Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1boWgt-0005Kr-VP
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2016 10:15:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paul.kennedy@samsung.com>) id 1boWKk-0008I0-VK
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 09:52:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paul.kennedy@samsung.com>) id 1boWKi-0000L2-SI
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 09:52:37 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25291)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paul.kennedy@samsung.com>)
	id 1boWKd-0000J7-1L; Mon, 26 Sep 2016 09:52:31 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com
	(Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5
	2014)) with ESMTP id <0OE4003FP6JFIF80@mailout1.w1.samsung.com>; Mon,
	26 Sep 2016 14:52:27 +0100 (BST)
Received: from eusmges5.samsung.com (unknown [203.254.199.245])
	by	eucas1p2.samsung.com (KnoxPortal) with ESMTP
	id	20160926135226eucas1p21a8b03c0cd38a0058d7c61ae248ff5de~3494j9qxe1369013690eucas1p2S;
	Mon, 26 Sep 2016 13:52:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207])
	by	eusmges5.samsung.com (EUCPMTA) with SMTP id AC.DC.19540.91829E75;
	Mon, 26	Sep 2016 14:52:25 +0100 (BST)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179])
	by	eucas1p2.samsung.com (KnoxPortal) with ESMTP
	id	20160926135225eucas1p2586f9ab42b65e3e0d6f37e217d3caa92~3493igFnj0769907699eucas1p2L;
	Mon, 26 Sep 2016 13:52:25 +0000 (GMT)
X-AuditID: cbfec7f5-f79ce6d000004c54-b5-57e928192a6c
Received: from eusync3.samsung.com ( [203.254.199.213])
	by	eusmgms1.samsung.com (EUCPMTA) with SMTP id 07.11.07726.5F729E75;
	Mon, 26	Sep 2016 14:51:49 +0100 (BST)
Received: from ex1.seri.co.uk ([106.1.8.3])
	by eusync3.samsung.com (Oracle	Communications Messaging Server
	7.0.5.31.0 64bit (built May  5 2014))
	with	ESMTPA id <0OE400BA16JCKF30@eusync3.samsung.com>; Mon,
	26 Sep 2016 14:52:25	+0100 (BST)
Received: from ex1.seri.co.uk ([fe80::f9a1:3f77:e349:7b44])
	by	ex1.seri.co.uk ([fe80::f9a1:3f77:e349:7b44%10])
	with mapi id 14.01.0438.000;	Mon, 26 Sep 2016 14:52:23 +0100
From: Paul Kennedy <paul.kennedy@samsung.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Thread-topic: [PATCH] arm-smmu: Fix bug when merging two 32 bit words to	form
	64  bit word
Thread-index: AdIX+ou+0S8wToiLQGaBGTTodgmXmw==
Date: Mon, 26 Sep 2016 13:52:22 +0000
Message-id: <D569458AC1CB644E8734594DD4D187440108853281@ex1.seri.co.uk>
Accept-Language: en-GB, en-US
Content-language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
X-Originating-IP: [106.1.8.131]
Content-type: multipart/alternative;
	boundary=_000_D569458AC1CB644E8734594DD4D187440108853281ex1sericouk_
