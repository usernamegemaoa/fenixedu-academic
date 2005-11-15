<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %><%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %><%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %><h2><bean:message bundle="MANAGER_RESOURCES" key="title.manage.faq"/></h2><br /><html:form action="/manageFAQSections" method="get">	<html:hidden property="page" value="1"/>	<html:hidden property="method" value="createFAQSection"/>	<table>		<tr>			<td>				<bean:message bundle="MANAGER_RESOURCES" key="property.faq.section.name"/>			</td>			<td>				<html:text size="45" property="sectionName"  />			</td>		</tr>		<tr>			<td>				<bean:message bundle="MANAGER_RESOURCES" key="property.faq.section.parent"/>			</td>			<td> 				<html:select property="parentSectionId" size="1">  	 				<option value=""></option> 					<html:options property="idInternal" labelProperty="sectionName" 								  collection="infoFAQSections" 								  />  	 			</html:select>             			</td>		</tr>	</table>	<br>	<html:submit styleClass="inputbutton">		<bean:message bundle="MANAGER_RESOURCES" key="button.create"/>	</html:submit>	<html:reset  styleClass="inputbutton">		<bean:message bundle="MANAGER_RESOURCES" key="label.clear"/>	</html:reset>			</html:form><br /><html:form action="/manageFAQs" method="get">	<html:hidden property="page" value="1"/>	<html:hidden property="method" value="createFAQEntry"/>	<table>		<tr>			<td>				<bean:message bundle="MANAGER_RESOURCES" key="property.faq.section.parent"/>			</td>			<td> 				<html:select property="parentSectionId" size="1">  	 				<option value=""></option> 					<html:options property="idInternal" labelProperty="sectionName" 								  collection="infoFAQSections" 								  />  	 			</html:select>             			</td>		</tr>		<tr>			<td>				<bean:message bundle="MANAGER_RESOURCES" key="property.faq.question"/>			</td>			<td>				<html:text size="45" property="question"/>			</td>		</tr>		<tr>			<td>				<bean:message bundle="MANAGER_RESOURCES" key="property.faq.answer"/>			</td>			<td>				<html:text size="45" property="answer"/>			</td>		</tr>	</table>	<br>	<html:submit styleClass="inputbutton">		<bean:message bundle="MANAGER_RESOURCES" key="button.create"/>	</html:submit>	<html:reset  styleClass="inputbutton">		<bean:message bundle="MANAGER_RESOURCES" key="label.clear"/>	</html:reset>			</html:form><br /><table width="90%" cellspacing="0" cellpadding="0" style="border: 1px solid #333;">	<logic:present name="rootInfoFAQEntries">		<logic:iterate id="infoFAQEntry" name="rootInfoFAQEntries">			<bean:define id="entryId" name="infoFAQEntry" property="idInternal"/>			<tr>				<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">					<bean:message bundle="MANAGER_RESOURCES" key="property.faq.question"/>: <strong><bean:write name="infoFAQEntry" property="question"/></strong>				</td>				<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">					<html:link module="/manager" page="<%= "/manageFAQs.do?method=deleteFAQEntry&amp;entryId="						+ pageContext.findAttribute("entryId") %>">						<bean:message bundle="MANAGER_RESOURCES" key="link.delete"/>					</html:link>				</td>			</tr>			<tr>				<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">					<bean:message bundle="MANAGER_RESOURCES" key="property.faq.answer"/>: <strong><bean:write name="infoFAQEntry" property="answer"/></strong>				</td>				<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">				</td>			</tr>		</logic:iterate>	</logic:present>	<logic:present name="rootInfoFAQSections">		<logic:iterate id="rootInfoFAQSection" name="rootInfoFAQSections">			<bean:define id="sectionId" name="rootInfoFAQSection" property="idInternal"/>			<tr>				<td colspan="3" style="background: #333; color:#fff; padding: 5px 0 5px 10px; border: 1px solid #333;">					<strong><bean:write name="rootInfoFAQSection" property="sectionName"/></strong>				</td>				<td colspan="3" style="background: #333; color:#fff; padding: 5px 0 5px 10px; border: 1px solid #333;">					<html:link module="/manager" page="<%= "/manageFAQSections.do?method=deleteFAQSection&amp;sectionId="						+ pageContext.findAttribute("sectionId") %>">						<bean:message bundle="MANAGER_RESOURCES" key="link.delete"/>					</html:link>				</td>			</tr>			<logic:present name="rootInfoFAQSection" property="subSections">				<logic:iterate id="subSection" name="rootInfoFAQSection" property="subSections">					<bean:define id="sectionId" name="subSection" property="idInternal"/>					<tr>						<td colspan="3" style="background: #ccc; padding: 5px 0 0 10px">							<strong><bean:write name="subSection" property="sectionName"/></strong>						</td>						<td colspan="3" style="background: #ccc; padding: 5px 0 0 10px">							<html:link module="/manager" page="<%= "/manageFAQSections.do?method=deleteFAQSection&amp;sectionId="								+ pageContext.findAttribute("sectionId") %>">								<bean:message bundle="MANAGER_RESOURCES" key="link.delete"/>							</html:link>						</td>					</tr>					<logic:present name="subSection" property="subSections">						<logic:iterate id="subSubSection" name="subSection" property="subSections">							<bean:define id="sectionId" name="subSubSection" property="idInternal"/>							<tr>								<td colspan="3" style="background: #EBECED; padding: 5px 0 0 10px">									<strong><bean:write name="subSubSection" property="sectionName"/></strong>								</td>								<td colspan="3" style="background: #EBECED; padding: 5px 0 0 10px">									<html:link module="/manager" page="<%= "/manageFAQSections.do?method=deleteFAQSection&amp;sectionId="										+ pageContext.findAttribute("sectionId") %>">										<bean:message bundle="MANAGER_RESOURCES" key="link.delete"/>									</html:link>								</td>							</tr>							<logic:present name="subSubSection" property="entries">								<logic:iterate id="infoFAQEntry" name="subSubSection" property="entries">									<bean:define id="entryId" name="infoFAQEntry" property="idInternal"/>									<tr>										<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">											<bean:message bundle="MANAGER_RESOURCES" key="property.faq.question"/>: <strong><bean:write name="infoFAQEntry" property="question"/></strong>										</td>										<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">											<html:link module="/manager" page="<%= "/manageFAQs.do?method=deleteFAQEntry&amp;entryId="												+ pageContext.findAttribute("entryId") %>">												<bean:message bundle="MANAGER_RESOURCES" key="link.delete"/>											</html:link>										</td>									</tr>									<tr>										<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">											<bean:message bundle="MANAGER_RESOURCES" key="property.faq.answer"/>: <strong><bean:write name="infoFAQEntry" property="answer"/></strong>										</td>										<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">										</td>									</tr>								</logic:iterate>							</logic:present>						</logic:iterate>					</logic:present>					<logic:present name="subSection" property="entries">						<logic:iterate id="infoFAQEntry" name="subSection" property="entries">							<bean:define id="entryId" name="infoFAQEntry" property="idInternal"/>							<tr>								<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">									<bean:message bundle="MANAGER_RESOURCES" key="property.faq.question"/>: <strong><bean:write name="infoFAQEntry" property="question"/></strong>								</td>								<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">									<html:link module="/manager" page="<%= "/manageFAQs.do?method=deleteFAQEntry&amp;entryId="										+ pageContext.findAttribute("entryId") %>">										<bean:message bundle="MANAGER_RESOURCES" key="link.delete"/>									</html:link>								</td>							</tr>							<tr>								<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">									<bean:message bundle="MANAGER_RESOURCES" key="property.faq.answer"/>: <strong><bean:write name="infoFAQEntry" property="answer"/></strong>								</td>								<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">								</td>							</tr>						</logic:iterate>					</logic:present>				</logic:iterate>			</logic:present>			<logic:present name="rootInfoFAQSection" property="entries">				<logic:iterate id="infoFAQEntry" name="rootInfoFAQSection" property="entries">					<bean:define id="entryId" name="infoFAQEntry" property="idInternal"/>					<tr>						<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">							<bean:message bundle="MANAGER_RESOURCES" key="property.faq.question"/>: <strong><bean:write name="infoFAQEntry" property="question"/></strong>						</td>						<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">							<html:link module="/manager" page="<%= "/manageFAQs.do?method=deleteFAQEntry&amp;entryId="								+ pageContext.findAttribute("entryId") %>">								<bean:message bundle="MANAGER_RESOURCES" key="link.delete"/>							</html:link>						</td>					</tr>					<tr>						<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">							<bean:message bundle="MANAGER_RESOURCES" key="property.faq.answer"/>: <strong><bean:write name="infoFAQEntry" property="answer"/></strong>						</td>						<td colspan="3" style="background: #fff; padding: 5px 0 0 10px">						</td>					</tr>				</logic:iterate>			</logic:present>		</logic:iterate>	</logic:present></table>