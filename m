Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cyPBb-0005gG-L0
	for mharc-qemu-trivial@gnu.org; Wed, 12 Apr 2017 16:48:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <craig@rancher.com>) id 1cyOyp-0002pT-TL
	for qemu-trivial@nongnu.org; Wed, 12 Apr 2017 16:35:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <craig@rancher.com>) id 1cyOym-0008Ct-PC
	for qemu-trivial@nongnu.org; Wed, 12 Apr 2017 16:35:07 -0400
Received: from mail-bl2nam02on0129.outbound.protection.outlook.com
	([104.47.38.129]:30544
	helo=NAM02-BL2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <craig@rancher.com>) id 1cyOym-0008CE-FG
	for qemu-trivial@nongnu.org; Wed, 12 Apr 2017 16:35:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=GraniteComputing.onmicrosoft.com; s=selector1-rancher-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=xYO2iLZtr5weWbvpr24gLjXUgdFV6Ub4BbZYDPRhTiU=;
	b=fY4xrYK+MCui8wh14o1IywMpsu1xFOuFPaQn0mQYV1IYRcf1AJj05Mi9cGhuREshfxTx36fKUGd0z27wgKrEHDxLm96OaM2zFAazkObqmXMHkVAtm/tcwrRxZMWwa7+pJXPhMJbHVq38IZXB4SBepDfSU10RyRDP3sEtsjoRJ7E=
Received: from CY4PR11MB1623.namprd11.prod.outlook.com (10.172.71.11) by
	CY4PR11MB1622.namprd11.prod.outlook.com (10.172.71.10) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1019.17; Wed, 12 Apr 2017 16:02:46 +0000
Received: from CY4PR11MB1623.namprd11.prod.outlook.com ([10.172.71.11]) by
	CY4PR11MB1623.namprd11.prod.outlook.com ([10.172.71.11]) with mapi id
	15.01.1019.026; Wed, 12 Apr 2017 16:02:46 +0000
From: Craig Jellick <craig@rancher.com>
To: Markus Armbruster <armbru@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-trivial@nongnu.org"
	<qemu-trivial@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] Add 'none' as type for drive's if option
Thread-Index: AQHSnzYk0Q8GsC2XUkG5E3TcO5iWOaHATXTugAHAhdU=
Date: Wed, 12 Apr 2017 16:02:46 +0000
Message-ID: <CY4PR11MB162370BEAB5D22F1E647CCE8AA030@CY4PR11MB1623.namprd11.prod.outlook.com>
References: <1489765795-32398-1-git-send-email-craig@rancher.com>,
	<871ssz9j8p.fsf@dusky.pond.sub.org>
In-Reply-To: <871ssz9j8p.fsf@dusky.pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
	header.d=none; redhat.com;
	dmarc=none action=none header.from=rancher.com; 
x-originating-ip: [25.163.31.4]
x-microsoft-exchange-diagnostics: 1; CY4PR11MB1622;
	7:weIaVYXlEKtxC6jUZcPIg0aTn9XB1zNo/RTQhdJPNucjpvFCL4mk7VG4OboTmNLMnlSL2KlKiMRkpkchp913arvWnvnL7Z9B+LDn8oKLmP8Wdh2D+RN6xGXsZH2zOeJ2KH/y2rkTEwM7l1rpMZ7yE0Yz08lBXfXOq5qbgmiyA2YkLiugnyGStyAJ1WtgtOAAMYc3Ox6o5n1vcVbmFgvSzuV8e+dqDg6JILVlLbOrn7wBqrGGLfycxmXQxL979y4hzsQl/qoG/jqii/oGhdw4OHoELtSzd2ywWuNPxLElDgeLDbuxqELBnGWyW2hLIIs464kiGIyipwByUY83/NOMPQ==
x-ms-office365-filtering-correlation-id: 5e3ca061-b5e4-4304-a8e6-08d481bd5c72
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075);
	SRVR:CY4PR11MB1622; 
