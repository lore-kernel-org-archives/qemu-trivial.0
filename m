Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etaLc-0007BH-LM
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2018 09:47:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1etaLZ-00078j-9Z
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:47:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1etaLS-0007If-Vs
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:47:13 -0500
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35660)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1etaLS-0007IE-L3
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2018 09:47:06 -0500
Received: by mail-wm0-f65.google.com with SMTP id x7so5213683wmc.0
	for <qemu-trivial@nongnu.org>; Wed, 07 Mar 2018 06:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yGzHwwxFu9hIJFrL9nC9nzPgAGrAd/ytgdxCTWjucPg=;
	b=dU/gQyRNzN99YwSlliK5z7LfUR6c4t6hqA7XJC43BihdHUwO/UevntgNK65PLx990h
	sYyDRNQGPyal6VpIfUcTfPlQt2pk54wrWdvSw4xePSYQsJS1iauBXFnBYn/I6Bsx0YFb
	EXkjwpwS3wT/H2fBQH8I3AXWuQddnsakhl61bTItrtEaastmG9OZvvOyi5fvNdzBUVr1
	e0xzBCw0zN7vLqwJq1VbvIcPPXEP96U7/qI76ZLKHYBsfZYI1w4gh3HaxXjOloyXV8N+
	nT4FiKlI8sTNLhCc0x2lve98rM80gNCht+cdAiAacDRxikNxc7njlYyTtu2/yvDpBWVQ
	1f7A==
X-Gm-Message-State: AElRT7FBrydh0P8u/QFHbk7BqhoPRqV2LGSJotjq93DCaPseWZJrElhL
	jy58C4oprllOzgSnY08KobRZ5A==
X-Google-Smtp-Source: AG47ELtW9f3ZTtFiehtZ379IrPYZZpQysEbGJ6z5ySyTlzEj5STU2FAku/7dqUkE95MSGiATU8+RlQ==
X-Received: by 10.28.95.139 with SMTP id t133mr15755787wmb.88.1520434025491;
	Wed, 07 Mar 2018 06:47:05 -0800 (PST)
Received: from [192.168.10.165] (94-36-191-219.adsl-ull.clienti.tiscali.it.
	[94.36.191.219]) by smtp.gmail.com with ESMTPSA id
	t91sm28182230wrc.21.2018.03.07.06.47.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Mar 2018 06:47:04 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, qemu-block@nongnu.org
References: <1518684912-31637-1-git-send-email-thuth@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <bb5b7bc7-f0cd-d735-293a-68b336ef7c27@redhat.com>
Date: Wed, 7 Mar 2018 15:47:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1518684912-31637-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] hw: Do not include
 "sysemu/block-backend.h" if it is not necessary
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
X-List-Received-Date: Wed, 07 Mar 2018 14:47:15 -0000

On 15/02/2018 09:55, Thomas Huth wrote:
> After reviewing a patch from Philippe that removes block-backend.h
> from hw/lm32/milkymist.c, I noticed that this header is included
> unnecessarily in a lot of other files, too. Remove those unneeded
> includes to speed up the compilation process a little bit.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Michael seems busy, so I'll pick this up.

Paolo

