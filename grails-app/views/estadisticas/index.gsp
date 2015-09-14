<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'question.label', default: 'Question')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>


	</head>

	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
			</ul>
		</div>
		<div id="list-question" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="numQuestion" title="${message(code: 'question.question.label', default: 'numQuestion')}" />
						
						<g:sortableColumn property="score" title="${message(code: 'question.answer1.label', default: 'score')}" />
					
						<g:sortableColumn property="result" title="${message(code: 'question.answer2.label', default: 'result')}" />
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${currentGameInstanceList}" status="i" var="currentGameInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${fieldValue(bean: currentGameInstance, field: "numQuestion")}</td>
					
						<td>${fieldValue(bean: currentGameInstance, field: "score")}</td>
					
						<td>${fieldValue(bean: currentGameInstance, field: "result")}</td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${questionInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
	

</html>
