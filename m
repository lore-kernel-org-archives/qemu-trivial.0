Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvYyJ-0000ZO-7D
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 13:43:55 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RvYyG-0000N6-43
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 13:43:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1RvYyE-0005Jd-M8
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 13:43:52 -0500
Received: from cantor2.suse.de ([195.135.220.15]:56499 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1RvYy2-0005FO-Hd; Thu, 09 Feb 2012 13:43:38 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 68A848FC93;
	Thu,  9 Feb 2012 19:43:37 +0100 (CET)
Message-ID: <4F3413D9.7040204@suse.de>
Date: Thu, 09 Feb 2012 19:43:37 +0100
From: =?ISO-8859-1?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111220 Thunderbird/9.0
MIME-Version: 1.0
To: Alex Barcelo <abarcelo@ac.upc.edu>
References: <CAFKAgTdwXj_XZ3EOgwR0=x_biz6s=SJKVsKX5C+z38=SicWY2A@mail.gmail.com>
In-Reply-To: <CAFKAgTdwXj_XZ3EOgwR0=x_biz6s=SJKVsKX5C+z38=SicWY2A@mail.gmail.com>
X-Enigmail-Version: 1.3.4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [TRIVIAL] sas_ss_flags bug for
	powerpc
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
X-List-Received-Date: Thu, 09 Feb 2012 18:43:53 -0000

Am 09.02.2012 19:30, schrieb Alex Barcelo:
> Signed-off-by: Alex Barcelo <abarcelo@ac.upc.edu>

This patch needs a better description than "bug", and you forgot to cc
the linux-user maintainer. The patch should describe what it touches
(linux-user), what it does, what for and make clear why that is correct.
Is there a particular test case that's broken without the patch?

I can't speak for Stefan, but to me it is totally unclear from looking
at the patch what sas_ss_flags() does here so this is likely not really
a trivial one.

Andreas

> ---
>  linux-user/signal.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/linux-user/signal.c b/linux-user/signal.c
> index 79a39dc..26e0530 100644
> --- a/linux-user/signal.c
> +++ b/linux-user/signal.c
> @@ -4115,7 +4115,7 @@ static target_ulong get_sigframe(struct
> target_sigaction *ka,
>      oldsp =3D env->gpr[1];
>=20
>      if ((ka->sa_flags & TARGET_SA_ONSTACK) &&
> -        (sas_ss_flags(oldsp))) {
> +        (sas_ss_flags(oldsp)) =3D=3D 0) {
>          oldsp =3D (target_sigaltstack_used.ss_sp
>                   + target_sigaltstack_used.ss_size);
>      }

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

