Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4n5q-0003YP-Ln
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 08:05:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4n5l-0003Ul-Mv
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:05:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4n5i-0006aF-IF
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 08:04:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4n5W-0006XH-1L; Wed, 18 Oct 2017 08:04:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2A6913AA8;
	Wed, 18 Oct 2017 12:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D2A6913AA8
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.33.192.189] (dhcp-192-189.str.redhat.com [10.33.192.189])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01F6181EF4;
	Wed, 18 Oct 2017 12:04:31 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Eduardo Otubo <otubo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c562db63-e5ec-3873-923f-b90f0c027b6c@redhat.com>
Date: Wed, 18 Oct 2017 14:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017164426.25277-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 18 Oct 2017 12:04:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 02/42] MAINTAINERS: add an entry for
 the i82374 (southbridge)
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
X-List-Received-Date: Wed, 18 Oct 2017 12:05:01 -0000

On 17.10.2017 18:43, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6f56c1349b..331f7391c1 100644
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
>=20

Reviewed-by: Thomas Huth <thuth@redhat.com>

