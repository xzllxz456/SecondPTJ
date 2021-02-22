<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>메인</title>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/header_footer.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  		
  	<script>
  		$(function () {
  			$.ajax("../recent", {
  				method: "get",
  				dataType: "json",
  				success: successResponse
  			});
  		});
  		
  		function successResponse(result) {
  			/* let body = "";
  			for (let res of result) {
  				body += "<tr>";
  				body += "<td>" + res.notiIdx + "</td>";
  				body += "<td>" + res.notiWriter + "</td>";
  				body += "<td>" + res.notiSubject + "</td>";
  				body += "</tr>";
  			}
  			document.querySelector("table").innerHTML = body; */
  			
  			let $tbody = $("<tbody/>");
  			for (let res of result) {
  				let $tr = $("<tr/>");
  				$tr.append($("<td/>").text(res.notiIdx));
  				$tr.append($("<td/>").text(res.notiWriter));
  				$tr.append($("<td/>").text(res.notiSubject));
  				$tbody.append($tr);
  			}
  			$("table").html($tbody);
  		}
  	</script>
</head>
<body>
    <div class="body-content">
    	메인페이지
    	<table>
    	</table> 
    </div>
</body>
</html>
