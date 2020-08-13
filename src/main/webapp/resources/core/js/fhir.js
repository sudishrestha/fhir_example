/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



var currentLocation = window.location.href;
var const1= currentLocation.toLowerCase()
if(const1.includes("checkeligibility"))
{
    openTabs(event, 'Eligibility');
}
else if(const1.includes("patient"))
{
    openTabs(event, 'Patient');
}
else if(const1.includes("location"))
{
    openTabs(event, 'Location');
}
else
{
    openTabs(event,'home')
}

function openTabs(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}