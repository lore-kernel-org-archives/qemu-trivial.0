Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c8Bs4-0004hF-FZ
	for mharc-qemu-trivial@gnu.org; Sat, 19 Nov 2016 15:04:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1c8Bs1-0004gV-Mw
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 15:04:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1c8Bry-0001Ks-JE
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 15:04:17 -0500
Received: from hera.aquilenet.fr ([141.255.128.1]:56637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1c8Bry-0001Jz-C6
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 15:04:14 -0500
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id D89A59598;
	Sat, 19 Nov 2016 21:04:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9DItGv3X3UyA; Sat, 19 Nov 2016 21:04:11 +0100 (CET)
Received: from var.youpi.perso.aquilenet.fr (unknown
	[IPv6:2a01:cb19:181:c200:3602:86ff:fe2c:6a19])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id F353D8DF2;
	Sat, 19 Nov 2016 21:04:10 +0100 (CET)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.88)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1c8Brt-00010w-MU; Sat, 19 Nov 2016 21:04:09 +0100
Date: Sat, 19 Nov 2016 21:04:09 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20161119200409.GF3422@var.home>
References: <20161119185318.10564-1-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161119185318.10564-1-sw@weilnetz.de>
User-Agent: Mutt/1.5.21+34 (58baf7c9f32f) (2010-12-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 141.255.128.1
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.8] curses: Fix
 compiler warnings (Mingw-w64 redefinition of macro KEY_EVENT)
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 19 Nov 2016 20:04:20 -0000

Stefan Weil, on Sat 19 Nov 2016 19:53:18 +0100, wrote:
> For builds with Mingw-w64 as it is included in Cygwin, there are two
> header files which define KEY_EVENT with different values.
> 
> This results in lots of compiler warnings like this one:
> 
>   CC      vl.o
> In file included from /qemu/include/ui/console.h:340:0,
>                  from /qemu/vl.c:76:
> /usr/i686-w64-mingw32/sys-root/mingw/include/curses.h:1522:0: warning: "KEY_EVENT" redefined
>  #define KEY_EVENT 0633  /* We were interrupted by an event */
> 
> In file included from /usr/share/mingw-w64/include/windows.h:74:0,
>                  from /usr/share/mingw-w64/include/winsock2.h:23,
>                  from /qemu/include/sysemu/os-win32.h:29,
>                  from /qemu/include/qemu/osdep.h:100,
>                  from /qemu/vl.c:24:
> /usr/share/mingw-w64/include/wincon.h:101:0: note: this is the location of the previous definition
>  #define KEY_EVENT 0x1
> 
> QEMU only uses the KEY_EVENT macro from wincon.h.
> Therefore we can undefine the macro coming from curses.h.
> 
> The explicit include statement for curses.h in ui/curses.c is not needed
> and was removed.
> 
> Those two modifications fix the redefinition warnings.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Acked-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  include/ui/console.h | 3 +++
>  ui/curses.c          | 1 -
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/ui/console.h b/include/ui/console.h
> index e2589e2..e5ae506 100644
> --- a/include/ui/console.h
> +++ b/include/ui/console.h
> @@ -337,7 +337,10 @@ static inline pixman_format_code_t surface_format(DisplaySurface *s)
>  }
>  
>  #ifdef CONFIG_CURSES
> +/* KEY_EVENT is defined in wincon.h and in curses.h. Avoid redefinition. */
> +#undef KEY_EVENT
>  #include <curses.h>
> +#undef KEY_EVENT
>  typedef chtype console_ch_t;
>  extern chtype vga_to_curses[];
>  #else
> diff --git a/ui/curses.c b/ui/curses.c
> index 2e132a7..03cefdf 100644
> --- a/ui/curses.c
> +++ b/ui/curses.c
> @@ -22,7 +22,6 @@
>   * THE SOFTWARE.
>   */
>  #include "qemu/osdep.h"
> -#include <curses.h>
>  
>  #ifndef _WIN32
>  #include <sys/ioctl.h>
> -- 
> 2.10.2
> 
> 

-- 
Samuel
Now I know someone out there is going to claim, "Well then, UNIX is intuitive,
because you only need to learn 5000 commands, and then everything else follows
from that! Har har har!"
(Andy Bates in comp.os.linux.misc, on "intuitive interfaces", slightly
defending Macs.)

