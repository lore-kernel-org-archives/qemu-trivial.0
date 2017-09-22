Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQzo-0002wQ-On
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:40:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42561)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQzl-0002tM-Ud
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:40:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQzl-0003KE-4P
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:40:05 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:53576)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvQzk-0003Jn-Uh
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:40:05 -0400
Received: by mail-wr0-x22c.google.com with SMTP id l22so1354301wrc.10
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=TeTAM8vg6XV7yWvtcYkcLvfViu0HxkEEDImtLf3FSOM=;
	b=Ye0eTrXokGkxeAXFDpE6Fv1YiYGr3loT7HhGuC11bsxkLvhxb346rfD2e0pPUCtTcM
	wf3vSqJLwXnXS8R8H+E5sXC1o/qEJifUykU8oRWo3locaa7tk2jKPFIxH6pwrLkTGIyl
	kOsxUIB1hH8buAiPTrnb/rI/e2a774Y3i/12U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=TeTAM8vg6XV7yWvtcYkcLvfViu0HxkEEDImtLf3FSOM=;
	b=dmqEYN062l3DIxAQUIVQD6A4D+iFIhm8Zl/v4WYRokiW2a96zQz8CF4AVtvTncYN3W
	Zump0cfCEJF7umOdNaBlQ/LqXDRdfyzpWJbuHAgusy4SjNY96yuqgK/gLFieqtAq8oKX
	SYbkNOP6dI9yhrwnURxBAaWh/JscuYX3HQ4QnAMo8mI5uOIXpx14QzP6XcfB9rCpGHHx
	JSCSMk2rTHylkBKSXdEmYxWd6A3V05wQXuQuHDeDy5RJ/M8xDO7vFso/n+ocltX3WQL5
	BM4foNZjM09k/wjCzmzImyY+urMtz08xjsDvtwNVGoKe4AX0o2zXE+jdDCSf6krxk8Hz
	MhMA==
X-Gm-Message-State: AHPjjUjFIqaLYlknLu0sPvG1sBpTmb9YyJj+66mlxym5GufLCntfheNw
	EtedlTi08Jc0CwSWTeiUXgCdXm2HRpynKxtJoBQ5pA==
X-Google-Smtp-Source: AOwi7QBo5P+Q2OpAmaKWE/7QrESyaZ1jM5+9+e4Nzdb/KPQtfUFYpBXE2ISopyRD3D92AkZuUfICiku5JGhXASALbb8=
X-Received: by 10.223.198.202 with SMTP id c10mr5249622wrh.230.1506098403989; 
	Fri, 22 Sep 2017 09:40:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:39:43 -0700 (PDT)
In-Reply-To: <20170922154014.29350-7-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-7-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:39:43 +0100
Message-ID: <CAFEAcA-FgAHEjMkS=kgYbwCW6A9qHBmfgYVLZm3DRQPWKSRPWg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <agraf@suse.de>,
	David Gibson <david@gibson.dropbear.id.au>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-trivial] [PATCH 06/34] ppc: remove duplicated includes
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
X-List-Received-Date: Fri, 22 Sep 2017 16:40:07 -0000

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> applied using ./scripts/clean-includes
>
> not needed since 7ebaf795560
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/ppc/spapr_hcall.c | 1 -
>  target/ppc/kvm.c     | 3 ---
>  2 files changed, 4 deletions(-)
>
> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
> index 57bb411394..2aeee28fe6 100644
> --- a/hw/ppc/spapr_hcall.c
> +++ b/hw/ppc/spapr_hcall.c
> @@ -13,7 +13,6 @@
>  #include "trace.h"
>  #include "kvm_ppc.h"
>  #include "hw/ppc/spapr_ovec.h"
> -#include "qemu/error-report.h"
>  #include "mmu-book3s-v3.h"
>
>  struct SPRSyncState {
> diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
> index 1deaf106d2..c9105af393 100644
> --- a/target/ppc/kvm.c
> +++ b/target/ppc/kvm.c
> @@ -47,9 +47,6 @@
>  #include "sysemu/hostmem.h"
>  #include "qemu/cutils.h"
>  #include "qemu/mmap-alloc.h"
> -#if defined(TARGET_PPC64)
> -#include "hw/ppc/spapr_cpu_core.h"
> -#endif
>  #include "elf.h"
>  #include "sysemu/kvm_int.h"
>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