MIME-version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEKsWRmVeSWpSXmKPExsWy7djP87qSGi/DDd7M07HYdGcPu0XPxuds
	Fsd7d7BYrD0zl9WBxePJtc1MHns//2YJYIrisklJzcksSy3St0vgyvh2eClzwUbJiiWnzrI1
	MP4X7WLk5JAQMJFY8Ho2C4QtJnHh3nq2LkYuDiGBpYwSK/YtY4dwPjNK9G0+zwbTMXv+KqjE
	MkaJ09+usMBV7Z/xjRHCWc8ocfbTf7DBbAK6EkevvmQCsUUEjCWOHV7CDFLELDCHUeJKVzM7
	SEJYIExi8tyZLBBFMRKXes+wQth6En2rG4FsDg4WAVWJ1YcUQMK8Au4SfVuvg5UzCshKfGlc
	zQxiMwuISxy7f5MR4lRBiUWz9zDDPPdv10OoF+Ql7k3axQpRnyux9eoJRoiZghI/Jt8D+0ZC
	4BK7RNOv3WB7JYAWbDoANcdFYtanSVBzhCVeHd/CDmHLSHR2HGSCsIslNk2YyA4xZwKjxJdT
	TVAN1hJP2hcyQSzmk5i0bTrzBEaVWUjunoXkpllIboKI60ncmDqFDcLWlli28DUzhK0rMePf
	IRZk8QWM7KsYRVJLi3PTU4tN9YoTc4tL89L1kvNzNzECU9Lpf8e/7mBceszqEKMAB6MSD6/H
	4efhQqyJZcWVuYcYJTiYlUR4L6i8DBfiTUmsrEotyo8vKs1JLT7EKM3BoiTOu2fBlXAhgfTE
	ktTs1NSC1CKYLBMHp1QDI2/rMQ3epuh9WzR7yzmEWbP4si+/2LxLnW/PkdobivV1KzPfa+vK
	6Xy673D0xL7a9jp79WV5mj97ZjCsq7G7m/pGb83WuUJMiStubJBZYvgrxNZinYzuiePLFu5J
	2ra4cv1p7cRoxk9sVdtZvP7slbm4uOx3d0cAy/yHX0Vf+4UaPtbZcKB9nxJLcUaioRZzUXEi
	ADZBBkdFAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsVy+t/xq7pf1V+GG6w8qGOx6c4edouejc/Z
	LI737mCxWHtmLqsDi8eTa5uZPPZ+/s0SwBTlZpORmpiSWqSQmpecn5KZl26rFBripmuhpJCX
	mJtqqxSh6xsSpKRQlphTCuQZGaABB+cA92AlfbsEt4xvh5cyF2yUrFhy6ixbA+N/0S5GTg4J
	AROJ2fNXsUPYYhIX7q1n62Lk4hASWMIoseDhCSYI5yujxK//E1lBqoQE1jNKLN0D1sEmoCtx
	9OpLJhBbRMBY4tjhJcwgDcwCcxglzq9+ywiSEBYIk5g8dyYLRFGMxMPfh1khbD2JvtWNQDYH
	B4uAqsTqQwogYV4Bd4m+rdfByhkFZCW+NK5mBrGZBcQljt2/yQhxqYDEkj3nmSFsUYmXj/+x
	QtjyEvcm7WKFqM+W2NSylwlipqDEj8n3WCYwisxCMmoWkrJZSMog4noSN6ZOYYOwtSWWLXzN
	DGHrSsz4d4gFWXwBI/sqRpHU0uLc9NxiQ73ixNzi0rx0veT83E2MwBjfduzn5h2MlzYGH2IU
	4GBU4uH1OPw8XIg1say4MvcQowQHs5II7wWVl+FCvCmJlVWpRfnxRaU5qcWHGE2B4TKRWUo0
	OR+YfvJK4g1NDM0tDY2MLSzMjYyUxHlLPlwJFxJITyxJzU5NLUgtgulj4uCUamCcFKORd3OF
	Z7fXJe+m99UhDmrSbIt88rjE1P7lZuQq2c/xOpG/oPnNK5fVXb0l37nv7dti8KjXZ3PIF4sN
	yjpPDA5qnd2QO5lJMuQku/EX5gOPpA87ierMvLlIuNn1t1+MavTp6rprl5OuKe9/K6Hwnrum
	1PaU/g9GyfePJr+RvpXDuPT256lKLMUZiYZazEXFiQCq2xSSBwMAAA==
X-MTR: 20000000000000000@CPGS
X-CMS-MailID: 20160926135225eucas1p2586f9ab42b65e3e0d6f37e217d3caa92
X-Msg-Generator: CA
X-Sender-IP: 182.198.249.179
X-Local-Sender: =?UTF-8?B?UGF1bCBLZW5uZWR5G1NSVUstUy1HUFUb7IK87ISx7KCE?=
	=?UTF-8?B?7J6QG1NlbmlvciBFbmdpbmVlciAy?=
X-Global-Sender: =?UTF-8?B?UGF1bCBDaHJpc3RvcGhlciBLZW5uZWR5G1NSVUstUy1HUFUb?=
	=?UTF-8?B?U2Ftc3VuZyBFbGVjdHJvbmljcxtTZW5pb3IgRW5naW5lZXIgMg==?=
