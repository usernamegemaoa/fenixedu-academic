/**
 * 
 */
package net.sourceforge.fenixedu.applicationTier.Servico.student.administrativeOfficeServices;

import net.sourceforge.fenixedu.applicationTier.Service;
import net.sourceforge.fenixedu.dataTransferObject.administrativeOffice.ExecutionDegreeBean;
import net.sourceforge.fenixedu.dataTransferObject.candidacy.IngressionInformationBean;
import net.sourceforge.fenixedu.dataTransferObject.candidacy.PrecedentDegreeInformationBean;
import net.sourceforge.fenixedu.dataTransferObject.person.PersonBean;
import net.sourceforge.fenixedu.domain.Degree;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.Qualification;
import net.sourceforge.fenixedu.domain.accounting.events.gratuity.PhDGratuityEvent;
import net.sourceforge.fenixedu.domain.candidacy.Ingression;
import net.sourceforge.fenixedu.domain.candidacy.RegisteredCandidacySituation;
import net.sourceforge.fenixedu.domain.candidacy.StudentCandidacy;
import net.sourceforge.fenixedu.domain.person.RoleType;
import net.sourceforge.fenixedu.domain.student.Registration;

/**
 * @author - Shezad Anavarali (shezad@ist.utl.pt)
 * @author - �ngela Almeida (argelina@ist.utl.pt)
 * 
 */
public class CreateStudent extends Service {

    public Registration run(PersonBean personBean, ExecutionDegreeBean executionDegreeBean,
	    PrecedentDegreeInformationBean precedentDegreeInformationBean,
	    IngressionInformationBean ingressionInformationBean) {

	// get or update person
	Person person = getPerson(personBean);

	// create candidacy
	StudentCandidacy studentCandidacy = StudentCandidacy.createStudentCandidacy(executionDegreeBean
		.getExecutionDegree(), person);
	new RegisteredCandidacySituation(studentCandidacy);

	// set ingression information
	final Ingression ingression = ingressionInformationBean.getIngression();
	studentCandidacy
		.setIngression(ingression != null ? ingression.getName()
			: null);
	studentCandidacy.setEntryPhase(ingressionInformationBean.getEntryPhase());	

	// edit precedent degree information
	studentCandidacy.getPrecedentDegreeInformation().edit(precedentDegreeInformationBean);

	// create registration
	Registration registration = new Registration(person, executionDegreeBean
		.getDegreeCurricularPlan(), studentCandidacy, ingressionInformationBean
		.getRegistrationAgreement(), executionDegreeBean.getCycleType());
	registration.setHomologationDate(ingressionInformationBean.getHomologationDate());
	registration.setStudiesStartDate(ingressionInformationBean.getStudiesStartDate());

	
	if (ingression == Ingression.RI) {
	    Degree sourceDegree = executionDegreeBean.getDegreeCurricularPlan().getEquivalencePlan()
		    .getSourceDegreeCurricularPlan().getDegree();
	    Registration sourceRegistration = person.getStudent().readRegistrationByDegree(sourceDegree);
	    registration.setSourceRegistration(sourceRegistration);
	}
	
	// create qualification
	new Qualification(person, studentCandidacy.getPrecedentDegreeInformation());

	// add roles
	person.addPersonRoleByRoleType(RoleType.STUDENT);
	person.addPersonRoleByRoleType(RoleType.PERSON);

	return registration;
    }

    private Person getPerson(PersonBean personBean) {
	Person person = null;
	if (personBean.getPerson() != null) {
	    person = personBean.getPerson();
	    person.edit(personBean);
	} else {
	    // create person
	    person = new Person(personBean);
	}
	return person;
    }

}
