Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uc87D-0002L5-7F
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2013 01:49:35 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uc87B-0002Ik-AP
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 01:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uc87A-0004Rx-DB
	for qemu-trivial@nongnu.org; Tue, 14 May 2013 01:49:33 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50688)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uc878-0004Qm-8i; Tue, 14 May 2013 01:49:30 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EEFE24092B;
	Tue, 14 May 2013 09:49:21 +0400 (MSK)
Message-ID: <5191D061.701@msgid.tls.msk.ru>
Date: Tue, 14 May 2013 09:49:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Christophe Lyon <christophe.lyon@linaro.org>
References: <CAKdteOYnrnY91NsuUKmoyMypRYK+aPs2t1ACJBPFK8pAXZTweA@mail.gmail.com>
In-Reply-To: <CAKdteOYnrnY91NsuUKmoyMypRYK+aPs2t1ACJBPFK8pAXZTweA@mail.gmail.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [Patch] v2 fix /proc/self/maps
	output
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
X-List-Received-Date: Tue, 14 May 2013 05:49:34 -0000

02.04.2013 16:03, Christophe Lyon wrote:
> Add a space at end of line when there is no filename to print, to
> conform to linux kernel format (see show_map_vma() in
> fs/proc/task_mmu.c).
> 
> Signed-off-by: Christophe Lyon <christophe.lyon@linaro.org>

Thanks, applied to the trivial patches queue.

/mjt

> Changes v1-v2:
> Additional space is now part of the format string.
> 
>  linux-user/syscall.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index a148d9f..c3c5c11 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -5013,10 +5013,10 @@ static int open_self_maps(void *cpu_env, int fd)
>          }
>          if (h2g_valid(min) && h2g_valid(max)) {
>              dprintf(fd, TARGET_ABI_FMT_lx "-" TARGET_ABI_FMT_lx
> -                    " %c%c%c%c %08" PRIx64 " %02x:%02x %d%s%s\n",
> +                    " %c%c%c%c %08" PRIx64 " %02x:%02x %d %s%s\n",
>                      h2g(min), h2g(max), flag_r, flag_w,
>                      flag_x, flag_p, offset, dev_maj, dev_min, inode,
> -                    path[0] ? "          " : "", path);
> +                    path[0] ? "         " : "", path);
>          }
>      }
> 


