<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">

<script src="http://d3js.org/d3.v3.min.js"></script>
<script type="text/javascript" src=" http://code.jquery.com/jquery-1.6.4.min.js" ></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script type='text/javascript' src="http://code.jquery.com/ui/1.11.0/jquery-ui.min.js"> </script>
<script type='text/javascript' src="http://labratrevenge.com/d3-tip/javascripts/d3.tip.v0.6.3.js"> </script>
	
	<style>
	
	d3-tip {
	    line-height: 1;
	    color: black;
	}
	
	line.arrow {
	    stroke: #666;
	    stroke-width: 2px;
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
	  font: 12px sans-serif;
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
	
		
	
	
    <div class="container">
      
				<div class="input-append">
				   <input type = "text" class = "span4 search-query" id="search">
				    <button type="submit" class= "btn" onclick="searchNode()">Search</button>
				    <button type="submit" class= "btn" onclick="replace()">Mostra tutto</button>
				</div>	
				 
</div>				
				
<div id="testo"> </div>



<script>

var links = ${stringa};


var nodes = {};

// Compute the distinct nodes from the links.
links.forEach(function(link) {
  link.source = nodes[link.source] || (nodes[link.source] = {name: link.source});
  link.target = nodes[link.target] || (nodes[link.target] = {name: link.target});
  
});


var width = 850,
    height = 500;

var force = d3.layout.force()
    .nodes(d3.values(nodes))
    .links(links)
    .charge(-200)
    .size([width, height])
    .linkDistance(60)
    .charge(-200)
    .on("tick", tick)
    .start();

//pinning

var node_drag = d3.behavior.drag()
      .on("dragstart", dragstart)
      .on("drag", dragmove)
      .on("dragend", dragend);
  function dragstart(d, i) {
      force.stop() // stops the force auto positioning before you start dragging
  }
  function dragmove(d, i) {
      d.px += d3.event.dx;
      d.py += d3.event.dy;
      d.x += d3.event.dx;
      d.y += d3.event.dy;
  }
  function dragend(d, i) {
      d.fixed = true; // of course set the node to fixed so the force doesn't include the node in its auto positioning stuff
      force.resume();
  }
//  function releasenode(d) {
  //    d.fixed = false; // of course set the node to fixed so the force doesn't include the node in its auto positioning stuff
    //  force.resume();
 // }

var svg = d3.select("#grafo").append("svg")
.attr({xmlns: "http://www.w3.org/2000/svg",
        xlink: "http://www.w3.org/1999/xlink"})
    .attr("width", width)
    .attr("height", height);

// build the arrow.
svg.append("svg:defs").selectAll("marker")
    .data(["end","type","subClass"])      // Different link/path types can be defined here
  .enter().append("svg:marker")    // This section adds in the arrows
    .attr("id", String)
    .attr("viewBox", "0 -5 10 10")
    .attr("refX", 15)
    .attr("refY", -1.5)
    .attr("markerWidth", 6)
    .attr("markerHeight", 6)
    .attr("orient", "auto")
  .append("svg:path")
    .attr("d", "M0,-5L10,0L0,5");
   
//rettangolo di contorno    
svg.append("svg:rect")
.attr("width", width)
.attr("height",height)
.style("stroke","#000")
.style("fill","white");


// add the links and the arrows
var path = svg.append("svg:g").selectAll("path")
    .data(force.links())
  .enter().append("svg:path")
     .attr("id", function(d) { return d.source.index + "_" + d.target.index; })
    .attr("class", function(d) { return "link " + d.type; })
    .attr("marker-end", "url(#end)")
    .style("visibility","hidden")
    .style("stroke", function(d){
    	//if (d.type.indexOf("#type") > -1)
    		//return "green";
    	//if (d.type.indexOf("#subClassOf") > -1)
    		//return "blue";
    	//return "green";
    })
    .style("stroke-dasharray", function(d){
    	if (d.type.indexOf("#subClassOf") > -1)
    		return "0,2 1";
    })
	

// define the nodes
var node = svg.selectAll(".node")
    .data(force.nodes())
    .enter().append("g")
    .attr("class", "node")
    .on("click", click)
//    .on("dblclick", doubleclick)
    .on("mouseover",  function(){ d3.select(this).select("text").transition()
    	  .duration(750)
    	  .attr("x", 22)
    	  .style("fill", "steelblue")
    	  .style("stroke", "lightsteelblue")
    	  .style("stroke-width", ".5px")
    	  .style("font", "20px sans-serif");
    	  
    	  d3.select(this).select("circle").transition()
    	  .duration(750)
    	  .attr("r", 16)
    	  .style("fill", "lightsteelblue");})
    	  
    .on("mouseout", function(){
    	 d3.select(this).select("text").transition()
   	  .duration(750)
   	  .attr("x", 22)
   	  .style("fill", "#000")
   	  .style("stroke-width", ".5px")
   	  .style("font", "12px sans-serif");
   	  
   	  d3.select(this).select("circle").transition()
   	  .duration(750)
   	  .attr("r", 6)
   	  .style("stroke","#fff")
   	  .style("fill", "#ccc");
    	
    })
    		  
    .style("visibility","hidden")
     .call(node_drag);
	
	// add the nodes
node.append("circle")
	    .attr("r", 6);
    
    // aggiungere map rettangolo sui nomi dei nodi per renderlo cliccabile!!
  
node.append("svg:a")
//.attr("xlink:href", function (d) { return  d.name; })
.append("rect")
    //.attr("class", "clickable")
     .on("click", function(d){   
    		 window.open(d.name);  })
    		 .attr("x",20)
    .attr("y", -6)
    .attr("width", 50) //2*4.5)
    .attr("height", 12)
    .style("fill", "lightsteelblue")
    .style("fill-opacity", 1e-6 )        // set to 1e-6 to make transparent          
;
// add the text 
node.append("text")
    .attr("x", 3.5)
    .attr("y", ".35em")
    //.attr("text-anchor","middle")
    .text(function(d) {  if (d.name.lastIndexOf("#") > -1){
        return  d.name.substring(d.name.lastIndexOf("#"));
        
    } return d.name;});
  

// add the curvy lines
function tick() {
    
       path.attr("d", function(d) {
        var dx = d.target.x - d.source.x,
            dy = d.target.y - d.source.y,
            dr = Math.sqrt(dx * dx + dy * dy);
        return "M" + 
            d.source.x + "," + 
            d.source.y + "A" + 
            dr + "," + dr + " 0 0,1 " + 
            d.target.x + "," + 
            d.target.y;
    });

    	   
    node
        .attr("transform", function(d) { 
		    return "translate(" + d.x + "," + d.y + ")"; });
   /* 
  text.attr("transform", function(d) {
        return "translate(" + d.x + "," + d.y + ")";
      });*/
      
      
}


    function linkArc(d) {
      var dx = d.target.x - d.source.x,
          dy = d.target.y - d.source.y,
          dr = Math.sqrt(dx * dx + dy * dy);
      return "M" + d.source.x + "," + d.source.y + "A" + dr + "," + dr + " 0 0,1 " + d.target.x + "," + d.target.y;
    }

    function transform(d) {
      return "translate(" + d.x + "," + d.y + ")";
    }
    
    

//Set up tooltip
var tip = d3.tip()
    .attr('class', 'd3-tip')
  
    .html(function(d) {  if (d.type.lastIndexOf("#") > -1){
        return  d.type.substring(d.type.lastIndexOf("#"));
        
    } return d.type;})

svg.call(tip);


var path_label = svg.append("svg:g").selectAll(".path_label")
.data(force.links())
.enter().append("svg:text")
.attr("class", "path_label")
.append("svg:textPath")
  .attr("startOffset", "50%")
  .attr("text-anchor", "middle")
  .attr("xlink:href", function(d) { return "#" + d.source.index + "_" + d.target.index; })
  .style("fill", "#000")
  .style("font-family", "Arial")
  .on("mouseover", tip.show)
  .on("mouseout", tip.hide)
 /* .text(function(d) {  if (d.type.lastIndexOf("#") > -1){
      return  d.type.substring(d.type.lastIndexOf("#"));
      
  } return d.type;});*/
    



//Toggle stores whether the highlighting is on
var toggle = 0;
//Create an array logging what is connected to what
var linkedByIndex = {};
for (i = 0; i < d3.values(nodes).length; i++) {
  linkedByIndex[i + "," + i] = 1;
};
links.forEach(function (d) {
  linkedByIndex[d.source.index + "," + d.target.index] = 1;
});
//This function looks up whether a pair are neighbours
function neighboring(a, b) {
  return linkedByIndex[a.index + "," + b.index];
}
//click sul nodo rende visibili i padri e i figli



function click() {
	
  d3.select(this).attr("transform", function() {     		
	    return "translate(" + width/2 + "," + height/2 + ")"; });
  
  d3.select(this).select("text").transition()
  .duration(750)
  .attr("x", 22)
  .style("fill", "steelblue")
  .style("stroke", "lightsteelblue")
  .style("stroke-width", ".5px")
  .style("font", "20px sans-serif");
  
  d3.select(this).select("circle").transition()
  .duration(750)
  .attr("r", 16)
  .style("fill", "lightsteelblue");
  
	d = d3.select(this).node().__data__;

       //document.getElementById("testo").innerHTML += "Nodo:  " + d.name;
       
     $("#lista").append("<a href=\" "+d.name+ "\" class=\"list-group-item \">" + d.name.substring(d.name.lastIndexOf("#")) + "</a>");
	
     node.style("visibility", function (o) {
	     	if(neighboring(d, o) | neighboring(o, d)){
	    		return "visible" ;}
	    	else return "hidden";
	        
	    });
	    path.style("visibility", function (o) {
	
	    	if( d.index==o.source.index | d.index==o.target.index){    		
	   					return "visible" ;}
	    	else return "hidden";
	     
	    });
	
}




// ricerca di un nodo
var optArray = [];

for (var i = 0; i < d3.values(nodes).length - 1; i++) {
    optArray.push(d3.values(nodes)[i].name.substring(d3.values(nodes)[i].name.lastIndexOf('#')));
}

optArray = optArray.sort();
$(function () {
    $("#search").autocomplete({
        source: optArray
    });
});

function searchNode() {
    //find the node
    force.stop();
     var selectedVal = document.getElementById('search').value;
    var node = svg.selectAll(".node");
    
    if (selectedVal == "") {
    	node.style("visibility", "hidden");
    	path.style("visibility","hidden");
    } else {
    		
    	var selected2 = node.filter(function (d, i) {
    		if(d.name.toLowerCase().indexOf(selectedVal.toLowerCase()) > -1)
    			      {  return d.name ;}
		        });
    	    	
    	selected2.style("visibility","visible");
    	selected2.attr("transform", function(d) {     		
 		    return "translate(" + width/2 + "," + height/2 + ")"; });
    	
    	
    	d = d3.select(this).node().__data__;
   
    	var selected = node.filter(function (d, i) {
    	if(d.name.toLowerCase().indexOf(selectedVal.toLowerCase()) <= -1)
    			{    return d.name ;}
		 });
    	
		selected.style("visibility", "hidden");
		path.style("visibility", "hidden");
	//	selected.fixed=true; 
	//	path.fixed= true;   
			        
	
      //  force.start();    
		 }
    }

//tutti i nodi e tutti i link visibili
function replace(){
    d3.selectAll(".node, .link").style( "visibility", "visible");
	force.start();
}



    

</script>

</body>
</html>