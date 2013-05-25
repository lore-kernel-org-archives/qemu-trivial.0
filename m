Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ug636-0005kD-Ho
	for mharc-qemu-trivial@gnu.org; Sat, 25 May 2013 00:25:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ug62z-0005bX-R4
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 00:25:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Ug62t-0008A6-N5
	for qemu-trivial@nongnu.org; Sat, 25 May 2013 00:25:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:39518)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Ug62i-00088N-SA; Sat, 25 May 2013 00:25:21 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 8D03C41906;
	Sat, 25 May 2013 08:25:10 +0400 (MSK)
Message-ID: <51A03D24.5010306@msgid.tls.msk.ru>
Date: Sat, 25 May 2013 08:25:08 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Ed Maste <emaste@freebsd.org>
References: <1369426020-39060-1-git-send-email-emaste@freebsd.org>
In-Reply-To: <1369426020-39060-1-git-send-email-emaste@freebsd.org>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: try pkg-config ncurses first
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
X-List-Received-Date: Sat, 25 May 2013 04:25:43 -0000

25.05.2013 00:07, Ed Maste wrote:
> When probing for ncurses, try pkg-config first rather than after
> explicit -lncurses and -lcurses.  This fixes static linking in the case
> that ncurses has additional dependencies, such as -ltinfo (as on FreeBSD).

This is not a FreeBSD-specific thing, this is the way how current
ncurses works -- they separated a bunch of functions into a new
library, libtinfo.

But this is interesting.

I'm not sure I agree with this approach.  When we're building using
shared library, libncurses.so already links with libtinfo.so, so we
don't need to link executable itself with libtinfo.so, since executable
itself uses none of its functions.

On the other hand, the current logic appears to be fine, -- we first
link with just -lncurses, and if that fails, we also try pkg-config --libs --
because, maybe, we're linking statically and in that case, additional
libs from pkg-config may help.

From yet another point of view, we may use --as-needed linker flag
and just ignore all the above.

Here, it is interesting to note that pkg-config does not actually do
the right thing in this case.  Because practically, it should have
one extra flag, something like --static-libs (or --libs --static),
and it should actually be different from plain --libs.

Anyway, I don't see a reason to apply this as it is.

Thanks,

/mjt

> 
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index cfdb564..7c99ef9 100755
> --- a/configure
> +++ b/configure
> @@ -2157,7 +2157,7 @@ fi
>  if test "$mingw32" = "yes" ; then
>      curses_list="-lpdcurses"
>  else
> -    curses_list="-lncurses:-lcurses:$($pkg_config --libs ncurses 2>/dev/null)"
> +    curses_list="$($pkg_config --libs ncurses 2>/dev/null):-lncurses:-lcurses"
>  fi
>  
>  if test "$curses" != "no" ; then
> 


