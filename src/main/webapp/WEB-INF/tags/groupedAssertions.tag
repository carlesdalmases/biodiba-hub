<%-- 
    Document   : assertionListItem
    Created on : Mar 1, 2011, 11:52:04 AM
    Author     : "Nick dos Remedios <Nick.dosRemedios@csiro.au>"
--%><%@ 
include file="/common/taglibs.jsp" %><%@
tag description="Print a <li> for user assertions on occurrence record page" pageEncoding="UTF-8"%><%@
attribute name="groupedAssertions" required="false" type="java.util.Collection" %>
<c:forEach items="${groupedAssertions}" var="assertion">
<li id="${assertion.usersAssertionUuid}">
    <fmt:message key="${assertion.name}"/>
    <c:choose>
    <c:when test="${assertion.assertionByUser}">
        <br/>
        <strong>
            (added by you
            <c:if test="${fn:length(assertion.userIds)>1}">
                and ${fn:length(assertion.userIds) - 1} ${fn:length(assertion.userIds)>2 ? 'other users' : 'other user'})
            </c:if>
        - <a href="#" class="deleteAssertion" id="${assertion.usersAssertionUuid}">delete</a>)</strong>
    </c:when>
    <c:otherwise>
        (added by ${fn:length(assertion.userIds)} ${fn:length(assertion.userIds)>1 ? 'users' : 'user'})
    </c:otherwise>
    </c:choose>
</li>
</c:forEach>