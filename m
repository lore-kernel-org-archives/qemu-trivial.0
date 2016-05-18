Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b2wTX-0005Yf-TG
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 04:05:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56428)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b2wTS-0005WM-B4
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 04:05:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b2wTL-0005yE-B4
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 04:04:57 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:48360)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>)
	id 1b2wT6-0005sU-Kk; Wed, 18 May 2016 04:04:36 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1b2wSs-0007hb-MB from Talha_Imran@mentor.com ;
	Wed, 18 May 2016 01:04:23 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.121]) by
	SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) with mapi id
	14.03.0224.002; Wed, 18 May 2016 09:04:21 +0100
From: "Imran, Talha" <Talha_Imran@mentor.com>
To: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Thread-Topic: [PATCH] Fix QEMU PPC e500v1 efscmp* instructions
Thread-Index: AQHRqr9BoGiDdbboj0abVCg4qfVMbJ+2Q4r1gADO1wCABQUwMIACSYmg
Date: Wed, 18 May 2016 08:04:21 +0000
Message-ID: <3052678E9DA67D4CB879A6625EE42075274B5F9D@EU-MBX-02.mgc.mentorg.com>
References: <3052678E9DA67D4CB879A6625EE42075274B5092@EU-MBX-02.mgc.mentorg.com>,
	<3052678E9DA67D4CB879A6625EE42075274B5912@EU-MBX-02.mgc.mentorg.com>,
	<3052678E9DA67D4CB879A6625EE42075274B5A3C@EU-MBX-02.mgc.mentorg.com>,
	<3052678E9DA67D4CB879A6625EE42075274B5D82@EU-MBX-02.mgc.mentorg.com>
In-Reply-To: <3052678E9DA67D4CB879A6625EE42075274B5D82@EU-MBX-02.mgc.mentorg.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
Content-Type: multipart/mixed;
	boundary="_004_3052678E9DA67D4CB879A6625EE42075274B5F9DEUMBX02mgcmento_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
Subject: Re: [Qemu-trivial] [PATCH] Fix QEMU PPC e500v1 efscmp* instructions
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
X-List-Received-Date: Wed, 18 May 2016 08:05:02 -0000

--_004_3052678E9DA67D4CB879A6625EE42075274B5F9DEUMBX02mgcmento_
Content-Type: multipart/alternative;
	boundary="_000_3052678E9DA67D4CB879A6625EE42075274B5F9DEUMBX02mgcmento_"

--_000_3052678E9DA67D4CB879A6625EE42075274B5F9DEUMBX02mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

With more information at hand with the reference manual from Freescale
http://cache.nxp.com/files/32bit/doc/ref_manual/SPEPEM.pdf , I was able to
revisit my patch and figure out what is actually going on.

Before applying any patch, efscmp* instructions in QEMU set crD values as
(0b0100 << 2) =3D 0b10000 (consider the HELPER_SINGLE_SPE_CMP macro which l=
eft
shifts the value returned by efscmp* instruction by 2 bits). A value of 0b1=
0000
is not correct according the to the reference manual.

The reference manual expects efscmp* instructions to return a value of 0b01=
00.
Please find attached an updated patch qemu-patch-5 which disables left shif=
ting in
HELPER_SINGLE_SPE_CMP macro. This macro is used by efscmp* and efstst*
instructions only. efstst* instruction handlers call efscmp* handlers.

*Explanation:*
Traditionally, each crD (condition register nibble) consist of 4 bits, whic=
h is
set by comparisons as follows:
crD =3D W X Y Z
where
W =3D Less than
X =3D Greater than
Y =3D Equal to

However, efscmp* instructions being a special case return a binary result.
(efscmpeq will set the crD =3D 0bx1xx iff when op1 =3D=3D op2 and 0bx0xx ot=
herwise;
i.e. there is no notion of different crD values based on Less than, Greater
than and Equal to).

This effectively means that crD will store a "Greater than" comparison resu=
lt
iff efscmp* instruction comparison is TRUE. Compiler exploits this feature =
by
checking for "Branch if Less than or Equal to" (ble instruction) OR "Branch=
 if
Greater than" (bgt instruction) for Branch if FALSE OR Branch if TRUE
respectively after an efscmp* instruction. This can be seen in a assembly c=
ode
snippet below:

27          if (__real__ x !=3D 3.0f || __imag__ x !=3D 4.0f)
10000498:   lwz r10,8(r31)
1000049c:   lis r9,16448
100004a0:   efscmpeq cr7,r10,r9
100004a4:   ble- cr7,0x100004b8 <bar+60>  //jump to abort() call
100004a8:   lwz r10,12(r31)
100004ac:   lis r9,16512
100004b0:   efscmpeq cr7,r10,r9
100004b4:   bgt- cr7,0x100004bc <bar+64>  //skip abort() call
28            abort ();
100004b8:   bl 0x10000808 <abort>

Comments and suggestions are welcome.

-Talha

