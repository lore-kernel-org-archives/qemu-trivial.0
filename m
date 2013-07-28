Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3Zai-0000bt-Dx
	for mharc-qemu-trivial@gnu.org; Sun, 28 Jul 2013 18:37:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3Zab-0000Tv-0q
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 18:37:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3ZaR-0005j2-WA
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 18:37:20 -0400
Received: from hall.aurel32.net ([88.191.116.210]:57262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3ZaR-0005ix-Q4
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 18:37:11 -0400
Received: from aurel32 by hall.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1V3ZaQ-0002vM-5J; Mon, 29 Jul 2013 00:37:10 +0200
Date: Mon, 29 Jul 2013 00:37:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130728223710.GF10155@hall.aurel32.net>
References: <1374783031-26633-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1374783031-26633-1-git-send-email-sw@weilnetz.de>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.191.116.210
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Remove assignment to a
 variable which is never used
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
X-List-Received-Date: Sun, 28 Jul 2013 22:37:27 -0000

On Thu, Jul 25, 2013 at 10:10:31PM +0200, Stefan Weil wrote:
> This assignment causes a compiler warning for compilations with the compiler
> option -Wunused-but-set-variable (which is included with -Wextra).
> 
> Removing it allows using -Wextra for QEMU code without suppressing too many
> extra warnings.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  target-mips/op_helper.c |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> index 5cf1c3f..b828375 100644
> --- a/target-mips/op_helper.c
> +++ b/target-mips/op_helper.c
> @@ -1735,7 +1735,6 @@ target_ulong helper_evpe(CPUMIPSState *env)
>  void helper_fork(target_ulong arg1, target_ulong arg2)
>  {
>      // arg1 = rt, arg2 = rs
> -    arg1 = 0;
>      // TODO: store to TC register
>  }
>  

Thanks, applied.


-- 
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

