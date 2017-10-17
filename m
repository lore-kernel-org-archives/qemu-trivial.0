Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Pgx-0007mq-Pg
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 07:05:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49169)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1e4Pgq-0007jQ-C8
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 07:05:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1e4Pgk-0003YJ-NU
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 07:05:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48788)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1e4Pga-0003PF-Lh; Tue, 17 Oct 2017 07:05:24 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 922DD4E917;
	Tue, 17 Oct 2017 11:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 922DD4E917
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.51] (ovpn-117-51.ams2.redhat.com [10.36.117.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D731600C4;
	Tue, 17 Oct 2017 11:05:19 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-36-f4bug@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5f0f4197-8787-a277-a46c-558f16fae2b8@redhat.com>
Date: Tue, 17 Oct 2017 13:05:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-36-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 17 Oct 2017 11:05:23 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2 35/39] i386/pc: move vmport.c from
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
X-List-Received-Date: Tue, 17 Oct 2017 11:05:46 -0000

On 17/10/2017 02:12, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Keeping the configurability is desirable here too, but moving to hw/i386
makes a lot of sense in this case.

Paolo

> ---
>  default-configs/i386-softmmu.mak   | 1 -
>  default-configs/x86_64-softmmu.mak | 1 -
>  hw/{misc =3D> i386}/vmport.c         | 0
>  hw/i386/Makefile.objs              | 1 +
>  hw/misc/Makefile.objs              | 2 --
>  5 files changed, 1 insertion(+), 4 deletions(-)
>  rename hw/{misc =3D> i386}/vmport.c (100%)
>=20
> diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-so=
ftmmu.mak
> index d2ab2f6655..dbc4e65652 100644
> --- a/default-configs/i386-softmmu.mak
> +++ b/default-configs/i386-softmmu.mak
> @@ -41,7 +41,6 @@ CONFIG_PCI_PIIX=3Dy
>  CONFIG_WDT_IB700=3Dy
>  CONFIG_ISA_DEBUG=3Dy
>  CONFIG_ISA_TESTDEV=3Dy
> -CONFIG_VMPORT=3Dy
>  CONFIG_SGA=3Dy
>  CONFIG_LPC_ICH9=3Dy
>  CONFIG_PCI_Q35=3Dy
> diff --git a/default-configs/x86_64-softmmu.mak b/default-configs/x86_6=
4-softmmu.mak
> index 9bde2f1c4b..f1fe508ff4 100644
> --- a/default-configs/x86_64-softmmu.mak
> +++ b/default-configs/x86_64-softmmu.mak
> @@ -41,7 +41,6 @@ CONFIG_PCI_PIIX=3Dy
>  CONFIG_WDT_IB700=3Dy
>  CONFIG_ISA_DEBUG=3Dy
>  CONFIG_ISA_TESTDEV=3Dy
> -CONFIG_VMPORT=3Dy
>  CONFIG_SGA=3Dy
>  CONFIG_LPC_ICH9=3Dy
>  CONFIG_PCI_Q35=3Dy
> diff --git a/hw/misc/vmport.c b/hw/i386/vmport.c
> similarity index 100%
> rename from hw/misc/vmport.c
> rename to hw/i386/vmport.c
> diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
> index 909ead6a77..feff56a9b7 100644
> --- a/hw/i386/Makefile.objs
> +++ b/hw/i386/Makefile.objs
> @@ -9,3 +9,4 @@ obj-$(CONFIG_XEN) +=3D ../xenpv/ xen/
>  obj-y +=3D kvmvapic.o
>  obj-y +=3D acpi-build.o
>  obj-y +=3D pci-assign-load-rom.o
> +obj-y +=3D vmport.o
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 19202d90cf..03bc758592 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -11,8 +11,6 @@ common-obj-$(CONFIG_EDU) +=3D edu.o
>  common-obj-y +=3D unimp.o
>  common-obj-y +=3D vmcoreinfo.o
> =20
> -obj-$(CONFIG_VMPORT) +=3D vmport.o
> -
>  # ARM devices
>  common-obj-$(CONFIG_PL310) +=3D arm_l2x0.o
>  common-obj-$(CONFIG_INTEGRATOR_DEBUG) +=3D arm_integrator_debug.o
>=20


