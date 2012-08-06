Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SyO3a-0005W8-9t
	for mharc-qemu-trivial@gnu.org; Mon, 06 Aug 2012 10:13:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SyO3V-0005Gg-Kr
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 10:13:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1SyO3P-0001ok-Ld
	for qemu-trivial@nongnu.org; Mon, 06 Aug 2012 10:13:13 -0400
Received: from cantor2.suse.de ([195.135.220.15]:50277 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1SyO3E-0001mF-PZ; Mon, 06 Aug 2012 10:12:56 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id DF3B7A341E;
	Mon,  6 Aug 2012 16:12:54 +0200 (CEST)
Message-ID: <501FD0E4.9090000@suse.de>
Date: Mon, 06 Aug 2012 16:12:52 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: "Peter A. G. Crosthwaite" <peter.crosthwaite@petalogix.com>
References: <1344236756-9660-1-git-send-email-peter.crosthwaite@petalogix.com>
In-Reply-To: <1344236756-9660-1-git-send-email-peter.crosthwaite@petalogix.com>
X-Enigmail-Version: 1.5a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arm: translate: comment
	typo - s/middel/middle/
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
X-List-Received-Date: Mon, 06 Aug 2012 14:13:16 -0000

Am 06.08.2012 09:05, schrieb Peter A. G. Crosthwaite:
> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com=
>
> ---
>  target-arm/translate.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/target-arm/translate.c b/target-arm/translate.c
> index 29008a4..494c682 100644
> --- a/target-arm/translate.c
> +++ b/target-arm/translate.c
> @@ -9892,7 +9892,7 @@ static inline void gen_intermediate_code_internal=
(CPUARMState *env,
>      } else {
>          /* While branches must always occur at the end of an IT block,
>             there are a few other things that can cause us to terminate
> -           the TB in the middel of an IT block:
> +           the TB in the middle of an IT block:
>              - Exception generating instructions (bkpt, swi, undefined)=
.
>              - Page boundaries.
>              - Hardware watchpoints.

FWIW

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

/-F

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

