Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIca5-0000IC-IA
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jan 2016 08:32:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <huzaifanazir89@yahoo.com>) id 1aIXMa-0002bv-0k
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 02:58:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <huzaifanazir89@yahoo.com>) id 1aIXMV-0006zq-0x
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 02:58:03 -0500
Received: from nm8-vm5.bullet.mail.ne1.yahoo.com ([98.138.91.230]:51001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <huzaifanazir89@yahoo.com>) id 1aIXMU-0006zX-Nm
	for qemu-trivial@nongnu.org; Mon, 11 Jan 2016 02:57:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1452499076; bh=vV7YCOabfOLhD8TErvoUEJ8NdnQh286p6e7J6nPUp40=;
	h=Date:From:Reply-To:To:Subject:References:From:Subject;
	b=Y40abBaOTGu4M2ybT/WIN+c0dRbL0gl/Kx/3Wssv5A11Dm0IiNJVOoF9BSYp2bVEwxCR2wvKfTGOsVqfODavVG3p6mTHR94ShwMlbg+6DFS8LSWqhI6/wavauIP0Z6q5uBnpXzM+U31fwFw0P86Sz8Ju7lv3tlyDk3d91RBXNr9dVbKMhYHcYtUCjjKAvYCzh2HYSsO+dTaym+QQf5zuf1EPyR60H/g2CRVOZaDAMl9L+me/nlwjocMXCD/kwyoKmNRXEaFkx0FdMoo+AwNvLa0Kdx6j+FWC5ZRVQD/1naKPfKq41lAGinzLNc9DYi8jh3wmcgJ/Kod7HcskDzxsrQ==
Received: from [98.138.226.176] by nm8.bullet.mail.ne1.yahoo.com with NNFMP;
	11 Jan 2016 07:57:56 -0000
Received: from [98.138.88.234] by tm11.bullet.mail.ne1.yahoo.com with NNFMP;
	11 Jan 2016 07:57:56 -0000
Received: from [127.0.0.1] by omp1034.mail.ne1.yahoo.com with NNFMP;
	11 Jan 2016 07:57:56 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 898312.42353.bm@omp1034.mail.ne1.yahoo.com
X-YMail-OSG: xBENo1cVM1mKC9kiIgcocQiepLe2zuf_6Jni5yuWI9LmHA_AugaTiLvsKdKvERI
	M1AMp6wxa_GvcFOTBUs_ZMLV06JqJw56QVs13U58o97q5_xeC3Jcx3yAO6bxZAgkQqvIyggtyYYK
	svVSonsbxZ.CaIdAr4Jpk8pH1TpISdji_WPq8YAmVnL5GWdcDJyU3TWCXN7QJnl359rMdjacbD29
	hm3j352QN_t5GLdHGTEBDN4sDRw7G1Njyo91tsA2oAtdkpuH.MR9u8SOdxmEohzI4BM0Xo5NnupK
	0UiXNpFjTMV_ihjTs5G9ENkLfc9L3hnUlQahP45so3Q98Hszs10KDgSpu.ve7dnpzOcAGbB3Am2L
	xhh7SQkyUzUM8Q45q3mLetsskh3TwCBuWkUj0.bgzwlNdHAsXyqOX_qst6TDG8JEkFnK.49E0iY8
	NieANW_tZf6Ql2KGSFgVWs3aMqA4G971HVQswiV8E4slWuklowFduSJo87mFurTKHe_.PmsbrGLY
	lm3lPg81jkljYDJSXJeElv6COBIaE
Received: by 98.138.101.183; Mon, 11 Jan 2016 07:57:56 +0000 
Date: Mon, 11 Jan 2016 07:57:46 +0000 (UTC)
From: Huzaifa Nazir <huzaifanazir89@yahoo.com>
To: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Message-ID: <659884798.2481156.1452499066616.JavaMail.yahoo@mail.yahoo.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2481155_175422843.1452499066613"
References: <659884798.2481156.1452499066616.JavaMail.yahoo.ref@mail.yahoo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 98.138.91.230
X-Mailman-Approved-At: Mon, 11 Jan 2016 08:32:20 -0500
Subject: [Qemu-trivial] deleting vmbus driver from device manager
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Huzaifa Nazir <huzaifanazir89@yahoo.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jan 2016 07:58:05 -0000

------=_Part_2481155_175422843.1452499066613
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,=C2=A0I want to remove "Virtual machine bus" from my qemu VM. I followed=
 following steps:  =20
   - Delete "c:\system32\vmbus.sys"
   - Restart
   - Uninstall "Virtual machine Bus" from Device manager. It was present as=
 non-Plug and play drivers under hidden entries of Device Manager.  =20

   - Restart
I got succeeded but I am unable to save the snap shot afterwards. On "savev=
m " The error on Qemu prompt is "Device 'ide0-hd0' is writable but does not=
 support snapshots".
Is it possible to remove vmBUS completely ? If yes please tell the correct =
way.
Regards,

------=_Part_2481155_175422843.1452499066613
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div style=3D"color:#000; background-color:#fff; f=
ont-family:HelveticaNeue, Helvetica Neue, Helvetica, Arial, Lucida Grande, =
sans-serif;font-size:16px"><div id=3D"yui_3_16_0_1_1452497810923_5698"><spa=
n>Hi,</span></div><div dir=3D"ltr" id=3D"yui_3_16_0_1_1452497810923_5755"><=
span id=3D"yui_3_16_0_1_1452497810923_5763">&nbsp;I want to remove "Virtual=
 machine bus" from my qemu VM. I followed following steps:</span></div><ul =
dir=3D"ltr" id=3D"yui_3_16_0_1_1452497810923_6035"><li class=3D"" id=3D"yui=
_3_16_0_1_1452497810923_5785">Delete "c:\system32\vmbus.sys"</li><li class=
=3D"" id=3D"yui_3_16_0_1_1452497810923_5787">Restart</li><li class=3D"" id=
=3D"yui_3_16_0_1_1452497810923_5789">Uninstall "Virtual machine Bus" from D=
evice manager. It was present as non-Plug and play drivers under hidden ent=
ries of Device Manager.<br></li><li class=3D"" id=3D"yui_3_16_0_1_145249781=
0923_5791">Restart</li></ul><div id=3D"yui_3_16_0_1_1452497810923_6051" dir=
=3D"ltr">I got succeeded but I am unable to save the snap shot afterwards. =
On "savevm " The error on Qemu prompt is "Device 'ide0-hd0' is writable but=
 does not support=20
snapshots".</div><div id=3D"yui_3_16_0_1_1452497810923_6081" dir=3D"ltr"><b=
r></div><div id=3D"yui_3_16_0_1_1452497810923_6122" dir=3D"ltr">Is it possi=
ble to remove vmBUS completely ? If yes please tell the correct way.</div><=
div id=3D"yui_3_16_0_1_1452497810923_6123" dir=3D"ltr"><br></div><div id=3D=
"yui_3_16_0_1_1452497810923_6125" dir=3D"ltr">Regards,<br></div><span style=
=3D"font-style:italic;font-weight:bold;"></span></div></body></html>
------=_Part_2481155_175422843.1452499066613--

