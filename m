Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLQxS-0001zt-1s
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 02:07:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50474)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <newbnz@yahoo.com>) id 1XLQwv-0001x6-11
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 02:07:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <newbnz@yahoo.com>) id 1XLQwZ-0001Q6-NR
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 02:06:44 -0400
Received: from nm29-vm1.bullet.mail.bf1.yahoo.com ([98.139.213.144]:40394)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <newbnz@yahoo.com>) id 1XLQwZ-0001Q2-Gi
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 02:06:23 -0400
Received: from [98.139.212.151] by nm29.bullet.mail.bf1.yahoo.com with NNFMP;
	24 Aug 2014 06:06:22 -0000
Received: from [98.139.212.243] by tm8.bullet.mail.bf1.yahoo.com with NNFMP;
	24 Aug 2014 06:06:22 -0000
Received: from [127.0.0.1] by omp1052.mail.bf1.yahoo.com with NNFMP;
	24 Aug 2014 06:06:22 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 649699.11108.bm@omp1052.mail.bf1.yahoo.com
Received: (qmail 57608 invoked by uid 60001); 24 Aug 2014 06:06:22 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024;
	t=1408860382; bh=+UF11rQDYjTw2qLSwCaZh4/rNg+s9qnz+v9jhAIwbF0=;
	h=References:Message-ID:Date:From:Reply-To:Subject:To:MIME-Version:Content-Type;
	b=wWAuOpNbeG3gBZgMC5nQYld4jzvoQh6EpOfHx5ByMXZZEBroor2uG1rP+RSuOVUPAj1beZdlAvAcH1soGacf1S7ZymTKdu9WlIWGFsK8BLYTCPFPpUgXRakDOrwjdfOzlG7bwqPwQzKVqXm1ysWi8cape4ytgsihIdnHAc3oBCQ=
X-YMail-OSG: 2BerAzEVM1kA5lpdTJgzs_hxC0Q6GSgImURPcWLpBgO_6fv
	VmXOrVu3mAqHi6pELonqVK1XLE6BIfFvN_QslXAg4Fggdgwo6b96lBOeJgxH
	e9rz4E7NmAb5Fx.OmmL49ZouyNznvXH25pdf9uzE7uYk0W.zeHGqJDoryNMx
	wq2F050gK_WHRNUgfOfZOSi3ITdzJrHJx9vM4IJiCdR9A8M6WWuy_UIp2EKZ
	Prh1dA89KAZr5Le.rQRDdftVtd_nEUUir0qu7zVcOaHksTfgIlnH1D52JzbQ
	3dNCHVRkq.w6iN5Dq_yzEyTsqafZWfcfNzzUo1IXABoatnNIH3ItnHlGVcq5
	_VdP3CwnRJI.9KyfYBf3wZp3SYQozd7oG1L9VgyfxKquSVb_SCI5s4YRqWC6
	JH0B_nNVrFDVjjON_EaoYSJTrq3rLPwyGv7xDcsEqZifU8Zg0p81czRq4fAM
	n35N4DN1EFeUR5y9jUOdgPm_qag90IR.dxZa_3w.mdpLIj7hfzdo-
Received: from [50.184.68.153] by web140706.mail.bf1.yahoo.com via HTTP;
	Sat, 23 Aug 2014 23:06:22 PDT
X-Rocket-MIMEInfo: 002.001,
	SGksCgoKUXVlc3Rpb24gMToKLS0tLS0tLS0tLS0tLQpNeSBwbGF0Zm9ybSBoYXMgYW4gQUJJIHRoYXQgZGV2aWF0ZXMgYSBiaXQgZnJvbSBhbiBvbGQga25vd24gc3RhbmRhcmQgYXJjaGl0ZWN0dXJlIGFzIHN1cHBvcnRlZCBpbiBxZW11LiBTaG91bGQgSSBiZSBtb2RpZnlpbmcgdGhlwqB0Y2dfdGFyZ2V0X3FlbXVfcHJvbG9ndWUoKSzCoGJvdGggcHJvbG9ndWUgYW5kIGVwaWxvZ3VlIG9wY29kZXMgaW4gdGhhdCBmdW5jdGlvbizCoHRvZ2V0aGVywqB3aXRoIHRoZSBhc3NvY2lhdGVkIG1hY3JvcyBmb3IgZnIBMAEBAQE-
X-Mailer: YahooMailWebService/0.8.201.700
References: 
Message-ID: <1408860382.40848.YahooMailNeo@web140706.mail.bf1.yahoo.com>
Date: Sat, 23 Aug 2014 23:06:22 -0700
From: New B <newbnz@yahoo.com>
To: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="-637016289-1968415408-1408860382=:40848"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 98.139.213.144
Subject: [Qemu-trivial] Question about tcg and ABI
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: New B <newbnz@yahoo.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Aug 2014 06:07:17 -0000

