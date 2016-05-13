Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b1ELB-0001B0-NM
	for mharc-qemu-trivial@gnu.org; Fri, 13 May 2016 10:45:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b14LX-0003OF-KA
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 00:05:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b14LU-0008MB-At
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 00:05:03 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:54103)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Talha_Imran@mentor.com>) id 1b14LU-0008Lw-4k
	for qemu-trivial@nongnu.org; Fri, 13 May 2016 00:05:00 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-04.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1b14LM-0000eH-8v from Talha_Imran@mentor.com 
	for qemu-trivial@nongnu.org; Thu, 12 May 2016 21:04:52 -0700
Received: from EU-MBX-02.mgc.mentorg.com ([169.254.3.121]) by
	SVR-IES-FEM-04.mgc.mentorg.com ([137.202.0.110]) with mapi id
	14.03.0224.002; Fri, 13 May 2016 05:04:51 +0100
From: "Imran, Talha" <Talha_Imran@mentor.com>
To: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Thread-Topic: [PATCH] Fix QEMU PPC e500v1 efscmp* instructions
Thread-Index: AQHRqr9BoGiDdbboj0abVCg4qfVMbJ+2Q4r1
Date: Fri, 13 May 2016 04:04:50 +0000
Message-ID: <3052678E9DA67D4CB879A6625EE42075274B5912@EU-MBX-02.mgc.mentorg.com>
References: <3052678E9DA67D4CB879A6625EE42075274B5092@EU-MBX-02.mgc.mentorg.com>
In-Reply-To: <3052678E9DA67D4CB879A6625EE42075274B5092@EU-MBX-02.mgc.mentorg.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [137.202.0.69]
Content-Type: multipart/alternative;
	boundary="_000_3052678E9DA67D4CB879A6625EE42075274B5912EUMBX02mgcmento_"
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 192.94.38.131
X-Mailman-Approved-At: Fri, 13 May 2016 10:45:19 -0400
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
X-List-Received-Date: Fri, 13 May 2016 04:05:05 -0000

--_000_3052678E9DA67D4CB879A6625EE42075274B5912EUMBX02mgcmento_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

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

--_000_3052678E9DA67D4CB879A6625EE42075274B5912EUMBX02mgcmento_
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
-->=0A=
P {margin-top:0;margin-bottom:0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">ping<br>
<br>
<div style=3D"font-family: Times New Roman; color: #000000; font-size: 16px=
">
<hr tabindex=3D"-1">
<div style=3D"direction: ltr;" id=3D"divRpF65373"><font face=3D"Tahoma" col=
or=3D"#000000" size=3D"2"><b>From:</b> Imran, Talha<br>
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
</body>
</html>

--_000_3052678E9DA67D4CB879A6625EE42075274B5912EUMBX02mgcmento_--

