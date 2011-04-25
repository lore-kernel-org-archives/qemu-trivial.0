Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QETGI-0001wH-Rj
	for mharc-qemu-trivial@gnu.org; Mon, 25 Apr 2011 17:24:06 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1QETGG-0001qA-F3
	for qemu-trivial@nongnu.org; Mon, 25 Apr 2011 17:24:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1QETGF-0006sO-Ic
	for qemu-trivial@nongnu.org; Mon, 25 Apr 2011 17:24:04 -0400
Received: from hall.aurel32.net ([88.191.126.93]:41453)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1QETGD-0006qF-I3; Mon, 25 Apr 2011 17:24:01 -0400
Received: from [90.84.144.189] (helo=volta.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1QETG5-0007lG-Cj; Mon, 25 Apr 2011 23:23:53 +0200
Received: from aurel32 by volta.aurel32.net with local (Exim 4.72)
	(envelope-from <aurelien@aurel32.net>)
	id 1QESCD-0001wu-Nl; Mon, 25 Apr 2011 22:15:49 +0200
Date: Mon, 25 Apr 2011 22:15:49 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20110425201549.GC21831@volta.aurel32.net>
References: <1303294755-2679-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1303294755-2679-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: Mutt 1.5.20 (2009-06-14)
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 88.191.126.93
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user/arm/nwfpe:
 rename REG_PC to ARM_REG_PC
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
X-List-Received-Date: Mon, 25 Apr 2011 21:24:05 -0000

On Wed, Apr 20, 2011 at 11:19:15AM +0100, Peter Maydell wrote:
> The REG_PC constant used in the ARM nwfpe code is fine in the kernel
> but when used in qemu can clash with a definition in the host system
> include files (in particular on Ubuntu Lucid SPARC, including signal.h
> will define a REG_PC). Rename the constant to avoid this issue.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  linux-user/arm/nwfpe/fpa11.c      |    2 +-
>  linux-user/arm/nwfpe/fpa11.h      |    2 +-
>  linux-user/arm/nwfpe/fpa11_cpdt.c |    8 ++++----
>  3 files changed, 6 insertions(+), 6 deletions(-)

Thanks, applied.

> diff --git a/linux-user/arm/nwfpe/fpa11.c b/linux-user/arm/nwfpe/fpa11.c
> index 0a87c43..eebd93f 100644
> --- a/linux-user/arm/nwfpe/fpa11.c
> +++ b/linux-user/arm/nwfpe/fpa11.c
> @@ -144,7 +144,7 @@ unsigned int EmulateAll(unsigned int opcode, FPA11* qfpa, CPUARMState* qregs)
>  
>  #if 0
>    fprintf(stderr,"emulating FP insn 0x%08x, PC=0x%08x\n",
> -          opcode, qregs[REG_PC]);
> +          opcode, qregs[ARM_REG_PC]);
>  #endif
>    fpa11 = GET_FPA11();
>  
> diff --git a/linux-user/arm/nwfpe/fpa11.h b/linux-user/arm/nwfpe/fpa11.h
> index f17647b..002b3cb 100644
> --- a/linux-user/arm/nwfpe/fpa11.h
> +++ b/linux-user/arm/nwfpe/fpa11.h
> @@ -111,7 +111,7 @@ static inline void writeConditionCodes(unsigned int x)
>          cpsr_write(user_registers,x,CPSR_NZCV);
>  }
>  
> -#define REG_PC 15
> +#define ARM_REG_PC 15
>  
>  unsigned int EmulateAll(unsigned int opcode, FPA11* qfpa, CPUARMState* qregs);
>  
> diff --git a/linux-user/arm/nwfpe/fpa11_cpdt.c b/linux-user/arm/nwfpe/fpa11_cpdt.c
> index b12e27d..3e7a938 100644
> --- a/linux-user/arm/nwfpe/fpa11_cpdt.c
> +++ b/linux-user/arm/nwfpe/fpa11_cpdt.c
> @@ -220,7 +220,7 @@ static unsigned int PerformLDF(const unsigned int opcode)
>     //printk("PerformLDF(0x%08x), Fd = 0x%08x\n",opcode,getFd(opcode));
>  
>     pBase = readRegister(getRn(opcode));
> -   if (REG_PC == getRn(opcode))
> +   if (ARM_REG_PC == getRn(opcode))
>     {
>       pBase += 8;
>       write_back = 0;
> @@ -256,7 +256,7 @@ static unsigned int PerformSTF(const unsigned int opcode)
>     SetRoundingMode(ROUND_TO_NEAREST);
>  
>     pBase = readRegister(getRn(opcode));
> -   if (REG_PC == getRn(opcode))
> +   if (ARM_REG_PC == getRn(opcode))
>     {
>       pBase += 8;
>       write_back = 0;
> @@ -289,7 +289,7 @@ static unsigned int PerformLFM(const unsigned int opcode)
>     target_ulong pBase, pAddress, pFinal;
>  
>     pBase = readRegister(getRn(opcode));
> -   if (REG_PC == getRn(opcode))
> +   if (ARM_REG_PC == getRn(opcode))
>     {
>       pBase += 8;
>       write_back = 0;
> @@ -322,7 +322,7 @@ static unsigned int PerformSFM(const unsigned int opcode)
>     target_ulong pBase, pAddress, pFinal;
>  
>     pBase = readRegister(getRn(opcode));
> -   if (REG_PC == getRn(opcode))
> +   if (ARM_REG_PC == getRn(opcode))
>     {
>       pBase += 8;
>       write_back = 0;
> -- 
> 1.7.1
> 
> 
> 

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

