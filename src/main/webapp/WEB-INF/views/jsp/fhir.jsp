<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>FHIR API EXAMPLE</title>
 
<spring:url value="/resources/core/css/fhir.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />

</head>
 
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
	<div class="navbar-header">
		<a class="navbar-brand" href="#">NEHR OPENIMIS FHIR API Demo</a>
	</div>
  </div>
</nav>
 
<div class="jumbotron">
  <div class="container">
	<h1>${title}</h1>
	<p>
		Code demonstration on OPENIMIS FHIR API
    </p>
    <p>
		<a class="btn btn-primary btn-lg" href="http://docs.openimis.org/en/latest/" target="_blank" role="button">Learn more</a>
	</p>
	</div>
</div>
 
<div class="container">
	<h2>Eligibility Check</h2>
	<div class="row">
		<div class="col-md-4">
			<h4>Input</h4>
			<form action = "checkEligibility" method = "POST">


			<input type="text" id="insuree_id" name="insuree_id" />
			<input type="submit" value="Check Eligibility"/>
				<!-- <a class="btn btn-default" href="#" role="button">Check Eligibility</a> -->
			</form>
		</div>
		<div class="col-md-4">
			<h4>Input JSON</h4>

			<p>
				<c:if test="${not empty input}">
			 ${input}
		</c:if>
			</p>
			
		</div>

		<div class="col-md-4">
			<h4>Note</h4>
			<p>Eligible Insuree example id: 123456789</p>
		</div>
	</div>	
 
 
  <hr>
  
  <div class="row">
		
		<div class="col-md-12">
			<h4>Output</h4>

			<p>
				<c:if test="${not empty output}">
			 ${output}
		</c:if>
                                
			</p>
			
		</div>

		
	</div>	
  <hr>
  <footer>
	<p>&copy; NEHR 2020</p>
  </footer>
</div>
 
<spring:url value="/resources/core/css/fhir.js" var="coreJs" />
<spring:url value="/resources/core/css/bootstrap.min.js" var="bootstrapJs" />
 
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 
</body>
</html>