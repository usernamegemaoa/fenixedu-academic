<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %><%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %><%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %><%@ taglib uri="/WEB-INF/taglibs-datetime.tld" prefix="dt" %><%@ taglib uri="/WEB-INF/enum.tld" prefix="e" %><h2><bean:message bundle="MANAGER_RESOURCES" key="link.manager.studentsManagement"/></h2><br /><p><span class="error"><html:errors/></span></p><jsp:include page="studentCurricularPlanHeader.jsp"/>	<bean:define id="studentNumber" name="studentCurricularPlanForm" property="number"/>	<bean:define id="degreeType" name="studentCurricularPlanForm" property="degreeType"/>	<html:link module="/manager" page="<%= "/studentsManagement.do?method=prepareCreateStudentCurricularPlan&amp;page=0&amp;number="				+ pageContext.findAttribute("studentNumber").toString()				+ "&amp;degreeType="				+ pageContext.findAttribute("degreeType").toString()			%>">		<bean:message bundle="MANAGER_RESOURCES" key="link.create.student.curricular.plan"/>	</html:link>	<br/>	<logic:present name="infoStudentCurricularPlans">		<br/>		<bean:define id="deleteConfirmStudentCurricularPlan">			return confirm('<bean:message bundle="MANAGER_RESOURCES" key="message.confirm.delete.studentCurricularPlan"/>')		</bean:define>		<bean:define id="deleteConfirmEnrollment">			return confirm('<bean:message bundle="MANAGER_RESOURCES" key="message.confirm.delete.enrollment"/>')		</bean:define>				<logic:iterate id="infoStudentCurricularPlan" name="infoStudentCurricularPlans">			<bean:define id="studentCurricularPlanId" name="infoStudentCurricularPlan" property="idInternal"/>			<bean:define id="studentNumber" name="infoStudentCurricularPlan" property="infoStudent.number"/>			<bean:define id="degreeType" name="infoStudentCurricularPlan" property="infoStudent.degreeType"/>			<table>				<tr>					<td colspan="3" rowspan="3" class="listClasses-header">						<bean:message bundle="MANAGER_RESOURCES" key="label.studentCurricularPlan"/>					</td>					<td colspan="4" class="listClasses">						<bean:define id="studentCurricularPlanStateString" type="java.lang.String" name="infoStudentCurricularPlan" property="currentState.name"/>						<bean:define id="onChangeString" type="java.lang.String">this.form.method.value='changeStudentCurricularPlanState';this.form.selectedStudentCurricularPlanId.value=<%= studentCurricularPlanId.toString() %>;this.form.submit();</bean:define><html:form action="/studentsManagement" focus="number">	<html:hidden property="method" value="show"/>	<html:hidden property="page" value="1"/>	<html:hidden property="selectedStudentCurricularPlanId" value="0"/>	<html:hidden property="number"/>	<html:hidden property="degreeType"/>						<e:labelValues id="values" enumeration="net.sourceforge.fenixedu.domain.studentCurricularPlan.StudentCurricularPlanState" bundle="ENUMERATION_RESOURCES"/>						<html:select property="studentCurricularPlanState" size="1"								onchange="<%= onChangeString %>" value="<%= studentCurricularPlanStateString %>">							<html:options collection="values" property="value" labelProperty="label"/>						</html:select></html:form>						<bean:message bundle="MANAGER_RESOURCES" name="infoStudentCurricularPlan" property="currentState.name" bundle="ENUMERATION_RESOURCES"/>						<logic:present name="infoStudentCurricularPlan" property="startDate">							:							<dt:format pattern="yyyy-MM-dd">								<bean:write name="infoStudentCurricularPlan" property="startDate.time"/>							</dt:format>						</logic:present>											</td>					<td colspan="1" rowspan="3" class="listClasses">						<html:link module="/manager" page="<%= "/studentsManagement.do?method=deleteStudentCurricularPlan&amp;page=0&amp;number="									+ pageContext.findAttribute("studentNumber").toString()									+ "&amp;degreeType="									+ pageContext.findAttribute("degreeType").toString()									+ "&amp;studentCurricularPlanId="									+ pageContext.findAttribute("studentCurricularPlanId").toString()								%>"								onclick='<%= pageContext.findAttribute("deleteConfirmStudentCurricularPlan").toString() %>'>							<bean:message bundle="MANAGER_RESOURCES" key="link.delete"/>						</html:link>					</td>				</tr>				<tr>					<td  colspan="4" class="listClasses">						<bean:write name="infoStudentCurricularPlan" property="infoDegreeCurricularPlan.infoDegree.nome"/>					</td>				</tr>				<tr>					<td colspan="4" class="listClasses">						<bean:write name="infoStudentCurricularPlan" property="infoDegreeCurricularPlan.name"/>						:						<logic:present name="infoStudentCurricularPlan" property="infoDegreeCurricularPlan.initialDate">							<dt:format pattern="yyyy-MM-dd">								<bean:write name="infoStudentCurricularPlan" property="infoDegreeCurricularPlan.initialDate.time"/>							</dt:format>						</logic:present>						<logic:notPresent name="infoStudentCurricularPlan" property="infoDegreeCurricularPlan.initialDate">							...						</logic:notPresent>						-						<logic:present name="infoStudentCurricularPlan" property="infoDegreeCurricularPlan.endDate">							<dt:format pattern="yyyy-MM-dd">								<bean:write name="infoStudentCurricularPlan" property="infoDegreeCurricularPlan.endDate.time"/>							</dt:format>						</logic:present>						<logic:notPresent name="infoStudentCurricularPlan" property="infoDegreeCurricularPlan.endDate">							...						</logic:notPresent>					</td>				</tr>					<tr>						<td class="listClasses-header">						</td>						<td class="listClasses-header">							<bean:message bundle="MANAGER_RESOURCES" key="label.executionYear"/>						</td>						<td class="listClasses-header">							<bean:message bundle="MANAGER_RESOURCES" key="label.manager.semester"/>						</td>						<td class="listClasses-header">							<bean:message bundle="MANAGER_RESOURCES" key="label.manager.degree"/>						</td>						<td class="listClasses-header">							<bean:message bundle="MANAGER_RESOURCES" key="label.course.code"/>						</td>						<td class="listClasses-header">							<bean:message bundle="MANAGER_RESOURCES" key="label.course.name"/>						</td>						<td class="listClasses-header">							<bean:message bundle="MANAGER_RESOURCES" key="label.grade"/>						</td>						<td class="listClasses-header">						</td>					</tr><html:form action="/studentsManagement" focus="number">	<html:hidden property="method" value="prepareTransferEnrollments"/>	<html:hidden property="page" value="1"/>	<html:hidden property="number"/>	<html:hidden property="degreeType"/>	<html:hidden property="selectedStudentCurricularPlanId" value="<%= pageContext.findAttribute("studentCurricularPlanId").toString() %>"/>				<logic:iterate id="infoEnrollmentGrade" name="infoStudentCurricularPlan" property="infoEnrolments">					<bean:define id="enrollmentId" name="infoEnrollmentGrade" property="infoEnrollment.idInternal"/>					<bean:define id="enrollmentIdString" type="java.lang.String"><bean:write name="enrollmentId"/></bean:define>					<tr>						<td class="listClasses">							<html:multibox property="enrollmentIDsToTransfer" value="<%= enrollmentIdString %>"/>						</td>						<td class="listClasses">							<bean:write name="infoEnrollmentGrade" property="infoEnrollment.infoExecutionPeriod.infoExecutionYear.year"/>						</td>						<td class="listClasses">							<bean:write name="infoEnrollmentGrade" property="infoEnrollment.infoExecutionPeriod.semester"/>						</td>						<td class="listClasses">							<bean:write name="infoEnrollmentGrade" property="infoEnrollment.infoCurricularCourse.infoDegreeCurricularPlan.infoDegree.sigla"/>						</td>						<td class="listClasses">							<bean:write name="infoEnrollmentGrade" property="infoEnrollment.infoCurricularCourse.code"/>						</td>						<td class="listClasses">							<bean:write name="infoEnrollmentGrade" property="infoEnrollment.infoCurricularCourse.name"/>						</td>						<td class="listClasses">							<bean:write name="infoEnrollmentGrade" property="grade"/>						</td>						<td class="listClasses">							<html:link module="/manager" page="<%= "/studentsManagement.do?method=deleteEnrollment&amp;page=0&amp;number="										+ pageContext.findAttribute("studentNumber").toString()										+ "&amp;degreeType="										+ pageContext.findAttribute("degreeType").toString()										+ "&amp;enrollmentId="										+ pageContext.findAttribute("enrollmentId").toString()									%>"									onclick='<%= pageContext.findAttribute("deleteConfirmEnrollment").toString() %>'>								<bean:message bundle="MANAGER_RESOURCES" key="link.delete"/>							</html:link>						</td>					</tr>				</logic:iterate>				<tr>					<td colspan="8" class="listClasses-header">						<html:submit property="submit" styleClass="inputbutton"/>					</td>				</tr></html:form>			</table>			<br />		</logic:iterate>	</logic:present>