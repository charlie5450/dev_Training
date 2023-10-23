<%@ Page Language="C#" %>

<script runat="server">
    protected void Page_Load(Object Sender, EventArgs e)
    {
        HelpDB db = new HelpDB();
        string bid = Request["_bid"];
        DataRow dr = db.getDataRow("SELECT * FROM TBIZ WHERE BID = '" + bid + "'");
        if (dr != null)
        {
            comNameView.InnerHtml = dr["comName"].ToString();
            comNumberView.InnerText = dr["comNumber"].ToString();
            comIdView.InnerText = dr["comId"].ToString();
            officerView.InnerText = dr["officer"].ToString();
            numberView.InnerText = dr["number"].ToString();
            emailView.InnerText = dr["email"].ToString();
        }
    }
</script>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>기업보기</title>
    <style>
        .line {
            border-bottom: 1px solid black;
        }

        .closeBtn {
            background-color: white;
            border: none;
            color: black;
            margin : auto;
            margin-top: 10px;
            display: block;
            box-shadow: none;
            border: 1px solid;
        }
    </style>
</head>
<body>
    <form>
        <div> 기업보기 </div>
        <div class="line"></div>
        <div>
        <table>
            <tr>
                <td>
                    기업명
                </td>
                <td id="comNameView" runat="server">

                </td>
            </tr>
            <tr>
                <td>
                    사업자번호
                </td>
                <td id="comNumberView" runat="server">

                </td>
            </tr>
            <tr>
                <td>
                    아이디
                </td>
                <td id="comIdView" runat="server">

                </td>
            </tr>
            <tr>
                <td>
                    담당자
                </td>
                <td id="officerView" runat="server">

                </td>
            </tr>
            <tr>
                <td>
                    대표번호
                </td>
                <td id="numberView" runat="server">

                </td>
            </tr>
            <tr>
                <td>
                    대표 이메일
                </td>
                <td id="emailView" runat="server">

                </td>
            </tr>
        </table>
    </div>
    <div class="line"></div>
    <div>
        <button type="button" class="closeBtn" onclick="closeChange()">닫기</button>
    </div>
</form>
</body>

<script>
    function closeChange() {
        var closeBefore = confirm("창을 닫으시겠습니까?");
        if (closeBefore) {
            window.close();
        }//취소 확인 순서 바꾸기 : 버튼 커스텀
    }
</script>
</html>
