
function getDistrictByStateId(District,Taluk)
{
	//alert("geting list");
	
	var stateId=document.getElementById("state").value;
$("#distId").empty();
	
	if(stateId!=null || stateId!=undefined || stateId.langet>0){
		
		 var o = new Option("option text","");
    		/// jquerify the DOM object 'o' so we can use the html method
    		$(o).html("Select District");
    		$("#distId").append(o);
		
    		
		$.ajax({
			url:"AjaxRequests?action=getDistrictByState&stateId="+stateId,
			type:"POST",
			success:function(result){
				//alert(result);
				var obj = JSON.parse(result); 
				$.each (obj, function (i, room) {
					
					 var o = new Option("option text",room.district_id);
			       		/// jquerify the DOM object 'o' so we can use the html method
			       		$(o).html(room.district_name);
			       		$("#distId").append(o);
					
					
				});
				if(District!=""){
					setDistrict(District);
					getTalukaByDistId(Taluk);
				}
				
			}
		});
	}
	//alert("end");
	
}

function getpincodeByTown(){
	//alert("in");
	$("#pincodelist").empty();	
	
	var town=document.getElementById("town").value;
	if(town!=null || town!=undefined || town.langet>0){
		
		$.ajax({
			url:"AjaxRequests?action=getPinByTown&town="+town,
			type:"POST",
			success:function(result){
			
				
				var obj = JSON.parse(result); 
				$.each (obj, function (i, room) {
					
					
					document.getElementById("pincode").value=room.pincode;
					
					//alert(room.pincode);
			       		//pin code
					
					
					
				});
				
			}});
		
	}
	
	
}


function getTalukaByDistId(Taluk)
{
	
	var districtId=document.getElementById("distId").value;
	
$("#talukaId").empty();
$("#pincodelist").empty();
$("#townlist").empty();
	
	if(districtId!=null || districtId!=undefined || districtId.langet>0){
		
		
		
		 var o = new Option("option text","");
    		/// jquerify the DOM object 'o' so we can use the html method
    		$(o).html("Select Taluka");
    		$("#talukaId").append(o);
		
    		
		$.ajax({
			url:"AjaxRequests?action=getTalukaByDistrict&districtId="+districtId,
			type:"POST",
			success:function(result){
				//alert(result);
				var obj = JSON.parse(result); 
				$.each (obj, function (i, room) 
				{
					
					 var o = new Option("option text",room.taluka_id);
			       		/// jquerify the DOM object 'o' so we can use the html method
			       		$(o).html(room.taluka_name);
			       		$("#talukaId").append(o);
			       		
			       		
			       		
			       		//pin code
			       	 var op = new Option("option text","");
			       		/// jquerify the DOM object 'o' so we can use the html method
			       		$(op).html(room.pincode);
			       		$("#pincodelist").append(op);
					
			       		
				});
				
				if(Taluk!=""){
					setTaluka(Taluk);
					
				}
			}
		});
	}
	//alert("end");
}



function setPinCode(talukaId){
	//hiii
	//alert("call");
	//$("#pincodelist").empty();
	//alert("no clear");
	$.ajax({
		url:"AjaxRequests?action=getPinCodeByTalukaId&talukaId="+talukaId,
		type:"POST",
		success:function(result){
			var data=JSON.parse(result);
			//alert(result);
			
			
			 $.each (data, function (i, room) {
		       		  //alert(i+":"+room.pincode+":"+room.post_office);
		       		
		       		
				 // pin codes
		       	     var o = new Option();
		       		/// jquerify the DOM object 'o' so we can use the html method
		       		$(o).html(room.pincode);
		       		
		       		$("#pincodelist").append(o);
		       		
		       		
		       		//town
		       	 var o1 = new Option();
		       		/// jquerify the DOM object 'o' so we can use the html method
		       		$(o1).html(room.post_office);
		       		
		       		$("#townlist").append(o1);
		       		
		       		
		       		
		       		});  
			
			//document.getElementById("pincode").value=data.pincode;
			
		}});
	
	
}