---637016289-1968415408-1408860382=:40848
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,=0A=0A=0AQuestion 1:=0A-------------=0AMy platform has an ABI that devia=
tes a bit from an old known standard architecture as supported in qemu. Sho=
uld I be modifying the=A0tcg_target_qemu_prologue(),=A0both prologue and ep=
ilogue opcodes in that function,=A0together=A0with the associated macros fo=
r frame and push sizes as well as stack alignment (if necessary)?=0A=0AIf n=
ot, I would appreciate some guidance on how best to do that.=0A=0AQuestion =
2:=0A-------------=0AAlso, =A0are the current gdb-xml/*.xml files used sole=
ly for debugging under gdb, or do they serve another purpose?=0A=0A=0AThank=
s,=0A-nz
---637016289-1968415408-1408860382=:40848
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"color:#000; background-color:#fff; font-family:He=
lveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, sans-serif;fo=
nt-size:12pt"><div id=3D"yiv6964191446"><div><div style=3D"color: rgb(0, 0,=
 0); background-color: rgb(255, 255, 255); font-family: HelveticaNeue, 'Hel=
vetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; font-size: 12p=
t;"><div id=3D"yiv6964191446yui_3_16_0_6_1408821254811_9" class=3D"yiv69641=
91446" style=3D"">Hi,</div><div id=3D"yiv6964191446yui_3_16_0_6_14088212548=
11_9" class=3D"yiv6964191446" style=3D""><br style=3D""></div><div id=3D"yi=
v6964191446yui_3_16_0_6_1408821254811_9" class=3D"yiv6964191446" style=3D""=
><br></div><div id=3D"yiv6964191446yui_3_16_0_6_1408821254811_9" style=3D"c=
olor: rgb(0, 0, 0); font-size: 16px; font-family: HelveticaNeue, 'Helvetica=
 Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; background-color: tr=
ansparent; font-style: normal;" class=3D"yiv6964191446">Question 1:</div><d=
iv
 id=3D"yiv6964191446yui_3_16_0_6_1408821254811_9" style=3D"color: rgb(0, 0,=
 0); font-size: 16px; font-family: HelveticaNeue, 'Helvetica Neue', Helveti=
ca, Arial, 'Lucida Grande', sans-serif; background-color: transparent; font=
-style: normal;" class=3D"yiv6964191446">-------------</div><div id=3D"yiv6=
964191446yui_3_16_0_6_1408821254811_9" style=3D"color: rgb(0, 0, 0); font-s=
ize: 16px; font-family: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, =
'Lucida Grande', sans-serif; background-color: transparent; font-style: nor=
mal;" class=3D"yiv6964191446">My platform has an ABI that deviates a bit fr=
om an old known standard architecture as supported in qemu. Should I be mod=
ifying the&nbsp;<span style=3D"font-family: Menlo; font-size: 11px;" id=3D"=
yiv6964191446yui_3_16_0_1_1408821254811_3124" class=3D"yiv6964191446">tcg_t=
arget_qemu_prologue(),</span><span style=3D"font-size:12pt;" id=3D"yiv69641=
91446yui_3_16_0_1_1408821254811_3127" class=3D"yiv6964191446">&nbsp;both pr=
ologue and
 epilogue opcodes in that function,</span><span style=3D"font-size:12pt;" i=
d=3D"yiv6964191446yui_3_16_0_1_1408821254811_3169" class=3D"yiv6964191446">=
&nbsp;together</span><span style=3D"font-size:12pt;background-color:transpa=
rent;" class=3D"yiv6964191446" id=3D"yiv6964191446yui_3_16_0_1_140882125481=
1_3225">&nbsp;with the associated macros for frame and push sizes as well a=
s stack alignment (if necessary)?</span></div><div id=3D"yiv6964191446yui_3=
_16_0_6_1408821254811_9" style=3D"color: rgb(0, 0, 0); font-size: 12pt; fon=
t-family: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande=
', sans-serif; background-color: transparent; font-style: normal;" class=3D=
"yiv6964191446"><span style=3D"font-size:12pt;" class=3D"yiv6964191446" id=
=3D"yiv6964191446yui_3_16_0_6_1408821254811_16"><br id=3D"yiv6964191446yui_=
3_16_0_1_1408821254811_3130" class=3D"yiv6964191446" style=3D""></span></di=
v><div id=3D"yiv6964191446yui_3_16_0_6_1408821254811_9" style=3D"color: rgb=
(0, 0, 0); font-size: 16px;
 font-family: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Gr=
ande', sans-serif; background-color: transparent; font-style: normal;" clas=
s=3D"yiv6964191446"><span style=3D"font-size:12pt;" class=3D"yiv6964191446"=
 id=3D"yiv6964191446yui_3_16_0_6_1408821254811_48"></span></div><div id=3D"=
yiv6964191446yui_3_16_0_6_1408821254811_9" class=3D"yiv6964191446" style=3D=
"background-color:transparent;"><span class=3D"yiv6964191446" id=3D"yiv6964=
191446yui_3_16_0_6_1408821254811_19" style=3D"font-size:12pt;">If not, I wo=
uld appreciate some guidance on how best to do that.</span></div><div id=3D=
"yiv6964191446yui_3_16_0_1_1408821254811_3339" class=3D"yiv6964191446" styl=
e=3D""><span class=3D"yiv6964191446" style=3D"=0Afont-size:12pt;" id=3D"yiv=
6964191446yui_3_16_0_1_1408821254811_3338"><br id=3D"yiv6964191446yui_3_16_=
0_1_1408821254811_3337" class=3D"yiv6964191446" style=3D""></span></div><di=
v id=3D"yiv6964191446yui_3_16_0_6_1408821254811_9" style=3D"color: rgb(0, 0=
, 0); font-size: 16px; font-family: HelveticaNeue, 'Helvetica Neue', Helvet=
ica, Arial, 'Lucida Grande', sans-serif; background-color: transparent; fon=
t-style: normal;" class=3D"yiv6964191446"><span style=3D"font-size:12pt;" c=
lass=3D"yiv6964191446" id=3D"yiv6964191446yui_3_16_0_6_1408821254811_44">Qu=
estion 2:</span></div><div id=3D"yiv6964191446yui_3_16_0_6_1408821254811_9"=
 style=3D"color: rgb(0, 0, 0); font-size: 12pt; font-family: HelveticaNeue,=
 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; backgroun=
d-color: transparent; font-style: normal;" class=3D"yiv6964191446"><span st=
yle=3D"font-size:12pt;" class=3D"yiv6964191446" id=3D"yiv6964191446yui_3_16=
_0_6_1408821254811_52">-------------</span></div><div
 id=3D"yiv6964191446yui_3_16_0_6_1408821254811_9" style=3D"color: rgb(0, 0,=
 0); font-size: 16px; font-family: HelveticaNeue, 'Helvetica Neue', Helveti=
ca, Arial, 'Lucida Grande', sans-serif; background-color: transparent; font=
-style: normal;" class=3D"yiv6964191446"><span style=3D"font-size:12pt;" cl=
ass=3D"yiv6964191446" id=3D"yiv6964191446yui_3_16_0_6_1408821254811_37">Als=
o, &nbsp;are the current gdb-xml/*.xml files used solely for debugging unde=
r gdb, or do they serve another purpose?</span></div><div id=3D"yiv69641914=
46yui_3_16_0_6_1408821254811_9" style=3D"color: rgb(0, 0, 0); font-size: 16=
px; font-family: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida=
 Grande', sans-serif; background-color: transparent; font-style: normal;" c=
lass=3D"yiv6964191446"><br class=3D"yiv6964191446" style=3D""></div><div id=
=3D"yiv6964191446yui_3_16_0_6_1408821254811_9" style=3D"color: rgb(0, 0, 0)=
; font-size: 16px; font-family: HelveticaNeue, 'Helvetica Neue', Helvetica,=
 Arial, 'Lucida
 Grande', sans-serif; background-color: transparent; font-style: normal;" c=
lass=3D"yiv6964191446"><span style=3D"font-size:12pt;" class=3D"yiv69641914=
46" id=3D"yiv6964191446yui_3_16_0_6_1408821254811_27"><br id=3D"yiv69641914=
46yui_3_16_0_1_1408821254811_3176" class=3D"yiv6964191446" style=3D""></spa=
n></div><div id=3D"yiv6964191446yui_3_16_0_6_1408821254811_9" style=3D"colo=
r: rgb(0, 0, 0); font-size: 16px; font-family: HelveticaNeue, 'Helvetica Ne=
ue', Helvetica, Arial, 'Lucida Grande', sans-serif; background-color: trans=
parent; font-style: normal;" class=3D"yiv6964191446"><span style=3D"font-si=
ze:12pt;" class=3D"yiv6964191446" id=3D"yiv6964191446yui_3_16_0_6_140882125=
4811_30">Thanks,</span></div><div id=3D"yiv6964191446yui_3_16_0_6_140882125=
4811_9" style=3D"color: rgb(0, 0, 0); font-size: 12pt; font-family: Helveti=
caNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', sans-serif; ba=
ckground-color: transparent; font-style: normal;" class=3D"yiv6964191446"><=
span
 style=3D"font-size:12pt;" class=3D"yiv6964191446" id=3D"yiv6964191446yui_3=
_16_0_6_1408821254811_34">-nz</span></div><div id=3D"yiv6964191446yui_3_16_=
0_6_1408821254811_9" style=3D"color: rgb(0, 0, 0); font-size: 16px; font-fa=
mily: HelveticaNeue, 'Helvetica Neue', Helvetica, Arial, 'Lucida Grande', s=
ans-serif; background-color: transparent; font-style: normal;" class=3D"yiv=
6964191446">&nbsp;</div></div></div></div></div></body></html>
---637016289-1968415408-1408860382=:40848--

