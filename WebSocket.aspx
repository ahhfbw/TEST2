<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebSocket.aspx.cs" Inherits="characterToKana.WebSocket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>WebSocket</title>
	<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
	<script>
		function WebSocketTest() {
			if ("WebSocket" in window) {
				alert("您的浏览器支持 WebSocket!");

				// 打开一个 web socket
				var ws = new WebSocket("ws://echo.websocket.org/");

				ws.onopen = function () {
					// Web Socket 已连接上，使用 send() 方法发送数据
					ws.send("发送数据");
					alert("数据发送中...");
				};

				ws.onmessage = function (evt) {
					var received_msg = evt.data;
					alert("数据已接收...");
				};

				ws.onclose = function () {
					// 关闭 websocket
					alert("连接已关闭...");
				};

				ws.onerror = function (evt) { console.log('WebSocketError!'); };

			}

			else {
				// 浏览器不支持 WebSocket
				alert("您的浏览器不支持 WebSocket!");
			}

			window.addEventListener('submit', function (e) {
			e.preventDefault();
			var val = $("#sendText").val();
			ws.send(val);
			$("#sendText").val("");
		});
		}


	</script>
</head>
<body onload="WebSocketTest()">
	<form id="form1" runat="server">
		<input id="sendText" placeholder="Text to send" />
		<div id="sse">
			<a href="javascript:WebSocketTest()">运行 WebSocket</a>
		</div>
		<input type="submit" value="submit" id="submit" />
	</form>
</body>
</html>
