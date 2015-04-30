Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynk3y-0005Wr-AA
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 04:43:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Ynk3w-0005Wg-55
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:43:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Ynk3q-0003MK-9v
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:43:16 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:46153 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1Ynk3q-0003LR-3q; Thu, 30 Apr 2015 04:43:10 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YnlH9-0006oM-7K; Thu, 30 Apr 2015 12:00:59 +0200
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
	<1430075424-25975-4-git-send-email-crosthwaite.peter@gmail.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
In-reply-to: <1430075424-25975-4-git-send-email-crosthwaite.peter@gmail.com>
Date: Thu, 30 Apr 2015 09:43:48 +0100
Message-ID: <87ioce0zwb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com, qemu-devel@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH microblaze v1 3/6] mb: cpu:
	Remote unused cpu_get_pc
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
X-List-Received-Date: Thu, 30 Apr 2015 08:43:17 -0000


Peter Crosthwaite <crosthwaitepeter@gmail.com> writes:

> This function is not used by anything. Remove.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>  target-microblaze/cpu.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
> index 7d06227..2c18b49 100644
> --- a/target-microblaze/cpu.h
> +++ b/target-microblaze/cpu.h
> @@ -333,11 +333,6 @@ static inline int cpu_interrupts_enabled(CPUMBState *env)
>  
>  #include "exec/cpu-all.h"
>  
> -static inline target_ulong cpu_get_pc(CPUMBState *env)
> -{
> -    return env->sregs[SR_PC];
> -}
> -
>  static inline void cpu_get_tb_cpu_state(CPUMBState *env, target_ulong *pc,
>                                          target_ulong *cs_base, int *flags)
>  {

Ahh I see that now ;-)

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>


-- 
Alex Bennée

