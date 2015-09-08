
<%@ page import="preguntados.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<script type="text/javascript">
			function Mostrar(boton){
				console.log('Ha hecho click')
			}
   		</script>
	</head>
	<body>
		<h1>Pregunta 1</h1>
		<div id="show-question" class="content scaffold-show div-question1" role="main">
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list question">
			
				<g:if test="${questionInstance?.question}">
				<li class="fieldcontain">
					<g:fieldValue bean="${questionInstance}" field="question"/>
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answer1}">
				<li class="fieldcontain">
					<g:link action="isCorrectAnswerA" id="${questionInstance.id}"><g:fieldValue bean="${questionInstance}" field="answer1"/></g:link>
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answer2}">
				<li class="fieldcontain">
					<g:link action="isCorrectAnswerB" id="${questionInstance.id}"><g:fieldValue bean="${questionInstance}" field="answer2"/></g:link>
				</li>
				</g:if>
			
				<g:if test="${questionInstance?.answer3}">
				<li class="fieldcontain">
					<g:link action="isCorrectAnswerC" id="${questionInstance.id}"><g:fieldValue bean="${questionInstance}" field="answer3"/></g:link>	
				</li>
				</g:if>
			
			</ol>
		</div>
	
</html>
