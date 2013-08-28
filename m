Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEmtb-0003b5-BU
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 17:03:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1VEmtY-0003XZ-HT
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 17:03:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1VEmtX-0006tU-Cr
	for qemu-trivial@nongnu.org; Wed, 28 Aug 2013 17:03:16 -0400
Received: from hall.aurel32.net ([2001:470:1f0b:4a8::1]:35127)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1VEmtU-0006pC-Dt; Wed, 28 Aug 2013 17:03:12 -0400
Received: from [2001:470:d4ed:1:2db:dfff:fe14:52d] (helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <aurelien@aurel32.net>)
	id 1VEmtT-0003sz-I7; Wed, 28 Aug 2013 23:03:11 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1VEmtS-0007Pv-1e; Wed, 28 Aug 2013 23:03:10 +0200
Date: Wed, 28 Aug 2013 23:03:10 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yongbok Kim <yongbok.kim@imgtec.com>
Message-ID: <20130828210310.GE5908@ohm.aurel32.net>
References: <1377622116-37650-1-git-send-email-yongbok.kim@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1377622116-37650-1-git-send-email-yongbok.kim@imgtec.com>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:470:1f0b:4a8::1
Cc: qemu-trivial@nongnu.org, james.hogan@imgtec.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: fix
 get_physical_address() #if 0 build error
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
X-List-Received-Date: Wed, 28 Aug 2013 21:03:17 -0000

On Tue, Aug 27, 2013 at 05:48:36PM +0100, Yongbok Kim wrote:
> From: James Hogan <james.hogan@imgtec.com>
> 
> In get_physical_address() is a qemu_log() call inside an #if 0 block.
> When enabled the following build error is hit:
> 
> target-mips/helper.c In function ‘get_physical_address’:
> target-mips/helper.c:220:13: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 5 has type ‘hwaddr’ [-Werror=format]
> 
> Fix the *physical (hwaddr) formatting by using "%"HWADDR_PRIx instead of
> TARGET_FMT_lx.
> 
> Signed-off-by: James Hogan <james.hogan@imgtec.com>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> Signed-off-by: Yongbok Kim <yongbok.kim@imgtec.com>
> ---
>  target-mips/helper.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/target-mips/helper.c b/target-mips/helper.c
> index 6feef7b..33e0e88 100644
> --- a/target-mips/helper.c
> +++ b/target-mips/helper.c
> @@ -193,7 +193,7 @@ static int get_physical_address (CPUMIPSState *env, hwaddr *physical,
>          }
>      }
>  #if 0
> -    qemu_log(TARGET_FMT_lx " %d %d => " TARGET_FMT_lx " %d (%d)\n",
> +    qemu_log(TARGET_FMT_lx " %d %d => %" HWADDR_PRIx " %d (%d)\n",
>              address, rw, access_type, *physical, *prot, ret);
>  #endif

Thanks, applied.


-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

