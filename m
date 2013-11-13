Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VgZ9j-0006vz-8z
	for mharc-qemu-trivial@gnu.org; Wed, 13 Nov 2013 07:02:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40198)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgZ9b-0006ji-Hm
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 07:02:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VgZ9V-0003sX-Gu
	for qemu-trivial@nongnu.org; Wed, 13 Nov 2013 07:02:39 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:40116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VgZ9J-0003rj-9g; Wed, 13 Nov 2013 07:02:21 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 49E2041736;
	Wed, 13 Nov 2013 16:02:20 +0400 (MSK)
Message-ID: <52836A4C.7040207@msgid.tls.msk.ru>
Date: Wed, 13 Nov 2013 16:02:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: whitearchey <whitearchey@gmail.com>
References: <op.w53t8fe2cb68cn@whitewind-arch>
In-Reply-To: <op.w53t8fe2cb68cn@whitewind-arch>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] qga: Fix shutdown command of guest agent
 to work with SysV
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
X-List-Received-Date: Wed, 13 Nov 2013 12:02:45 -0000

06.11.2013 05:54, whitearchey wrote:
> For now guest agent uses following command to shutdown system:
> shutdown -P +0 "blabla"
> but this syntax works only with shutdown command from systemd or upstart,
> because SysV shutdown requires -h switch.
> 
> Following patch changes the command so it works with systemd, upstart and SysV
> 
> Signed-off-by: Michael Avdienko <whitearchey@gmail.com>
> ---
>  qga/commands-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index f453132..10682f5 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -99,7 +99,7 @@ void qmp_guest_shutdown(bool has_mode, const char *mode, Error **err)
>          reopen_fd_to_null(1);
>          reopen_fd_to_null(2);
> 
> -        execle("/sbin/shutdown", "shutdown", shutdown_flag, "+0",
> +        execle("/sbin/shutdown", "shutdown", "-h", shutdown_flag, "+0",
>                 "hypervisor initiated shutdown", (char*)NULL, environ);
>          _exit(EXIT_FAILURE);
>      } else if (pid < 0) {

Applied to the trivial-patches queue, with additional comments from your
next email explaining which commands/flags are used by which shutdown command.

I guess we'll need some #ifdef SOLARIS..#ifdef *BSD here later, but for
now it should be fine as-is, since apparently both variants (before and after
your change) are linux-only anyway.

Thanks,

/mjt

