Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSRmV-0003AD-OD
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 14:43:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fSRmT-000374-5n
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 14:43:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fSRmS-0002T3-AX
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 14:43:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28340)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fSRmN-0002P1-QE; Mon, 11 Jun 2018 14:42:59 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C8424BDD0;
	Mon, 11 Jun 2018 18:42:58 +0000 (UTC)
Received: from localhost (ovpn-116-19.gru2.redhat.com [10.97.116.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2E3978F6DB;
	Mon, 11 Jun 2018 18:42:58 +0000 (UTC)
Date: Mon, 11 Jun 2018 15:42:57 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Message-ID: <20180611184257.GS7451@localhost.localdomain>
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-4-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20180611011501.10235-4-f4bug@amsat.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 11 Jun 2018 18:42:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4 03/40] x86/cpu: Use definitions from
 "qemu/units.h"
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
X-List-Received-Date: Mon, 11 Jun 2018 18:43:06 -0000

On Sun, Jun 10, 2018 at 10:14:24PM -0300, Philippe Mathieu-Daud=E9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

Nice, thanks!

Acked-by: Eduardo Habkost <ehabkost@redhat.com>

> ---
>  target/i386/cpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 94260412e2..56c63615fe 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -18,6 +18,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qemu/cutils.h"
> =20
>  #include "cpu.h"
> @@ -64,9 +65,6 @@ struct CPUID2CacheDescriptorInfo {
>      int associativity;
>  };
> =20
> -#define KiB 1024
> -#define MiB (1024 * 1024)
> -
>  /*
>   * Known CPUID 2 cache descriptors.
>   * From Intel SDM Volume 2A, CPUID instruction
> --=20
> 2.17.1
>=20

--=20
Eduardo

