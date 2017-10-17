Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Lc4-0006V6-D7
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 02:44:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55847)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4Lc1-0006T8-Gz
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:44:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4Lc0-0002sW-MA
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:44:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23805)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4Lbs-0002nE-35; Tue, 17 Oct 2017 02:44:16 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AC60883B4;
	Tue, 17 Oct 2017 06:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 0AC60883B4
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.158] (ovpn-116-158.ams2.redhat.com [10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0B516363D;
	Tue, 17 Oct 2017 06:44:02 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Aurelien Jarno
	<aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>,
	Richard Henderson <rth@twiddle.net>, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
	<hpoussin@reactos.org>, David Gibson <david@gibson.dropbear.id.au>,
	Alexander Graf <agraf@suse.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Otubo <otubo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-39-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f7cc6099-cb42-f3ec-d23f-135111ff306c@redhat.com>
Date: Tue, 17 Oct 2017 08:43:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-39-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 17 Oct 2017 06:44:15 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 38/39] hw/dma/i82374: avoid multiple
 creations on the same ISA bus
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
X-List-Received-Date: Tue, 17 Oct 2017 06:44:26 -0000

On 17.10.2017 02:12, Philippe Mathieu-Daud=C3=A9 wrote:
> $ ./ppc64-softmmu/qemu-system-ppc64 -S -machine 40p,accel=3Dtcg -device=
 i82374
> qemu-system-ppc64: -device i82374: DMA already initialized on ISA bus
>=20
> Reported-by: Eduardo Otubo <otubo@redhat.com>
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/dma/i82374.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/dma/i82374.c b/hw/dma/i82374.c
> index 6c0f975df0..280e64f0fa 100644
> --- a/hw/dma/i82374.c
> +++ b/hw/dma/i82374.c
> @@ -23,6 +23,7 @@
>   */
> =20
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "hw/isa/isa.h"
> =20
>  #define TYPE_I82374 "i82374"
> @@ -117,13 +118,19 @@ static const MemoryRegionPortio i82374_portio_lis=
t[] =3D {
>  static void i82374_realize(DeviceState *dev, Error **errp)
>  {
>      I82374State *s =3D I82374(dev);
> +    ISABus *isa_bus =3D isa_bus_from_device(ISA_DEVICE(dev));
> +
> +    if (isa_bus->dma[0] || isa_bus->dma[1]) {
> +        error_setg(errp, "DMA already initialized on ISA bus");
> +        return;
> +    }

I think it'd be somewhat cleaner to do this check within DMA_init() -
and DMA_init() then should be provided with an errp parameter, too.
Since you then have to touch all callers, it would then maybe also make
sense to merge this with the next patch where you've got to touch all
callers due to the renaming of the function anyway.

>      portio_list_init(&s->port_list, OBJECT(s), i82374_portio_list, s,
>                       "i82374");
>      portio_list_add(&s->port_list, isa_address_space_io(&s->parent_obj=
),
>                      s->iobase);
> =20
> -    DMA_init(isa_bus_from_device(ISA_DEVICE(dev)), 1);
> +    DMA_init(isa_bus, 1);
>      memset(s->commands, 0, sizeof(s->commands));
>  }

 Thomas



