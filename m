Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4j2U-0002as-1r
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 03:45:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1e4j2R-0002We-Mu
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 03:45:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1e4j2O-0006sy-Fe
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 03:45:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1e4j2E-0006mc-RA; Wed, 18 Oct 2017 03:45:03 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD60E5F7AC;
	Wed, 18 Oct 2017 07:45:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BD60E5F7AC
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (unknown [10.43.2.209])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DC19B18EF3;
	Wed, 18 Oct 2017 07:44:57 +0000 (UTC)
Date: Wed, 18 Oct 2017 09:44:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell
	<peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20171018094457.1e9a0ee0@nial.brq.redhat.com>
In-Reply-To: <20171017164426.25277-34-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-34-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 18 Oct 2017 07:45:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 33/42] hw/acpi: ACPI_PM_* defines are
 not restricted to i386 arch
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
X-List-Received-Date: Wed, 18 Oct 2017 07:45:16 -0000

On Tue, 17 Oct 2017 13:44:17 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> this allows to remove the old i386/pc dependency on acpi/core.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/acpi.h | 11 +++++++++++
>  include/hw/i386/pc.h   | 11 -----------
>  hw/acpi/core.c         |  1 -
>  3 files changed, 11 insertions(+), 12 deletions(-)
>=20
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index 7b3d93cf0d..39ff512129 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -39,6 +39,17 @@
>  #define ACPI_PM2_REGISTER_WIDTH         8
>  #define ACPI_PM_TIMER_WIDTH             32
> =20
> +/* PC-style peripherals (also used by other machines).  */
> +#define ACPI_PM_PROP_S3_DISABLED "disable_s3"
> +#define ACPI_PM_PROP_S4_DISABLED "disable_s4"
> +#define ACPI_PM_PROP_S4_VAL "s4_val"
> +#define ACPI_PM_PROP_SCI_INT "sci_int"
> +#define ACPI_PM_PROP_ACPI_ENABLE_CMD "acpi_enable_cmd"
> +#define ACPI_PM_PROP_ACPI_DISABLE_CMD "acpi_disable_cmd"
> +#define ACPI_PM_PROP_PM_IO_BASE "pm_io_base"
> +#define ACPI_PM_PROP_GPE0_BLK "gpe0_blk"
> +#define ACPI_PM_PROP_GPE0_BLK_LEN "gpe0_blk_len"
> +
>  /* PM Timer ticks per second (HZ) */
>  #define PM_TIMER_FREQUENCY  3579545
> =20
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 087d184ef5..6335e2bf47 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -151,17 +151,6 @@ struct PCMachineClass {
>  #define PC_MACHINE_CLASS(klass) \
>      OBJECT_CLASS_CHECK(PCMachineClass, (klass), TYPE_PC_MACHINE)
> =20
> -/* PC-style peripherals (also used by other machines).  */
> -
> -#define ACPI_PM_PROP_S3_DISABLED "disable_s3"
> -#define ACPI_PM_PROP_S4_DISABLED "disable_s4"
> -#define ACPI_PM_PROP_S4_VAL "s4_val"
> -#define ACPI_PM_PROP_SCI_INT "sci_int"
> -#define ACPI_PM_PROP_ACPI_ENABLE_CMD "acpi_enable_cmd"
> -#define ACPI_PM_PROP_ACPI_DISABLE_CMD "acpi_disable_cmd"
> -#define ACPI_PM_PROP_PM_IO_BASE "pm_io_base"
> -#define ACPI_PM_PROP_GPE0_BLK "gpe0_blk"
> -#define ACPI_PM_PROP_GPE0_BLK_LEN "gpe0_blk_len"
>  #define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
> =20
>  /* parallel.c */
> diff --git a/hw/acpi/core.c b/hw/acpi/core.c
> index cd0a1d357b..eb9b76f70b 100644
> --- a/hw/acpi/core.c
> +++ b/hw/acpi/core.c
> @@ -21,7 +21,6 @@
>  #include "qemu/osdep.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/hw.h"
> -#include "hw/i386/pc.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "qemu/config-file.h"


