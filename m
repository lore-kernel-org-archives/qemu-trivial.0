Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b1Fvc-00019D-05
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2016 12:27:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b1FvX-000143-PZ
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 12:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b1FvS-0004S8-FC
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 12:26:59 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:41254)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b1FvS-0004Rp-1G
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 12:26:54 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1b1FvN-0005lb-Jm from Talha_Imran@mentor.com 
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 09:26:50 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.121]) by
	SVR-IES-FEM-03.mgc.mentorg.com ([137.202.0.108]) with mapi id
	14.03.0224.002; Fri, 13 May 2016 17:26:47 +0100
From: "Imran, Talha" <Talha_Imran@mentor.com>
To: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Thread-Topic: [PATCH] Fix QEMU PPC e500v1 efscmp* instructions
Thread-Index: AQHRqr9BoGiDdbboj0abVCg4qfVMbJ+2Q4r1gADO1wA=
Date: Fri, 13 May 2016 16:26:47 +0000
Message-ID: <3052678E9DA67D4CB879A6625EE42075274B5A3C@EU-MBX-02.mgc.mentorg.com>
References: <3052678E9DA67D4CB879A6625EE42075274B5092@EU-MBX-02.mgc.mentorg.com>,
	<3052678E9DA67D4CB879A6625EE42075274B5912@EU-MBX-02.mgc.mentorg.com>
In-Reply-To: <3052678E9DA67D4CB879A6625EE42075274B5912@EU-MBX-02.mgc.mentorg.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
Content-Type: multipart/mixed;
	boundary="_004_3052678E9DA67D4CB879A6625EE42075274B5A3CEUMBX02mgcmento_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
Subject: [Qemu-trivial] [PATCH] Fix QEMU PPC e500v1 efscmp* instructions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 13 May 2016 16:27:01 -0000

--_004_3052678E9DA67D4CB879A6625EE42075274B5A3CEUMBX02mgcmento_
Content-Type: multipart/alternative;
	boundary="_000_3052678E9DA67D4CB879A6625EE42075274B5A3CEUMBX02mgcmento_"

--_000_3052678E9DA67D4CB879A6625EE42075274B5A3CEUMBX02mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

re-post with attachment.

________________________________
From: Imran, Talha
Sent: Friday, May 13, 2016 9:04 AM
To: qemu-trivial@nongnu.org
Subject: [PATCH] Fix QEMU PPC e500v1 efscmp* instructions

ping

________________________________
From: Imran, Talha
Sent: Tuesday, May 10, 2016 6:24 PM
To: qemu-ppc@nongnu.org; qemu-devel@nongnu.org
Subject: [PATCH] Fix QEMU PPC e500v1 efscmp* instructions

Hi Everyone,

Please find attached a patch which fixes handling in QEMU PPC e500v1 for ef=
scmp*
instructions. This was the cause of over 400 FAILs for this CPU while runni=
ng
GCC testsuite, which have been fixed.

Value for Condition Registers (CR) being set in QEMU was different from
the value observed on hardware.

I have not managed to find a documentation describing the behaviour of
e500 cores for these instructions. However, the behaviour on
MPC8548-CDS target was observed by dumping registers to stdout, while
running executables from uboot.

These instructions are used by GCC only when compiling for te500v1 multilib=
; hence no
effect on other PPC CPUs (603, 7400 etc.)

A comparison of GCC v5.2.0 testsuite results summary (number of FAILs) is a=
s follows:

CPU =3D te500v1
without patch: 699
with patch: 193

CPU =3D e500v2
without patch: 225
with patch: 225

Is this OK to commit? Comments and suggestions are welcome.

Thanks,
Talha Imran

--_000_3052678E9DA67D4CB879A6625EE42075274B5A3CEUMBX02mgcmento_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">=0A=
<!--=0A=
p=0A=
	{margin-top:0;=0A=
	margin-bottom:0}=0A=
p=0A=
	{margin-top:0;=0A=
	margin-bottom:0}=0A=
