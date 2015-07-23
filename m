Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZI8WJ-0007Zm-Eh
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jul 2015 00:54:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wency@cn.fujitsu.com>) id 1ZI5V3-0002mQ-VI
	for qemu-trivial@nongnu.org; Wed, 22 Jul 2015 21:40:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wency@cn.fujitsu.com>) id 1ZI5V3-0007qs-3g
	for qemu-trivial@nongnu.org; Wed, 22 Jul 2015 21:40:41 -0400
Received: from [59.151.112.132] (port=8455 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wency@cn.fujitsu.com>)
	id 1ZI5Ux-0007Zq-9Q; Wed, 22 Jul 2015 21:40:35 -0400
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="98748468"
Received: from bogon (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 23 Jul 2015 09:44:06 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t6N1cbFX024220;
	Thu, 23 Jul 2015 09:38:37 +0800
Received: from [10.167.226.52] (10.167.226.52) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.181.6; Thu, 23 Jul 2015 09:40:25 +0800
To: Stefan Weil <sw@weilnetz.de>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <1437587610-26433-1-git-send-email-sw@weilnetz.de>
From: Wen Congyang <wency@cn.fujitsu.com>
Message-ID: <55B046DA.6040308@cn.fujitsu.com>
Date: Thu, 23 Jul 2015 09:43:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1437587610-26433-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.226.52]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Thu, 23 Jul 2015 00:54:10 -0400
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.4] vl: Fix compiler
 warning for builds without VLC
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
X-List-Received-Date: Thu, 23 Jul 2015 01:40:42 -0000

On 07/23/2015 01:53 AM, Stefan Weil wrote:
> This regression was caused by commit 70b94331.

vnc, not vlc in the title.

Reviewed-by: Wen Congyang <wency@cn.fujitsu.com>

>=20
>   CC    vl.o
> vl.c: In function =E2=80=98select_display=E2=80=99:
> vl.c:2064:12: error: unused variable =E2=80=98err=E2=80=99 [-Werror=3Dunu=
sed-variable]
>      Error *err =3D NULL;
>             ^
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  vl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/vl.c b/vl.c
> index 5856396..0adbbd6 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -2061,7 +2061,6 @@ static void select_vgahw (const char *p)
> =20
>  static DisplayType select_display(const char *p)
>  {
> -    Error *err =3D NULL;
>      const char *opts;
>      DisplayType display =3D DT_DEFAULT;
> =20
> @@ -2130,6 +2129,7 @@ static DisplayType select_display(const char *p)
>      } else if (strstart(p, "vnc", &opts)) {
>  #ifdef CONFIG_VNC
>          if (*opts =3D=3D '=3D') {
> +            Error *err =3D NULL;
>              if (vnc_parse(opts + 1, &err) =3D=3D NULL) {
>                  error_report_err(err);
>                  exit(1);
>=20