function getDataByPinCode(){
	//alert("in fun");
	var pin=document.getElementById("pincode").value;
	
	var State;
	var District;
	var Taluk;
	if(pin.length==6){
		$.ajax({
			url:"AjaxRequests?action=getDataByPinCode&pincode="+pin,
			type:"POST",
					success:function(result){
						//alert("ok="+result);
						var data=JSON.parse(result);
						var PostOffice=data.PostOffice;
						
						 $.each (PostOffice, function (i, room) {
				       		//  alert(i+":"+room.Name);
				       		 if(i==0)
				       			 {
				       			 	State=room.State;
				       			    District=room.District;
				       			    Taluk=room.Taluk;
				       			 }
				       		
				       		});  
						/* document.getElementById("district").value=District;
							document.getElementById("taluka").value=Taluk;
						*/	
							
						//alert(State+":"+District+":"+Taluk);
					
						 
						 
						 //select state
						 
					var textToFind = State;

					var dd = document.getElementById('state');
					for (var i = 0; i < dd.options.length; i++) {
					    if (dd.options[i].text === textToFind) {
					        dd.selectedIndex = i;
					        break;
					    }
					}
					//alert("zal call");
					//get dist list
					getDistrictByStateId(District,Taluk);
					
					
					 
					
						//alert("done..");
					}
		})
		
		
		
		
		
	//window.location="AddressServlet?pincode="+pin;
		
		
		$.ajax({
			url:"AjaxRequests?action=getTownByPin&pincode="+pin,
			type:"POST",
					success:function(result){
						//alert("ok="+result);
						var data=JSON.parse(result);
						
						document.getElementById("town").value=data.post_office;
						//alert(data.post_office);
						
					}
		});
		
		
	}
	
	
}



function setDistrict(textToFind){
	//alert("in this"+textToFind);
	// alert(textToFind);
	var dd = document.getElementById('distId');
	//alert(dd.options.length);
	for (var i = 0; i < dd.options.length; i++) {
		//alert(dd.options[i].text );
	    if (dd.options[i].text === textToFind) {
	        dd.selectedIndex = i;
	        break;
	    }
	}
}



function setTaluka(Taluk){
	//alert("in this"+Taluk);
	// alert(textToFind);
	var textToFind=Taluk;
	var dd = document.getElementById('talukaId');
	//alert(dd.options.length);
	for (var i = 0; i < dd.options.length; i++) {
		//alert(dd.options[i].text );
	    if (dd.options[i].text === textToFind) {
	        dd.selectedIndex = i;
	        break;
	    }
	}
}



$("#location").keyup(function(){
	$("#citys").empty();
	var key=document.getElementById("location").value;
	
	$.ajax({
		url:"AjaxRequests?action=getLocationByKey&key="+key,
		type:"POST",
		success:function(result){
			//alert("call success.."+result);
			var data=JSON.parse(result);
			
				
// $.each (obj, function (i, room) {
			
			$.each(data, function(i,d) {
				//alert(d.city);
				var o = new Option();
	       		$(o).html(d.city);
	       		$("#citys").append(o);
	       		
			})
			
			
		}
	})
	
})



$("#location").change(function(){
	//alert("change call");
	var location=document.getElementById("location").value;
	setSessionLocation(location);
});


function setSessionLocation(location){
	//alert(location);
	$.ajax({
		
		url:"AjaxRequests?action=setLocation&city="+location,
		type:"POST",
		success:function(result){
			//alert("ok"+result+":"+ct);
		}
	})
}

var city = document.getElementById('location');

function getLocation() {
	//alert("in fun");
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
    	city.value = "Geolocation is not supported by this browser.";
    }
}

function showPosition(position) {
   /*  x.innerHTML = "Latitude: " + position.coords.latitude + 
    "<br>Longitude: " + position.coords.longitude; */
    
    
    var locapi="https://maps.googleapis.com/maps/api/geocode/json?latlng="+position.coords.latitude+","+position.coords.longitude+"&sensor=true";
    
    
    $.get({
    	url:locapi,
    	success:function(data){
    		console.log(data);
    		var ct="";
    		var size=data.results[0].address_components.length;
    		var siz=parseInt(size);
    		
    		if(siz>6){
    			//alert("siz if call ");
    		siz=siz-5
    		}
    		else{
    			//alert("siz else call ");
    			siz=2;
    		}
    		
    		
    		var existing = document.getElementById('location').value;
    		
    		if(existing===null || existing===undefined || existing.langet<=0 || existing===""){
    			
    		//city.value=data.results[0].address_components[siz].long_name;
    		document.getElementById("location").value=data.results[0].address_components[siz].long_name;
    		
    		var ct=document.getElementById("location").value;
    		
    		setSessionLocation(ct);
    		}
    		else{
    			//alert("in else");
    		}
    	}
    });
    
    
}


$(".search-btn").click(function(){
  //  alert("The paragraph was clicked. ");
    location.reload();
   // alert("ok")
});



$("#category").keyup(function(){
	//alert("in fun");
	var key=document.getElementById("category").value;
	//alert(key);
	$("#cateList").empty();
	
	$.ajax({
		
		url:"AjaxRequests?action=getDataByKey&key="+key,
		type:"POST",
		success:function(result){
			
		//	alert("call success.."+result);
			
			
			var data=JSON.parse(result);
			
			
			// $.each (obj, function (i, room) {
						
						$.each(data, function(i,d) {
						//	alert(d.cat);
							var o = new Option();
				       		$(o).html(d.cat);
				       		$("#cateList").append(o);
				       		
						})
			
			
		}
	})
	
})





