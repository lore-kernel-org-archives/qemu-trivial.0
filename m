Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ynjxg-0003WT-Ly
	for mharc-qemu-trivial@gnu.org; Thu, 30 Apr 2015 04:36:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1Ynjxb-0003R6-CC
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1YnjxY-0001O7-4L
	for qemu-trivial@nongnu.org; Thu, 30 Apr 2015 04:36:43 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:46137 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YnjxX-0001No-Tj; Thu, 30 Apr 2015 04:36:40 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1YnlAq-0006mL-43; Thu, 30 Apr 2015 11:54:28 +0200
References: <1430379532-7300-1-git-send-email-crosthwaite.peter@gmail.com>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
In-reply-to: <1430379532-7300-1-git-send-email-crosthwaite.peter@gmail.com>
Date: Thu, 30 Apr 2015 09:37:17 +0100
Message-ID: <87k2wu1076.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-devel@nongnu.org, proljc@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] openrisc: cpu: Remove
	unused cpu_get_pc
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
X-List-Received-Date: Thu, 30 Apr 2015 08:36:44 -0000


Peter Crosthwaite <crosthwaitepeter@gmail.com> writes:

> This function is not used by anything. Remove.
>
> Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
> ---
>  target-openrisc/cpu.h | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/target-openrisc/cpu.h b/target-openrisc/cpu.h
> index b25324b..9e23cd0 100644
> --- a/target-openrisc/cpu.h
> +++ b/target-openrisc/cpu.h
> @@ -415,9 +415,4 @@ static inline int cpu_mmu_index(CPUOpenRISCState *env)
>  
>  #include "exec/exec-all.h"
>  
> -static inline target_ulong cpu_get_pc(CPUOpenRISCState *env)
> -{
> -    return env->pc;
> -}
> -
>  #endif /* CPU_OPENRISC_H */

Are you going to clean up the the microblaze one as well?

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

-- 
Alex Bennée

