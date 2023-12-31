<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div id="bodyArea">
        <div id="bodyLeft">


        </div>

        <div id="bodyRight">

            <div class="textArea"></div>

        </div>

        <div id="bodyBtm" class="">


            <link rel="stylesheet" href="/global/css/login_ssl.css?v=20211116205359">
            <script type="text/javascript" src="/Scripts/jquery-1.10.2.min.js"></script>
            <script type="text/javascript" src="/global/js/check.js" defer="defer"></script>
            <script type="text/javascript">

                document.domain = "interpark.com";

                // SNS 로그인 완료 후, 동작하는 Call Back Function
                function receiveSnsResponse(id, email, name, loginResult) {
                    try {
                        fnGA_LoginResult('000', true);
                    } catch (e) { }

                    var urlAfterSnsLogin = '//tour.interpark.com';

                    if (GetParam('goUrl') != '')
                        urlAfterSnsLogin = decodeURIComponent(GetParam('goUrl'));

                    if (loginResult === 'Y') {

                        // 팝업 로그인 및 레이어 팝업의 경우 레이어 닫기
                        var openerUrl = location.href;
                        if (openerUrl.toLowerCase().indexOf('_method=layer') > -1 || openerUrl.toLowerCase().indexOf('_method=popup') > -1) {
                            window.location.href = document.getElementById("GoUrl").value;
                        }
                        else {
                            // 로그인 이후 redirectUrl 이동
                            location.href = urlAfterSnsLogin;
                        }
                    }
                }

                function GetParam(name) {
                    try {
                        var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);

                        if (results == null) {
                            return "";
                        }
                        else {
                            return results[1]; // || 0;
                        }
                    }
                    catch (e) { return ""; }
                }

                function snsAuthPopup(snsTp) {

                    var tp = '';
                    var snsMethod = '';
                    var bizCd = '60'; // 부문 코드 
                    if (snsTp == 'naver') {
                        snsMethod = 'loginNaverAuth'; tp = '20';
                    } else if (snsTp == 'kakao') {
                        snsMethod = 'loginKakaoAuth'; tp = '30';
                    } else if (snsTp == 'payco') {
                        snsMethod = 'loginPaycoAuth'; tp = '40';
                    }
                    //INCORP(10)+PC(00)+(facebook(10), naver(20), kakao(30), payco(40), google(50) 
                    var loginTp = bizCd + "00" + tp;
                    var url = "https://incorp.interpark.com/member/login.do?_method=" + snsMethod + "&tp=loginForClause&loginTp=" + loginTp;    //팝업창에 출력될 페이지 URL
                    window.open(url, "popup", "width=370, height=360, resizable=no, scrollbars=yes, status=no, toolbar=0,location=0,directories=0,menubar=0;");
                }

                function RefreshNoticeSections() {

                    document.getElementById('idPwdNotice').style.display = 'none';
                    document.getElementById('sentence4PasswordFail').style.display = 'none';
                    document.getElementById('sentence4Logout').style.display = 'none';
                    document.getElementById('sectionCaptcha').style.display = 'none';

                }

                function RefreshCaptcha() {
                    document.getElementById('ifrCaptcha').src = document.getElementById('ifrCaptcha').src;
                    document.getElementById('CaptchaValue').value = '';
                    document.getElementById('CaptchaValue').focus();
                }

                function getEvent(evt) {
                    return evt ? evt : window.event;
                }
                function keyTab(evt, chkData) {
                    evt = getEvent(evt);
                    if (evt.keyCode == 13) {
                        if (chkData == "login") {
                            document.getElementById("MemPWD").focus();
                        }
                    }
                }
                function keyLogin(evt, chkData) {
                    evt = getEvent(evt);
                    if (evt.keyCode == 13) {
                        if (chkData == "login") {
                            goSubmit();
                        }
                    }
                }

                function inFocus2(i) {
                    (i).style.border = '1px solid #DE4D52';
                    //(i).style.padding='4px 0 0 4px;';
                    (i).style.backgroundImage = 'none';
                    (i).style.backgroundColor = '#FAFAFA';
                }

                function outFocus3(obj, i) {
                    (obj).style.border = '1px solid #EAEAEA';
                    if (i == "MemID" && document.getElementById('MemID').value == '') {
                        (obj).style.background = 'url(https://sslimage.interpark.com/_nip_ui/login/bg_input_id.gif)';
                    } else if (i == "MemPWD" && document.getElementById('MemPWD').value == '') {
                        (obj).style.background = 'url(https://sslimage.interpark.com/_nip_ui/login/bg_input_pwd.gif)';
                    }
                }

                function goSubmit() {

                    RefreshNoticeSections();

                    var docUrl = document.URL;
                    var objFrm = document.getElementById("frmLogin");
                    var objId = objFrm.MemID;
                    var objPw = objFrm.MemPWD;
                    var argId = objId.value;
                    var argPw = objPw.value;
                    var saveID = objFrm.SaveMemID.value;
                    var autoLogin = objFrm.AutoLogin.value;
                    var errorMsg = '';
                    var isPopup = ("initial" == "popup" || "initial" == "layer") ? true : false;
                    var argCapcha = objFrm.CaptchaValue.value;

                    // 익스 10 이하는 placeholder 수동처리
                    var exVer = GetExplorerVersion();
                    if (exVer > 0 && exVer <= 10) {
                        argId = argId.replace($j("#MemID").attr("placeholder"), "");
                        argPw = argPw.replace($j("#MemPWD").attr("placeholder"), "");
                    }

                    var errorMsgElement = document.getElementById('idPwdNotice');

                    if ("" == argId) {
                        errorMsg = '<p class="error">아이디를 입력해주세요.</p>';
                        errorMsgElement.innerHTML = errorMsg;
                        errorMsgElement.style.display = 'block';

                        objId.focus();
                        return;
                    }

                    if ("" == argPw) {
                        errorMsg = '<p class="error">비밀번호를 입력해주세요.</p>';
                        errorMsgElement.innerHTML = errorMsg;
                        errorMsgElement.style.display = 'block';

                        objPw.focus();
                        return;
                    }

                    if (('false' == 'true' || document.getElementById("sectionCaptcha").style.display == 'block') && "" == argCapcha) {
                        errorimg = '<p class="error">보안 문자를 입력하세요.</strong> <br />';
                        errorMsgElement.innerHTML = errorimg;
                        objPw.focus();
                        return;
                    }

                    // 로그인 중입니다
                    errormsg = '<p class="error">로그인 중입니다...</p>';
                    errorMsgElement.innerhtml = errormsg;
                    errorMsgElement.style.display = 'block';

                    reqLoginAutologin(argId, argPw, saveID, autoLogin, isPopup, argCapcha, function (code, message, pwdFailCnt) {
                        try {
                            fnGA_LoginResult(code, false);
                        } catch (e) { }

                        if (code == "000" || code == "200") {
                            errorMsgElement.innerHTML = '';
                            window.location.href = document.getElementById("GoUrl").value;
                        }
                        else if (code == "005") {
                            errorMsg = '<p class="error">보안 문자가 올바르지 않습니다.</p>';
                        }
                        else if (code == "006") {
                            errorMsg = '<p class="error">비정상적인 접속 시도로 계정 보호를 위해 로그인 잠김처리 되었습니다.'
                                + '<a href="javascript:ShowUserDormPopup()">본인확인 및 비밀번호 재설정</a></p>';
                        }
                        else if (code == "007") {
                            errorMsg = '<p class="error">부정거래 이용자 입니다.</p>';
                        }
                        else if (code == "501") {
                            errorMsg = '<p class="error">아이디 또는 비밀번호가 일치하지 않습니다.'
                                + '<br>SNS 회원이신 경우 연결된 SNS로 로그인해주세요.</p>';
                        }
                        else if (code == "101") {
                            errorMsg = '<p class="error lock">로그인 오류가 5회 초과했습니다.'
                                + '<br>'
                                + '    <span>정보보호를 위해 자동입력방지 문자를 함께 입력해주세요.</span>'
                                + '</p>';

                            // Show Top Notice ( 소중한 정보보호를 위해 재로그인이 필요합니다 )
                            document.getElementById('sentence4PasswordFail').style.display = 'block';

                            // Show Captcha
                            document.getElementById('sectionCaptcha').style.display = 'block';
                        }
                        else {
                            if (Number(pwdFailCnt) == 0) {
                                errorMsg = '<p class="error">아이디 또는 비밀번호가 일치하지 않습니다.</p>';
                            }
                            else {
                                errorMsg = '<p class="error">아이디 또는 비밀번호가 일치하지 않습니다. (로그인 오류 : ' + pwdFailCnt + '회)'
                                    + '<br>5회 이상 로그인 오류 시 보안을 위해 비밀번호 사용이 제한됩니다.</p>';
                            }
                        }

                        errorMsgElement.innerHTML = errorMsg;
                        errorMsgElement.style.display = 'block';

                        RefreshCaptcha();
                    });
                }

                function ShowUserDormPopup() {

                    var form = document.frmUserDorm;
                    var url = "https://incorp.interpark.com/member/checkCert.do";
                    var popup = window.open(url, "userDorm", "width=620px, height=400px")

                    form.target = "userDorm";
                    form.action = url;
                    form.submit();
                    popup.focus();
                }

                function matchIdPopUp() {
                    var url = "https://incorp.interpark.com/member/matchid.do?_method=initialPopUp&egsTp=6000";
                    window.open(url, "아이디_찾기", "width=500,height=300,scrollbars=no");
                }
                function matchPwdPopUp() {
                    var url = "https://incorp.interpark.com/member/matchpwd.do?_method=initialPopUp&egsTp=6000";
                    window.open(url, "비밀번호_찾기", "width=480,height=275,scrollbars=no");
                }
                function memJoin() {

                    var ippcd = getCookie('ippcd');
                    var ippcdForSE = 'P14550';
                    var ippcdForSoulBrain = 'P14572';

                    var url = "https://incorp.interpark.com/member/memberjoinclause.do?_method=initial&reqSite=TOUR&egsTp=6000&mbn=tour&mln=sub_join";

                    // 제휴사 ( 삼성전자, 솔브레인의 경우 전용 가입 페이지로 링크 변경 )
                    if (ippcd == ippcdForSE)
                        url = 'https://incorp.interpark.com/member/memberjoin.do?_method=initialPartner&partnerTp=SAMSUNG';
                    else if (ippcd == ippcdForSoulBrain)
                        url = 'https://incorp.interpark.com/member/memberjoin.do?_method=initialPartner&partnerTp=SOULBRAIN';

                    if ("initial" == "initial")
                        location.href = url;
                    else
                        window.open(url);
                }

                function chg_checkopt(btnID, type) {
                    var objFrm = document.getElementById("frmLogin");
                    var obj;

                    if (type == "saveID")
                        obj = objFrm.SaveMemID;
                    else if (type == "autoLogin")
                        obj = objFrm.AutoLogin;
                    else
                        return;

                    if (btnID.checked == false) {
                        obj.value = "N";
                    }
                    else {
                        obj.value = "Y";
                    }
                }

                function LoginInit() {
                    // 로그 아웃 진입일 때 안내 메시지 표시
                    if (GetParam('_method') == 'logout')
                        document.getElementById('sentence4Logout').style.display = 'block';

                    // 탭 클릭 이벤트
                    _NonMember.SetClickEvent();
                    _NonMember.Init();

                //     // 익스 9,10에서 placeholder 표시해주기
                //     _placeHolder.Init();
                // }

                AddWindowEvent(LoginInit);

                // 비회원 로그인
                var _NonMember = {

                    nmInterval: null,
                    nmAvailSecond: 180,
                    nmDisableMin: 5,
                    nmLeftTime: 0,
                    nmAuthFailCnt: 0,   // 인증실패 횟수 (max 5회)
                    nmInputFailCnt: 0,  // 인증번호 입력 오류 횟수 (max 3회)

                    Init: function () {

                        // 인증실패 횟수를 쿠키에서 가져온다
                        var failcnt = getCookie("NMAFC");

                        if (failcnt == null || failcnt == "" || failcnt == 0)
                            return;

                        _NonMember.nmAuthFailCnt = failcnt;

                        if (_NonMember.nmAuthFailCnt > 5)
                            _NonMember.SetSMSAuthButtonDisable();
                        else if (_NonMember.nmAuthFailCnt > 0)
                            $j(".j_certification").text("인증실패 (" + String(_NonMember.nmAuthFailCnt) + "/5)");
                    },

                    // 클릭이벤트 생성
                    SetClickEvent: function () {

                        $j(".j_loginTabWrap li").each(function (idx, obj) {

                            $j(obj).click(function () {

                                $j(".j_loginTabWrap li").removeClass("current");
                                $j(obj).addClass("current");

                                $j(".j_loginContents").hide();
                                $j(".j_loginContents:eq(" + idx + ")").show();
                            })
                        });

                        $j("#btnSMSAuth").click(function () { _NonMember.NMemberSMSAuth(); });
                        $j("#btnNMAuthCheck").click(function () { _NonMember.NMemberAuthCheck(); });
                    },

                    // 비회원 SMS 인증 발송
                    NMemberSMSAuth: function () {

                        // 인증실패 5회 이상 상태이면 return
                        if (_NonMember.nmAuthFailCnt > 5)
                            return;

                        // --------------------------------------
                        // 재전송 버튼 클릭시 실패 처리
                        if (_NonMember.nmInterval != null) {
                            _NonMember.SetAuthFail("fail");
                            return;
                        }

                        var hpno = $j.trim($j("#txtNMHP").val());
                        var usernm = $j.trim($j("#txtNMNM").val());

                        // 익스 10 이하는 placeholder 수동처리
                        var exVer = GetExplorerVersion();
                        if (exVer > 0 && exVer < 11) {
                            hpno = hpno.replace($j("#txtNMHP").attr("placeholder"), "");
                            usernm = usernm.replace($j("#txtNMNM").attr("placeholder"), "");
                        }

                        usernm = usernm.replace(/-/g, "");

                        if (usernm == "") {
                            _NonMember.ShowNMemberErrorMessage("이름을 입력해주세요.", "Y");
                            $j("#txtNMNM").focus();
                            return;
                        }

                        if (hpno == "") {
                            _NonMember.ShowNMemberErrorMessage("휴대폰 번호를 입력해주세요.", "Y");
                            $j("#txtNMHP").focus();
                            return;
                        }

                        if (!chk_number(hpno) || hpno.length < 10 || hpno.substr(0, 1) != "0" || hpno.length > 11) {
                            _NonMember.ShowNMemberErrorMessage("휴대폰 번호를 정확하게 입력해 주세요.", "Y");
                            $j("#txtNMHP").focus();
                            return;
                        }

                        //---------------------------------------
                        // 오류메세지 초기화
                        _NonMember.ShowNMemberErrorMessage("", "N");

                        var strParam = '';
                        strParam += 'hpno=' + encodeURIComponent(hpno);
                        strParam += '&usernm=' + encodeURIComponent(usernm);

                        new ajaxO.Request(
                            "POST",
                            "/Exporter/ws/GateService.asmx/NonMemberSMSAuth",
                            strParam,
                            function (result) {
                                var item = result.getElementsByTagName("CustomerAuth")[0];
                                var code = item.getElementsByTagName("ErrCode")[0].childNodes[0].nodeValue;

                                var message = "";
                                if (item.getElementsByTagName("ErrText")[0].childNodes[0] != null && typeof item.getElementsByTagName("ErrText")[0].childNodes[0] != 'undefined')
                                    message = item.getElementsByTagName("ErrText")[0].childNodes[0].nodeValue;

                                if (code == "00") {
                                    _NonMember.ShowNMemberErrorMessage("인증번호가 발송되었습니다.", "Y");

                                    _NonMember.nmLeftTime = _NonMember.nmAvailSecond;
                                    _NonMember.SetNMemAuthTime();
                                    _NonMember.nmInterval = setInterval(_NonMember.SetNMemAuthTime, 1000);

                                    $j("#btnSMSAuth").text("인증번호 재전송");
                                }
                                else {
                                    _NonMember.ShowNMemberErrorMessage("인증오류:" + message, "Y");
                                }
                            },
                            "XML");
                    },


                    // 남은 시간 표시
                    SetNMemAuthTime: function () {

                        if (_NonMember.nmLeftTime > 0) {

                            _NonMember.nmLeftTime--;
                            $j(".j_certification").text("남은시간 : " + _NonMember.SecToMinSec(_NonMember.nmLeftTime));
                        }
                        else {

                            _NonMember.SetAuthFail("time");
                        }
                    },

                    // 초 -> 0분 0초
                    SecToMinSec: function (t) {

                        var min;
                        var sec;

                        // 정수로부터 남은 시, 분, 초 단위 계산
                        min = Math.floor(t / 60);
                        sec = t - (min * 60);

                        if (min < 10) min = "0" + min;
                        if (sec < 10) sec = "0" + sec;
                        return (min + ":" + sec);
                    },

                    // 비회원 오류메세지 노출
                    ShowNMemberErrorMessage: function (msg, imgyn) {

                        if (msg == "") {
                            // default 메세지
                            $j(".j_nomemCaution").html("비회원으로 <span>예약 시 입력하신 정보</span>로 로그인해 주세요.");
                        }
                        else {
                            var img = "";

                            if (imgyn == "Y")
                                img = '<span><img src="https://sslimage.interpark.com/tourpark/tour_ui/common/icon/caution_login.gif"></span>';

                            $j(".j_nomemCaution").html('<span>' + img + ' ' + msg + '</span>');
                        }
                    },

                    // 비회원 SMS 인증번호 확인
                    NMemberAuthCheck: function () {

                        var authno = $j.trim($j("#txtNMAuthNo").val());
                        var hpno = $j.trim($j("#txtNMHP").val());

                        // 익스 10 이하는 placeholder 수동처리
                        var exVer = GetExplorerVersion();
                        if (exVer > 0 && exVer < 11) {
                            hpno = hpno.replace($j("#txtNMHP").attr("placeholder"), "");
                            authno = authno.replace($j("#txtNMAuthNo").attr("placeholder"), "");
                        }

                        if (authno == "") {
                            _NonMember.ShowNMemberErrorMessage("인증번호를 입력해 주세요.", "Y");
                            $j("#txtNMAuthNo").focus();
                            return;
                        }

                        if (_NonMember.nmLeftTime <= 0) {
                            _NonMember.ShowNMemberErrorMessage("인증번호 입력시간이 초과되었습니다. <br/>인증번호 재전송 버튼을 눌러 다시 시도해 주세요", "Y");
                            return;
                        }

                        var strParam = '';
                        strParam += 'hpno=' + encodeURIComponent(hpno);
                        strParam += '&authno=' + encodeURIComponent(authno);

                        new ajaxO.Request(
                            "POST",
                            "/Exporter/ws/GateService.asmx/NonMemberAuthCheck",
                            strParam,
                            function (result) {
                                var item = result.getElementsByTagName("CustomerAuth")[0];
                                var code = item.getElementsByTagName("ErrCode")[0].childNodes[0].nodeValue;

                                var message = "";
                                if (item.getElementsByTagName("ErrText")[0].childNodes[0] != null && typeof item.getElementsByTagName("ErrText")[0].childNodes[0] != 'undefined')
                                    message = item.getElementsByTagName("ErrText")[0].childNodes[0].nodeValue;

                                var enckey = "";
                                if (item.getElementsByTagName("EncKey")[0].childNodes[0] != null && typeof item.getElementsByTagName("EncKey")[0].childNodes[0] != 'undefined')
                                    enckey = item.getElementsByTagName("EncKey")[0].childNodes[0].nodeValue;

                                var authinfo = "";
                                if (item.getElementsByTagName("AuthMethodInfo")[0].childNodes[0] != null && typeof item.getElementsByTagName("AuthMethodInfo")[0].childNodes[0] != 'undefined')
                                    authinfo = item.getElementsByTagName("AuthMethodInfo")[0].childNodes[0].nodeValue;

                                if (code == "00") {

                                    clearInterval(_NonMember.nmInterval);
                                    _NonMember.nmInterval = null;

                                    // Non Member Auth Fail Count 쿠키 삭제
                                    setCookie("NMAFC", 0, -1);

                                    _NonMember.ShowNMemberErrorMessage("로그인중입니다..", "N");

                                    SetNMemInfoS(enckey, authinfo, "Y");
                                }
                                else {

                                    _NonMember.nmInputFailCnt++;

                                    if (_NonMember.nmInputFailCnt > 3) {

                                        _NonMember.SetAuthFail("fail");
                                    }
                                    else {

                                        _NonMember.ShowNMemberErrorMessage("올바른 인증번호를 입력해 주세요.", "Y");
                                    }
                                }
                            },
                            "XML");
                    },

                    SetAuthFail: function (type) {

                        // 인증번호 3번 틀리면 인증실패 1회로 간주함
                        clearInterval(_NonMember.nmInterval);
                        _NonMember.nmInterval = null;
                        _NonMember.nmLeftTime = 0;
                        _NonMember.nmInputFailCnt = 0;
                        _NonMember.nmAuthFailCnt++;

                        // Non Member Auth Fail Count 쿠키 세팅
                        setSessionCookie("NMAFC", _NonMember.nmAuthFailCnt);

                        // 인증번호 5회 실패시 비활성화
                        if (_NonMember.nmAuthFailCnt > 5) {

                            _NonMember.SetSMSAuthButtonDisable();
                        }
                        else {
                            $j(".j_certification").text("인증실패 (" + String(_NonMember.nmAuthFailCnt > 5 ? 5 : _NonMember.nmAuthFailCnt) + "/5)");

                            if (type == "time")
                                _NonMember.ShowNMemberErrorMessage("인증번호 입력시간이 초과되었습니다. <br>인증번호 재전송 버튼을 눌러 다시 시도해 주세요.", "Y");
                            else
                                _NonMember.ShowNMemberErrorMessage("인증이 실패 되었습니다. <br>인증번호 재전송 버튼을 눌러 다시 시도해 주세요.", "Y");
                        }
                    },

                    // 인증번호 전송 Disable
                    SetSMSAuthButtonDisable: function () {

                        $j("#btnSMSAuth").prop("disabled", true);
                        $j("#btnNMAuthCheck").prop("disabled", true);
                        $j("#btnSMSAuth").css("color", "#ccc");

                        $j(".j_certification").text("인증실패 (5/5)");

                        _NonMember.ShowNMemberErrorMessage("인증실패 5회 초과로 5분간 인증번호 전송이 불가합니다. ", "Y");
                        setTimeout(_NonMember.SetSMSAuthButtonEnable, _NonMember.nmDisableMin * 60 * 1000);
                    },

                    // 인증번호 전송 Enable
                    SetSMSAuthButtonEnable: function () {

                        $j("#btnSMSAuth").prop("disabled", false);
                        $j("#btnNMAuthCheck").prop("disabled", false);
                        $j("#btnSMSAuth").css("color", "#666");

                        // Non Member Auth Fail Count 쿠키 삭제
                        setCookie("NMAFC", 0, -1);

                        _NonMember.nmAuthFailCnt = 0;

                        $j(".j_certification").text("미인증");
                        _NonMember.ShowNMemberErrorMessage('<p class="nomemCaution j_nomemCaution"> 비회원으로 <span>예약 시 입력하신 정보</span>로 로그인해 주세요. </p> ', "N");
                    }

                }

                function SetMemInfoResult(result) {
                    if (result.successYN == "Y") {

                        window.location.href = document.getElementById("GoUrl").value;
                    }
                    else {

                        alert("비회원 로그인 오류가 발생하였습니다. [" + result.message + "]");
                    }
                }

                // 익스 버전체크
                function GetExplorerVersion() {

                    var rv = -1; // Return value assumes failure.    

                    try {
                        if (navigator.appName == 'Microsoft Internet Explorer') {
                            var ua = navigator.userAgent;
                            var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
                            if (re.exec(ua) != null)
                                rv = parseFloat(RegExp.$1);
                        }
                    }
                    catch (e) { }

                    return rv;
                }

                var _placeHolder = {

                    Init: function () {

                        var exVer = GetExplorerVersion();
                        if (exVer < 0 || exVer > 10)
                            return;

                        $j("input[type=password]").attr("type", "text");

                        $j.each($j("input[type=text]"), function (idx, obj) {

                            $j(obj).val($j(obj).attr("placeholder"));

                            // focus 이벤트
                            $j(obj).focus(function () {

                                if ($j(obj).val() != $j(obj).attr("placeholder"))
                                    return;

                                if ($j(obj).attr("id") == "MemPWD") {
                                    $j(obj).attr("type", "password");
                                }

                                $j(obj).val("");
                            });

                            // blur 이벤트
                            $j(obj).blur(function () {

                                if ($j(obj).val() != "")
                                    return;

                                if ($j(obj).attr("id") == "MemPWD") {
                                    $j(obj).attr("type", "text");
                                }

                                $j(obj).val($j(obj).attr("placeholder"));
                            });
                        });
                    }
                }


                    ; (function ($) {

                        $(document).ready(function (e) {

                            var agent = navigator.userAgent.toLowerCase();

                            $.extend($.fn, {
                                inputClear: function () {
                                    var input = $(this);

                                    input.each(function () {
                                        var $this = $(this);
                                        var clearBt = $this.next('.delBtn');

                                        $(window).load(function () {
                                            clearBt.hide();
                                        });

                                        $this.on('keyup focus', function () {

                                            // IE 의 경우 일괄 삭제 버튼 표시 하지 않음
                                            if (agent.indexOf('msie') != -1)
                                                return false;

                                            clearBt.toggle(Boolean($(this).val()));

                                        });

                                        $this.blur(function () {
                                            // blur 직후 hide 할 경우 event 발생 하지 않음
                                            setTimeout(function () {
                                                clearBt.hide();
                                            }, 250);
                                        });

                                        clearBt.toggle(Boolean($this.val()));
                                        clearBt.click(function () {
                                            $this.val('').focus();
                                            $(this).hide();
                                        });
                                    });
                                },

                                checkNoti: function () {
                                    var $checkWrap = $(this);
                                    var $checkStyle = $checkWrap.find('.checkStyle:first-child');
                                    var $checkInput = $checkStyle.children('input:checkbox');
                                    var $showCheck = $checkWrap.find('.maintain');

                                    $checkInput.click(function () {
                                        if ($checkInput.prop('checked')) {
                                            $showCheck.show();
                                        } else {
                                            $showCheck.hide();
                                        }
                                    });
                                }
                            });

                            $('.iInput').inputClear();
                            $('.loginCheck').checkNoti();


                        });


                    })(jQuery);

            </script>
            <script type="text/javascript" src="/global/js/failLog.js"></script>




            <form id="frmLogin" method="post">
                <div id="loginAllWrap">
                    <div class="topNotiBox">
                        <p id="sentence4PasswordFail" style="display: none">소중한 정보보호를 위해
                            <span>재로그인</span>이 필요합니다.
                        </p>

                        <p id="sentence4Logout" style="display: none">정상적으로
                            <span>로그아웃</span> 처리되었습니다.
                        </p>
                    </div>
                    <div class="leftLoginBox">
                        <div class="loginTabWrap j_loginTabWrap">
                            <ul>
                                <li class="current">
                                    <a href="javascript:;">회원</a>
                                </li>
                                <li>
                                    <a href="javascript:;">비회원</a>
                                </li>
                            </ul>
                        </div>


                        <div class="loginContents j_loginContents">
                            <iframe
                                src="https://accounts.interpark.com/authorize/tour-pc?origin=https%3a%2f%2fevents.interpark.com%2fexhibition%3fexhibitionCode%3d220921017%26utm_medium%3dcpc%26utm_source%3dgoogle%26utm_campaign%3dtour_airlowest_20221017_paidsearch_pc_cpc%26utm_content%3dconsider_34%26utm_term%3d%25EC%259D%25B8%25ED%2584%25B0%25ED%258C%258C%25ED%2581%25AC%25ED%2588%25AC%25EC%2596%25B4%26gclid%3dCj0KCQjw5f2lBhCkARIsAHeTvli_lvQRWTJWMVXGZ2jdFeqKU2jRF4BpLkX9-XsIL8-NNyfotVFGItgaAt4gEALw_wcB&amp;postProc=IFRAME"
                                width="460" height="650" frameborder="0" scrolling="no" title="login"></iframe>
                        </div>



                        <div class="tabCon noMember j_loginContents" style="display:none;">
                            <div class="loginFieldWrap">
                                <h4 class="blind">비회원 로그인</h4>
                                <p class="nomemCaution j_nomemCaution"> 비회원으로
                                    <span>예약 시 입력하신 정보</span>로 로그인해 주세요.
                                </p>
                                <ul>
                                    <li>
                                        <div class="styleInput">
                                            <input type="text" id="txtNMNM" class="iInput" placeholder="이름"
                                                title="이름을 입력하세요.">
                                        </div>
                                    </li>
                                    <li>
                                        <div class="styleInput noMemberPhone">
                                            <input type="text" id="txtNMHP" class="iInput" placeholder="휴대폰번호(-없이 입력)"
                                                title="휴대폰번호를 입력하세요." maxlength="13">
                                            <button type="button" id="btnSMSAuth">인증번호 전송</button>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="styleInput noMemberNumber">
                                            <input type="text" id="txtNMAuthNo" class="iInput" placeholder="인증번호"
                                                title="인증번호를 입력하세요." maxlength="4"
                                                onkeydown="if(event.keyCode==13){_NonMember.NMemberAuthCheck();}">
                                            <div class="certification j_certification"> 미인증 </div>
                                        </div>
                                    </li>
                                </ul>
                                <ul class="loginInfoTxt">
                                    <li>3분 이내로 인증번호(4자리)를 입력하셔야 합니다.</li>
                                    <li>인증실패 시 "재전송"버튼을 눌러 주시기 바랍니다.</li>
                                </ul>
                                <div class="loginBtn">
                                    <button type="button" id="btnNMAuthCheck" class="btnRed">비회원 로그인</button>
                                </div>
                            </div>
                        </div>


                    </div>


                    <input id="GoUrl" name="GoUrl" type="hidden"
                        value="https://events.interpark.com/exhibition?exhibitionCode=220921017&amp;utm_medium=cpc&amp;utm_source=google&amp;utm_campaign=tour_airlowest_20221017_paidsearch_pc_cpc&amp;utm_content=consider_34&amp;utm_term=%EC%9D%B8%ED%84%B0%ED%8C%8C%ED%81%AC%ED%88%AC%EC%96%B4&amp;gclid=Cj0KCQjw5f2lBhCkARIsAHeTvli_lvQRWTJWMVXGZ2jdFeqKU2jRF4BpLkX9-XsIL8-NNyfotVFGItgaAt4gEALw_wcB">
                    <input id="_method" name="_method" type="hidden" value="initial">
                    <input id="SaveMemID" name="SaveMemID" type="hidden" value="">
                    <input id="AutoLogin" name="AutoLogin" type="hidden" value="N">

                </div>
            </form>





            <form name="frmUserDorm" method="post" action="https://incorp.interpark.com/member/checkCert.do">
                <input type="hidden" name="_method" value="totalCertify">
                <input type="hidden" id="hidUserDormMemId" name="mbrId" value="">
                <input type="hidden" id="hidUserDormMemInfo" name="mbrInfo" value="">
                <input type="hidden" name="type" value="userDorm">
            </form>


        </div>

    </div>