-->=0A=
</style><style type=3D"text/css"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">re-post with attachment.&nbsp;
<div><br>
</div>
<div>
<div>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div id=3D"divRpF195720" style=3D"direction: ltr;"><font face=3D"Tahoma" si=
ze=3D"2" color=3D"#000000"><b>From:</b> Imran, Talha<br>
<b>Sent:</b> Friday, May 13, 2016 9:04 AM<br>
<b>To:</b> qemu-trivial@nongnu.org<br>
<b>Subject:</b> [PATCH] Fix QEMU PPC e500v1 efscmp* instructions<br>
</font><br>
</div>
<div></div>
<div>
<div style=3D"direction:ltr; font-family:Tahoma; color:#000000; font-size:1=
0pt">ping<br>
<br>
<div style=3D"font-family:Times New Roman; color:#000000; font-size:16px">
<hr tabindex=3D"-1">
<div id=3D"divRpF65373" style=3D"direction:ltr"><font face=3D"Tahoma" color=
=3D"#000000" size=3D"2"><b>From:</b> Imran, Talha<br>
<b>Sent:</b> Tuesday, May 10, 2016 6:24 PM<br>
<b>To:</b> qemu-ppc@nongnu.org; qemu-devel@nongnu.org<br>
<b>Subject:</b> [PATCH] Fix QEMU PPC e500v1 efscmp* instructions<br>
</font><br>
</div>
<div></div>
<div>
<div style=3D"direction:ltr; font-family:Tahoma; color:#000000; font-size:1=
0pt">Hi Everyone,
<br>
<br>
Please find attached a patch which fixes handling in QEMU PPC e500v1 for ef=
scmp* <br>
instructions. This was the cause of over 400 FAILs for this CPU while runni=
ng <br>
GCC testsuite, which have been fixed.<br>
<br>
Value for Condition Registers (CR) being set in QEMU was different from <br=
>
the value observed on hardware. <br>
<br>
I have not managed to find a documentation describing the behaviour of <br>
e500 cores for these instructions. However, the behaviour on <br>
MPC8548-CDS target was observed by dumping registers to stdout, while<br>
running executables from uboot. <br>
<br>
These instructions are used by GCC only when compiling for te500v1 multilib=
; hence no<br>
effect on other PPC CPUs (603, 7400 etc.)<br>
<br>
A comparison of GCC v5.2.0 testsuite results summary (number of FAILs) is a=
s follows:<br>
<br>
<b>CPU =3D te500v1</b><br>
without patch: 699<br>
with patch: 193<br>
<br>
<b><b>CPU =3D </b>e500v2</b><br>
without patch: 225<br>
with patch: 225<br>
<br>
Is this OK to commit? Comments and suggestions are welcome.<br>
<br>
Thanks, <br>
Talha Imran<br>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_3052678E9DA67D4CB879A6625EE42075274B5A3CEUMBX02mgcmento_--

--_004_3052678E9DA67D4CB879A6625EE42075274B5A3CEUMBX02mgcmento_
Content-Type: application/octet-stream; name="ppc-efscmpgt.patch"
Content-Description: ppc-efscmpgt.patch
Content-Disposition: attachment; filename="ppc-efscmpgt.patch"; size=1713;
	creation-date="Fri, 13 May 2016 16:26:14 GMT";
	modification-date="Fri, 13 May 2016 16:26:14 GMT"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3RhcmdldC1wcGMvZnB1X2hlbHBlci5jIGIvdGFyZ2V0LXBwYy9mcHVfaGVs
