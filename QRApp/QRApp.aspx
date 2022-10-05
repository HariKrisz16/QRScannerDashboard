<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QRApp.aspx.cs" Inherits="QRApp.QRApp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <style>
    .utterances {
      position: relative;
      box-sizing: border-box;
      width: 100%;
      max-width: 760px;
      margin-left: auto;
      margin-right: auto;
    }
    .utterances-frame {
      color-scheme: light;
      position: absolute;
      left: 0;
      right: 0;
      width: 1px;
      min-width: 100%;
      max-width: 100%;
      height: 100%;
      border: 0;
    }
  </style>
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <main class="default-content" aria-label="Content">
     <div class="post-sidebar-right" style="position: fixed;">
</div>
<style>
#reader {
    width: 640px;
}
@media(max-width: 600px) {
	#reader {
		width: 300px;
	}
}
.empty {
    display: block;
    width: 100%;
    height: 20px;
}
.alert {
    padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 4px;
}
.alert-info {
    color: #31708f;
    background-color: #d9edf7;
    border-color: #bce8f1;
}
.alert-success {
    color: #3c763d;
    background-color: #dff0d8;
    border-color: #d6e9c6;
}
#scanapp_ad {
    display: none;
}
@media(max-width: 1500px) {
	#scanapp_ad {
		display: block;
	}
}
</style>
<link rel="stylesheet" href="./HTML5 QR Code Scanner Demo _ Minhaz’s Blog_files/default.min.css">
<h1> HTML5 QR Code scanner</h1>
<div class="container">
	<div class="row">
		<div class="col-md-12" style="text-align: center;margin-bottom: 20px;">
			<div id="reader" style="display: inline-block; position: relative; padding: 0px; border: 1px solid silver;"><div style="text-align: left; margin: 0px;"><div style="position: absolute; top: 10px; right: 10px; z-index: 2; display: none; padding: 5pt; border: 1px solid silver; font-size: 10pt; background: rgb(248, 248, 248);">Built using <a href="https://github.com/mebjas/html5-qrcode" target="new">html5-qrcode</a><br><br><a href="https://github.com/mebjas/html5-qrcode/issues" target="new">Report issues</a></div><img src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCA0NjAgNDYwIiBzdHlsZT0iZW5hYmxlLWJhY2tncm91bmQ6bmV3IDAgMCA0NjAgNDYwIiB4bWw6c3BhY2U9InByZXNlcnZlIj48cGF0aCBkPSJNMjMwIDBDMTAyLjk3NSAwIDAgMTAyLjk3NSAwIDIzMHMxMDIuOTc1IDIzMCAyMzAgMjMwIDIzMC0xMDIuOTc0IDIzMC0yMzBTMzU3LjAyNSAwIDIzMCAwem0zOC4zMzMgMzc3LjM2YzAgOC42NzYtNy4wMzQgMTUuNzEtMTUuNzEgMTUuNzFoLTQzLjEwMWMtOC42NzYgMC0xNS43MS03LjAzNC0xNS43MS0xNS43MVYyMDIuNDc3YzAtOC42NzYgNy4wMzMtMTUuNzEgMTUuNzEtMTUuNzFoNDMuMTAxYzguNjc2IDAgMTUuNzEgNy4wMzMgMTUuNzEgMTUuNzFWMzc3LjM2ek0yMzAgMTU3Yy0yMS41MzkgMC0zOS0xNy40NjEtMzktMzlzMTcuNDYxLTM5IDM5LTM5IDM5IDE3LjQ2MSAzOSAzOS0xNy40NjEgMzktMzkgMzl6Ii8+PC9zdmc+" style="position: absolute; top: 4px; right: 4px; opacity: 0.6; cursor: pointer; z-index: 2; width: 16px; height: 16px;"><div id="reader__header_message" style="display: none; text-align: center; font-size: 14px; padding: 2px 10px; margin: 4px; border-top: 1px solid rgb(246, 246, 246);"></div></div><div id="reader__scan_region" style="width: 100%; min-height: 100px; text-align: center;"><br><img width="64" src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNzEuNjQzIDM3MS42NDMiIHN0eWxlPSJlbmFibGUtYmFja2dyb3VuZDpuZXcgMCAwIDM3MS42NDMgMzcxLjY0MyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+PHBhdGggZD0iTTEwNS4wODQgMzguMjcxaDE2My43Njh2MjBIMTA1LjA4NHoiLz48cGF0aCBkPSJNMzExLjU5NiAxOTAuMTg5Yy03LjQ0MS05LjM0Ny0xOC40MDMtMTYuMjA2LTMyLjc0My0yMC41MjJWMzBjMC0xNi41NDItMTMuNDU4LTMwLTMwLTMwSDEyNS4wODRjLTE2LjU0MiAwLTMwIDEzLjQ1OC0zMCAzMHYxMjAuMTQzaC04LjI5NmMtMTYuNTQyIDAtMzAgMTMuNDU4LTMwIDMwdjEuMzMzYTI5LjgwNCAyOS44MDQgMCAwIDAgNC42MDMgMTUuOTM5Yy03LjM0IDUuNDc0LTEyLjEwMyAxNC4yMjEtMTIuMTAzIDI0LjA2MXYxLjMzM2MwIDkuODQgNC43NjMgMTguNTg3IDEyLjEwMyAyNC4wNjJhMjkuODEgMjkuODEgMCAwIDAtNC42MDMgMTUuOTM4djEuMzMzYzAgMTYuNTQyIDEzLjQ1OCAzMCAzMCAzMGg4LjMyNGMuNDI3IDExLjYzMSA3LjUwMyAyMS41ODcgMTcuNTM0IDI2LjE3Ny45MzEgMTAuNTAzIDQuMDg0IDMwLjE4NyAxNC43NjggNDUuNTM3YTkuOTg4IDkuOTg4IDAgMCAwIDguMjE2IDQuMjg4IDkuOTU4IDkuOTU4IDAgMCAwIDUuNzA0LTEuNzkzYzQuNTMzLTMuMTU1IDUuNjUtOS4zODggMi40OTUtMTMuOTIxLTYuNzk4LTkuNzY3LTkuNjAyLTIyLjYwOC0xMC43Ni0zMS40aDgyLjY4NWMuMjcyLjQxNC41NDUuODE4LjgxNSAxLjIxIDMuMTQyIDQuNTQxIDkuMzcyIDUuNjc5IDEzLjkxMyAyLjUzNCA0LjU0Mi0zLjE0MiA1LjY3Ny05LjM3MSAyLjUzNS0xMy45MTMtMTEuOTE5LTE3LjIyOS04Ljc4Ny0zNS44ODQgOS41ODEtNTcuMDEyIDMuMDY3LTIuNjUyIDEyLjMwNy0xMS43MzIgMTEuMjE3LTI0LjAzMy0uODI4LTkuMzQzLTcuMTA5LTE3LjE5NC0xOC42NjktMjMuMzM3YTkuODU3IDkuODU3IDAgMCAwLTEuMDYxLS40ODZjLS40NjYtLjE4Mi0xMS40MDMtNC41NzktOS43NDEtMTUuNzA2IDEuMDA3LTYuNzM3IDE0Ljc2OC04LjI3MyAyMy43NjYtNy42NjYgMjMuMTU2IDEuNTY5IDM5LjY5OCA3LjgwMyA0Ny44MzYgMTguMDI2IDUuNzUyIDcuMjI1IDcuNjA3IDE2LjYyMyA1LjY3MyAyOC43MzMtLjQxMyAyLjU4NS0uODI0IDUuMjQxLTEuMjQ1IDcuOTU5LTUuNzU2IDM3LjE5NC0xMi45MTkgODMuNDgzLTQ5Ljg3IDExNC42NjEtNC4yMjEgMy41NjEtNC43NTYgOS44Ny0xLjE5NCAxNC4wOTJhOS45OCA5Ljk4IDAgMCAwIDcuNjQ4IDMuNTUxIDkuOTU1IDkuOTU1IDAgMCAwIDYuNDQ0LTIuMzU4YzQyLjY3Mi0zNi4wMDUgNTAuODAyLTg4LjUzMyA1Ni43MzctMTI2Ljg4OC40MTUtMi42ODQuODIxLTUuMzA5IDEuMjI5LTcuODYzIDIuODM0LTE3LjcyMS0uNDU1LTMyLjY0MS05Ljc3Mi00NC4zNDV6bS0yMzIuMzA4IDQyLjYyYy01LjUxNCAwLTEwLTQuNDg2LTEwLTEwdi0xLjMzM2MwLTUuNTE0IDQuNDg2LTEwIDEwLTEwaDE1djIxLjMzM2gtMTV6bS0yLjUtNTIuNjY2YzAtNS41MTQgNC40ODYtMTAgMTAtMTBoNy41djIxLjMzM2gtNy41Yy01LjUxNCAwLTEwLTQuNDg2LTEwLTEwdi0xLjMzM3ptMTcuNSA5My45OTloLTcuNWMtNS41MTQgMC0xMC00LjQ4Ni0xMC0xMHYtMS4zMzNjMC01LjUxNCA0LjQ4Ni0xMCAxMC0xMGg3LjV2MjEuMzMzem0zMC43OTYgMjguODg3Yy01LjUxNCAwLTEwLTQuNDg2LTEwLTEwdi04LjI3MWg5MS40NTdjLS44NTEgNi42NjgtLjQzNyAxMi43ODcuNzMxIDE4LjI3MWgtODIuMTg4em03OS40ODItMTEzLjY5OGMtMy4xMjQgMjAuOTA2IDEyLjQyNyAzMy4xODQgMjEuNjI1IDM3LjA0IDUuNDQxIDIuOTY4IDcuNTUxIDUuNjQ3IDcuNzAxIDcuMTg4LjIxIDIuMTUtMi41NTMgNS42ODQtNC40NzcgNy4yNTEtLjQ4Mi4zNzgtLjkyOS44LTEuMzM1IDEuMjYxLTYuOTg3IDcuOTM2LTExLjk4MiAxNS41Mi0xNS40MzIgMjIuNjg4aC05Ny41NjRWMzBjMC01LjUxNCA0LjQ4Ni0xMCAxMC0xMGgxMjMuNzY5YzUuNTE0IDAgMTAgNC40ODYgMTAgMTB2MTM1LjU3OWMtMy4wMzItLjM4MS02LjE1LS42OTQtOS4zODktLjkxNC0yNS4xNTktMS42OTQtNDIuMzcgNy43NDgtNDQuODk4IDI0LjY2NnoiLz48cGF0aCBkPSJNMTc5LjEyOSA4My4xNjdoLTI0LjA2YTUgNSAwIDAgMC01IDV2MjQuMDYxYTUgNSAwIDAgMCA1IDVoMjQuMDZhNSA1IDAgMCAwIDUtNVY4OC4xNjdhNSA1IDAgMCAwLTUtNXpNMTcyLjYyOSAxNDIuODZoLTEyLjU2VjEzMC44YTUgNSAwIDEgMC0xMCAwdjE3LjA2MWE1IDUgMCAwIDAgNSA1aDE3LjU2YTUgNSAwIDEgMCAwLTEwLjAwMXpNMjE2LjU2OCA4My4xNjdoLTI0LjA2YTUgNSAwIDAgMC01IDV2MjQuMDYxYTUgNSAwIDAgMCA1IDVoMjQuMDZhNSA1IDAgMCAwIDUtNVY4OC4xNjdhNSA1IDAgMCAwLTUtNXptLTUgMjQuMDYxaC0xNC4wNlY5My4xNjdoMTQuMDZ2MTQuMDYxek0yMTEuNjY5IDEyNS45MzZIMTk3LjQxYTUgNSAwIDAgMC01IDV2MTQuMjU3YTUgNSAwIDAgMCA1IDVoMTQuMjU5YTUgNSAwIDAgMCA1LTV2LTE0LjI1N2E1IDUgMCAwIDAtNS01eiIvPjwvc3ZnPg==" style="opacity: 0.8;"></div><div id="reader__dashboard" style="width: 100%;"><div id="reader__dashboard_section" style="width: 100%; padding: 10px 0px; text-align: left;"><div><div id="reader__dashboard_section_csr" style="display: block;"><div style="text-align: center;"><button>Request Camera Permissions</button></div></div><div id="reader__dashboard_section_fsr" style="text-align: center; display: none;"><input id="reader__filescan_input" accept="image/*" type="file" disabled="" style="width: 200px;"><span> Select Image</span></div></div><div style="text-align: center;"><a id="reader__dashboard_section_swaplink" href="https://blog.minhazav.dev/research/html5-qrcode.html#scan-using-file" style="text-decoration: underline;">Scan an Image File</a></div></div></div></div>
			<div class="empty"></div>
			<div id="scanned-result"></div>
		</div>
        <asp:TextBox ID="TxtScannedQRVAlue" runat="server" Text="InitialValue" autopostback="true" OnTextChanged="TxtScannedQRVAlue_TextChanged" ></asp:TextBox>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
	</div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="QRKey" DataSourceID="QRSource" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="QRKey" HeaderText="QRKey" ReadOnly="True" SortExpression="QRKey"></asp:BoundField>
            <asp:BoundField DataField="InTime" HeaderText="InTime" SortExpression="InTime"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="QRSource" ConnectionString='<%$ ConnectionStrings:DB_9B1DE6_doctymeConnectionString %>' DeleteCommand="DELETE FROM [QRAppoinment] WHERE [QRKey] = @QRKey" InsertCommand="INSERT INTO [QRAppoinment] ([QRKey], [InTime]) VALUES (@QRKey, @InTime)" SelectCommand="SELECT * FROM [QRAppoinment]" UpdateCommand="UPDATE [QRAppoinment] SET [InTime] = @InTime WHERE [QRKey] = @QRKey">
        <DeleteParameters>
            <asp:Parameter Name="QRKey" Type="String"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="QRKey" Type="String"></asp:Parameter>
            <asp:Parameter Name="InTime" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="InTime" Type="String"></asp:Parameter>
            <asp:Parameter Name="QRKey" Type="String"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <script src="Js/html5-qrcode.min.js"></script>
