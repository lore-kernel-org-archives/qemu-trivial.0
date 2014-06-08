Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wtdhg-0003rt-TY
	for mharc-qemu-trivial@gnu.org; Sun, 08 Jun 2014 10:04:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wtdha-0003lH-Hs
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 10:04:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WtdhV-0000gr-7U
	for qemu-trivial@nongnu.org; Sun, 08 Jun 2014 10:04:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47521)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WtdhK-0000dw-QT; Sun, 08 Jun 2014 10:03:46 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AD13C40DD7;
	Sun,  8 Jun 2014 18:03:45 +0400 (MSK)
Message-ID: <53946D41.8030708@msgid.tls.msk.ru>
Date: Sun, 08 Jun 2014 18:03:45 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] readline: Clear screen on form feed.
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
X-List-Received-Date: Sun, 08 Jun 2014 14:04:07 -0000

01.06.2014 15:53, Hani Benhabiles wrote:
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>  util/readline.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/util/readline.c b/util/readline.c
> index 8baec55..08d07e3 100644
> --- a/util/readline.c
> +++ b/util/readline.c
> @@ -345,6 +345,12 @@ static void readline_completion(ReadLineState *rs)
>      }
>  }
>  
> +static void readline_clear_screen(ReadLineState *rs)
> +{
> +    rs->printf_func(rs->opaque, "\033[2J\033[1;1H");
> +    readline_show_prompt(rs);

That's not entirely universal escape sequence, but readline
code uses similar sequences in other places already.

Applying to -trivial, thank you!

/mjt


