Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePn4N-00023d-45
	for mharc-qemu-trivial@gnu.org; Fri, 15 Dec 2017 05:18:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ePn4H-0001yN-Lz
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 05:18:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ePn4B-0008HB-Vm
	for qemu-trivial@nongnu.org; Fri, 15 Dec 2017 05:18:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36286)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1ePn46-0008C3-Pt; Fri, 15 Dec 2017 05:18:02 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 164D225C4F;
	Fri, 15 Dec 2017 10:18:00 +0000 (UTC)
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3FA3B600C2;
	Fri, 15 Dec 2017 10:17:56 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
References: <20171215033015.738-1-f4bug@amsat.org>
	<20171215033015.738-5-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <800d15c5-fe10-56af-083c-501291d245ad@redhat.com>
Date: Fri, 15 Dec 2017 11:17:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20171215033015.738-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 15 Dec 2017 10:18:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v4 04/43] MAINTAINERS: add an entry for
 the i82378 (superio)
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
X-List-Received-Date: Fri, 15 Dec 2017 10:18:17 -0000

On 15.12.2017 04:29, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Reviewed-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>
> Reviewed-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org>

Remove the doubled Reviewed-by, or replace the second line with:

Reviewed-by: Thomas Huth <thuth@redhat.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 31c673d60a..4618f9b4db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -732,6 +732,7 @@ F: hw/ppc/prep.c
>  F: hw/ppc/prep_systemio.c
>  F: hw/ppc/rs6000_mc.c
>  F: hw/pci-host/prep.[hc]
> +F: hw/isa/i82378.c
>  F: hw/isa/pc87312.[hc]
>  F: hw/dma/i82374.c
>  F: pc-bios/ppc_rom.bin
>=20


