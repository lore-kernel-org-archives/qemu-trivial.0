Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b6v8w-0005yD-F6
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2016 03:28:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6v8u-0005wW-JM
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 03:28:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b6v8s-0003dK-OR
	for qemu-trivial@nongnu.org; Sun, 29 May 2016 03:28:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45729)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b6v8l-0003Z1-J4; Sun, 29 May 2016 03:28:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id EC84042BF2;
	Sun, 29 May 2016 10:27:59 +0300 (MSK)
To: Jan Vesely <jano.vesely@gmail.com>, qemu-trivial@nongnu.org
References: <1458439134-28726-1-git-send-email-jano.vesely@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <574A99FF.2090709@msgid.tls.msk.ru>
Date: Sun, 29 May 2016 10:27:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.8.0
MIME-Version: 1.0
In-Reply-To: <1458439134-28726-1-git-send-email-jano.vesely@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] po/Makefile: call rm -f directly
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
X-List-Received-Date: Sun, 29 May 2016 07:28:14 -0000

20.03.2016 04:58, Jan Vesely wrote:
> Default variables are undefined in rules.mak and this is what the rest
> of the build system uses.
> Fixes make clean in ./po/

Please add qemu-devel@ address for all patches.

Applied to -trivial, thank you!


> Signed-off-by: Jan Vesely <jano.vesely@gmail.com>
> ---
>  po/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/po/Makefile b/po/Makefile
> index b271f79..7bab09d 100644
> --- a/po/Makefile
> +++ b/po/Makefile
> @@ -32,7 +32,7 @@ update: $(SRCS)
>  build: $(OBJS)
>  
>  clean:
> -	$(RM) $(OBJS)
> +	rm -f $(OBJS)
>  
>  install: $(OBJS)
>  	for obj in $(OBJS); do \
> 


