Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKkRq-00087Y-K4
	for mharc-qemu-trivial@gnu.org; Fri, 22 Aug 2014 04:43:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34167)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XKkRl-000821-BD
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 04:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XKkRh-0007NG-8a
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 04:43:45 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:25687)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XKkRf-0007Es-Jy; Fri, 22 Aug 2014 04:43:41 -0400
Received: from 172.24.2.119 (EHLO SZXEMA402-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAQ81103; Fri, 22 Aug 2014 16:43:26 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.21]) by
	SZXEMA402-HUB.china.huawei.com ([10.82.72.34]) with mapi id
	14.03.0158.001; Fri, 22 Aug 2014 16:43:18 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: Zhanghailiang <zhang.zhanghailiang@huawei.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH] linux-user: fix file descriptor leaks
Thread-Index: AQHPveNLAe3g46vquUmhKPp1jVvQbZvcThxg
Date: Fri, 22 Aug 2014 08:43:18 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086D6B54C@SZXEMA503-MBS.china.huawei.com>
References: <1408695831-11844-1-git-send-email-zhang.zhanghailiang@huawei.com>
In-Reply-To: <1408695831-11844-1-git-send-email-zhang.zhanghailiang@huawei.com>
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"riku.voipio@iki.fi" <riku.voipio@iki.fi>,
	Luonengjun <luonengjun@huawei.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	Zhanghailiang <zhang.zhanghailiang@huawei.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: fix file
	descriptor leaks
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
X-List-Received-Date: Fri, 22 Aug 2014 08:43:49 -0000

> -----Original Message-----
> From: qemu-devel-bounces+arei.gonglei=3Dhuawei.com@nongnu.org
> [mailto:qemu-devel-bounces+arei.gonglei=3Dhuawei.com@nongnu.org] On
> Behalf Of zhanghailiang
> Sent: Friday, August 22, 2014 4:24 PM
> To: qemu-devel@nongnu.org
> Cc: qemu-trivial@nongnu.org; riku.voipio@iki.fi; Luonengjun; Huangpeng
> (Peter); Zhanghailiang
> Subject: [Qemu-devel] [PATCH] linux-user: fix file descriptor leaks
>=20
> Handle variable "fd_orig" going out of scope leaks the handle.
>=20
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> ---
>  linux-user/syscall.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a50229d..11a48c2 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5082,6 +5082,7 @@ static int open_self_cmdline(void *cpu_env, int fd)
>=20
>          if (word_skipped) {
>              if (write(fd, cp_buf, nb_read) !=3D nb_read) {
> +                close(fd_orig);
>                  return -1;
>              }
>          }
> --
> 1.7.12.4
>=20
>=20

Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Best regards,
-Gonglei