cGVyLmMKaW5kZXggYjY3ZWJjYS4uNzUyYzU1MiAxMDA2NDQKLS0tIGEvdGFyZ2V0LXBwYy9mcHVf
aGVscGVyLmMKKysrIGIvdGFyZ2V0LXBwYy9mcHVfaGVscGVyLmMKQEAgLTE0MDAsNyArMTQwMCw3
IEBAIHN0YXRpYyBpbmxpbmUgdWludDMyX3QgZWZzY21wbHQoQ1BVUFBDU3RhdGUgKmVudiwgdWlu
dDMyX3Qgb3AxLCB1aW50MzJfdCBvcDIpCiAKICAgICB1MS5sID0gb3AxOwogICAgIHUyLmwgPSBv
cDI7Ci0gICAgcmV0dXJuIGZsb2F0MzJfbHQodTEuZiwgdTIuZiwgJmVudi0+dmVjX3N0YXR1cykg
PyA0IDogMDsKKyAgICByZXR1cm4gZmxvYXQzMl9sdCh1MS5mLCB1Mi5mLCAmZW52LT52ZWNfc3Rh
dHVzKSA/IDYgOiAwOwogfQogCiBzdGF0aWMgaW5saW5lIHVpbnQzMl90IGVmc2NtcGd0KENQVVBQ
Q1N0YXRlICplbnYsIHVpbnQzMl90IG9wMSwgdWludDMyX3Qgb3AyKQpAQCAtMTQwOSw3ICsxNDA5
LDcgQEAgc3RhdGljIGlubGluZSB1aW50MzJfdCBlZnNjbXBndChDUFVQUENTdGF0ZSAqZW52LCB1
aW50MzJfdCBvcDEsIHVpbnQzMl90IG9wMikKIAogICAgIHUxLmwgPSBvcDE7CiAgICAgdTIubCA9
IG9wMjsKLSAgICByZXR1cm4gZmxvYXQzMl9sZSh1MS5mLCB1Mi5mLCAmZW52LT52ZWNfc3RhdHVz
KSA/IDAgOiA0OworICAgIHJldHVybiBmbG9hdDMyX2xlKHUxLmYsIHUyLmYsICZlbnYtPnZlY19z
dGF0dXMpID8gMCA6IDY7CiB9CiAKIHN0YXRpYyBpbmxpbmUgdWludDMyX3QgZWZzY21wZXEoQ1BV
UFBDU3RhdGUgKmVudiwgdWludDMyX3Qgb3AxLCB1aW50MzJfdCBvcDIpCkBAIC0xNDE4LDcgKzE0
MTgsNyBAQCBzdGF0aWMgaW5saW5lIHVpbnQzMl90IGVmc2NtcGVxKENQVVBQQ1N0YXRlICplbnYs
IHVpbnQzMl90IG9wMSwgdWludDMyX3Qgb3AyKQogCiAgICAgdTEubCA9IG9wMTsKICAgICB1Mi5s
ID0gb3AyOwotICAgIHJldHVybiBmbG9hdDMyX2VxKHUxLmYsIHUyLmYsICZlbnYtPnZlY19zdGF0
dXMpID8gNCA6IDA7CisgICAgcmV0dXJuIGZsb2F0MzJfZXEodTEuZiwgdTIuZiwgJmVudi0+dmVj
X3N0YXR1cykgPyA2IDogMDsKIH0KIAogc3RhdGljIGlubGluZSB1aW50MzJfdCBlZnN0c3RsdChD
UFVQUENTdGF0ZSAqZW52LCB1aW50MzJfdCBvcDEsIHVpbnQzMl90IG9wMikKQEAgLTE0NDIsNyAr
MTQ0Miw3IEBAIHN0YXRpYyBpbmxpbmUgdWludDMyX3QgZWZzdHN0ZXEoQ1BVUFBDU3RhdGUgKmVu
diwgdWludDMyX3Qgb3AxLCB1aW50MzJfdCBvcDIpCiAjZGVmaW5lIEhFTFBFUl9TSU5HTEVfU1BF
X0NNUChuYW1lKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAgICAgdWlu
dDMyX3QgaGVscGVyX2UjI25hbWUoQ1BVUFBDU3RhdGUgKmVudiwgdWludDMyX3Qgb3AxLCB1aW50
MzJfdCBvcDIpIFwKICAgICB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLSAgICAgICAgcmV0dXJuIGUjI25hbWUoZW52
LCBvcDEsIG9wMikgPDwgMjsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKKyAgICAgICAg
cmV0dXJuIGUjI25hbWUoZW52LCBvcDEsIG9wMik7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCiAgICAgfQogLyogZWZzdHN0bHQgKi8KIEhFTFBFUl9TSU5HTEVfU1BFX0NNUChmc3RzdGx0
KTsK

--_004_3052678E9DA67D4CB879A6625EE42075274B5A3CEUMBX02mgcmento_--

