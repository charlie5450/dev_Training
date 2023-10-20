<%@ Page Language="C#" %>

<script runat="server"> //수정 요
    string comName1, userName1, number1, emailId1;
    string comName2, userName2, number2, emailId2;
    string comName3, userName3, number3, emailId3;
    protected void Page_Load(Object Sender, EventArgs e)
    {
        HelpDB db = new HelpDB();
        DataTable dt = db.getTable("SELECT * FROM dbo.TBIZ");
        comName1 = "";
        comName1 += dt.Rows[0]["comName"].ToString();
        number1 += dt.Rows[0]["number"].ToString();
        userName1 += dt.Rows[0]["userName"].ToString();
        emailId1 += dt.Rows[0]["email"].ToString();

        comName2 += dt.Rows[1]["comName"].ToString();
        number2 += dt.Rows[1]["number"].ToString();
        userName2 += dt.Rows[1]["userName"].ToString();
        emailId2 += dt.Rows[1]["email"].ToString();

        comName3 += dt.Rows[2]["comName"].ToString();
        number3 += dt.Rows[2]["number"].ToString();
        userName3 += dt.Rows[2]["userName"].ToString();
        emailId3 += dt.Rows[2]["email"].ToString();
    }
</script>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>기업목록</title>
    <script></script>
    <style>
    * {
        text-align: center;
    }

    table {
        width: 100%;
        border: 0.1px solid #000000;
        border-collapse: collapse;
    }

    th, td {
        border:0.1px solid #000000;
    }

    .searchbt {
        background-color: dodgerblue;
        border: none;
        color: white;
        margin-right: 30px;
        margin-top: 10px;
        margin-bottom: 15px;
        box-shadow: none;
        width: 60px;
        height: 30px;
        font-size: 15px;
        border: 0.1px solid #000000;
        float:right;
    }

    .button2 {
        background-color: limegreen;
        border: none;
        color: white;
        margin-left: 5px;
        margin-top: 10px;
        margin-bottom: 10px;
        box-shadow: none;
        border: 0.1px solid #000000;
    }

    .button3 {
        background-color: red;
        border: none;
        color: white;
        margin-left: 5px;
        margin-top: 10px;
        margin-bottom: 10px;
        box-shadow: none;
        border: 0.1px solid #000000;
    }

    .registerCom {
        background-color: dodgerblue;
        border: none;
        color: white;
        margin-left: 5px;
        margin-top: 10px;
        margin-bottom: 10px;
        box-shadow: none;
        float: right;
        border: 0.1px solid #000000;
    }

    div {
        background-color:lightgrey;
    }

    #top {
        border: 1px solid;
        overflow:hidden;
    }

    .inputComName {
        width: 120px;
        height: 20px;
        font-size: 15px;
        margin-top: 10px;
        margin-bottom: 10px;
        margin-right : 25px;
        border: 0.1px solid #000000;
    }

    .inputName {
        width: 150px;
        height: 20px;
        font-size: 15px;
        margin-top: 10px;
        margin-bottom: 10px;
        border: 0.1px solid #000000;
    }

    .inputNumber {
        width: 50px;
        height: 20px;
        font-size: 15px;
        margin-right: 5px;
        margin-bottom: 10px;
        border: 0.1px solid #000000;
    }

    .inputEmail {
        width: 150px;
        height: 20px;
        font-size: 15px;
        margin-bottom: 10px;
        border: 0.1px solid #000000;
    }

    .checkbox {
        margin-bottom: 10px;
        margin-top: 10px;
        border: 1px solid dodgerblue;
    }
</style>
</head>