> ---
>  hw/arm/highbank.c              | 1 -
>  hw/arm/msf2-soc.c              | 1 -
>  hw/arm/realview.c              | 1 -
>  hw/arm/tosa.c                  | 1 -
>  hw/i386/pc.c                   | 2 --
>  hw/i386/pc_piix.c              | 1 -
>  hw/ide/ahci-allwinner.c        | 1 -
>  hw/ide/cmd646.c                | 1 -
>  hw/ide/ich.c                   | 1 -
>  hw/ide/isa.c                   | 1 -
>  hw/ide/microdrive.c            | 1 -
>  hw/ide/mmio.c                  | 1 -
>  hw/mips/mips_fulong2e.c        | 1 -
>  hw/mips/mips_jazz.c            | 1 -
>  hw/ppc/mac_newworld.c          | 1 -
>  hw/ppc/mac_oldworld.c          | 1 -
>  hw/ppc/prep.c                  | 1 -
>  hw/scsi/mptendian.c            | 1 -
>  hw/sd/core.c                   | 1 -
>  hw/sparc/sun4m.c               | 1 -
>  hw/tricore/tricore_testboard.c | 2 --
>  21 files changed, 23 deletions(-)
> 
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index 287392b..1742cf6 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -27,7 +27,6 @@
>  #include "sysemu/kvm.h"
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
> -#include "sysemu/block-backend.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "hw/char/pl011.h"
> diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
> index a8ec2cd..f68df56 100644
> --- a/hw/arm/msf2-soc.c
> +++ b/hw/arm/msf2-soc.c
> @@ -29,7 +29,6 @@
>  #include "exec/address-spaces.h"
>  #include "hw/char/serial.h"
>  #include "hw/boards.h"
> -#include "sysemu/block-backend.h"
>  #include "qemu/cutils.h"
>  #include "hw/arm/msf2-soc.h"
>  #include "hw/misc/unimp.h"
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 87cd1e5..2139a62 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -20,7 +20,6 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/i2c/i2c.h"
> -#include "sysemu/block-backend.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/error-report.h"
>  #include "hw/char/pl011.h"
> diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
> index a55b1a3..7a925fa 100644
> --- a/hw/arm/tosa.c
> +++ b/hw/arm/tosa.c
> @@ -22,7 +22,6 @@
>  #include "hw/boards.h"
>  #include "hw/i2c/i2c.h"
>  #include "hw/ssi/ssi.h"
> -#include "sysemu/block-backend.h"
>  #include "hw/sysbus.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/sysemu.h"
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 55e69d6..7670b45 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -50,8 +50,6 @@
>  #include "sysemu/qtest.h"
>  #include "kvm_i386.h"
>  #include "hw/xen/xen.h"
> -#include "sysemu/block-backend.h"
> -#include "hw/block/block.h"
>  #include "ui/qemu-spice.h"
>  #include "exec/memory.h"
>  #include "exec/address-spaces.h"
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 456dc9e..527c922 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -40,7 +40,6 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/sysbus.h"
>  #include "sysemu/arch_init.h"
> -#include "sysemu/block-backend.h"
>  #include "hw/i2c/smbus.h"
>  #include "hw/xen/xen.h"
>  #include "exec/memory.h"
> diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
> index c3f1604..5397483 100644
> --- a/hw/ide/ahci-allwinner.c
> +++ b/hw/ide/ahci-allwinner.c
> @@ -18,7 +18,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
>  #include "qemu/error-report.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/dma.h"
>  #include "hw/ide/internal.h"
>  #include "hw/ide/ahci_internal.h"
> diff --git a/hw/ide/cmd646.c b/hw/ide/cmd646.c
> index 65aff51..6bb92d7 100644
> --- a/hw/ide/cmd646.c
> +++ b/hw/ide/cmd646.c
> @@ -26,7 +26,6 @@
>  #include "hw/hw.h"
>  #include "hw/pci/pci.h"
>  #include "hw/isa/isa.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/sysemu.h"
>  #include "sysemu/dma.h"
>  
> diff --git a/hw/ide/ich.c b/hw/ide/ich.c
> index c01b24e..134478e 100644
> --- a/hw/ide/ich.c
> +++ b/hw/ide/ich.c
> @@ -65,7 +65,6 @@
>  #include "hw/pci/msi.h"
>  #include "hw/pci/pci.h"
>  #include "hw/isa/isa.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/dma.h"
>  #include "hw/ide/pci.h"
>  #include "hw/ide/ahci_internal.h"
> diff --git a/hw/ide/isa.c b/hw/ide/isa.c
> index 9fb24fc..028bd61 100644
> --- a/hw/ide/isa.c
> +++ b/hw/ide/isa.c
> @@ -25,7 +25,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
>  #include "hw/isa/isa.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/dma.h"
>  
>  #include "hw/ide/internal.h"
> diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
> index 58e4f52..34bb98d 100644
> --- a/hw/ide/microdrive.c
> +++ b/hw/ide/microdrive.c
> @@ -25,7 +25,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
>  #include "hw/pcmcia.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/dma.h"
>  
>  #include "hw/ide/internal.h"
> diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
> index 6f12f45..42fcf13 100644
> --- a/hw/ide/mmio.c
> +++ b/hw/ide/mmio.c
> @@ -25,7 +25,6 @@
>  #include "qemu/osdep.h"
>  #include "hw/hw.h"
>  #include "hw/sysbus.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/dma.h"
>  
>  #include "hw/ide/internal.h"
> diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
> index f68c625..be4f839 100644
> --- a/hw/mips/mips_fulong2e.c
> +++ b/hw/mips/mips_fulong2e.c
> @@ -27,7 +27,6 @@
>  #include "net/net.h"
>  #include "hw/boards.h"
>  #include "hw/i2c/smbus.h"
> -#include "sysemu/block-backend.h"
>  #include "hw/block/flash.h"
>  #include "hw/mips/mips.h"
>  #include "hw/mips/cpudevs.h"
> diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
> index b09871a..08e6f62 100644
> --- a/hw/mips/mips_jazz.c
> +++ b/hw/mips/mips_jazz.c
> @@ -41,7 +41,6 @@
>  #include "hw/timer/i8254.h"
>  #include "hw/display/vga.h"
>  #include "hw/audio/pcspk.h"
> -#include "sysemu/block-backend.h"
>  #include "hw/sysbus.h"
>  #include "exec/address-spaces.h"
>  #include "sysemu/qtest.h"
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index b832417..2c909d1 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -68,7 +68,6 @@
>  #include "sysemu/kvm.h"
>  #include "kvm_ppc.h"
>  #include "hw/usb.h"
> -#include "sysemu/block-backend.h"
>  #include "exec/address-spaces.h"
>  #include "hw/sysbus.h"
>  #include "qemu/cutils.h"
> diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
> index d1f4546..e35575c 100644
> --- a/hw/ppc/mac_oldworld.c
> +++ b/hw/ppc/mac_oldworld.c
> @@ -43,7 +43,6 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/kvm.h"
>  #include "kvm_ppc.h"
> -#include "sysemu/block-backend.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/cutils.h"
>  
> diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
> index 096d4d4..c9d8950 100644
> --- a/hw/ppc/prep.c
> +++ b/hw/ppc/prep.c
> @@ -43,7 +43,6 @@
>  #include "hw/timer/mc146818rtc.h"
>  #include "hw/isa/pc87312.h"
>  #include "hw/net/ne2000-isa.h"
> -#include "sysemu/block-backend.h"
>  #include "sysemu/arch_init.h"
>  #include "sysemu/kvm.h"
>  #include "sysemu/qtest.h"
> diff --git a/hw/scsi/mptendian.c b/hw/scsi/mptendian.c
> index 3415229..8ae39a7 100644
> --- a/hw/scsi/mptendian.c
> +++ b/hw/scsi/mptendian.c
> @@ -24,7 +24,6 @@
>  #include "hw/hw.h"
>  #include "hw/pci/pci.h"
>  #include "sysemu/dma.h"
> -#include "sysemu/block-backend.h"
>  #include "hw/pci/msi.h"
>  #include "qemu/iov.h"
>  #include "hw/scsi/scsi.h"
> diff --git a/hw/sd/core.c b/hw/sd/core.c
> index 3c6eae6..820345f 100644
> --- a/hw/sd/core.c
> +++ b/hw/sd/core.c
> @@ -21,7 +21,6 @@
>  
>  #include "qemu/osdep.h"
>  #include "hw/qdev-core.h"
> -#include "sysemu/block-backend.h"
>  #include "hw/sd/sd.h"
>  #include "trace.h"
>  
> diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
> index f9892e3..c980096 100644
> --- a/hw/sparc/sun4m.c
> +++ b/hw/sparc/sun4m.c
> @@ -44,7 +44,6 @@
>  #include "hw/empty_slot.h"
>  #include "hw/loader.h"
>  #include "elf.h"
> -#include "sysemu/block-backend.h"
>  #include "trace.h"
>  #include "qemu/cutils.h"
>  
> diff --git a/hw/tricore/tricore_testboard.c b/hw/tricore/tricore_testboard.c
> index ac75eb2..8e61dfc 100644
> --- a/hw/tricore/tricore_testboard.c
> +++ b/hw/tricore/tricore_testboard.c
> @@ -28,9 +28,7 @@
>  #include "sysemu/sysemu.h"
>  #include "hw/boards.h"
>  #include "hw/loader.h"
> -#include "sysemu/block-backend.h"
>  #include "exec/address-spaces.h"
> -#include "hw/block/flash.h"
>  #include "elf.h"
>  #include "hw/tricore/tricore.h"
>  #include "qemu/error-report.h"
> 


