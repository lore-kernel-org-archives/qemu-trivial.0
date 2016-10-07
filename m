Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bsWBs-00027g-By
	for mharc-qemu-trivial@gnu.org; Fri, 07 Oct 2016 10:32:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bsWBm-00025N-Di
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:31:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1bsWBk-0006Nx-3F
	for qemu-trivial@nongnu.org; Fri, 07 Oct 2016 10:31:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33512)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>)
	id 1bsWBe-0006KO-In; Fri, 07 Oct 2016 10:31:46 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1F057D0E1;
	Fri,  7 Oct 2016 14:31:45 +0000 (UTC)
Received: from [10.3.116.64] (ovpn-116-64.phx2.redhat.com [10.3.116.64])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u97EVjTC015939; Fri, 7 Oct 2016 10:31:45 -0400
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
Cc: qemu-trivial@nongnu.org
From: Eric Blake <eblake@redhat.com>
Openpgp: url=http://people.redhat.com/eblake/eblake.gpg
Organization: Red Hat, Inc.
Message-ID: <290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
Date: Fri, 7 Oct 2016 09:31:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="b0pGfpjQVi3NVSPwCcHm0i1a0dAo4anFc"
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 07 Oct 2016 14:31:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] clean-up: removed duplicate
 #includes
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
X-List-Received-Date: Fri, 07 Oct 2016 14:31:55 -0000

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b0pGfpjQVi3NVSPwCcHm0i1a0dAo4anFc
Content-Type: multipart/mixed; boundary="UAT0octRK69qgvxaclFwuXQ65HovXKQfa";
 protected-headers="v1"
From: Eric Blake <eblake@redhat.com>
To: Anand J <anand.indukala@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Message-ID: <290de67f-8505-fbd7-c2fa-6fbe7ca604eb@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] clean-up: removed duplicate #includes
References: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>
In-Reply-To: <1475829975-17413-1-git-send-email-anand.indukala@gmail.com>

--UAT0octRK69qgvxaclFwuXQ65HovXKQfa
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 10/07/2016 03:46 AM, Anand J wrote:
> Some files contain multiple #includes of the same header file.
> Removed most of those unnecessary duplicate entries.

How did you find these? Is it a repeatable formula for rerunning a year
from now to find new culprits?  If so, listing it in the commit message
would be worthwhile.  Is it something we should add to
scripts/clean-includes?

>=20
> Signed-off-by: Anand J <anand.indukala@gmail.com>
> ---

> +++ b/disas/libvixl/vixl/globals.h
> @@ -46,7 +46,6 @@
>  #include <assert.h>
>  #include <stdarg.h>
>  #include <stdio.h>
> -#include <stdint.h>
>  #include <stdlib.h>
>  #include <stddef.h>
>  #include "vixl/platform.h"

scripts/clean-includes intentionally ignores disas/libvixl because that
source is copied from elsewhere with minimal changes; are you sure this
hunk is appropriate?

> +++ b/hw/pci-bridge/pci_expander_bridge.c
> @@ -13,7 +13,6 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/pci/pci.h"
> -#include "hw/pci/pci_bus.h"
>  #include "hw/pci/pci_host.h"
>  #include "hw/pci/pci_bus.h"

Changes like this are obviously correct...

>  #include "hw/pci/pci_bridge.h"
> diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
> index 4b2f07a..d01798f 100644
> --- a/hw/ppc/ppc405_boards.c
> +++ b/hw/ppc/ppc405_boards.c
> @@ -37,7 +37,6 @@
>  #include "qemu/log.h"
>  #include "qemu/error-report.h"
>  #include "hw/loader.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/blockdev.h"
>  #include "exec/address-spaces.h"

=2E..while changes like this require looking at context. But the nice par=
t
of this patch is that if it compiles, it is correct...

> +++ b/hw/usb/dev-mtp.c
> @@ -17,7 +17,6 @@
>  #include <sys/statvfs.h>
>  #ifdef CONFIG_INOTIFY1
>  #include <sys/inotify.h>
> -#include "qapi/error.h"
>  #include "qemu/main-loop.h"
>  #endif

=2E..well, ones like this are a little trickier (if CONFIG_INOTIFY1 is no=
t
defined, a completed compilation is no indication of success - but
reading context shows it is correct, and the duplicate include was just
outside of the diff context).

--=20
Eric Blake   eblake redhat com    +1-919-301-3266
Libvirt virtualization library http://libvirt.org


--UAT0octRK69qgvxaclFwuXQ65HovXKQfa--

--b0pGfpjQVi3NVSPwCcHm0i1a0dAo4anFc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Public key at http://people.redhat.com/eblake/eblake.gpg
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQEcBAEBCAAGBQJX97HQAAoJEKeha0olJ0NqtO4IAIaHaQ1QOL+uXuBsKxTXR3bh
vCc7JQMVug2169Rmn1S0fMcn1Zcd/NKwUhqPiSlbuKyVhnQ8K5FlC8PP5+JZxblK
qE4VnhMxK5KimteIx7dHlmxScDK4qKosQGADDLcEemiaA1OgD1GXuYfCKw+l+F6t
llDH1dKbcr5WnuV3qdYNsH+t0QewmOGOiS/KVa8yDo9GKS5sA3wY/8JRORnYMO1J
qIfZrSFmTk8MFPWoekRM9erh6R+rss4qMUGZl2+pHAuIPTyLuvCQvA8apjca/pPO
qHlZMkKWQoItN1ZQwsu5nmIGU96FA7jH2vlkf81mDAj+u3AG1IpAqiUcuKrxwlg=
=GjEK
-----END PGP SIGNATURE-----

--b0pGfpjQVi3NVSPwCcHm0i1a0dAo4anFc--

