Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1axye2-0005b6-D0
	for mharc-qemu-trivial@gnu.org; Wed, 04 May 2016 11:23:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47439)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axydu-0005Jk-3G
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 11:23:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axydi-0001D9-FJ
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 11:23:08 -0400
Received: from mail-yw0-x22f.google.com ([2607:f8b0:4002:c05::22f]:34716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1axydh-00013d-9i
	for qemu-trivial@nongnu.org; Wed, 04 May 2016 11:23:02 -0400
Received: by mail-yw0-x22f.google.com with SMTP id j74so86791128ywg.1
	for <qemu-trivial@nongnu.org>; Wed, 04 May 2016 08:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=c4KJRV0onV0f4v6Z8CNDJyKofS9em1QGXWy9jjxeH3Y=;
	b=a7y3lu2LYvjCTnZpxUz7Dw0S9+seUeUFd/ET2WYFojHPuOCVKeJCiZTVJIZ537aYQg
	7bd8Ly5WAfj9XE5iw3hG+Ei+beCPaWdAFmeZr/aytFlAFsGhqctLY/KvRA9QKCh5BSwx
	nHuVvKobnvenoS1Okha4E9CFef84I/mUz6A2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=c4KJRV0onV0f4v6Z8CNDJyKofS9em1QGXWy9jjxeH3Y=;
	b=ZpuuOG4zEOjZCMjbIDbs3fkEKkRSAn7UPLT7fKbXP6HoIbmZzWZ/STjjiV7UN305TZ
	6kTuXmkwBeRedbkP8DOD9fDfs5It6P1VutwHBxgTgIh+2136b20XnUFgsxZUZC2LXryW
	ZBWKiNNhGoqmPinVmqYot8K2werkKdmXjFFibABTXzgr6RI6dJ3BMB4b09NurDroZKZ5
	5t7AlSUNO2aAOpIVVBrRia3vXpVVPMQrdji3HDCPzfCT2odMkAh8muwINJLknIOVN1HI
	JfNtZE/mCzZ7RT0jmvS/YlXGGICP6/wRtx/53bIMdqQK8Z/LALDkkkZlPqrVrjExujKZ
	JqQA==
X-Gm-Message-State: AOPr4FUIlfLDjTXxm5omrUUev3Fh3SyBMvlSk3aIA3cvfs3gFVMXVMLksxDJXACocqY525Y/l1fZ0JYMQcHdbwy/
X-Received: by 10.176.6.100 with SMTP id f91mr5698591uaf.38.1462375356077;
	Wed, 04 May 2016 08:22:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 4 May 2016 08:22:16 -0700 (PDT)
In-Reply-To: <1461651308-894-1-git-send-email-zhoujie2011@cn.fujitsu.com>
References: <1461651308-894-1-git-send-email-zhoujie2011@cn.fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 4 May 2016 16:22:16 +0100
Message-ID: <CAFEAcA-__bqcWUhVw-qg2DPwwgGwBn-F6Fpu+vmY42o3YKfwiA@mail.gmail.com>
To: Zhou Jie <zhoujie2011@cn.fujitsu.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4002:c05::22f
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/nseries: Allocating
 Large sized arrays to heap
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
X-List-Received-Date: Wed, 04 May 2016 15:23:20 -0000

On 26 April 2016 at 07:15, Zhou Jie <zhoujie2011@cn.fujitsu.com> wrote:
> n8x0_init has a huge stack usage of 65536 bytes approx.
> Moving large arrays to heap to reduce stack usage.
>
> Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
> ---
>  hw/arm/nseries.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
> index 5382505..c7068c0 100644
> --- a/hw/arm/nseries.c
> +++ b/hw/arm/nseries.c
> @@ -1364,7 +1364,7 @@ static void n8x0_init(MachineState *machine,
>
>      if (option_rom[0].name &&
>          (machine->boot_order[0] == 'n' || !machine->kernel_filename)) {
> -        uint8_t nolo_tags[0x10000];
> +        uint8_t *nolo_tags = g_new(uint8_t, 0x10000);
>          /* No, wait, better start at the ROM.  */
>          s->mpu->cpu->env.regs[15] = OMAP2_Q2_BASE + 0x400000;
>
> @@ -1383,6 +1383,7 @@ static void n8x0_init(MachineState *machine,
>
>          n800_setup_nolo_tags(nolo_tags);
>          cpu_physical_memory_write(OMAP2_SRAM_BASE, nolo_tags, 0x10000);
> +        g_free(nolo_tags);
>      }
>  }

Thanks, applied to target-arm.next.

-- PMM

