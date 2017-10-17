Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4LKO-0003Va-P9
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 02:26:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4LKM-0003US-Pq
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:26:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4LKM-00014r-2o
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:26:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49310)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4LKF-00012U-7Q; Tue, 17 Oct 2017 02:26:03 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3784C4E917;
	Tue, 17 Oct 2017 06:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3784C4E917
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.158] (ovpn-116-158.ams2.redhat.com [10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 410955D972;
	Tue, 17 Oct 2017 06:25:56 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-37-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7bf3fd02-7df4-456e-124c-8079b90e5fb8@redhat.com>
Date: Tue, 17 Oct 2017 08:25:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-37-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 17 Oct 2017 06:26:02 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 36/39] i386/pc: move pvpanic.c from
 hw/misc/ to hw/i386/
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
X-List-Received-Date: Tue, 17 Oct 2017 06:26:11 -0000


Add at least a short patch description, please (not everybody can read
your mind ;-))

On 17.10.2017 02:12, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  default-configs/i386-softmmu.mak   | 1 -
>  default-configs/x86_64-softmmu.mak | 1 -
>  hw/{misc =3D> i386}/pvpanic.c        | 0
>  hw/i386/Makefile.objs              | 2 +-
>  hw/misc/Makefile.objs              | 1 -
>  5 files changed, 1 insertion(+), 4 deletions(-)
>  rename hw/{misc =3D> i386}/pvpanic.c (100%)
>=20
> diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-so=
ftmmu.mak
> index dbc4e65652..541ec8604d 100644
> --- a/default-configs/i386-softmmu.mak
> +++ b/default-configs/i386-softmmu.mak
> @@ -46,7 +46,6 @@ CONFIG_LPC_ICH9=3Dy
>  CONFIG_PCI_Q35=3Dy
>  CONFIG_APIC=3Dy
>  CONFIG_IOAPIC=3Dy
> -CONFIG_PVPANIC=3Dy

Looks like QEMU currently can not be build without CONFIG_PVPANIC, so
this config switch is useless, indeed. Should be OK to remove it.

Reviewed-by: Thomas Huth <thuth@redhat.com>

