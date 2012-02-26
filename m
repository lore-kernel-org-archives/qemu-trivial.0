Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1hke-0007Da-LA
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 12:19:12 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S1hka-00070R-67
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 12:19:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1S1hkZ-00012q-3X
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 12:19:08 -0500
Received: from cantor2.suse.de ([195.135.220.15]:44735 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1S1hkW-00012J-DB; Sun, 26 Feb 2012 12:19:04 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id 795DF8FE2D;
	Sun, 26 Feb 2012 18:18:58 +0100 (CET)
Message-ID: <4F4A6981.2030008@suse.de>
Date: Sun, 26 Feb 2012 18:18:57 +0100
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120215 Thunderbird/10.0.2
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1330263343-21307-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1330263343-21307-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.3.5
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes in comments
	(it's -> its)
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
X-List-Received-Date: Sun, 26 Feb 2012 17:19:10 -0000

Am 26.02.2012 14:35, schrieb Stefan Weil:
> * it's -> its (fixed for all files)
> * dont -> don't (only fixed in a line which was touched by the previous=
 fix)
>=20
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Except for one omission:

> ---
>  configure               |    2 +-
>  hw/exynos4210_mct.c     |    2 +-
>  hw/usb-ccid.c           |    2 +-
>  include/qemu/object.h   |    4 ++--
>  kvm-all.c               |    2 +-
>  libcacard/vscclient.c   |    2 +-
>  linux-user/signal.c     |    2 +-
>  qemu-file.h             |    2 +-
>  target-mips/op_helper.c |    2 +-
>  9 files changed, 10 insertions(+), 10 deletions(-)

> diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> index c51b9cb..7d6773d 100644
> --- a/target-mips/op_helper.c
> +++ b/target-mips/op_helper.c
> @@ -1930,7 +1930,7 @@ target_ulong helper_evpe(void)
> =20
>      do {
>          if (other_cpu !=3D env
> -           /* If the VPE is WFI, dont distrub it's sleep.  */
> +           /* If the VPE is WFI, don't distrub its sleep.  */

While at it, please also fix "disturb". :)

Also I've generally wondered if there is a reason for having two spaces
before */? Some do, some don't.

Andreas

>             && !mips_vpe_is_wfi(other_cpu)) {
>              /* Enable the VPE.  */
>              other_cpu->mvp->CP0_MVPControl |=3D (1 << CP0MVPCo_EVP);

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

