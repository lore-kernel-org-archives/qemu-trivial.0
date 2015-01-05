Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8CBu-0002LI-7d
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jan 2015 13:15:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y8CBs-0002K0-8N
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:15:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y8CBi-0006Rl-6f
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:15:44 -0500
Received: from mail-la0-f45.google.com ([209.85.215.45]:38225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Y8CBh-0006RZ-NW
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 13:15:33 -0500
Received: by mail-la0-f45.google.com with SMTP id gq15so18752459lab.32
	for <qemu-trivial@nongnu.org>; Mon, 05 Jan 2015 10:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FSCxTcgffFk7aQS3cUT0KZeHMWj3IiZNlgJ2LSiOtJg=;
	b=gNbdgWLrA3HrKC/sh8aUeaIW3LlOLTA+j0sn4+LGV+/BzqVr+F2v6Y1yz4iVGZNsWS
	Sxafcbli1DOCj64FrqVsRBDSuJh9s4RsAI4W8N57Fik6f8XCc1DvciMt0muu29GgJlK0
	7sklsJltRlxYIpO01iJZP76Rb33N70fDCafkWj/zIEZkdLxZAPCb+49/EzOHM++XD1Uq
	v7OcucfDbLGadW1Ss66UaOCksWXcdagsQXdmvfZ15l7juP+Nkw3prc6pV8AWvXNSZws6
	wKccKksjq105hOrCM9Mst0Nebv0Apz/1IXgaEYjIKDPA6GblZduIuTfEqFMQcQQ8HP10
	2oaA==
X-Gm-Message-State: ALoCoQkp7ylipayjAC0nSkNoIi473ZcnBL8I7OWLMMMKF3nbB4HB5IBKcoiSq7G7JS2o0PP57Nmg
X-Received: by 10.112.185.101 with SMTP id fb5mr51427654lbc.12.1420481732897; 
	Mon, 05 Jan 2015 10:15:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.52.38 with HTTP; Mon, 5 Jan 2015 10:15:12 -0800 (PST)
In-Reply-To: <1418862393-10691-1-git-send-email-dmorrison@invlim.com>
References: <1418862393-10691-1-git-send-email-dmorrison@invlim.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jan 2015 18:15:12 +0000
Message-ID: <CAFEAcA9RHCGaGHk4zZWMa4BAWR0OV5sAxan3AjrR=G-NaiJ58g@mail.gmail.com>
To: David Morrison <dmorrison@invlim.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Ethan Hunt <proljc@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-openrisc: bugfixes
 for debugging with GDB+Qemu on OpenRISC
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
X-List-Received-Date: Mon, 05 Jan 2015 18:15:45 -0000

On 18 December 2014 at 00:26, David Morrison <dmorrison@invlim.com> wrote:
> This patch fixes two bugs in Qemu for OpenRISC, and enables more
> functionality from or1k-elf-gdb:
>
> 1) Fixed the decoding of "system" instructions (starting with 0x2)
> in dec_sys() in translate.c.  In particular, the l.trap instruction
> is now correctly decoded, which enables for singlestepping and
> breakpoints to be set in GDB.
>
> 2) Fixed a memory read error when debugging kernels inside Qemu and
> the OpenRISC MMU is enabled

Thanks for this patch; comments below.

> Signed-off-by: David R. Morrison <dmorrison@invlim.com>
> ---
>  target-openrisc/cpu.h       | 1 +
>  target-openrisc/mmu.c       | 2 +-
>  target-openrisc/translate.c | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target-openrisc/cpu.h b/target-openrisc/cpu.h
> index 69b96c6..6b08af6 100644
> --- a/target-openrisc/cpu.h
> +++ b/target-openrisc/cpu.h
> @@ -20,6 +20,7 @@
>  #ifndef CPU_OPENRISC_H
>  #define CPU_OPENRISC_H
>
> +#define TARGET_HAS_ICE
>  #define TARGET_LONG_BITS 32
>  #define ELF_MACHINE    EM_OPENRISC

This looks like a correct change, but it should be in its own patch.
(The general principle is that each unrelated bug fix should get
a patch and thus a git commit of its own.)

> diff --git a/target-openrisc/mmu.c b/target-openrisc/mmu.c
> index 750a936..bbd05f1 100644
> --- a/target-openrisc/mmu.c
> +++ b/target-openrisc/mmu.c
> @@ -219,7 +219,7 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>      hwaddr phys_addr;
>      int prot;
>
> -    if (cpu_openrisc_get_phys_addr(cpu, &phys_addr, &prot, addr, 0)) {
> +    if (cpu_openrisc_get_phys_nommu(cpu, &phys_addr, &prot, addr, 0)) {

This looks wrong -- we won't do the virtual-to-physical
translation on the addresses provided by the debugger if
we use the _nommu() function. You definitely need to be
doing a v-to-p translation here somehow.

>          return -1;
>      }
>
> diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
> index 407bd97..d36278f 100644
> --- a/target-openrisc/translate.c
> +++ b/target-openrisc/translate.c
> @@ -1320,7 +1320,7 @@ static void dec_sys(DisasContext *dc, uint32_t insn)
>  #ifdef OPENRISC_DISAS
>      uint32_t K16;
>  #endif
> -    op0 = extract32(insn, 16, 8);
> +    op0 = extract32(insn, 16, 10);
>  #ifdef OPENRISC_DISAS
>      K16 = extract32(insn, 0, 16);
>  #endif

This change should also go in a patch of its own, since it's
not related to either the HAS_ICE fix or the change to
get_phys_page_debug().

thanks
-- PMM

