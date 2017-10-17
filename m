Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4PgY-0007YC-EH
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 07:05:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1e4PgR-0007VE-O5
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 07:05:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1e4PgL-0003B0-Pl
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 07:05:15 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1e4Pg8-0002wh-E8; Tue, 17 Oct 2017 07:04:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDAF5267C2;
	Tue, 17 Oct 2017 11:04:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DDAF5267C2
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.51] (ovpn-117-51.ams2.redhat.com [10.36.117.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6F3260852;
	Tue, 17 Oct 2017 11:04:49 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-37-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <0e1e9d13-9b7f-ef72-757b-7b4262986a48@redhat.com>
Date: Tue, 17 Oct 2017 13:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-37-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 17 Oct 2017 11:04:55 +0000 (UTC)
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
X-List-Received-Date: Tue, 17 Oct 2017 11:05:20 -0000

On 17/10/2017 02:12, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

pvpanic does not _have_ to be i386-specific, and losing the
configurability with default-configs/ is a bit of a pity (there are
people who change the configurations), so I think it's better to leave
out this change.

Paolo

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
>  CONFIG_MEM_HOTPLUG=3Dy
>  CONFIG_NVDIMM=3Dy
>  CONFIG_ACPI_NVDIMM=3Dy
> diff --git a/default-configs/x86_64-softmmu.mak b/default-configs/x86_6=
4-softmmu.mak
> index f1fe508ff4..23488d324f 100644
> --- a/default-configs/x86_64-softmmu.mak
> +++ b/default-configs/x86_64-softmmu.mak
> @@ -46,7 +46,6 @@ CONFIG_LPC_ICH9=3Dy
>  CONFIG_PCI_Q35=3Dy
>  CONFIG_APIC=3Dy
>  CONFIG_IOAPIC=3Dy
> -CONFIG_PVPANIC=3Dy
>  CONFIG_MEM_HOTPLUG=3Dy
>  CONFIG_NVDIMM=3Dy
>  CONFIG_ACPI_NVDIMM=3Dy
> diff --git a/hw/misc/pvpanic.c b/hw/i386/pvpanic.c
> similarity index 100%
> rename from hw/misc/pvpanic.c
> rename to hw/i386/pvpanic.c
> diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
> index feff56a9b7..41574096f1 100644
> --- a/hw/i386/Makefile.objs
> +++ b/hw/i386/Makefile.objs
> @@ -7,6 +7,6 @@ obj-y +=3D amd_iommu.o
>  obj-$(CONFIG_XEN) +=3D ../xenpv/ xen/
> =20
>  obj-y +=3D kvmvapic.o
> -obj-y +=3D acpi-build.o
> +obj-y +=3D acpi-build.o pvpanic.o
>  obj-y +=3D pci-assign-load-rom.o
>  obj-y +=3D vmport.o
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 03bc758592..182f9a7d54 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -53,7 +53,6 @@ obj-$(CONFIG_MIPS_CPS) +=3D mips_cpc.o
>  obj-$(CONFIG_MIPS_ITU) +=3D mips_itu.o
>  obj-$(CONFIG_MPS2_SCC) +=3D mps2-scc.o
> =20
> -obj-$(CONFIG_PVPANIC) +=3D pvpanic.o
>  obj-$(CONFIG_HYPERV_TESTDEV) +=3D hyperv_testdev.o
>  obj-$(CONFIG_AUX) +=3D auxbus.o
>  obj-$(CONFIG_ASPEED_SOC) +=3D aspeed_scu.o aspeed_sdmc.o
>=20