<body>
    <div id="top">
        기업명 <input type="text" id="comName" class="inputComName" />
        사용자이름 <input type="text" id="name" class="inputName" /><br />
        연락처 <input type="number" id="num1" class="inputNumber" /><input type="number" id="num2" class="inputNumber" /><input type="number" id="num3" class="inputNumber" />
        이메일 <input type="text" id="email" class="inputEmail" /><br />
        <button class="searchbt" onclick="search()">조회</button><br />
    </div>

    <div>
        <button class="registerCom" id="popUpBtn">기업등록</button>
    </div>
    <form runat="server">
        <table id="Table1" border-width="0.1px" bordercolor="black" align="center" runat="server">
    <tr style="background-color : lightgrey">
        <th>
            <label for="checkbox">
                <input type="checkbox" id="selectAll" onclick="check()" />
            </label>
        </th>
        <th>기업명</th>
        <th>사용자이름</th>
        <th>연락처</th>
        <th>email</th>
        <th>관리</th>
    </tr>
    <tr>
        <th>
            <label for="checkbox">
                <input type="checkbox" class="subCheck" id="box0" />
            </label>
        </th>
        <!-- <td><asp:Button ID="button_1" runat="server" Text="<%=comName1 %>" OnClientClick='<%# "popUpView();" %>' /></td> -->
        <td><%=userName1 %></td>
        <td><%=number1 %></td>
        <td><%=emailId1 %></td>
        <th>
            <button type="button" class="button2" onclick="bt1Change(this)">수정</button>
            <button type="button" class="button3" onclick="bt2Change(this)">삭제</button>
        </th>
    </tr>
    <tr id="기업명2">
        <th>
            <label for="checkbox">
                <input type="checkbox" class="subCheck" id="box2" />
            </label>
        </th>
            <td><asp:Button ID="button_2" runat="server" Text="<%=comName2 %>" OnClientClick='<%# "popUpView();" %>' /></td>
            <td><%=userName2 %></td>
            <td><%=number2 %></td>
            <td><%=emailId2 %></td>
        <td>
            <button type="button" class="button2" onclick="bt1Change(this)">수정</button>
            <button type="button" class="button3" onclick="bt2Change(this)">삭제</button>
        </td>
    </tr>
<tr id="기업명3">
    <th>
        <label for="checkbox">
            <input type="checkbox" class="subCheck" id="box3" />
        </label>
    </th>
        <td><asp:Button ID="button_3" runat="server" Text="<%=comName3 %>" OnClientClick='<%# "popUpView();" %>' /></td>
        <td><%=userName3 %></td>
        <td><%=number3 %></td>
        <td><%=emailId3 %></td>
    <td>
        <button type="button" class="button2" onclick="bt1Change(this)">수정</button>
        <button type="button" class="button3" onclick="bt2Change(this)">삭제</button>
    </td>
</tr>

</table>
    </form>
    

    <script type="text/javascript">
        document.getElementById('selectAll').addEventListener('click', function () {
            var checkboxes = document.getElementsByClassName('subCheck');

            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = this.checked;
            }
        });

        function check() {//?
            var checkboxes = document.getElementsByClassName('Check');
        }

        function popUpView() {
            window.open('BizView.aspx', '기업보기', 'width=1000, height=800');
        }

        function bt1Change(element) {
            window.open("BizChange.aspx", "수정", "width=1000, height=800");
        }

        function bt2Change(obj) {
            var bt2before = confirm("해당 사용자를 정말 삭제하겠습니까?");
            if (bt2before) {
                var tr = obj.parentElement.parentElement;
                delete (tr); //지워도 안 지워져
            }
        }

        document.getElementById('popUpBtn').addEventListener('click', function () {
            var popupWindow = window.open('BizForm.aspx', '기업목록', 'width=1000,height=800');
        });

        function search() {
            var input1, input2, filter1, filter2, table, tr;
            input1 = document.getElementById("comName");
            input2 = document.getElementById("email");
            input3 = document.getElementById("name"); //이상함
            input4 = document.getElementById("num1");

            filter1 = input1.value.toUpperCase();
            filter2 = input2.value.toUpperCase();
            filter3 = input3.value.toUpperCase();
            filter4 = input4.value.toUpperCase();

            table = document.getElementById("Table1");
            tr = table.querySelectorAll("tr");

            tr.forEach(function (row) {
                var id = row.getAttribute("id");
                var email = row.querySelector("[id*='email']");
                if (id) {
                    if (id === filter1) {
                        row.style.display = "";
                    } else if (id === filter3) {
                        row.style.display = "";
                    }
                    //else if (email.textContent.toLocaleUpperCase().indexOf(filter2) != -1) { //여기 오류
                       // row.style.display = "";
                    //}
                    else {
                        row.style.display = "none";
                    }
                }
                
            });
        }
    </script>
</body>
</html>
