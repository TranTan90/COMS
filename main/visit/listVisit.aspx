<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="listVisit.aspx.cs" Inherits="main_visit_listVisit" Title="Chi tiết đăng ký (신청 내역)" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="../../include/Calender/js/jsCalendar.js" type="text/javascript"></script>
<script src="../../include/Calender/js/jsCalendar.datepicker.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">

// 전자 결재 관련 quản ký phê duyệt điện tử
var approveServerPath='<%=ConfigurationManager.AppSettings["elecApproveServerPath"]%>'; // 전자결재 서버 PATH
var approveServerPort='<%=ConfigurationManager.AppSettings["elecApproveServerPort"]%>'; // 전자결재 서버 PORT

if(approveServerPort) approveServerURL=approveServerPath + ":" + approveServerPort;
else approveServerURL=approveServerPath;
	
// 삭제 여부 có xóa hay không?
function confirmDelete(url){
    if (confirm('Dữ liệu xóa đi sẽ không phục hồi lại được.\n\n Có chắc chắn xóa không? (한번 삭제된 데이터는 복구가 불가능합니다.\n\n정말로 삭제하시겠습니까?)')) {
        window.location=url;
    }else{
        return;
    }
}

// 결재 상태 보기 xem trạng thái phê duyệt
function showApproveStatus(strDoc_code) {
	//strDoc_code 는 doc_code  입니다.
	var strOpt = 'dialogHeight:260px; dialogWidth:608px; leftmargin:30px; marginwidth:30px; dialogTop:'+(screen.height-250)/2+'px; dialogLeft:'+(screen.width-620)/2+'px;   center: yes; help: no; resizable: no; scroll: auto; status: no;';   
	var url = approveServerURL + '/Elec_legacy/Elec_status/Elec_status.asp?doc_code='+strDoc_code;
	strReturn = window.showModalDialog(url, 'Elec_status', strOpt);   
	return;  
}

</script>
<script language="javascript" type="text/javascript" src="../../include/js/calendar.js"></script>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
	<td>
		<!--################################ 타이틀, 현재위치 시작 ################################-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="26" height="35"><img src="/COMS/images/basic/icon_02.gif" width="25" height="20"></td>
			<td><span class="contents_title">Chi tiết đăng ký khách thăm (내방 신청 내역)</span> (Tài liệu lưu tạm thời phải được tiến hành phê duyệt mới có thể xử lý vào cổng. (임시저장된 문서는 결재를 진행하여야 입문 처리가 가능합니다.))</td>
			<td align="right" class="location">HOME &gt;Khách thăm (Chi tiết đăng ký) (내방 (신청 내역))</td>
		</tr>
		<tr>
			<td colspan="3" class="title_line"></td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td valign="top">			
							
		<table width="100%">
		<tr>
			<td align="right">
			
                 <label> From</label>
                     <asp:TextBox ID="txtStartDate" runat="server" data-datepicker data-format="yyyy-MM-DD" style="width : 85px" ></asp:TextBox>
                 <label> To  </label>
                     <asp:TextBox ID="txtEndDate" runat="server" data-datepicker data-format="yyyy-MM-DD" style="width : 85px" ></asp:TextBox>
					<asp:DropDownList id="txtKeyWord" runat="server">
                        <asp:ListItem Value="visitorName">Tên (이름)</asp:ListItem>
                        <asp:ListItem Value="companyName">Tên công ty (회사명)</asp:ListItem>
                    </asp:DropDownList><asp:TextBox id="txtKey" runat="server" Width="80px"></asp:TextBox>
				<asp:Button ID="Button2" runat="server" Text="Tìm kiếm (검색)" />
                    <asp:Button ID="Button1" runat="server" Text="Tải xuống (다운로드)" OnClick="Button1_Click" />
					<input type="button" value="In (인쇄)" onclick="window.print()" />
			</td>
		</tr>
		</table>
		<table width="100%">
		<tr>
				<td>
					<asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" Width="100%" OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" DataSourceID="ObjectDataSource1" PageSize="50" EmptyDataText="Không có nôi dung đăng ký (등록 된 내용이 없습니다)." CssClass="table table-bordered ">
			<FooterStyle BackColor="White" ForeColor="#000066" />
			<RowStyle ForeColor="#000066" />
			<PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
			<SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
						<Columns>
							<asp:BoundField DataField="RegDate" HeaderText="Ngày đăng ký (신청일)" DataFormatString="{0:yyyy.MM.dd}" HtmlEncode="False" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Ngày hẹn (예약일)" DataFormatString="{0:yyyy.MM.dd}" HtmlEncode="False" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Tên (성명)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Tên công ty (회사명)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Số điện thoại (전화번호)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Bộ phận đăng ký (신청부서)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Người đăng ký (신청자)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Người đón tiếp (접견자)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Mục đích đến (방문목적)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Số xe (차량번호)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField DataField="VisitDataCode" HeaderText="Trạng thái (상태)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField HeaderText="Sửa (수정)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
							<asp:BoundField HeaderText="Xóa (삭제)" >
								<HeaderStyle HorizontalAlign="Center" />
								<ItemStyle HorizontalAlign="Center" />
							</asp:BoundField>
						</Columns>
					</asp:GridView>
					<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="selectVisitDataList" TypeName="HanaMicron.COMS.BLL.VisitData">
						<SelectParameters>
							<asp:ControlParameter ControlID="txtKeyWord" Name="keyWord" PropertyName="SelectedValue" Type="String" />
							<asp:ControlParameter ControlID="txtKey" Name="key" PropertyName="Text" Type="String" />
							<asp:ControlParameter ControlID="txtStartDate" Name="searchStartDate" PropertyName="Text" Type="String" />
							<asp:ControlParameter ControlID="txtEndDate" Name="searchEndDate" PropertyName="Text" Type="String" />
							<asp:SessionParameter Name="upnid" SessionField="loginUpnid" Type="String" />
							<asp:Parameter Name="approveUserCode" Type="String" />
                            <asp:Parameter Name="type" Type="String" />
						</SelectParameters>
					</asp:ObjectDataSource>
					&nbsp;
				</td>
			</tr>
		</table>
	</td>
</tr>
<!--
<tr>
			<td>
				<strong>상태 도움말</strong><br />
				임시저장 : 결재를 상신하지 않은 상태 입니다.<br />
				결재 상신 중 : 결재를 상신하여 결재 완료를 대기 하는 중입니다.<br />
				승인 : 결재를 완료 후 입문 대기 상태입니다.<br />
				입문 : 내방객이 입문을 하여 출문 대기 중인 상태 입니다.<br />
				출문 : 내방객이 출문 하여 종결된 상태 입니다.<br />
			</td>
		</tr>
-->
</table>
	
</asp:Content>

