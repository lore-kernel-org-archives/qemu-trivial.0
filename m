Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4j3P-0003AN-8X
	for mharc-qemu-trivial@gnu.org; Wed, 18 Oct 2017 03:46:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1e4j3H-00035H-Vd
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 03:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1e4j3H-0007kj-38
	for qemu-trivial@nongnu.org; Wed, 18 Oct 2017 03:46:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55276)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1e4j3C-0007fY-N9; Wed, 18 Oct 2017 03:46:02 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9B59680460;
	Wed, 18 Oct 2017 07:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9B59680460
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from nial.brq.redhat.com (unknown [10.43.2.209])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 44A097C633;
	Wed, 18 Oct 2017 07:45:58 +0000 (UTC)
Date: Wed, 18 Oct 2017 09:45:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Cc: Michael Tokarev <mjt@tls.msk.ru>, Peter Maydell
	<peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20171018094557.1473b323@nial.brq.redhat.com>
In-Reply-To: <20171017164426.25277-35-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
	<20171017164426.25277-35-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 18 Oct 2017 07:46:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3 34/42] hw/acpi/ich9: extract
 ACPI_PM_PROP_TCO_ENABLED from i386/pc
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
X-List-Received-Date: Wed, 18 Oct 2017 07:46:13 -0000

On Tue, 17 Oct 2017 13:44:18 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> enable_tco is specific to i386/pc.
>=20
> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/ich9.h | 2 ++
>  include/hw/i386/pc.h   | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/hw/acpi/ich9.h b/include/hw/acpi/ich9.h
> index a352c94fde..59aeb06393 100644
> --- a/include/hw/acpi/ich9.h
> +++ b/include/hw/acpi/ich9.h
> @@ -63,6 +63,8 @@ typedef struct ICH9LPCPMRegs {
>      TCOIORegs tco_regs;
>  } ICH9LPCPMRegs;
> =20
> +#define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
> +
>  void ich9_pm_init(PCIDevice *lpc_pci, ICH9LPCPMRegs *pm,
>                    bool smm_enabled,
>                    qemu_irq sci_irq);
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 6335e2bf47..b1b4c918af 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -151,8 +151,6 @@ struct PCMachineClass {
>  #define PC_MACHINE_CLASS(klass) \
>      OBJECT_CLASS_CHECK(PCMachineClass, (klass), TYPE_PC_MACHINE)
> =20
> -#define ACPI_PM_PROP_TCO_ENABLED "enable_tco"
> -
>  /* parallel.c */
> =20
>  void parallel_hds_isa_init(ISABus *bus, int n);


