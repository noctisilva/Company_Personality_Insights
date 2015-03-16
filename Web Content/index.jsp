<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Personality Insights</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/watson-bootstrap-dark.css">
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/style2.css">
<link rel="stylesheet" href="css/fonts2.css">
<script
src="http://maps.googleapis.com/maps/api/js">
</script>
</head>
<body>
<div class="container">
<div id="listOfCompanies">
	<ul id="listOfComp">
		<li class="queryComp"><b>Companies in NY</b></li>
		<li class="queryComp">Microsoft</li>
		<li class="queryComp">IBM</li>
		<li class="queryComp">Google</li>
		<li class="queryComp">EY</li>
		<li class="queryComp">PWC</li>
		<li class="queryComp">Venmo</li>
		<li class="queryComp">MongoDB</li>
		<li class="queryComp">Yodle</li>
		<li class="queryComp">facebook</li>
		<li class="queryComp">uber</li>
		<li class="queryComp">Columbia | Engineering</li>
	</ul>
	<input id="searchComp" placeholder="Search NY Company"></input>
	<div id="googleMap"></div>
</div>
<div id="RightContainer">
	<div id="topRight">
		<div id="titleBig">Companies in NY</div>
	</div>
	<div id="gdContainer">
		<div id="pros">
		</div>
		<br>
		<div id="cons"> 
		</div>
	</div>
	<table class="otherStuff">
		<tr id="osFont">
			<td id="industry"></td>
			<td id="numberOfRatings"></td>
			<td id="overallRating"></td>
			<td id="ratingDescription"></td>
		</tr>
	</table>


	<div id="render">Versona!</div>
</div>
<div class="row">
<div class="col-lg-6 col-md-6 col-xs-12" id="goodbye">
	<h2>Try the service</h2>
	<div class="well">
		<div class="form-group row">
			<div class="col-lg-12 col-xs-12">
				<textarea rows="8" required
					placeholder="Please enter the text to analyze (minimum of 100 words)..."
					class="content form-control" id="textbuilder">${content}</textarea>
				<div class="text-right">
					<span class="wordsCount small"></span>
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="col-lg-4 col-lg-push-4 col-xs-4">
				<button type="button" class="btn btn-block clear-btn">Clear</button>
			</div>
			<div class="col-lg-4 col-lg-push-4 col-xs-4 col-xs-push-4">
				<button type="button" class="btn btn-block analysis-btn" id="analClk">Analyze</button>
			</div>
		</div>
	</div>
</div>
<div class="col-lg-6 col-md-6 col-xs-12" id="goodbye2">
	<div class="row">
		<div style="display:none;" class="form-group row loading text-center loading">
			<h2>&nbsp;</h2>
			<img src="images/watson.gif">
		</div>
		<div style="display: none;" class="form-group row error">
			<h2>&nbsp;</h2>
			<div class="well">
				<p class="errorMsg"></p>
			</div>
		</div>
	</div>
	<div style="display: none;" class="results">
		<h3 style="height: 29px;">Your Personality*</h3>
		<div class="well">
			<div class="summary-div"></div>
			<div style="color: gray" class="text-right">
				<em class="small">*Compared to most people who participated in our surveys.</em>
			</div>
		</div>
	</div>
</div>
<div style="display: none;" class="results" id="goodbye3">
	<div class="row">
		<div class="col-lg-5 col-md-5 col-xs-12">
			<h3>Data Behind Your Personality</h3>
			<div style="display: none;" class="col540px well traits"></div>
			</div>
			<div class="col-lg-7 col-xs-12 col-md-7">
				<h3>Visualization of Personality Data</h3>
				<div id="vizcontainer" class="well"></div>
			</div>
		</div>
	</div>
	<div class="hidden">
		<div id="header-template">
			<div class="row theader">
				<div class="col-lg-5 col-xs-5">
					<span>Name</span>
				</div>
				<div class="col-lg-7 col-xs-7 text-right">
					<span>Value ± Sampling Error</span>
				</div>
			</div>
		</div>
		<div id="trait-template">
			<div class="row">
				<div class="tname col-lg-7 col-xs-7">
					<span></span>
				</div>
				<div class="tvalue col-lg-5 col-xs-5 text-right">
					<span></span>
				</div>
			</div>
		</div>
		<div id="model-template">
			<div class="row">
				<div class="col-lg-12 col-xs-12 text-center">
					<span></span>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/d3.v2.min.js"></script>
	<script type="text/javascript" src="js/demo.js"></script>
	<script type="text/javascript" src="js/personality.js"></script>
	<script type="text/javascript" src="js/textsummary.js"></script>
	<script type="text/javascript" src="js/scriptGDapi.js"></script>
	<script type="text/javascript" src="js/spin.js"></script>
</body>
</html>