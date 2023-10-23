<%@ Page Language="C#" %>

<script runat="server"> //수정 요
    string comName, bid;
    protected void Page_Load(Object Sender, EventArgs e)
    {
        HelpDB db = new HelpDB();
        DataTable dt = db.getTable("SELECT * FROM dbo.TBIZ");

        foreach (DataRow dr in dt.Rows) {
            tableArea.InnerHtml += "<tr id=" + dr["BID"] +">";
            tableArea.InnerHtml += "    <td>";
            tableArea.InnerHtml += "        <label for='checkbox'>";
            tableArea.InnerHtml += "            <input type='checkbox' class='subCheck' id='box_" + dr["BID"] + "' />";
            tableArea.InnerHtml += "        </label>";
            tableArea.InnerHtml += "    </td>";
            tableArea.InnerHtml += "    <td>";
            tableArea.InnerHtml += "        <button type='button' class='button1' onclick = popUpView(" + dr["BID"] + ")>" + dr["comName"] + "</button>";
            tableArea.InnerHtml += "    </td>";
            tableArea.InnerHtml += "    <td>";
            tableArea.InnerHtml +=          dr["userName"];
            tableArea.InnerHtml += "    </td>";
            tableArea.InnerHtml += "    <td>";
            tableArea.InnerHtml +=          dr["number"];
            tableArea.InnerHtml += "    </td>";
            tableArea.InnerHtml += "    <td>";
            tableArea.InnerHtml +=          dr["email"];
            tableArea.InnerHtml += "    </td>";
            tableArea.InnerHtml += "    <td>";
            tableArea.InnerHtml += "        <button type='button' class='button2' onclick='bt1Change(" + dr["BID"] + ")'>수정</button>";
            tableArea.InnerHtml += "        <button type='button' class='button3' onclick='bt2Change(" + dr["BID"] + ")'>삭제</button>";
            tableArea.InnerHtml += "    </td>";
            tableArea.InnerHtml += "</tr>";
        }
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

    .button1 {
        border: none;
        outline: none;
        background: none;
        text-decoration: underline;
        font-size: 15px;
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
        <button type="button" class="searchbt" onclick="search()">조회</button><br />
    </div>

    <div>
        <button type="button" class="registerCom" id="popUpBtn">기업등록</button>
    </div>
    <form id="form1" method="post" runat="server">
        <input type="hidden" id="hidden1" name="deleteRow"/>
        <table id="Table1" border-width="0.1px" bordercolor="black" align="center">
            <colgroup>
                <col width="6%" /> <!-- 간격조절 -->
                <col width="18%" />
                <col width="18%" />
                <col width="18%" />
                <col width="18%" />
                <col width="18%" />
            </colgroup>
            <tr style="background-color : lightgrey">
                <th style="width:84px">
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
            <p id="tableArea" runat="server">

            </p> <!-- 원래 p/div 사용 불가, 향후 수정 -->
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

        function popUpView(bid) {
            window.open("/Biz/BizView.aspx?_bid=" + bid + " ", '기업보기', 'width=1000, height=800'); // '=' 넣는 거 유의
        }

        function bt1Change(bid) {
            window.open("/Biz/BizChange.aspx?_bid=" + bid + " ", '기업수정', 'width=1000, height=800');
        }

        function bt2Change(bid) {
            var bt2before = confirm("해당 사용자를 정말 삭제하겠습니까?");
            if (bt2before) {
                var tr = document.getElementById(bid); // 해당 bid의 tr 선택하는 걸로 수정
                tr.style.display = "none";

                //var a = document.getElementById(hidden1);
                //Request.Form["a"];
            }
        }

        document.getElementById('popUpBtn').addEventListener('click', function () {
            var popupWindow = window.open('BizForm.aspx', '기업등록', 'width=1000,height=800');
        });

        function search(bid) {
            var input1, input2, filter1, filter2, table, tr;
            input1 = document.getElementById("comName");
            input2 = document.getElementById("email");
            input3 = document.getElementById("name");
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
                    }
                    else if (id === filter3) {
                        row.style.display = "";
                    }
                    else if (email.textContent.toLocaleUpperCase().indexOf(filter2) != -1) { //여기 오류
                        row.style.display = "";
                    }
                    else {
                        row.style.display = "none";
                    }
                }
                
            });
        }
    </script>
</body>
</html>
