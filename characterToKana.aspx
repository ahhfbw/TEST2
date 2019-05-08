<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="characterToKana.aspx.cs" Inherits="characterToKana.characterToKana" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>日文汉字转平假名</title>
	<script type="text/javascript" src="js/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="js/BsmWebKanaInput.js"></script>
	<script>
		$(function () {
			//console.log($("#hz1").val());
			$("#hz1").change(function () {
				var strValue = $("#hz1").val();
				var strOut = "";
				for (i = 0; i < strValue.length; i++) {
					var iCode = strValue.charCodeAt(i);
					console.log(iCode)
					console.log("\n")
					strOut+= BsmWebKanaInput.toByteKana(iCode)
				}
				$("#pjm1").val(strOut)
			})

		})

		//function InputChange(obj) {
		//	$("#pjm2").val(katakanaToHiragana($(obj).val()))
		//}

		//function katakanaToHiragana(src) {
		//	return src.replace(/[\u30a1-\u30f6]/g, function (match) {
		//		var chr = match.charCodeAt(0)// - 0x60;
		//		return String.fromCharCode(chr);
		//	});
		//}

		//function hiraganaToKatagana(src) {
		//	return src.replace(/[\u3041-\u3096]/g, function (match) {
		//		var chr = match.charCodeAt(0)//   0x60;
		//		return String.fromCharCode(chr);
		//	});
		//}

		<%--
		//-------------------------------------------------------------------------------
		// 関数：[Enter]キー押下イベント
		// 説明：Editの[onkyedown]イベントに連動します。
		// 補足：[Enter]キーが押下された時に呼ばれます。
		//-------------------------------------------------------------------------------
		--%>
		function OnKeyDownByEdit(event) {

			var VK_RETURN = 0x0d;

			if (event.keyCode == VK_RETURN) {
				return false;
			} else {
				return true;
			}
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			日文汉字1：
			<asp:TextBox ID="hz1" runat="server" Width="600px"></asp:TextBox>
			<br />
			&nbsp;&nbsp;&nbsp;
			平假名1：
			<asp:TextBox ID="pjm1" runat="server" Width="600px"></asp:TextBox>
		</div>


		<div>
			日文汉字2：
			<input type="text" id="hz2" runat="server"  style="width: 600px"/>
			<br />
			&nbsp;&nbsp;&nbsp;
			平假名2：
			<input type="text" id="pjm2" runat="server" style="width: 600px"/>
		</div>
	</form>
</body>
</html>