x-microsoft-antispam-prvs: <CY4PR11MB1622D7C99A4698670772240BAA030@CY4PR11MB1622.namprd11.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(158342451672863);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(6041248)(201703131423075)(201702281528075)(201703061421075)(2016111802025)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(6043046)(6072148);
	SRVR:CY4PR11MB1622; BCL:0; PCL:0; RULEID:; SRVR:CY4PR11MB1622; 
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39840400002)(39450400003)(39400400002)(39410400002)(377454003)(54356999)(50986999)(2900100001)(3280700002)(76176999)(81166006)(6116002)(102836003)(3846002)(77096006)(8676002)(8936002)(6506006)(189998001)(6436002)(25786009)(53546009)(33656002)(4326008)(38730400002)(110136004)(3660700001)(7696004)(6916009)(6246003)(2950100002)(66066001)(229853002)(74316002)(5660300001)(54896002)(86362001)(99286003)(7736002)(2906002)(122556002)(55016002)(53936002)(54906002)(9686003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR11MB1622;
	H:CY4PR11MB1623.namprd11.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: multipart/alternative;
	boundary="_000_CY4PR11MB162370BEAB5D22F1E647CCE8AA030CY4PR11MB1623namp_"
MIME-Version: 1.0
X-OriginatorOrg: rancher.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2017 16:02:46.3450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb5adde-bee8-4821-8b03-e63efdc7701c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1622
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.38.129
X-Mailman-Approved-At: Wed, 12 Apr 2017 16:48:18 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add 'none' as type for
 drive's if option
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
X-List-Received-Date: Wed, 12 Apr 2017 20:35:09 -0000

--_000_CY4PR11MB162370BEAB5D22F1E647CCE8AA030CY4PR11MB1623namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is there an action I need to take for that?

________________________________
From: Markus Armbruster <armbru@redhat.com>
Sent: Tuesday, April 11, 2017 6:17:10 AM
To: Craig Jellick
Cc: qemu-devel@nongnu.org; qemu-trivial@nongnu.org
Subject: Re: [Qemu-devel] [PATCH] Add 'none' as type for drive's if option

Perhaps this can go via qemu-trivial.

Craig Jellick <craig@rancher.com> writes:

> Signed-off-by: Craig Jellick <craig@rancher.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 99af8ed..8291e64 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -591,7 +591,7 @@ Special files such as iSCSI devices can be specified =
using protocol
>  specific URLs. See the section for "Device URL Syntax" for more informat=
ion.
>  @item if=3D@var{interface}
>  This option defines on which type on interface the drive is connected.
> -Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio.
> +Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio, none.
>  @item bus=3D@var{bus},unit=3D@var{unit}
>  These options define where is connected the drive by defining the bus nu=
mber and
>  the unit id.

--_000_CY4PR11MB162370BEAB5D22F1E647CCE8AA030CY4PR11MB1623namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Arial,Helvetica,sans-serif">
<p>Is there an action I need to take for that?<br>
</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Markus Armbruster &=
lt;armbru@redhat.com&gt;<br>
<b>Sent:</b> Tuesday, April 11, 2017 6:17:10 AM<br>
<b>To:</b> Craig Jellick<br>
<b>Cc:</b> qemu-devel@nongnu.org; qemu-trivial@nongnu.org<br>
<b>Subject:</b> Re: [Qemu-devel] [PATCH] Add 'none' as type for drive's if =
option</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Perhaps this can go via qemu-trivial.<br>
<br>
Craig Jellick &lt;craig@rancher.com&gt; writes:<br>
<br>
&gt; Signed-off-by: Craig Jellick &lt;craig@rancher.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; qemu-options.hx | 2 &#43;-<br>
&gt;&nbsp; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br>
&gt; index 99af8ed..8291e64 100644<br>
&gt; --- a/qemu-options.hx<br>
&gt; &#43;&#43;&#43; b/qemu-options.hx<br>
&gt; @@ -591,7 &#43;591,7 @@ Special files such as iSCSI devices can be spe=
cified using protocol<br>
&gt;&nbsp; specific URLs. See the section for &quot;Device URL Syntax&quot;=
 for more information.<br>
&gt;&nbsp; @item if=3D@var{interface}<br>
&gt;&nbsp; This option defines on which type on interface the drive is conn=
ected.<br>
&gt; -Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio.<br>
&gt; &#43;Available types are: ide, scsi, sd, mtd, floppy, pflash, virtio, =
none.<br>
&gt;&nbsp; @item bus=3D@var{bus},unit=3D@var{unit}<br>
&gt;&nbsp; These options define where is connected the drive by defining th=
e bus number and<br>
&gt;&nbsp; the unit id.<br>
</div>
</span></font>
</body>
</html>

--_000_CY4PR11MB162370BEAB5D22F1E647CCE8AA030CY4PR11MB1623namp_--

