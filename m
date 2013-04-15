Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1URhNP-0007fP-Sl
	for mharc-qemu-trivial@gnu.org; Mon, 15 Apr 2013 07:15:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1URhNM-0007bK-MT
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 07:15:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <afaerber@suse.de>) id 1URhNK-00012W-N8
	for qemu-trivial@nongnu.org; Mon, 15 Apr 2013 07:15:08 -0400
Received: from cantor2.suse.de ([195.135.220.15]:58706 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <afaerber@suse.de>)
	id 1URh2D-00005i-Ld; Mon, 15 Apr 2013 06:53:17 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1C279A50DE;
	Mon, 15 Apr 2013 12:52:30 +0200 (CEST)
Message-ID: <516BDBEA.4010404@suse.de>
Date: Mon, 15 Apr 2013 12:52:26 +0200
From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Organization: SUSE LINUX Products GmbH
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <51686F17.7070503@weilnetz.de>
	<1365990476-14975-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1365990476-14975-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.6a1pre
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-trivial@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Blue Swirl <blauwirbel@gmail.com>,
	qemu-ppc@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH v2] bswap: fix compiler warning
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
X-List-Received-Date: Mon, 15 Apr 2013 11:15:10 -0000

Am 15.04.2013 03:47, schrieb Alexey Kardashevskiy:
> The bswap functions use memcpy but the bswap.h header itself does not s=
eem to
> include it in some configuration such as cross compiling for powerpc64
> on x86_64 machine.
>=20
> The patch explicitly includes string.h.
>=20
> v2:
> * #include statement moved to the right place
>=20
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/qemu/bswap.h |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
> index d3af35d..14a5f65 100644
> --- a/include/qemu/bswap.h
> +++ b/include/qemu/bswap.h
> @@ -4,6 +4,7 @@
>  #include "config-host.h"
>  #include <inttypes.h>
>  #include <limits.h>
> +#include <string.h>
>  #include "fpu/softfloat.h"
> =20
>  #ifdef CONFIG_MACHINE_BSWAP_H

Thanks,

Reviewed-by: Andreas F=E4rber <afaerber@suse.de>

Normally the change log does not go into the commit message but I'm sure
Stefan can fix that. :)

Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrnbe=
rg

