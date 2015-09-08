
<%@ page import="preguntados.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-question" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.question}">
				<li class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="question.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${questionInstance}" field="question"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answer1}">
				<li class="fieldcontain">
					<span id="answer1-label" class="property-label"><g:message code="question.answer1.label" default="Answer1" /></span>
					
						<span class="property-value" aria-labelledby="answer1-label"><g:fieldValue bean="${questionInstance}" field="answer1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answer2}">
				<li class="fieldcontain">
					<span id="answer2-label" class="property-label"><g:message code="question.answer2.label" default="Answer2" /></span>
					
						<span class="property-value" aria-labelledby="answer2-label"><g:fieldValue bean="${questionInstance}" field="answer2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answer3}">
				<li class="fieldcontain">
					<span id="answer3-label" class="property-label"><g:message code="question.answer3.label" default="Answer3" /></span>
					
						<span class="property-value" aria-labelledby="answer3-label"><g:fieldValue bean="${questionInstance}" field="answer3"/></span>
					
				</li>
				</g:if>
			
			
			</ol>
			<g:form url="[resource:questionInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${questionInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
