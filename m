Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4LEc-0002La-PT
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 02:20:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4LEY-0002Jc-8m
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:20:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1e4LEW-0006OF-U2
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 02:20:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49932)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1e4LEP-0006Je-LN; Tue, 17 Oct 2017 02:20:01 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 43A6BC049D42;
	Tue, 17 Oct 2017 06:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 43A6BC049D42
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=thuth@redhat.com
Received: from [10.36.116.158] (ovpn-116-158.ams2.redhat.com [10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB6545D972;
	Tue, 17 Oct 2017 06:19:54 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20171017001209.32276-1-f4bug@amsat.org>
	<20171017001209.32276-36-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <82f588d7-b471-be7e-05f5-597e20452a5b@redhat.com>
Date: Tue, 17 Oct 2017 08:19:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171017001209.32276-36-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 17 Oct 2017 06:20:00 +0000 (UTC)
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
X-List-Received-Date: Tue, 17 Oct 2017 06:20:13 -0000


May I suggest to add at least a small patch description a la "It's a
x86-only device, so it does not make sense to keep it in the shared misc
folder" here?

On 17.10.2017 02:12, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
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

It seems to be possible to disable this device in the configuration
(when also disabling VMMOUSE), so I'd maybe be nicer to rather keep the
config switch, I think (in case people want to build a minimalistic QEMU)

 Thomas

