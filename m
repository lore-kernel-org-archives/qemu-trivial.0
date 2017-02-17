Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceePl-0000H5-8E
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 04:01:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <snaipe@diacritic.io>) id 1ceePj-0000Es-1Y
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 04:01:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <snaipe@diacritic.io>) id 1ceePi-0002bh-1l
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 04:01:15 -0500
Received: from relay5-d.mail.gandi.net ([2001:4b98:c:538::197]:44662)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <snaipe@diacritic.io>)
	id 1ceePd-0002Y3-D4; Fri, 17 Feb 2017 04:01:09 -0500
Received: from mfilter36-d.gandi.net (mfilter36-d.gandi.net [217.70.178.167])
	by relay5-d.mail.gandi.net (Postfix) with ESMTP id B49A141C09D;
	Fri, 17 Feb 2017 10:01:07 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mfilter36-d.gandi.net
Received: from relay5-d.mail.gandi.net ([IPv6:::ffff:217.70.183.197])
	by mfilter36-d.gandi.net (mfilter36-d.gandi.net [::ffff:10.0.15.180])
	(amavisd-new, port 10024)
	with ESMTP id DcIptl5RJPLO; Fri, 17 Feb 2017 10:01:06 +0100 (CET)
X-Originating-IP: 74.125.82.181
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181]) (Authenticated sender: snaipe@diacritic.io)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id CF4A341C088;
	Fri, 17 Feb 2017 10:01:03 +0100 (CET)
Received: by mail-ot0-f181.google.com with SMTP id t47so27784908ota.1;
	Fri, 17 Feb 2017 01:01:03 -0800 (PST)
X-Gm-Message-State: AMke39mIenNDO6TEpxMnpiXPva6qW7J7t2oE1kE7tcnSCJBVEFJbznvpEbVNBbd0l7MaSPh6cuhotYsDYeJRZw==
X-Received: by 10.157.40.144 with SMTP id s16mr4108881ota.146.1487322062588;
	Fri, 17 Feb 2017 01:01:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.202.57.194 with HTTP; Fri, 17 Feb 2017 01:00:22 -0800 (PST)
In-Reply-To: <20170217085800.28873-1-snaipe@diacritic.io>
References: <20170216085857.23501-1-snaipe@diacritic.io>
	<20170217085800.28873-1-snaipe@diacritic.io>
From: "Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>
Date: Fri, 17 Feb 2017 09:00:22 +0000
X-Gmail-Original-Message-ID: <CAK_MOSfBOJn6Zqo2Z9E8pLZLsuTJZ37HQo_1bp4XdU3iG55D1A@mail.gmail.com>
Message-ID: <CAK_MOSfBOJn6Zqo2Z9E8pLZLsuTJZ37HQo_1bp4XdU3iG55D1A@mail.gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, snaipe@arista.com, 
	Franklin Snaipe Mathieu <snaipe@diacritic.io>,
	Riku Voipio <riku.voipio@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:4b98:c:538::197
Subject: Re: [Qemu-trivial] [PATCH] syscall: fixed mincore(2) not failing
 with ENOMEM
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
X-List-Received-Date: Fri, 17 Feb 2017 09:01:16 -0000

Ignore this patch, this was sent again by mistake.

2017-02-17 8:57 GMT+00:00 Franklin Snaipe Mathieu <snaipe@diacritic.io>:
> From: "Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>
>
> The current implementation of the mincore(2) syscall sets errno to
> EFAULT when the region identified by the first two parameters is
> invalid.
>
> This goes against the man page specification, where mincore(2) should
> only fail with EFAULT when the third parameter is an invalid address;
> and fail with ENOMEM when the checked region does not point to mapped
> memory.
>
> Signed-off-by: Franklin "Snaipe" Mathieu <snaipe@diacritic.io>
> Cc: Riku Voipio <riku.voipio@linaro.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  linux-user/syscall.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9be8e9530e..733e0009e1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11061,11 +11061,16 @@ abi_long do_syscall(void *cpu_env, int num, abi=
_long arg1,
>      case TARGET_NR_mincore:
>          {
>              void *a;
> +            ret =3D -TARGET_ENOMEM;
> +            a =3D lock_user(VERIFY_READ, arg1, arg2, 0);
> +            if (!a) {
> +                goto fail;
> +            }
>              ret =3D -TARGET_EFAULT;
> -            if (!(a =3D lock_user(VERIFY_READ, arg1,arg2, 0)))
> -                goto efault;
> -            if (!(p =3D lock_user_string(arg3)))
> +            p =3D lock_user_string(arg3);
> +            if (!p) {
>                  goto mincore_fail;
> +            }
>              ret =3D get_errno(mincore(a, arg2, p));
>              unlock_user(p, arg3, ret);
>              mincore_fail:
> --
> 2.11.0
>



--=20
Franklin "Snaipe" Mathieu
=F0=9F=9D=B0 https://diacritic.io

