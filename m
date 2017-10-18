Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4nR5-0003ai-K3
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 08:26:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57051)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nR3-0003Zg-Qc
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:26:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4nR2-0007T9-Ut
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:26:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60476)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4nQx-0007Me-Ou; Wed, 18 Oct 2017 08:26:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 96D1FCFEA3;
	Wed, 18 Oct 2017 12:26:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 96D1FCFEA3
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 256637EF45;
	Wed, 18 Oct 2017 12:26:43 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@imgtec.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-36-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <05c9a669-da17-9894-62d9-43c3d9defb17@redhat.com>
Date: Wed, 18 Oct 2017 14:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017164426.25277-36-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 18 Oct 2017 12:26:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 35/42] hw/display/vga:
 "vga.h" only contains registers defs, rename it "vga_regs.h"
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
X-List-Received-Date: Wed, 18 Oct 2017 12:26:58 -0000

On 17.10.2017 18:44, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/display/{vga.h =3D> vga_regs.h} | 0
>  hw/display/vga.c                 | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename hw/display/{vga.h =3D> vga_regs.h} (100%)
>=20
> diff --git a/hw/display/vga.h b/hw/display/vga_regs.h
> similarity index 100%
> rename from hw/display/vga.h
> rename to hw/display/vga_regs.h
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index ed24ef7076..35696b6fdd 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -24,11 +24,11 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/hw.h"
> -#include "vga.h"
>  #include "ui/console.h"
>  #include "hw/i386/pc.h"
>  #include "hw/pci/pci.h"
>  #include "vga_int.h"
> +#include "vga_regs.h"
>  #include "ui/pixel_ops.h"
>  #include "qemu/timer.h"
>  #include "hw/xen/xen.h"
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>

