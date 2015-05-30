Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyhVd-0006O6-69
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2015 10:13:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49297)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyhVa-0006JW-Pz
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 10:13:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YyhVZ-00040V-SG
	for qemu-trivial@nongnu.org; Sat, 30 May 2015 10:13:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60008)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YyhVU-0003y1-8s; Sat, 30 May 2015 10:13:00 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 6EF9F42A03;
	Sat, 30 May 2015 17:12:57 +0300 (MSK)
Message-ID: <5569C569.5010301@msgid.tls.msk.ru>
Date: Sat, 30 May 2015 17:12:57 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
In-Reply-To: <1432877231-5136-1-git-send-email-zhaoshenglong@huawei.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, shannon.zhao@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [Qemu-trivial] [PATCH v2 00/13] use qemu_allocate_irq not _irqs
	for single irq
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 30 May 2015 14:13:08 -0000


29.05.2015 08:26, Shannon Zhao wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>=20
> These are relevant to misusing qemu_allocate_irqs for requesting single
> irq and they cause memory leak. So these patches use qemu_allocate_irq
> for single irq to fix these memory leaks.
>=20
> PS: These patches are split from my previous patchset [1] since they ar=
e
> relevant to misusing qemu_allocate_irqs for single irq. And for the
> reset patches of [1] will respin later.
>=20
> Thanks,
> Shannon
>=20
> [1] [PATCH 00/29] Fix memory leak relevant to calling qemu_allocate_irq=
s
>=20
> changes since v1=EF=BC=9A
>   * split those relevant to misusing qemu_allocate_irqs for single irq
>=20
> Shannon Zhao (13):
>   hw/i386/pc: Fix misusing qemu_allocate_irqs for single irq
>   hw/isa/lpc_ich9.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/isa/i82378.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/timer/arm_timer.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/intc/exynos4210_gic.c: Fix memory leak by adjusting order
>   hw/sparc/sun4m.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/ppc/prep.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/lm32/lm32_boards.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/lm32/milkymist.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/unicore32/puv3.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/alpha/typhoon.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/arm/nseries.c: Fix misusing qemu_allocate_irqs for single irq
>   hw/display/tc6393xb.c: Fix misusing qemu_allocate_irqs for single irq

Applied all patches, removing valgrind messages from commits.
Re-ordered the exynos4210_gic.c patch to be the first, so it
comes outside of the series, together with the previous split
of the same nature, hw/arm/omap_sx1.c.

You made me busy for quite some time, verifying all this :)

Thanks,

/mjt

