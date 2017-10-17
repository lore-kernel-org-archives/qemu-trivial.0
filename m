Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4L1Y-00075t-Bv
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 02:06:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44874)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4L1V-00074f-W5
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:06:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4L1V-0007s0-1w
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:06:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4L1Q-0007pV-DE; Tue, 17 Oct 2017 02:06:36 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C2747E433;
	Tue, 17 Oct 2017 06:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2C2747E433
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.158] (ovpn-116-158.ams2.redhat.com [10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 054AF5C660;
	Tue, 17 Oct 2017 06:06:25 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-31-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <44b57d76-6d10-84c8-3a13-cdac7331c5d9@redhat.com>
Date: Tue, 17 Oct 2017 08:06:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-31-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 17 Oct 2017 06:06:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 30/39] hw/display/vga: remove the old
 i386/pc dependency
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
X-List-Received-Date: Tue, 17 Oct 2017 06:06:43 -0000

On 17.10.2017 02:12, Philippe Mathieu-Daud=C3=A9 wrote:
> move public API to "hw/display/vga.h" and private registers
> to "hw/display/vga_int_regs.h"
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/vga_int.h                 |  3 ++-
>  hw/display/{vga.h =3D> vga_int_regs.h} |  0
>  include/hw/display/vga.h             | 25 +++++++++++++++++++++++++
>  include/hw/i386/pc.h                 | 12 ------------
>  hw/display/vga-isa-mm.c              |  4 +---
>  hw/display/vga-isa.c                 |  2 +-
>  hw/display/vga.c                     |  4 ++--
>  hw/mips/mips_jazz.c                  |  1 +
>  vl.c                                 |  2 +-
>  MAINTAINERS                          |  1 +
>  10 files changed, 34 insertions(+), 20 deletions(-)
>  rename hw/display/{vga.h =3D> vga_int_regs.h} (100%)
>  create mode 100644 include/hw/display/vga.h
>=20
> diff --git a/hw/display/vga_int.h b/hw/display/vga_int.h
> index ad34a1f048..fe23b81442 100644
> --- a/hw/display/vga_int.h
> +++ b/hw/display/vga_int.h
> @@ -25,8 +25,9 @@
>  #ifndef HW_VGA_INT_H
>  #define HW_VGA_INT_H
> =20
> -#include "hw/hw.h"
> +#include "exec/ioport.h"
>  #include "exec/memory.h"
> +#include "ui/console.h"

So vga_int.h now includes console.h (is it really necessary?) ...

[...]
>  static inline bool isa_ne2000_init(ISABus *bus, int base, int irq, NIC=
Info *nd)
>  {
> diff --git a/hw/display/vga-isa-mm.c b/hw/display/vga-isa-mm.c
> index 51ccbccc41..e887b45651 100644
> --- a/hw/display/vga-isa-mm.c
> +++ b/hw/display/vga-isa-mm.c
> @@ -23,11 +23,9 @@
>   */
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
> -#include "ui/console.h"

... and here you also remove it from the .c file - OK ...

> -#include "hw/i386/pc.h"
> +#include "hw/display/vga.h"
>  #include "vga_int.h"
>  #include "ui/pixel_ops.h"
> -#include "qemu/timer.h"
> =20
>  #define VGA_RAM_SIZE (8192 * 1024)
> =20
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 1af95562f2..9af43abee8 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -26,7 +26,7 @@
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
>  #include "ui/console.h"

... but here you keep it? I think you should either remove it here, too,
or not add the include in the header (which I'd prefer if the header
itself does not depend on console.h).

> -#include "hw/i386/pc.h"
> +#include "hw/isa/isa.h"
>  #include "vga_int.h"
>  #include "ui/pixel_ops.h"
>  #include "qemu/timer.h"
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index ed24ef7076..0da4942a09 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -24,9 +24,9 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/hw.h"
> -#include "vga.h"
> +#include "hw/display/vga.h"
>  #include "ui/console.h"

Here's another one --^

 Thomas


