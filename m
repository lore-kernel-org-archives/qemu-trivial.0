Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXRDe-0004Lz-64
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 09:07:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60972)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXRDa-0004Hr-Sx
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 09:07:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1fXRDZ-0008AO-V7
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 09:07:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60744 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1fXRDI-00087L-Fl; Mon, 25 Jun 2018 09:07:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE5BE7D84D;
	Mon, 25 Jun 2018 13:07:23 +0000 (UTC)
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 06FA02026D5B;
	Mon, 25 Jun 2018 13:07:21 +0000 (UTC)
Date: Mon, 25 Jun 2018 15:07:19 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Richard Henderson
	<rth@twiddle.net>, Alexander Graf <agraf@suse.de>, David Hildenbrand
	<david@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
	qemu-s390x@nongnu.org (open list:S390)
Message-ID: <20180625150719.0392da6c.cohuck@redhat.com>
In-Reply-To: <20180625124238.25339-20-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-20-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Mon, 25 Jun 2018 13:07:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Mon, 25 Jun 2018 13:07:23 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'cohuck@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH v5 19/46] hw/s390x: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 13:07:44 -0000

On Mon, 25 Jun 2018 09:42:11 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> It eases code review, unit is explicit.
>=20
> Patch generated using:
>=20
>   $ git grep -E '(1024|2048|4096|8192|(<<|>>).?(10|20|30))' hw/ include/h=
w/
>=20
> and modified manually.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Acked-by: Cornelia Huck <cohuck@redhat.com>

Hm, I had not looked at the v2+ patches, as this already carried my
ack...

> ---
>  hw/s390x/s390-skeys.c    | 3 ++-
>  hw/s390x/s390-stattrib.c | 3 ++-

...but these two were added later on.

>  hw/s390x/sclp.c          | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
>=20
> diff --git a/hw/s390x/s390-skeys.c b/hw/s390x/s390-skeys.c
> index 76241c240e..15f7ab0e53 100644
> --- a/hw/s390x/s390-skeys.c
> +++ b/hw/s390x/s390-skeys.c
> @@ -10,6 +10,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "hw/boards.h"
>  #include "hw/s390x/storage-keys.h"
>  #include "qapi/error.h"
> @@ -19,7 +20,7 @@
>  #include "sysemu/kvm.h"
>  #include "migration/register.h"
> =20
> -#define S390_SKEYS_BUFFER_SIZE 131072  /* Room for 128k storage keys */
> +#define S390_SKEYS_BUFFER_SIZE (128 * KiB)  /* Room for 128k storage key=
s */

This one looks confusing to me. We're not allocating 128 chunks of 1
KiB size, but space enough for 128k byte values. What do others think?

>  #define S390_SKEYS_SAVE_FLAG_EOS 0x01
>  #define S390_SKEYS_SAVE_FLAG_SKEYS 0x02
>  #define S390_SKEYS_SAVE_FLAG_ERROR 0x04
> diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
> index 70b95550a8..5161a1659b 100644
> --- a/hw/s390x/s390-stattrib.c
> +++ b/hw/s390x/s390-stattrib.c
> @@ -10,6 +10,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "hw/boards.h"
>  #include "cpu.h"
>  #include "migration/qemu-file.h"
> @@ -20,7 +21,7 @@
>  #include "qapi/error.h"
>  #include "qapi/qmp/qdict.h"
> =20
> -#define CMMA_BLOCK_SIZE  (1 << 10)
> +#define CMMA_BLOCK_SIZE  (1 * KiB)

This one looks fine.

> =20
>  #define STATTR_FLAG_EOS     0x01ULL
>  #define STATTR_FLAG_MORE    0x02ULL
> diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
> index 047d577313..bd2a024efd 100644
> --- a/hw/s390x/sclp.c
> +++ b/hw/s390x/sclp.c
> @@ -13,6 +13,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "cpu.h"
>  #include "sysemu/sysemu.h"
> @@ -289,7 +290,7 @@ static void sclp_realize(DeviceState *dev, Error **er=
rp)
>      ret =3D s390_set_memory_limit(machine->maxram_size, &hw_limit);
>      if (ret =3D=3D -E2BIG) {
>          error_setg(&err, "host supports a maximum of %" PRIu64 " GB",
> -                   hw_limit >> 30);
> +                   hw_limit / GiB);
>      } else if (ret) {
>          error_setg(&err, "setting the guest size failed");
>      }


