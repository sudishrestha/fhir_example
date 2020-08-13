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
<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>
</head>
 
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
	<div class="navbar-header">
		<a class="navbar-brand" href="/ssf">NEHR OPENIMIS FHIR API Demo</a>
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
    
<div class="tab">
  <button class="tablinks" onclick="openTabs(event, 'Eligibility')">Eligibility Check</button>
  <button class="tablinks" onclick="openTabs(event, 'Patient')">Patient View</button>
  <button class="tablinks" onclick="openTabs(event, 'Location')">Location View</button>
</div>
    
    <div id="home" class="tabcontent">
        <p> FHIR API implementation example in spring java developed by <a href="http://www.nepalehr.org/" target="_blank"> NEHR </a>2020. For any further query mail us at contact@nehr.org.np
        To start click any of the tabs.
        </p>
        
    </div>
    
<div id="Eligibility" class="tabcontent">
 
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
</div>
<div id="Patient" class="tabcontent">
  <h3>Patient</h3>
  <p>View Patient Details.</p> 
  <div class="row">
		<div class="col-md-4">
			<h4>Input</h4>
			<form action = "Patient" method = "POST">


			<input type="text" id="insuree_id" name="insuree_id" />
			<input type="submit" value="View Patient"/>
				<!-- <a class="btn btn-default" href="#" role="button">Check Eligibility</a> -->
			</form>
		</div>
		<div class="col-md-4">
			<h4>Input JSON</h4>

			<p>
				<c:if test="${not empty input_patient}">
			 ${input_patient}
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
				<c:if test="${not empty output_patient}">
			 ${output_patient}
		</c:if>               
			</p>
		</div>
	</div>	
</div>

<div id="Location" class="tabcontent">
  <h3>Location</h3>
  <p>Get Location Details.</p>
  <div class="row">
		<div class="col-md-4">
			<h4>Input</h4>
			<form action = "Location" method = "POST">


			<input type="text" id="insuree_id" name="insuree_id" />
			<input type="submit" value="View Locations"/>
				<!-- <a class="btn btn-default" href="#" role="button">Check Eligibility</a> -->
			</form>
		</div>
		<div class="col-md-4">
			<h4>Input JSON</h4>

			<p>
				<c:if test="${not empty input_location}">
			 ${input_location}
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
				<c:if test="${not empty output_location}">
			 ${output_location}
		</c:if>               
			</p>
		</div>
	</div>	
</div>
	
  <hr>
  <footer>
	<p>&copy; NEHR 2020</p>
  </footer>
</div>
 
<spring:url value="/resources/core/js/fhir.js" var="coreJs" />
<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
 
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
 
</body>
</html>