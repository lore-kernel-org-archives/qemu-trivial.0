Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YxxDW-0002De-F1
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:47:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YxxDT-0002CP-I5
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:47:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YxxDP-0003rC-IG
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:47:19 -0400
Received: from mail-ig0-f182.google.com ([209.85.213.182]:38676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YxxDE-0003nX-7X
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:47:15 -0400
Received: by igbjd9 with SMTP id jd9so22827552igb.1
	for <qemu-trivial@nongnu.org>; Thu, 28 May 2015 05:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LtfitBJcfTSNrr52b3QB3Qt+vsL57SdAtcsyDcqSDBI=;
	b=Dq0ToZAN965+Rg+iABokbg8jEhtqF7dk8wjEHGfkZmdpkZ708VQqkd9fSdk/ORaAvM
	sZSdPpH5RemKc3MVTzHDrBCr1KzBkGKDp07QzCfvhDk6v9Kag1HOyoham5rzXFH0AYLS
	V2o67EtW/EkyptoXqot7NCsi1k+Fm3ua0EkL46ZEntNYsAS2ggvuFHcniG3uDrGr4HSv
	24F5glLlCWrmzhwGR8k9E6L47WrEo1bx1BRQOWcUXerr8L5akghdF6U6JSNQlEwdwBda
	W3kRuGnGMIpQ1TTDJGf8U0DjD+PidmygNqVhwomlKz8kRvVwUDrtAY1qHDokGldabcwi
	D/0Q==
X-Gm-Message-State: ALoCoQk1woMIpi7nKKJLY1FFGPmvywXsmyosfVNQKNn4j1ItrDqO2DAFcxHDJIiMKRG6/X9qdKm5
X-Received: by 10.50.110.104 with SMTP id hz8mr10863912igb.38.1432817223489;
	Thu, 28 May 2015 05:47:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.181.6 with HTTP; Thu, 28 May 2015 05:46:43 -0700 (PDT)
In-Reply-To: <1432814932-12608-22-git-send-email-zhaoshenglong@huawei.com>
References: <1432814932-12608-1-git-send-email-zhaoshenglong@huawei.com>
	<1432814932-12608-22-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2015 13:46:43 +0100
Message-ID: <CAFEAcA_StGyawua1BVOxBXAVgbjQSR5OmpmdWg7fuEWm7zjoWg@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.182
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH 21/29] hw/sh4/r2d.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 12:47:20 -0000

On 28 May 2015 at 13:08, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> valgrind complains about:
> ==29844== 1,364 (104 direct, 1,260 indirect) bytes in 1 blocks are definitely lost in loss record 2,143 of 2,205
> ==29844==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==29844==    by 0x25096F: malloc_and_trace (vl.c:2556)
> ==29844==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
> ==29844==    by 0x2C7CDB: qemu_extend_irqs (irq.c:55)
> ==29844==    by 0x2C7D67: qemu_allocate_irqs (irq.c:64)
> ==29844==    by 0x2167ED: r2d_fpga_init (r2d.c:191)
> ==29844==    by 0x2169CC: r2d_init (r2d.c:263)
> ==29844==    by 0x254D3A: main (vl.c:4249)
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
>  hw/sh4/r2d.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
> index 4221060..594c733 100644
> --- a/hw/sh4/r2d.c
> +++ b/hw/sh4/r2d.c
> @@ -287,6 +287,16 @@ static void r2d_init(MachineState *machine)
>      sysbus_mmio_map(busdev, 1, 0x1400080c);
>      mmio_ide_init_drives(dev, dinfo, NULL);
>
> +    /* free unused irq */
> +    qemu_free_irq(irq[CF_CD]);
> +    qemu_free_irq(irq[KEY]);
> +    qemu_free_irq(irq[RTC_A]);
> +    qemu_free_irq(irq[RTC_T]);
> +    qemu_free_irq(irq[SDCARD]);
> +    qemu_free_irq(irq[EXT]);
> +    qemu_free_irq(irq[TP]);
> +    g_free(irq);
> +

Yuck. We should just save the irq pointer in some state structure
and g_free_irqs() it all in deinit.

-- PMM

