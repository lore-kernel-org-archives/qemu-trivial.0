Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3ZcG-0001zD-CS
	for mharc-qemu-trivial@gnu.org; Sun, 28 Jul 2013 18:39:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3Zc9-0001vZ-JJ
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 18:39:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3Zc3-00065B-T9
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 18:38:57 -0400
Received: from hall.aurel32.net ([88.191.116.210]:57270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3Zc3-000655-O7
	for qemu-trivial@nongnu.org; Sun, 28 Jul 2013 18:38:51 -0400
Received: from [2001:470:d4ed:1:2db:dfff:fe14:52d] (helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <aurelien@aurel32.net>)
	id 1V3Zc1-0002vn-2U; Mon, 29 Jul 2013 00:38:49 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1V3Zby-0004Tk-9I; Mon, 29 Jul 2013 00:38:46 +0200
Date: Mon, 29 Jul 2013 00:38:46 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
Message-ID: <20130728223846.GA15063@ohm.aurel32.net>
References: <1374598810-78021-1-git-send-email-petar.jovanovic@rt-rk.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1374598810-78021-1-git-send-email-petar.jovanovic@rt-rk.com>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.191.116.210
Cc: qemu-trivial@nongnu.org, riku.voipio@linaro.org, qemu-devel@nongnu.org,
	petar.jovanovic@imgtec.com
Subject: Re: [Qemu-trivial] [PATCH] linux-user: correct argument number for
 sys_mremap and sys_splice
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
X-List-Received-Date: Sun, 28 Jul 2013 22:39:03 -0000

On Tue, Jul 23, 2013 at 07:00:10PM +0200, Petar Jovanovic wrote:
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
> 
> sys_mremap missed 5th argument (new_address), which caused examples that
> remap to a specific address to fail.
> sys_splice missed 5th and 6th argument which caused different examples to
> fail.
> This change has an effect on MIPS target only.
> 
> Signed-off-by: Petar Jovanovic <petar.jovanovic@imgtec.com>
> ---
>  linux-user/main.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/main.c b/linux-user/main.c
> index 99c3b3f..1c20229 100644
> --- a/linux-user/main.c
> +++ b/linux-user/main.c
> @@ -1957,7 +1957,7 @@ static const uint8_t mips_syscall_args[] = {
>  	MIPS_SYS(sys_sched_get_priority_min, 1)
>  	MIPS_SYS(sys_sched_rr_get_interval, 2)	/* 4165 */
>  	MIPS_SYS(sys_nanosleep,	2)
> -	MIPS_SYS(sys_mremap	, 4)
> +	MIPS_SYS(sys_mremap	, 5)
>  	MIPS_SYS(sys_accept	, 3)
>  	MIPS_SYS(sys_bind	, 3)
>  	MIPS_SYS(sys_connect	, 3)	/* 4170 */
> @@ -2094,7 +2094,7 @@ static const uint8_t mips_syscall_args[] = {
>  	MIPS_SYS(sys_pselect6, 6)
>  	MIPS_SYS(sys_ppoll, 5)
>  	MIPS_SYS(sys_unshare, 1)
> -	MIPS_SYS(sys_splice, 4)
> +	MIPS_SYS(sys_splice, 6)
>  	MIPS_SYS(sys_sync_file_range, 7) /* 4305 */
>  	MIPS_SYS(sys_tee, 4)
>  	MIPS_SYS(sys_vmsplice, 4)

Thanks, applied.


-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

