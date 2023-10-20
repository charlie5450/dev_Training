<%@ Page Language="C#" %>

<script runat="server">
    string tableString;
    protected void Page_Load(Object Sender, EventArgs e)
    {
        HelpDB db = new HelpDB();
        DataTable dt = db.getTable("SELECT * FROM TBIZ");
        tableString = "";
        foreach (DataRow dr in dt.Rows)
        {
            tableString += "<tr>";
            tableString += "<td>" + dr["BID"] + "</td>";
            tableString += "<td>" + dr["BIZNAME"] + "</td>";
            tableString += "</tr>";
        }

        //Reuqest["bid"] , //Reuqest["bizname"]
        
        //쿼리 실행
        db.Execute("insert into TBIZ values('300','휴노300')");

        //데이터 인서트
        DataRow idr = db.cmdInsert("TBIZ");
        idr["BID"] = "2000";
        idr["BIZNAME"] = "휴노200";
        db.insertUpdate(idr);

        //데이터 수정
        DataRow edr = db.cmdEdit("SELECT * FROM TBIZ WHERE BIZNAME = '삼성'");
        edr["BIZNAME"] = "현대";
        db.editUpdate(edr);

        //데이터 삭제
        db.Execute("DELETE FROM TBIZ WHERE BIZNAME ='삼성'");
    }
</script>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" method="post" >
        <table id="table1" border="1">
            <tr>
                <td>기업번호
                </td>
                <td>기업명
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" id="bid" / >
                </td>
                <td>
                    <input type="text" id="bizname" / >
                </td>
            </tr>
            <%=tableString %>
        </table>
     </form>
</body>
</html>