--_000_3052678E9DA67D4CB879A6625EE42075274B5F9DEUMBX02mgcmento_
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
P {margin-top:0;margin-bottom:0;}</style><style type=3D"text/css">=0A=
<!--=0A=
-->=0A=
</style><style type=3D"text/css">=0A=
<!--=0A=
-->=0A=
</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;"><font size=3D"2"><span style=3D"font-size:10pt;">With more informati=
on at hand with the reference manual from Freescale
<br>
<a href=3D"http://cache.nxp.com/files/32bit/doc/ref_manual/SPEPEM.pdf" targ=
et=3D"_blank">http://cache.nxp.com/files/32bit/doc/ref_manual/SPEPEM.pdf</a=
> , I was able to
<br>
revisit my patch and figure out what is actually going on.<br>
<br>
Before applying any patch, efscmp* instructions in QEMU set crD values as <=
br>
(0b0100 &lt;&lt; 2) =3D 0b10000 (consider the HELPER_SINGLE_SPE_CMP macro w=
hich left<br>
shifts the value returned by efscmp* instruction by 2 bits). A value of 0b1=
0000<br>
is not correct according the to the reference manual.<br>
<br>
The reference manual expects efscmp* instructions to return a value of 0b01=
00.<br>
Please find attached an updated patch qemu-patch-5 which disables left shif=
ting in
<br>
HELPER_SINGLE_SPE_CMP macro. This macro is used by efscmp* and efstst*</spa=
n> <br>
i<span style=3D"font-size:10pt;">nstructions only. </span></font><font size=
=3D"2"><span style=3D"font-size:10pt;"><font size=3D"2"><span style=3D"font=
-size:10pt;">efstst* instruction handlers call
</span></font></span></font><font size=3D"2"><span style=3D"font-size:10pt;=
"><font size=3D"2"><span style=3D"font-size:10pt;"><font size=3D"2"><span s=
tyle=3D"font-size:10pt;">efscmp* handlers.</span></font></span></font>
<br>
<br>
*Explanation:*<br>
Traditionally, each crD (condition register nibble) consist of 4 bits, whic=
h is<br>
set by comparisons as follows: <br>
crD =3D W X Y Z<br>
where<br>
W =3D Less than<br>
X =3D Greater than<br>
Y =3D Equal to<br>
<br>
However, efscmp* instructions being a special case return a binary result. =
<br>
(efscmpeq will set the crD =3D 0bx1xx iff when op1 =3D=3D op2 and 0bx0xx ot=
herwise;<br>
i.e. there is no notion of different crD values based on Less than, Greater=
 <br>
than and Equal to).<br>
<br>
This effectively means that crD will store a &quot;Greater than&quot; compa=
rison result<br>
iff efscmp* instruction comparison is TRUE. Compiler exploits this feature =
by<br>
checking for &quot;Branch if Less than or Equal to&quot; (ble instruction) =
OR &quot;Branch if<br>
Greater than&quot; (bgt instruction) for Branch if FALSE OR Branch if TRUE =
<br>
respectively after an efscmp* instruction. This can be seen in a assembly c=
ode<br>
snippet below:<br>
<br>
27&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (__real__ x !=
=3D 3.0f || __imag__ x !=3D 4.0f)<br>
10000498:&nbsp;&nbsp; lwz r10,8(r31)<br>
1000049c:&nbsp;&nbsp; lis r9,16448<br>
100004a0:&nbsp;&nbsp; efscmpeq cr7,r10,r9<br>
100004a4:&nbsp;&nbsp; ble- cr7,0x100004b8 &lt;bar&#43;60&gt;&nbsp; //jump t=
o abort() call<br>
100004a8:&nbsp;&nbsp; lwz r10,12(r31)<br>
100004ac:&nbsp;&nbsp; lis r9,16512<br>
100004b0:&nbsp;&nbsp; efscmpeq cr7,r10,r9<br>
100004b4:&nbsp;&nbsp; bgt- cr7,0x100004bc &lt;bar&#43;64&gt;&nbsp; //skip a=
bort() call<br>
28&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; abort =
();<br>
100004b8:&nbsp;&nbsp; bl 0x10000808 &lt;abort&gt;<br>
<br>
Comments and suggestions are welcome.<br>
<br>
-Talha</span></font></div>
</body>
</html>

--_000_3052678E9DA67D4CB879A6625EE42075274B5F9DEUMBX02mgcmento_--

--_004_3052678E9DA67D4CB879A6625EE42075274B5F9DEUMBX02mgcmento_
Content-Type: text/x-diff; name="qemu-patch5.patch"
Content-Description: qemu-patch5.patch
Content-Disposition: attachment; filename="qemu-patch5.patch"; size=701;
	creation-date="Wed, 18 May 2016 08:00:21 GMT";
	modification-date="Wed, 18 May 2016 08:00:21 GMT"
Content-Transfer-Encoding: base64

SW5kZXg6IHNyYy9xZW11LTIuMi0yMDE1LjE3L3RhcmdldC1wcGMvZnB1X2hlbHBlci5jCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0KLS0tIHNyYy9xZW11LTIuMi0yMDE1LjE3L3RhcmdldC1wcGMvZnB1X2hlbHBlci5jCShy
ZXZpc2lvbiA0NjM5NjcpCisrKyBzcmMvcWVtdS0yLjItMjAxNS4xNy90YXJnZXQtcHBjL2ZwdV9o
ZWxwZXIuYwkod29ya2luZyBjb3B5KQpAQCAtMTQzNyw3ICsxNDM3LDcgQEAKICNkZWZpbmUgSEVM
UEVSX1NJTkdMRV9TUEVfQ01QKG5hbWUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKICAgICB1aW50MzJfdCBoZWxwZXJfZSMjbmFtZShDUFVQUENTdGF0ZSAqZW52LCB1aW50
MzJfdCBvcDEsIHVpbnQzMl90IG9wMikgXAogICAgIHsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotICAgICAgICByZXR1
cm4gZSMjbmFtZShlbnYsIG9wMSwgb3AyKSA8PCAyOyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAorICAgICAgICByZXR1cm4gZSMjbmFtZShlbnYsIG9wMSwgb3AyKTsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKICAgICB9CiAvKiBlZnN0c3RsdCAqLwogSEVMUEVSX1NJTkdMRV9T
UEVfQ01QKGZzdHN0bHQpOwo=

--_004_3052678E9DA67D4CB879A6625EE42075274B5F9DEUMBX02mgcmento_--

