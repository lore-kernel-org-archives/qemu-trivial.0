Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8BwQ-0004S0-8I
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jan 2015 12:59:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y8BwN-0004NM-Gr
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 12:59:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>) id 1Y8BwM-0001FI-Kd
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 12:59:43 -0500
Received: from fofx.invlim.com ([71.6.153.225]:52113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dmorrison@invlim.com>)
	id 1Y8BwH-0001CY-VO; Mon, 05 Jan 2015 12:59:38 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by fofx.invlim.com (Postfix) with ESMTP id 84CE9248288;
	Mon,  5 Jan 2015 09:49:30 -0800 (PST)
X-Virus-Scanned: amavisd-new at example.com
Received: from fofx.invlim.com ([127.0.0.1])
	by localhost (fofx.invlim.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cDBrIuNlllqt; Mon,  5 Jan 2015 09:49:29 -0800 (PST)
Received: from [10.240.0.46] (unknown [10.240.0.46])
	by fofx.invlim.com (Postfix) with ESMTP id C715B248286;
	Mon,  5 Jan 2015 09:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=invlim.com;
	s=default; t=1420480169;
	bh=QgAFUBKSBrzM4qCGQE86r5fYbCR//xh6A4cx2pJCuCI=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=MnHLzwts78uZUikR9AwvVeV3Vi1zogO55GuWfsLK4VHn51BHIkumCb5ZdXUDhUogM
	+IOZjUJjSQ6mos9YmLBI5s9wkPYbpg5wJ4L/VjgRHuceOkJ8CVD6fZTNx1kI7rN3xx
	oY+eI2ELeFdnjC1J4EKmIQ4zqICSGWLBkJIou9Bk=
Message-ID: <54AAD0FE.2090902@invlim.com>
Date: Mon, 05 Jan 2015 09:59:26 -0800
From: David Morrison <dmorrison@invlim.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, proljc@gmail.com
References: <1418862393-10691-1-git-send-email-dmorrison@invlim.com>
In-Reply-To: <1418862393-10691-1-git-send-email-dmorrison@invlim.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 71.6.153.225
Subject: Re: [Qemu-trivial] [PATCH] target-openrisc: bugfixes for debugging
 with GDB+Qemu on OpenRISC
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
X-List-Received-Date: Mon, 05 Jan 2015 17:59:44 -0000

ping

On 12/17/2014 04:26 PM, David Morrison wrote:
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
>
> Signed-off-by: David R. Morrison <dmorrison@invlim.com>
> ---
>   target-openrisc/cpu.h       | 1 +
>   target-openrisc/mmu.c       | 2 +-
>   target-openrisc/translate.c | 2 +-
>   3 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/target-openrisc/cpu.h b/target-openrisc/cpu.h
> index 69b96c6..6b08af6 100644
> --- a/target-openrisc/cpu.h
> +++ b/target-openrisc/cpu.h
> @@ -20,6 +20,7 @@
>   #ifndef CPU_OPENRISC_H
>   #define CPU_OPENRISC_H
>
> +#define TARGET_HAS_ICE
>   #define TARGET_LONG_BITS 32
>   #define ELF_MACHINE    EM_OPENRISC
>
> diff --git a/target-openrisc/mmu.c b/target-openrisc/mmu.c
> index 750a936..bbd05f1 100644
> --- a/target-openrisc/mmu.c
> +++ b/target-openrisc/mmu.c
> @@ -219,7 +219,7 @@ hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
>       hwaddr phys_addr;
>       int prot;
>
> -    if (cpu_openrisc_get_phys_addr(cpu, &phys_addr, &prot, addr, 0)) {
> +    if (cpu_openrisc_get_phys_nommu(cpu, &phys_addr, &prot, addr, 0)) {
>           return -1;
>       }
>
> diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
> index 407bd97..d36278f 100644
> --- a/target-openrisc/translate.c
> +++ b/target-openrisc/translate.c
> @@ -1320,7 +1320,7 @@ static void dec_sys(DisasContext *dc, uint32_t insn)
>   #ifdef OPENRISC_DISAS
>       uint32_t K16;
>   #endif
> -    op0 = extract32(insn, 16, 8);
> +    op0 = extract32(insn, 16, 10);
>   #ifdef OPENRISC_DISAS
>       K16 = extract32(insn, 0, 16);
>   #endif
>

-- 
David R. Morrison, PhD
Inverse Limit
dmorrison@invlim.com
+1-217-417-9445

