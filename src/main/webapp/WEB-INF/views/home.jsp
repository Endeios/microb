<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <!-- Bootstrap core CSS -->
   <link href="http://getbootstrap.com/dist/css/bootstrap.min.css" rel="stylesheet">
  
    <!-- Custom styles for this template -->
    <link href="http://getbootstrap.com/examples/offcanvas/offcanvas.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="resources/Off Canvas Template for Bootstrap_files/ie-emulation-modes-warning.js"></script><style type="text/css"></style>  
  <script src="resources/js/bootstrap.js"></script><style type="text/css"></style>
 <script src="resources/css/bootstrap.css"></script><style type="text/css"></style>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src="http://d3js.org/d3.v3.js"></script>
<script src=" http://code.jquery.com/jquery-1.6.4.min.js" type="text/javascript"></script>
<script src="//code.jquery.com/jquery.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>

<style>



line.arrow {
    stroke: #666;
    stroke-width: 1px;
}
marker#arrow {
    fill: #666;
}
.link-label {
    font-family: sans-serif;
    font-size: 11px;
}

path.link {
  fill: none;
  stroke: #666;
  stroke-width: 1.5px;
}

path.#subClass {
 fill:green
}

path.link.subClass {
  stroke: green;
}

path.link.type {
  stroke-dasharray: 0,2 1;
}


circle {
  fill: #ccc;
  stroke: #fff;
  stroke-width: 1.5px;
}

text {
  fill: #000;
  font: 10px sans-serif;
  pointer-events: none;
}
text.shadow {
  stroke: #fff;
  stroke-width: 3px;
  stroke-opacity: .8;
}

</style>
</head>

  <body>
    <nav class="navbar navbar-fixed-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="./Off Canvas Template for Bootstrap_files/Off Canvas Template for Bootstrap.html">MicrobIA</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="./Off Canvas Template for Bootstrap_files/Off Canvas Template for Bootstrap.html">Home</a></li>
          	<li><a href="http://www.microbia.org/index.php/resources">Imaging</a></li>
            <li><a href="http://getbootstrap.com/examples/offcanvas/#about">About</a></li>
            <li><a href="http://getbootstrap.com/examples/offcanvas/#contact">Contact</a></li>
          </ul>
        </div><!-- /.nav-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->

    <div class="container">
      
      <div class="row row-offcanvas row-offcanvas-right" id = "spazio">
                <div class="col-xs-12 col-sm-9" id = "grafo">
						  <%@include file= "NewFile.jsp"%>
				</div> 
 <script type="text/javascript">
$(document).ready(function(){
    $('[data-toggle="popover"]').popover({
        placement : 'right'
    });
});
</script>            


ciao  
		   <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
			    <div class="list-group" id = "lista">
					    <a href="#" class="list-group-item active" id="link">Link  </a>
 <button type="button" class="btn btn-primary" data-toggle="popover" title="Popover title" data-content="Default popover">Popover</button>
 				     </div> 
			<!-- 	     
	   <div class="accordion" id="accordion2">
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseOne">
        Collapsible Group Item #1
      </a>
    </div>
    <div id="collapseOne" class="accordion-body collapse in">
      <div class="accordion-inner">
        Anim pariatur cliche...
      </div>
    </div>
  </div>
  <div class="accordion-group">
    <div class="accordion-heading">
      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapseTwo">
        Collapsible Group Item #2
      </a>
    </div>
    <div id="collapseTwo" class="accordion-body collapse">
      <div class="accordion-inner">
        Anim pariatur cliche...
      </div>
    </div>
  </div>
</div>		-->		     
		  </div>      
 		</div>
 	</div>
 				
      <hr>

      <footer>
        <p>© Company 2015</p>
      </footer>

 </body>
</html>

