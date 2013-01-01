Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TpzHC-0002Za-Nj
	for mharc-qemu-trivial@gnu.org; Tue, 01 Jan 2013 05:40:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TpzH9-0002ZU-M7
	for qemu-trivial@nongnu.org; Tue, 01 Jan 2013 05:40:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1TpzH8-0004S7-Bz
	for qemu-trivial@nongnu.org; Tue, 01 Jan 2013 05:40:51 -0500
Received: from hall.aurel32.net ([2001:470:1f15:c4f::1]:52686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1TpzH8-0004S1-31; Tue, 01 Jan 2013 05:40:50 -0500
Received: from [2001:470:d4ed:0:ea11:32ff:fea1:831a] (helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.72) (envelope-from <aurelien@aurel32.net>)
	id 1Tpyx2-0002kj-Fb; Tue, 01 Jan 2013 11:20:04 +0100
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1Tpyx1-00077H-89; Tue, 01 Jan 2013 11:20:03 +0100
Date: Tue, 1 Jan 2013 11:20:03 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130101102003.GC16659@ohm.aurel32.net>
References: <1356179899-1268-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1356179899-1268-1-git-send-email-sw@weilnetz.de>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:470:1f15:c4f::1
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-mips: Remove semicolon from macro
	definition
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
X-List-Received-Date: Tue, 01 Jan 2013 10:40:54 -0000

On Sat, Dec 22, 2012 at 01:38:19PM +0100, Stefan Weil wrote:
> Macro RESTORE_FLUSH_MODE is similar to RESTORE_ROUNDING_MODE
> but included a semicolon.
> 
> The code which uses that macro also includes a semicolon,
> so the result was an empty statement.
> 
> Remove the superfluous semicolon from the macro definition.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> Note:
> 
> After the patch, the modified line is shorter, but still longer than
> required by the coding conventions.
> 
>  target-mips/op_helper.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target-mips/op_helper.c b/target-mips/op_helper.c
> index e85edce..e3ab05c 100644
> --- a/target-mips/op_helper.c
> +++ b/target-mips/op_helper.c
> @@ -2175,7 +2175,7 @@ static unsigned int ieee_rm[] = {
>      set_float_rounding_mode(ieee_rm[env->active_fpu.fcr31 & 3], &env->active_fpu.fp_status)
>  
>  #define RESTORE_FLUSH_MODE \
> -    set_flush_to_zero((env->active_fpu.fcr31 & (1 << 24)) != 0, &env->active_fpu.fp_status);
> +    set_flush_to_zero((env->active_fpu.fcr31 & (1 << 24)) != 0, &env->active_fpu.fp_status)
>  
>  target_ulong helper_cfc1(CPUMIPSState *env, uint32_t reg)
>  {

Thanks, applied.


-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

