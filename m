Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwOTD-0007td-V3
	for mharc-qemu-trivial@gnu.org; Mon, 25 Sep 2017 04:10:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dwOTC-0007sT-8R
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 04:10:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1dwOTB-0007xW-GU
	for qemu-trivial@nongnu.org; Mon, 25 Sep 2017 04:10:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43630)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1dwOT2-0007rD-S6; Mon, 25 Sep 2017 04:10:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E36E281DFE;
	Mon, 25 Sep 2017 08:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E36E281DFE
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-215.str.redhat.com [10.33.192.215])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24C1D6017D;
	Mon, 25 Sep 2017 08:10:04 +0000 (UTC)
Date: Mon, 25 Sep 2017 10:10:00 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth
	<thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann
	<kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov
	<imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>, David Gibson
	<david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>, Alex
	Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170925101000.7e996270.cohuck@redhat.com>
In-Reply-To: <20170922154014.29350-2-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-2-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 25 Sep 2017 08:10:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 01/34] hw: use "qemu/osdep.h" as first
 #include in source files
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
X-List-Received-Date: Mon, 25 Sep 2017 08:10:27 -0000

On Fri, 22 Sep 2017 12:39:41 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> applied using ./scripts/clean-includes
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/acpi/ipmi-stub.c             | 1 +
>  hw/audio/fmopl.c                | 1 -
>  hw/cpu/core.c                   | 1 +
>  hw/ppc/spapr_cpu_core.c         | 1 +
>  hw/smbios/smbios_type_38-stub.c | 1 +
>  hw/vfio/ccw.c                   | 2 +-
>  hw/virtio/vhost-vsock.c         | 2 +-
>  7 files changed, 6 insertions(+), 3 deletions(-)
>=20

> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index a8baadf57a..4810fa0b50 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -11,11 +11,11 @@
>   * directory.
>   */
> =20
> +#include "qemu/osdep.h"
>  #include <linux/vfio.h>
>  #include <linux/vfio_ccw.h>
>  #include <sys/ioctl.h>
> =20
> -#include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "hw/sysbus.h"
>  #include "hw/vfio/vfio.h"

Acked-by: Cornelia Huck <cohuck@redhat.com>

