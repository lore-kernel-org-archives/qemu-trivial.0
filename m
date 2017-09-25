Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwLo4-0001jH-MZ
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 01:19:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwLo1-0001fb-OR
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:19:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1dwLo0-0005Bm-Ob
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 01:19:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50062)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1dwLnw-00056t-AE; Mon, 25 Sep 2017 01:19:40 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29C7E356F0;
	Mon, 25 Sep 2017 05:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 29C7E356F0
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.76] (ovpn-116-76.ams2.redhat.com [10.36.116.76])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 792606016F;
	Mon, 25 Sep 2017 05:19:36 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-19-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <0793731d-fc49-cf85-f15d-3f1ae8bbe0d2@redhat.com>
Date: Mon, 25 Sep 2017 07:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922154014.29350-19-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 25 Sep 2017 05:19:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 18/34] hw/unicore32: restrict hw addr
 defines to source file
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
X-List-Received-Date: Mon, 25 Sep 2017 05:19:46 -0000

On 22.09.2017 17:39, Philippe Mathieu-Daud=C3=A9 wrote:
> and drop unused #includes
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/unicore32/puv3.h | 10 ----------
>  hw/unicore32/puv3.c         | 16 ++++++++++------
>  2 files changed, 10 insertions(+), 16 deletions(-)
>=20
> diff --git a/include/hw/unicore32/puv3.h b/include/hw/unicore32/puv3.h
> index 5a4839f8df..f587a1f622 100644
> --- a/include/hw/unicore32/puv3.h
> +++ b/include/hw/unicore32/puv3.h
> @@ -14,16 +14,6 @@
> =20
>  #define PUV3_REGS_OFFSET        (0x1000) /* 4K is reasonable */
> =20
> -/* PKUnity System bus (AHB): 0xc0000000 - 0xedffffff (640MB) */
> -#define PUV3_DMA_BASE           (0xc0200000) /* AHB-4 */
> -
> -/* PKUnity Peripheral bus (APB): 0xee000000 - 0xefffffff (128MB) */
> -#define PUV3_GPIO_BASE          (0xee500000) /* APB-5 */
> -#define PUV3_INTC_BASE          (0xee600000) /* APB-6 */
> -#define PUV3_OST_BASE           (0xee800000) /* APB-8 */
> -#define PUV3_PM_BASE            (0xeea00000) /* APB-10 */
> -#define PUV3_PS2_BASE           (0xeeb00000) /* APB-11 */
> -
>  /* Hardware interrupts */
>  #define PUV3_IRQS_NR            (32)
> =20
> diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
> index 504ea46211..6849bac59c 100644
> --- a/hw/unicore32/puv3.c
> +++ b/hw/unicore32/puv3.c
> @@ -11,16 +11,10 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "qemu-common.h"
>  #include "cpu.h"
>  #include "ui/console.h"
> -#include "elf.h"
> -#include "exec/address-spaces.h"
> -#include "hw/sysbus.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> -#include "hw/i386/pc.h"
> -#include "qemu/error-report.h"
>  #include "sysemu/qtest.h"
> =20
>  #undef DEBUG_PUV3
> @@ -29,6 +23,16 @@
>  #define KERNEL_LOAD_ADDR        0x03000000
>  #define KERNEL_MAX_SIZE         0x00800000 /* Just a guess */
> =20
> +/* PKUnity System bus (AHB): 0xc0000000 - 0xedffffff (640MB) */
> +#define PUV3_DMA_BASE           (0xc0200000) /* AHB-4 */
> +
> +/* PKUnity Peripheral bus (APB): 0xee000000 - 0xefffffff (128MB) */
> +#define PUV3_GPIO_BASE          (0xee500000) /* APB-5 */
> +#define PUV3_INTC_BASE          (0xee600000) /* APB-6 */
> +#define PUV3_OST_BASE           (0xee800000) /* APB-8 */
> +#define PUV3_PM_BASE            (0xeea00000) /* APB-10 */
> +#define PUV3_PS2_BASE           (0xeeb00000) /* APB-11 */
> +
>  static void puv3_intc_cpu_handler(void *opaque, int irq, int level)
>  {
>      UniCore32CPU *cpu =3D opaque;
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>


