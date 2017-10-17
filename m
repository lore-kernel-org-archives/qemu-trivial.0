Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Phx-0000AC-V5
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 07:06:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1e4Pht-000067-JV
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 07:06:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1e4Phk-0004Qd-2h
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 07:06:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50304)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1e4PhZ-0004HQ-Nw; Tue, 17 Oct 2017 07:06:25 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CF2A67E43E;
	Tue, 17 Oct 2017 11:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com CF2A67E43E
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.51] (ovpn-117-51.ams2.redhat.com [10.36.117.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADEBC516EF;
	Tue, 17 Oct 2017 11:06:20 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-29-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <53e262a3-deb1-7d63-f1bc-98a323928d4e@redhat.com>
Date: Tue, 17 Oct 2017 13:06:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-29-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 17 Oct 2017 11:06:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 28/39] hw/acpi: ACPI_PM_* defines are
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
X-List-Received-Date: Tue, 17 Oct 2017 11:06:49 -0000

On 17/10/2017 02:11, Philippe Mathieu-Daud=C3=A9 wrote:
> this allows to remove the old i386/pc dependency on acpi/core.

enable_tco is specific to i386/pc.

You can move it to include/hw/acpi/ich9.h.

Paolo

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/acpi/acpi.h | 12 ++++++++++++
>  include/hw/i386/pc.h   | 13 -------------
>  hw/acpi/core.c         |  1 -
>  3 files changed, 12 insertions(+), 14 deletions(-)
>=20
> diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
> index 7b3d93cf0d..30013b0464 100644
> --- a/include/hw/acpi/acpi.h
> +++ b/include/hw/acpi/acpi.h
> @@ -39,6 +39,18 @@
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
> +#define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
> +
>  /* PM Timer ticks per second (HZ) */
>  #define PM_TIMER_FREQUENCY  3579545
> =20
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 087d184ef5..b1b4c918af 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -151,19 +151,6 @@ struct PCMachineClass {
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
> -#define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
> -
>  /* parallel.c */
> =20
>  void parallel_hds_isa_init(ISABus *bus, int n);
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
>=20