X-Sender-Code: =?UTF-8?B?QzEwG0VIURtDMTBDRDAxQ0QwMTcxNDI=?=
CMS-TYPE: 201P
X-HopCount: 7
X-CMS-RootMailID: 20160926135225eucas1p2586f9ab42b65e3e0d6f37e217d3caa92
X-RootMTR: 20160926135225eucas1p2586f9ab42b65e3e0d6f37e217d3caa92
References: <CGME20160926135225eucas1p2586f9ab42b65e3e0d6f37e217d3caa92@eucas1p2.samsung.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 210.118.77.11
X-Mailman-Approved-At: Mon, 26 Sep 2016 10:15:30 -0400
Subject: [Qemu-trivial] [PATCH] arm-smmu: Fix bug when merging two 32 bit
 words to form 64 bit word
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
X-List-Received-Date: Mon, 26 Sep 2016 13:52:40 -0000

--_000_D569458AC1CB644E8734594DD4D187440108853281ex1sericouk_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

From 7bf015d76a5b53cd061c91f91fea4427101b26fd Mon Sep 17 00:00:00 2001
From: Paul Kennedy <paul.kennedy@samsung.com>
Date: Mon, 26 Sep 2016 11:59:00 +0100
Subject: [PATCH] arm-smmu: Fix bug when merging two 32 bit words to form 64
 bit word

Fix bug where least significant 32 bits overwrite most significant
32 bits of TTBR1 register.

Signed-off-by: Paul C Kennedy <paul.kennedy@samsung.com>
---
 hw/misc/arm-smmu.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/arm-smmu.c b/hw/misc/arm-smmu.c
index 7e7acd8..8255f3e 100644
--- a/hw/misc/arm-smmu.c
+++ b/hw/misc/arm-smmu.c
@@ -6566,7 +6566,7 @@ static bool smmu500_at64(SMMU *s, unsigned int cb, hw=
addr va,

     req.ttbr[1][1] =3D s->regs[R_SMMU_CB0_TTBR1_HIGH + cb_offset];
     req.ttbr[1][1] <<=3D 32;
-    req.ttbr[1][1] =3D s->regs[R_SMMU_CB0_TTBR1_LOW + cb_offset];
+    req.ttbr[1][1] |=3D s->regs[R_SMMU_CB0_TTBR1_LOW + cb_offset];

     if (req.s2_enabled) {
         req.tcr[2] =3D s->regs[R_SMMU_CB0_TCR_LPAE + cb2_offset];
--
1.7.9.5


--_000_D569458AC1CB644E8734594DD4D187440108853281ex1sericouk_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">From 7bf015d76a5b53cd061c91f91fea4427101b26fd Mon Sep 17 00:00:00 20=
01<br>
From: Paul Kennedy &lt;paul.kennedy@samsung.com&gt;<br>
Date: Mon, 26 Sep 2016 11:59:00 &#43;0100<br>
Subject: [PATCH] arm-smmu: Fix bug when merging two 32 bit words to form 64=
<br>
&nbsp;bit word<br>
<br>
Fix bug where least significant 32 bits overwrite most significant<br>
32 bits of TTBR1 register.<br>
<br>
Signed-off-by: Paul C Kennedy &lt;paul.kennedy@samsung.com&gt;<br>
---<br>
&nbsp;hw/misc/arm-smmu.c |&nbsp;&nbsp;&nbsp; 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/hw/misc/arm-smmu.c b/hw/misc/arm-smmu.c<br>
index 7e7acd8..8255f3e 100644<br>
--- a/hw/misc/arm-smmu.c<br>
&#43;&#43;&#43; b/hw/misc/arm-smmu.c<br>
@@ -6566,7 &#43;6566,7 @@ static bool smmu500_at64(SMMU *s, unsigned int cb=
, hwaddr va,<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; req.ttbr[1][1] =3D s-&gt;regs[R_SMMU_CB0_TTBR1_HIG=
H &#43; cb_offset];<br>
&nbsp;&nbsp;&nbsp;&nbsp; req.ttbr[1][1] &lt;&lt;=3D 32;<br>
-&nbsp;&nbsp;&nbsp; req.ttbr[1][1] =3D s-&gt;regs[R_SMMU_CB0_TTBR1_LOW &#43=
; cb_offset];<br>
&#43;&nbsp;&nbsp;&nbsp; req.ttbr[1][1] |=3D s-&gt;regs[R_SMMU_CB0_TTBR1_LOW=
 &#43; cb_offset];<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp; if (req.s2_enabled) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; req.tcr[2] =3D s-&gt;regs[=
R_SMMU_CB0_TCR_LPAE &#43; cb2_offset];<br>
--<br>
1.7.9.5<br>
<br>
</div>
</body>
</html>

--_000_D569458AC1CB644E8734594DD4D187440108853281ex1sericouk_--

