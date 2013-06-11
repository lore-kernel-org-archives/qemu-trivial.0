Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmMrU-0006Ua-En
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 07:35:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmMrS-0006RV-AB
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:35:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmMrQ-0002Ea-NN
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 07:35:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:52983)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmMrN-0002DQ-1B; Tue, 11 Jun 2013 07:35:33 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 3CF96411FC;
	Tue, 11 Jun 2013 15:35:32 +0400 (MSK)
Message-ID: <51B70B82.4000309@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 15:35:30 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1370927720-4348-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<1370927720-4348-3-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1370927720-4348-3-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 3/5] qemu-char: pass bool parameter for
 qemu_opt_get_bool
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
X-List-Received-Date: Tue, 11 Jun 2013 11:35:39 -0000

11.06.2013 09:15, liguang wrote:
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  qemu-char.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/qemu-char.c b/qemu-char.c
> index d04b429..8092eb8 100644
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -2767,10 +2767,10 @@ static CharDriverState *qemu_chr_open_socket(QemuOpts *opts)
>      int is_unix;
>      int is_telnet;
>  
> -    is_listen      = qemu_opt_get_bool(opts, "server", 0);
> -    is_waitconnect = qemu_opt_get_bool(opts, "wait", 1);
> -    is_telnet      = qemu_opt_get_bool(opts, "telnet", 0);
> -    do_nodelay     = !qemu_opt_get_bool(opts, "delay", 1);
> +    is_listen      = qemu_opt_get_bool(opts, "server", false);
> +    is_waitconnect = qemu_opt_get_bool(opts, "wait", true);
> +    is_telnet      = qemu_opt_get_bool(opts, "telnet", false);
> +    do_nodelay     = !qemu_opt_get_bool(opts, "delay", true);
>      is_unix        = qemu_opt_get(opts, "path") != NULL;
>      if (!is_listen)
>          is_waitconnect = 0;

While we're at it, all the is_* variables themselves should be made
bool instead of int too.

Thanks,

/mjt


