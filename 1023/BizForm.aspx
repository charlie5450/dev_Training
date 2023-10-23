<%@ Page Language="C#" %>

<script runat="server">
    protected void Page_Load(Object Sender, EventArgs e)
    {
        HelpDB db = new HelpDB();
        DataTable dt = db.getTable("SELECT * FROM TBIZ");

    }
</script>
<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>기업등록</title>
    <style>
    .line {
        border-bottom: 1px solid black;
    }

    .mandatory{
        color:red;
    }

    .cancelBtn {
        background-color:white;
        border: none;
        color: black;
        margin-left: 5px;
        margin-top: 10px;
        box-shadow: none;
        border: 1px solid;
    }

    .duplicateConfrimBtn {
        background-color: dodgerblue;
        border: none;
        color: white;
        margin-left: 5px;
        margin-top: 10px;
        box-shadow: none;
        border: 1px solid black;
    }

    .registerBtn {
        background-color: limegreen;
        border: none;
        color: white;
        margin-left: 5px;
        margin-top: 10px;
        box-shadow: none;
        border: 1px solid black;
    }

    .requiredInputComName {
        width: 120px;
        height: 20px;
        font-size: 15px;
        margin-top: 10px;
    }

    .requiredInputComNumber {
        width: 50px;
        height: 20px;
        font-size: 15px;
        margin-right: 10px; 
    }

    .requiredInputId {
        width: 150px;
        height: 20px;
        font-size: 15px;
        margin-bottom: 10px;
    }

    .requiredInputPw {
        width: 150px;
        height: 20px;
        font-size: 15px;
        margin-bottom: 10px;
    }

    .requiredInptuPwConfirm {
        width: 150px;
        height: 20px;
        font-size: 15px;
        margin-bottom: 10px;
    }

    .inputOfficer {
        width: 150px;
        height: 20px;
        font-size: 15px;
        margin-bottom: 10px;
    }

    .requiredInputNumber {
        width: 50px;
        height: 20px;
        font-size: 15px;
        margin-bottom: 10px;
        margin-right: 10px;
    }

    .requiredInputEmail {
        width: 150px;
        height: 20px;
        font-size: 15px;
        margin-bottom: 10px;
    }
    .selectValue {
        width: 100px;
        height: 25px;
        font-size: 15px;
        margin-bottom: 10px;
    }
</style>
</head>

<body>
    <form onsubmit="return register()" method="get">
        <div>
            <div style="margin-bottom: 10px">기업등록</div>
            <div class="line"></div>
            <div>
                <span class="mandatory">*</span> 기업명 <input class="requiredInputComName" type="text" /><br />
                <span class="mandatory">*</span> 사업자번호 <input class="requiredInputComNumber" id="comNum1" type="number" oninput='handleOnInput(this, 3)' /><input class="requiredInputComNumber" type="number" oninput='handleOnInput(this, 2)' /><input class="requiredInputComNumber" type="number" oninput='handleOnInput(this, 5)' /><button type="button" class="duplicateConfrimBtn" onclick="checkComNum(this)" )" >중복확인</button><br />
                <span class="mandatory">*</span> 아이디 <input class="requiredInputId" id="comId" type="text" /><button type="button" class="duplicateConfrimBtn" onclick="checkId(this)">중복확인</button><br />
                <span class="mandatory">*</span> 비밀번호 <input class="requiredInputPw" id="pw1" type="text" /> 영문자, 숫자, 특수문자가 섞인 8자리 이상으로 등록해주시기 바랍니다.<br />
                <span class="mandatory">*</span> 비밀번호 확인 <input class="requiredInptuPwConfirm" id="pw2" type="text" /><br />
                담당자 <input class="inputOfficer" type="text" /><br />
                <span class="mandatory">*</span> 대표번호 <input class="requiredInputNumber" type="number" oninput='handleOnInput(this, 4)' /><input class="requiredInputNumber" type="number"  oninput='handleOnInput(this, 4)' /><input class="requiredInputNumber" type="number" oninput='handleOnInput(this, 4)' /><br />
                <span class="mandatory">*</span> 대표 이메일<input class="requiredInputEmail" type="text" /> @ <select id="selectValue">
                    <option value="default">select</option>
                    <option value="naver.com">naver.com</option>
                    <option value="hanmail.net">hanmail.net</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="type">직접입력</option>
                </select><input type="text" id="hiddenTextInput" oninput="charCheck(this)" style="display: none;" />
            </div>
        </div>
        <div class="line"></div>
        <div style="text-align: center">
            <button type="button" class="cancelBtn" onclick="cancel()">취소</button>
            <button type="button" class="registerBtn" onclick="register()">등록</button>
        </div>
    </form>
</body>

<script>
    document.getElementById("selectValue").addEventListener("change", function () {
        var selectedOption = this.value;
        var textInput = document.getElementById("hiddenTextInput");

        if (selectedOption === "type") {
            textInput.style.display = "inline";
        } else {
            textInput.style.display = "none";
        }
    });

    //num의 자릿수 제한은 이렇게
    function handleOnInput(el, maxlength) {
        if (el.value.length > maxlength) {
            el.value
                = el.value.substr(0, maxlength);
        }
    }

    function checkComNum() {
        var checkComNum = document.getElementById('comNum1').value;
        if (checkComNum === '123') {
            alert('해당 사업자 번호가 등록되어 있습니다. 관리자에게 문의하세요');
        } else {
            alert('사용가능한 사업자 번호입니다');
        }
    }

    function checkId() {
        var checkId = document.getElementById('comId').value;
        if (checkId === 'id1') {
            alert('이미 등록된 계정입니다. 다른 계정을 기재해주세요');
        } else {
            alert('사용가능한 아이디입니다');
        }
    }

    function charCheck(obj) {
        var char = /[ \{\}\[\]\/?,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
        if (char.test(obj.value)) {
            alert('특수문자 입력불가');
            obj.value = obj.value.substring(0, obj.value.length - 1);
        }
    }

    function cancel() {
        var cancelBefore = confirm("닫기 시 기재된 정보가 저장되지 않습니다. 정말 닫으시겠습니까?");
        if (cancelBefore) {
            window.close();
        }
    }

    function register() { //required
        var requiredFields = document.querySelectorAll('.required');
        var pw1 = document.getElementById('pw1');
        var pw1txt = pw1.value;
        var pw2 = document.getElementById('pw2');
        var pw2txt = pw2.value;

        for (var i = 0; i < requiredFields.length; i++) {
            if (requiredFields[i].value === "") {
                alert("필수 항목이 비어 있으니 작성해주세요");
                return false;
            }
        }

        if (pw1txt != pw2txt) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다");
            return false;
        }
        //db에 넣는 코드 필요

    }

    window.addEventListener("beforeunload", function (event) {
        event.returnValue = "닫기 시 기재된 정보가 저장되지 않습니다. 정말 닫으시겠습니까?";
    });

</script>
</html>
