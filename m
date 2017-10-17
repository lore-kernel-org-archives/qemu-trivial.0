Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Lf8-0007eB-7z
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 02:47:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4Lf5-0007c9-Qn
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:47:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4Lf5-0004VJ-3b
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:47:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4Lex-0004Of-3s; Tue, 17 Oct 2017 02:47:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 06A72883A2;
	Tue, 17 Oct 2017 06:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 06A72883A2
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.158] (ovpn-116-158.ams2.redhat.com [10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 782F962B0C;
	Tue, 17 Oct 2017 06:47:16 +0000 (UTC)
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
	<20171017001209.32276-40-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <349eda7b-b812-7df7-0a1c-34f1b262625f@redhat.com>
Date: Tue, 17 Oct 2017 08:47:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-40-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 17 Oct 2017 06:47:26 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 39/39] hw/dma/i8257: rename DMA_init()
 to i8257_dma_init()
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
X-List-Received-Date: Tue, 17 Oct 2017 06:47:36 -0000

On 17.10.2017 02:12, Philippe Mathieu-Daud=C3=A9 wrote:
> - move the header from hw/isa/ to hw/dma/
> - remove the old i386/pc dependency
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  include/hw/{isa/i8257.h =3D> dma/i8257_dma.h} | 6 ++++++
>  include/hw/isa/isa.h                        | 2 --
>  hw/dma/i82374.c                             | 3 ++-
>  hw/dma/i8257.c                              | 4 ++--
>  hw/i386/pc.c                                | 3 ++-
>  hw/mips/mips_fulong2e.c                     | 3 ++-
>  hw/mips/mips_jazz.c                         | 3 ++-
>  hw/mips/mips_malta.c                        | 3 ++-
>  hw/sparc/sun4m.c                            | 4 ----
>  hw/sparc64/sun4u.c                          | 4 ----
>  10 files changed, 18 insertions(+), 17 deletions(-)
>  rename include/hw/{isa/i8257.h =3D> dma/i8257_dma.h} (86%)
>=20
> diff --git a/include/hw/isa/i8257.h b/include/hw/dma/i8257_dma.h
> similarity index 86%
> rename from include/hw/isa/i8257.h
> rename to include/hw/dma/i8257_dma.h

I think you could drop the "_dma" suffix from the name - it is already
in a folder called "dma", so the context of this file should be clear
already.

 Thomas

