Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLkyG-00076b-Fb
	for mharc-qemu-trivial@gnu.org; Sun, 24 Aug 2014 23:29:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55843)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XLkyB-00076U-0k
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 23:29:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XLky6-0004VY-OK
	for qemu-trivial@nongnu.org; Sun, 24 Aug 2014 23:29:22 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:18392)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XLky5-0004VL-Tt; Sun, 24 Aug 2014 23:29:18 -0400
Received: from 172.24.2.119 (EHLO SZXEMA402-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATM11150; Mon, 25 Aug 2014 11:29:13 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.21]) by
	SZXEMA402-HUB.china.huawei.com ([10.82.72.34]) with mapi id
	14.03.0158.001; Mon, 25 Aug 2014 11:29:06 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [PATCH v2] monitor: fix debug print compiling error
Thread-Index: AQHPvUBKLJgskRnjfE+2BX84x5Q4gZvgrfNg
Date: Mon, 25 Aug 2014 03:29:04 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086D6DD72@SZXEMA503-MBS.china.huawei.com>
References: <1408626189-6220-1-git-send-email-arei.gonglei@huawei.com>
In-Reply-To: <1408626189-6220-1-git-send-email-arei.gonglei@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.177.19.102]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020209.53FAAD8A.003C,ss=1,re=0.000,fgs=0,
	ip=169.254.6.21, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: aa3bb1bf3490c15ea97fa30f5da73934
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"peter.crosthwaite@xilinx.com" <peter.crosthwaite@xilinx.com>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"lcapitulino@redhat.com" <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] monitor: fix debug print compiling
	error
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
X-List-Received-Date: Mon, 25 Aug 2014 03:29:27 -0000

Hi,

Cc'ing qemu-trivial. Please consider receiving, thanks.


Best regards,
-Gonglei


> -----Original Message-----
> From: Gonglei (Arei)
> Sent: Thursday, August 21, 2014 9:03 PM
> To: qemu-devel@nongnu.org
> Cc: lcapitulino@redhat.com; Huangweidong (C); peter.crosthwaite@xilinx.co=
m;
> Gonglei (Arei)
> Subject: [PATCH v2] monitor: fix debug print compiling error
>=20
> From: Gonglei <arei.gonglei@huawei.com>
>=20
> error: 'i' undeclared (first use in this function)
>=20
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
> v2:
>  avoid to mix code and declarations, add a pair of {}, thanks Peter.
> ---
>  monitor.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/monitor.c b/monitor.c
> index 34cee74..667efb7 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4747,8 +4747,11 @@ static void monitor_find_completion(void *opaque,
>          return;
>      }
>  #ifdef DEBUG_COMPLETION
> -    for (i =3D 0; i < nb_args; i++) {
> -        monitor_printf(mon, "arg%d =3D '%s'\n", i, args[i]);
> +    {
> +        int i;
> +        for (i =3D 0; i < nb_args; i++) {
> +            monitor_printf(mon, "arg%d =3D '%s'\n", i, args[i]);
> +        }
>      }
>  #endif
>=20
> --
> 1.7.12.4
>=20


