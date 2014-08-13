Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XHPKZ-0004Pb-QC
	for mharc-qemu-trivial@gnu.org; Tue, 12 Aug 2014 23:34:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53865)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XHPKU-0004OB-0G
	for qemu-trivial@nongnu.org; Tue, 12 Aug 2014 23:34:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XHPKO-00038J-4p
	for qemu-trivial@nongnu.org; Tue, 12 Aug 2014 23:34:25 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:52947)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XHPKN-00037j-D2; Tue, 12 Aug 2014 23:34:20 -0400
Received: from 172.24.2.119 (EHLO SZXEMA408-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAF71981; Wed, 13 Aug 2014 11:33:58 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.21]) by
	SZXEMA408-HUB.china.huawei.com ([10.82.72.40]) with mapi id
	14.03.0158.001; Wed, 13 Aug 2014 11:33:58 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Liming Wang <liming.wang@canonical.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] qemu-options.hx: fix a typo of chardev
Thread-Index: AQHPtqWrpauGN6vOnUySiLgkW/s9iJvN4TxA
Date: Wed, 13 Aug 2014 03:33:56 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086C3027C@SZXEMA503-MBS.china.huawei.com>
References: <1407900004-5105-1-git-send-email-liming.wang@canonical.com>
In-Reply-To: <1407900004-5105-1-git-send-email-liming.wang@canonical.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.19.102]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: fix a typo
	of chardev
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Aug 2014 03:34:30 -0000

> Subject: [Qemu-devel] [PATCH] qemu-options.hx: fix a typo of chardev
>=20
> Change host to port.
>=20
> Signed-off-by: Liming Wang <liming.wang@canonical.com>
> ---
>  qemu-options.hx | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Cc'ing qemu-trivial@

Best regards,
-Gonglei

> diff --git a/qemu-options.hx b/qemu-options.hx
> index 1549625..ac9e985 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1926,7 +1926,7 @@ ETEXI
>=20
>  DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
>      "-chardev null,id=3Did[,mux=3Don|off]\n"
> -    "-chardev
> socket,id=3Did[,host=3Dhost],port=3Dhost[,to=3Dto][,ipv4][,ipv6][,nodelay=
]\n"
> +    "-chardev
> socket,id=3Did[,host=3Dhost],port=3Dport[,to=3Dto][,ipv4][,ipv6][,nodelay=
]\n"
>      "         [,server][,nowait][,telnet][,mux=3Don|off] (tcp)\n"
>      "-chardev socket,id=3Did,path=3Dpath[,server][,nowait][,telnet],[mux=
=3Don|off]
> (unix)\n"
>      "-chardev udp,id=3Did[,host=3Dhost],port=3Dport[,localaddr=3Dlocalad=
dr]\n"
> --
> 1.9.1
>=20


