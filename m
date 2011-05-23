Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QOcm6-000610-4N
	for mharc-qemu-trivial@gnu.org; Mon, 23 May 2011 17:34:54 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54543)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1QOcm3-0005wt-Rr
	for qemu-trivial@nongnu.org; Mon, 23 May 2011 17:34:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1QOcm2-0001ty-U0
	for qemu-trivial@nongnu.org; Mon, 23 May 2011 17:34:51 -0400
Received: from hall.aurel32.net ([88.191.126.93]:44431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1QOcm0-0001tL-GT; Mon, 23 May 2011 17:34:48 -0400
Received: from aurel32 by hall.aurel32.net with local (Exim 4.72)
	(envelope-from <aurelien@aurel32.net>)
	id 1QOclz-00009x-Un; Mon, 23 May 2011 23:34:47 +0200
Date: Mon, 23 May 2011 23:34:47 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20110523213447.GC15554@hall.aurel32.net>
References: <1306163082-30267-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1306163082-30267-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: Mutt 1.5.20 (2009-06-14)
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 88.191.126.93
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-arm/exec.h: Remove
 unused #define of M0
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
X-List-Received-Date: Mon, 23 May 2011 21:34:53 -0000

On Mon, May 23, 2011 at 04:04:42PM +0100, Peter Maydell wrote:
> Remove a preprocessor #define which is never used.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target-arm/exec.h |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)

Thanks, applied.

> diff --git a/target-arm/exec.h b/target-arm/exec.h
> index 44e1b55..db6608e 100644
> --- a/target-arm/exec.h
> +++ b/target-arm/exec.h
> @@ -21,8 +21,6 @@
>  
>  register struct CPUARMState *env asm(AREG0);
>  
> -#define M0   env->iwmmxt.val
> -
>  #include "cpu.h"
>  #include "exec-all.h"
>  
> -- 
> 1.7.1
> 
> 
> 

-- 
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

