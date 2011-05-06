package net.sourceforge.fenixedu.domain.phd.serviceRequests.documentRequests;

import java.util.Locale;

import net.sourceforge.fenixedu.dataTransferObject.serviceRequests.AcademicServiceRequestBean;
import net.sourceforge.fenixedu.dataTransferObject.serviceRequests.AcademicServiceRequestCreateBean;
import net.sourceforge.fenixedu.domain.accounting.EventType;
import net.sourceforge.fenixedu.domain.accounting.events.serviceRequests.PhdDiplomaRequestEvent;
import net.sourceforge.fenixedu.domain.degreeStructure.CycleType;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.domain.phd.PhdIndividualProgramProcess;
import net.sourceforge.fenixedu.domain.phd.exceptions.PhdDomainOperationException;
import net.sourceforge.fenixedu.domain.phd.serviceRequests.PhdAcademicServiceRequestCreateBean;
import net.sourceforge.fenixedu.domain.phd.serviceRequests.PhdDocumentRequestCreateBean;
import net.sourceforge.fenixedu.domain.phd.thesis.PhdThesisFinalGrade;
import net.sourceforge.fenixedu.domain.serviceRequests.IDiplomaRequest;
import net.sourceforge.fenixedu.domain.serviceRequests.RegistryCode;
import net.sourceforge.fenixedu.domain.serviceRequests.documentRequests.DocumentRequestType;

import org.joda.time.LocalDate;

public class PhdDiplomaRequest extends PhdDiplomaRequest_Base implements IDiplomaRequest {

    protected PhdDiplomaRequest() {
	super();
    }

    protected PhdDiplomaRequest(final PhdDocumentRequestCreateBean bean) {
	init(bean);
    }

    @Override
    protected void init(AcademicServiceRequestCreateBean bean) {
	throw new DomainException("invoke init(PhdDocumentRequestCreateBean)");
    }

    @Override
    protected void init(PhdAcademicServiceRequestCreateBean bean) {
	throw new DomainException("invoke init(PhdDocumentRequestCreateBean)");
    }

    protected void init(final PhdDocumentRequestCreateBean bean) {
	checkParameters(bean);
	super.init(bean);

	if (!isFree()) {
	    PhdDiplomaRequestEvent.create(getAdministrativeOffice(), getPhdIndividualProgramProcess().getPerson(), this);
	}

	applyRegistryCode();
    }

    private void applyRegistryCode() {
	RegistryCode code = getRegistryCode();
	if (code != null) {
	    if (!code.hasDocumentRequest(this)) {
		code.addDocumentRequest(this);
	    }
	} else {
	    getRootDomainObject().getInstitutionUnit().getRegistryCodeGenerator().createRegistryFor(this);
	}
    }

    private void checkParameters(final PhdDocumentRequestCreateBean bean) {
	PhdIndividualProgramProcess process = bean.getPhdIndividualProgramProcess();

	if (process.hasDiplomaRequest()) {
	    throw new PhdDomainOperationException("error.phdDiploma.alreadyHasDiplomaRequest");
	}

	checkRegistryDiplomaRequest(process);
    }

    private void checkRegistryDiplomaRequest(PhdIndividualProgramProcess process) {

	if (!process.isBolonha()) {
	    return;
	}

	if (!process.hasRegistryDiplomaRequest()) {
	    throw new PhdDomainOperationException("error.phdDiploma.registryDiploma.must.be.requested");
	}

	PhdRegistryDiplomaRequest phdRegistryDiploma = process.getRegistryDiplomaRequest();

	if (phdRegistryDiploma.isPayedUponCreation() && !phdRegistryDiploma.getEvent().isPayed()) {
	    throw new PhdDomainOperationException("error.phdDiploma.registryDiploma.must.be.payed");
	}
    }

    @Override
    public DocumentRequestType getDocumentRequestType() {
	return DocumentRequestType.DIPLOMA_REQUEST;
    }

    @Override
    public String getDescription() {
	return getDescription(getAcademicServiceRequestType(), getDocumentRequestType().getQualifiedName() + "." + "PHD");
    }

    @Override
    public String getDocumentTemplateKey() {
	return PhdDiplomaRequest.class.getName();
    }

    @Override
    public boolean isPayedUponCreation() {
	return true;
    }

    @Override
    public boolean isToPrint() {
	return true;
    }

    @Override
    public boolean isPossibleToSendToOtherEntity() {
	return false;
    }

    @Override
    public boolean isManagedWithRectorateSubmissionBatch() {
	return false;
    }

    @Override
    public EventType getEventType() {
	return EventType.BOLONHA_PHD_DIPLOMA_REQUEST;
    }

    @Override
    public boolean hasPersonalInfo() {
	return true;
    }

    @Override
    public RegistryCode getRegistryCode() {
	PhdIndividualProgramProcess phdIndividualProgramProcess = getPhdIndividualProgramProcess();
	RegistryCode registryCode = phdIndividualProgramProcess.getRegistryDiplomaRequest().getRegistryCode();

	return registryCode != null ? registryCode : super.getRegistryCode();
    }

    @Override
    protected void internalChangeState(AcademicServiceRequestBean academicServiceRequestBean) {
	try {
	    verifyIsToProcessAndHasPersonalInfo(academicServiceRequestBean);
	    verifyIsToDeliveredAndIsPayed(academicServiceRequestBean);
	} catch (DomainException e) {
	    throw new PhdDomainOperationException(e.getKey(), e, e.getArgs());
	}

	super.internalChangeState(academicServiceRequestBean);

	if (academicServiceRequestBean.isToProcess()) {
	    if (!getPhdIndividualProgramProcess().isConclusionProcessed()) {
		throw new PhdDomainOperationException("error.phdDiploma.registrationNotSubmitedToConclusionProcess");
	    }

	    if (isPayable() && !isPayed()) {
		throw new PhdDomainOperationException("AcademicServiceRequest.hasnt.been.payed");
	    }

	    getAdministrativeOffice().getCurrentRectorateSubmissionBatch().addDocumentRequest(this);

	    if (getLastGeneratedDocument() == null) {
		generateDocument();
	    }
	} else if (academicServiceRequestBean.isToCancelOrReject()) {
	    if (hasEvent()) {
		getEvent().cancel(academicServiceRequestBean.getEmployee());
	    }
	}
    }

    @Override
    public CycleType getWhatShouldBeRequestedCycle() {
	return CycleType.THIRD_CYCLE;
    }

    @Override
    public LocalDate getConclusionDate() {
	return getPhdIndividualProgramProcess().getConclusionDate();
    }

    @Override
    public Integer getFinalAverage() {
	return null;
    }

    @Override
    public String getFinalAverageQualified() {
	return null;
    }

    @Override
    public String getDissertationThesisTitle() {
	return getPhdIndividualProgramProcess().getThesisTitle();
    }

    @Override
    public String getGraduateTitle(Locale locale) {
	return getPhdIndividualProgramProcess().getGraduateTitle(locale);
    }

    public PhdThesisFinalGrade getThesisFinalGrade() {
	return getPhdIndividualProgramProcess().getFinalGrade();
    }

    public Boolean isBolonha() {
	return getPhdIndividualProgramProcess().isBolonha();
    }

    public static PhdDiplomaRequest create(final PhdDocumentRequestCreateBean bean) {
	return new PhdDiplomaRequest(bean);
    }
}