<script src="Js/highlight.min.js"></script>
<script>
function docReady(fn) {
    // see if DOM is already available
    if (document.readyState === "complete" || document.readyState === "interactive") {
        // call on next available tick
        setTimeout(fn, 1);
    } else {
        document.addEventListener("DOMContentLoaded", fn);
    }
}
/** Ugly function to write the results to a table dynamically. */
function printScanResultPretty(codeId, decodedText, decodedResult) {
	let resultSection = document.getElementById('scanned-result');
    let tableBodyId = "scanned-result-table-body";
    let TxtboxforQRPlaceHolder = "TxtScannedQRVAlue";
    if (!document.getElementById(tableBodyId)) {
        let table = document.createElement("table");
        table.className = "styled-table";
        table.style.width = "100%";
        resultSection.appendChild(table);
        let theader = document.createElement('thead');
        let trow = document.createElement('tr');
        let th1 = document.createElement('td');
        th1.innerText = "Count";
        let th2 = document.createElement('td');
        th2.innerText = "Format";
        let th3 = document.createElement('td');
        th3.innerText = "Result";
        trow.appendChild(th1);
        trow.appendChild(th2);
        trow.appendChild(th3);
        theader.appendChild(trow);
        table.appendChild(theader);
        let tbody = document.createElement("tbody");
        tbody.id = tableBodyId;
        table.appendChild(tbody);
    }
    let tbody = document.getElementById(tableBodyId);
    let txtBody = document.getElementById(TxtboxforQRPlaceHolder);
    let trow = document.createElement('tr');
    let td1 = document.createElement('td');
    td1.innerText = `${codeId}`;
    let td2 = document.createElement('td');
    td2.innerText = `${decodedResult.result.format.formatName}`;
    let td3 = document.createElement('td');
    td3.innerText = `${decodedText}`;
    document.getElementById('<%=TxtScannedQRVAlue.ClientID %>').value = `${decodedText}`;
    __doPostBack('TxtScannedQRVAlue', 'TextChanged');
    trow.appendChild(td1);
    trow.appendChild(td2);
    trow.appendChild(td3);
    tbody.appendChild(trow);
}
docReady(function() {
	hljs.initHighlightingOnLoad();
	var lastMessage;
	var codeId = 0;
	function onScanSuccess(decodedText, decodedResult) {
        /**
         * If you following the code example of this page by looking at the
         * source code of the demo page - good job!!
         * 
         * Tip: update this function with a success callback of your choise.
         */
		if (lastMessage !== decodedText) {
			lastMessage = decodedText;
            printScanResultPretty(codeId, decodedText, decodedResult);
            ++codeId;
		}
	}
	let html5QrcodeScanner = new Html5QrcodeScanner(
        "reader", 
        { 
            fps: 10,
            qrbox: { width: 250, height: 250 },
            // Important notice: this is experimental feature, use it at your
            // own risk. See documentation in
            // mebjas@/html5-qrcode/src/experimental-features.ts
            experimentalFeatures: {
                useBarCodeDetectorIfSupported: true
            },
            rememberLastUsedCamera: true
        });
	html5QrcodeScanner.render(onScanSuccess);
});
</script>
     </div>
   </main>
    </form>
</body>
</html>
