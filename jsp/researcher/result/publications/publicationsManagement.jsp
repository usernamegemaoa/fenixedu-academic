<%@ page language="java" %> 
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>

<logic:present role="RESEARCHER">
	<bean:define id="publications" name="UserView" property="person.resultPublications"/>

	<h2><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.management.title"/></h2>

	<html:link page="/resultPublications/prepareCreate.do">
		<bean:message bundle="RESEARCHER_RESOURCES"	key="researcher.ResultPublication.insert.link"/>
	</html:link>
	
	<logic:empty name="publications">
		<br/>
		<br/>
		<p><em><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.emptyList"/></em></p>
	</logic:empty>

	<logic:notEmpty name="books">
		<h3 id='books' class='cd_heading'/><span><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.books"/></span></h3>
		<logic:iterate id="book" name="books">
	 		<bean:define id="bookId" name="book" property="idInternal"/>
			<fr:view name="book" layout="tabular" schema="result.publication.resume.Book">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId=" + bookId%>"/>
			</fr:view>
	 		<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ bookId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
	 		<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ bookId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
	  		<br/><br/>
		</logic:iterate>
	</logic:notEmpty>

	<logic:notEmpty name="bookParts">
		<h3 id='booksParts' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.bookParts"/> </span> </h3>
		<logic:iterate id="bookPart" name="bookParts">
	 		<bean:define id="bookPartId" name="bookPart" property="idInternal"/>
			<fr:view name="bookPart" layout="tabular" schema="result.publication.resume.BookPart">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ bookPartId%>"/>
			</fr:view>
	 		<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ bookPartId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
	 		<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ bookPartId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
	  		<br /><br />
		</logic:iterate>
	</logic:notEmpty>

	<logic:notEmpty name="articles">
		<h3 id='articles' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.articles"/> </span> </h3>
		<logic:iterate id="article" name="articles">
			<bean:define id="articleId" name="article" property="idInternal"/>
			<fr:view name="article" layout="tabular" schema="result.publication.resume.Article">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ articleId%>"/>
			</fr:view>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ articleId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ articleId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>

	<logic:notEmpty name="inproceedings">
		<h3 id='inproceedings' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.inproceedings"/> </span> </h3>
		<logic:iterate id="inproceeding" name="inproceedings">
			<bean:define id="inproceedingId" name="inproceeding" property="idInternal"/>
			<fr:view name="inproceeding" layout="tabular" schema="result.publication.resume.Inproceedings">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ inproceedingId%>"/>
			</fr:view>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ inproceedingId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ inproceedingId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>
	
	<logic:notEmpty name="proceedings">
		<h3 id='proceedings' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.proceedings"/> </span> </h3>
		<logic:iterate id="proceeding" name="proceedings">
			<bean:define id="proceedingId" name="proceeding" property="idInternal"/>
			<fr:view name="proceeding" layout="tabular" schema="result.publication.resume.Proceedings">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ proceedingId%>"/>
			</fr:view>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ proceedingId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ proceedingId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>
	
	<logic:notEmpty name="theses">
		<h3 id='theses' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.theses"/> </span> </h3>
		<logic:iterate id="thesis" name="theses">
			<bean:define id="thesisId" name="thesis" property="idInternal"/>
			<fr:view name="thesis" layout="tabular" schema="result.publication.resume.Thesis">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ thesisId%>"/>
			</fr:view>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ thesisId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ thesisId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>
	
	<logic:notEmpty name="manuals">
		<h3 id='manuals' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.manuals"/> </span> </h3>
		<logic:iterate id="manual" name="manuals">
			<bean:define id="manualId" name="manual" property="idInternal"/>
			<fr:view name="manual" layout="tabular" schema="result.publication.resume.Manual">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ manualId%>"/>
			</fr:view>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ manualId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ manualId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>
	
	<logic:notEmpty name="technicalReports">
		<h3 id='technicalReports' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.technicalReports"/> </span> </h3>
		<logic:iterate id="technicalReport" name="technicalReports">
			<bean:define id="technicalReportId" name="technicalReport" property="idInternal"/>
			<fr:view name="technicalReport" layout="tabular" schema="result.publication.resume.TechnicalReport">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ technicalReportId%>"/>
			</fr:view>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ technicalReportId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ technicalReportId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>
	
	<logic:notEmpty name="booklets">
		<h3 id='booklets' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.booklets"/> </span> </h3>
		<logic:iterate id="booklet" name="booklets">
			<bean:define id="bookletId" name="booklet" property="idInternal"/>
			<fr:view name="booklet" layout="tabular" schema="result.publication.resume.Booklet">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ bookletId%>"/>
			</fr:view>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ bookletId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ bookletId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>
	
	<logic:notEmpty name="miscs">
		<h3 id='miscs' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.miscs"/> </span> </h3>
		<logic:iterate id="misc" name="miscs">
			<bean:define id="miscId" name="misc" property="idInternal"/>
			<fr:view name="misc" layout="tabular" schema="result.publication.resume.Misc">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ miscId%>"/>
			</fr:view>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ miscId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ miscId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>
	
	<logic:notEmpty name="unpublisheds">
		<h3 id='unpublisheds' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.unpublisheds"/> </span> </h3>
		<logic:iterate id="unpublished" name="unpublisheds">
			<bean:define id="unpublishedId" name="unpublished" property="idInternal"/>
			<fr:view name="unpublished" layout="tabular" schema="result.publication.resume.Unpublished">
			    <fr:destination name="viewPublicationDetails" path="<%="/resultPublications/prepareDetails.do?resultId="+ unpublishedId%>"/>
			</fr:view>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ unpublishedId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.details.link" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ unpublishedId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>

	<logic:notEmpty name="unstructureds">
		<h3 id='unstructureds' class='cd_heading'/> <span> <bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.unstructureds"/> </span> </h3>
		<logic:iterate id="unstructured" name="unstructureds">
			<bean:define id="unstructuredId" name="unstructured" property="idInternal"/>
			<fr:view name="unstructured" layout="tabular" schema="result.publication.Unstructured"/>
			<html:link page="<%="/resultPublications/prepareEdit.do?resultId="+ unstructuredId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="researcher.ResultPublication.convertUnstructured" /></html:link>&nbsp;&nbsp;&nbsp;
			<html:link page="<%="/resultPublications/prepareDelete.do?resultId="+ unstructuredId%>"><bean:message bundle="RESEARCHER_RESOURCES" key="link.remove" /></html:link>
			<br /><br />
		</logic:iterate>
	</logic:notEmpty>
</logic:present>
