<%@ page language="java" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<html:xhtml/>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="/WEB-INF/fenix-renderers.tld" prefix="fr"%>
<%@ taglib uri="/WEB-INF/collectionPager.tld" prefix="cp"%>

<h2><bean:message bundle="SPACE_RESOURCES" key="space.list.changes.in.the.spaces.title"/></h2>

<logic:messagesPresent message="true">
	<p>
		<span class="error0"><!-- Error messages go here -->
			<html:messages id="message" message="true" bundle="SPACE_RESOURCES">
				<bean:write name="message"/>
			</html:messages>
		</span>
	</p>
</logic:messagesPresent>

<logic:notEmpty name="domainObjectActionLogs">			
	
	<cp:collectionPages url="/SpaceManager/listChangesInTheSpaces.do?method=changesList" pageNumberAttributeName="pageNumber" numberOfPagesAttributeName="numberOfPages"/>	

	<fr:view name="domainObjectActionLogs" schema="ListChangesInTheSpacesSchema">
		<fr:layout name="tabular">
			<fr:property name="classes" value="tstyle4"/>
			<fr:property name="columnClasses" value="nowrap,,nowrap,nowrap,aleft,aleft"/>
			<fr:property name="rowClasses" value="listClasses"/>					
		</fr:layout>
	</fr:view>		
</logic:notEmpty>
