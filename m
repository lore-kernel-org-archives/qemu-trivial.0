Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIIMz-0003PY-4y
	for mharc-qemu-trivial@gnu.org; Thu, 12 Apr 2012 07:39:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SIIMw-0003I9-L4
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 07:39:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SIIMp-0007g0-EN
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 07:39:18 -0400
Received: from cantor2.suse.de ([195.135.220.15]:54135 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SIIMe-0007MP-CW; Thu, 12 Apr 2012 07:39:00 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id AB00D98EA8;
	Thu, 12 Apr 2012 13:38:58 +0200 (CEST)
Message-ID: <4F86B0C0.1090903@suse.de>
Date: Thu, 12 Apr 2012 12:38:56 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120312 Thunderbird/11.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1334226164-25658-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1334226164-25658-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.4
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, patches@linaro.org, qemu-devel@nongnu.org,
	Brad Smith <brad@comstyle.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bsd-user: fix compile
	failure
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
X-List-Received-Date: Thu, 12 Apr 2012 11:39:20 -0000

Am 12.04.2012 12:22, schrieb Peter Maydell:
> bsd-user doesn't actually support reserving a memory area for the
> guest address space, but we need to at least define the reserved_va
> global so that cpu-all.h's RESERVED_VA macro will work correctly.
>=20
> This fixes a compilation error introduced in commit

Did you forget to paste the commit hash here? Otherwise a "the" seems
missing.

> which added a use of RESERVED_VA to h2g_valid().
>=20

Reported-by: Brad Smith <brad@comstyle.com>

from what I remember.

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  bsd-user/main.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 48cb715..0689e38 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -41,6 +41,7 @@ int singlestep;
>  unsigned long mmap_min_addr;
>  unsigned long guest_base;
>  int have_guest_base;
> +unsigned long reserved_va;
>  #endif
> =20
>  static const char *interp_prefix =3D CONFIG_QEMU_INTERP_PREFIX;

Looks okay to me but don't have BSD setup to test.

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

