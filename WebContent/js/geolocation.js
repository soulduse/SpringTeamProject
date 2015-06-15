
var lati;
var longi
if(navigator.geolocation)
{
	function myPosition(position)
	{
		lati = position.coords.latitude;
		longi = position.coords.longitude
		$('[name=latitude]').attr("value", lati);
		$('[name=longitude]').attr("value", longi);

		
	};
	navigator.geolocation.getCurrentPosition(myPosition);
}
else
{
	alert("지원하지 않습니다.")
}
