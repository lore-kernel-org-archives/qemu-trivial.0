Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4LqT-0002mY-BN
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 02:59:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4LqR-0002lI-HS
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:59:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4LqQ-0002rc-W6
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:59:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39010)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4LqM-0002ns-Mt; Tue, 17 Oct 2017 02:59:14 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 641B1356F3;
	Tue, 17 Oct 2017 06:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 641B1356F3
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.158] (ovpn-116-158.ams2.redhat.com [10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9483B60577;
	Tue, 17 Oct 2017 06:59:11 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <50725210-1e77-a987-b9fc-6185597b5c57@redhat.com>
Date: Tue, 17 Oct 2017 08:59:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 17 Oct 2017 06:59:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 02/39] MAINTAINERS: add
 entries for dma/i82374
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
X-List-Received-Date: Tue, 17 Oct 2017 06:59:20 -0000

On 17.10.2017 02:11, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6f56c1349b..cfd9010e27 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -713,6 +713,7 @@ F: hw/ppc/prep_systemio.c
>  F: hw/ppc/rs6000_mc.c
>  F: hw/pci-host/prep.[hc]
>  F: hw/isa/pc87312.[hc]
> +F: hw/dma/i82374.c
>  F: pc-bios/ppc_rom.bin
> =20
>  sPAPR
> @@ -854,6 +855,7 @@ F: hw/misc/pc-testdev.c
>  F: hw/timer/hpet*
>  F: hw/timer/i8254*
>  F: hw/timer/mc146818rtc*
> +F: include/hw/dma/i8257_dma.h

Does not match $subject. And the file does not exist yet (you just
create it in patch 39). And I think you should CC: the corresponding
maintainers so that they have a chance to say yes or no.

 Thomas

