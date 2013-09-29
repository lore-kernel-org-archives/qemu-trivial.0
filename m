Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VQMvD-0001V5-K1
	for mharc-qemu-trivial@gnu.org; Sun, 29 Sep 2013 15:44:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQMvA-0001Rr-Tn
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:44:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VQMvA-0002GZ-3n
	for qemu-trivial@nongnu.org; Sun, 29 Sep 2013 15:44:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41334)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VQMv0-0002Ef-2e; Sun, 29 Sep 2013 15:44:38 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 40F214292C;
	Sun, 29 Sep 2013 23:44:37 +0400 (MSK)
Message-ID: <52488325.5090702@msgid.tls.msk.ru>
Date: Sun, 29 Sep 2013 23:44:37 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1380362114-29476-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1380362114-29476-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] block: Remove unused assignment (fixes
 warning from clang)
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
X-List-Received-Date: Sun, 29 Sep 2013 19:44:49 -0000

28.09.2013 13:55, Stefan Weil wrote:
> blockdev.c:1929:13: warning: Value stored to 'ret' is never read
>              ret = 0;
>              ^     ~

Applied to the trivial patches queue.

> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>   blockdev.c |    1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/blockdev.c b/blockdev.c
> index 8aa66a9..8c83f6f 100644
> --- a/blockdev.c
> +++ b/blockdev.c
> @@ -1926,7 +1926,6 @@ void qmp_drive_mirror(const char *device, const char *target,
>       } else {
>           switch (mode) {
>           case NEW_IMAGE_MODE_EXISTING:
> -            ret = 0;
>               break;

While this one is obviously unused assignment,
there's on more usage of `ret' variable in this
function, -- it is to store the return value
from bdrv_open():

     ret = bdrv_open(target_bs, target, NULL, flags | BDRV_O_NO_BACKING, drv,
                     &local_err);
     if (ret < 0) {...

What's the rule about converting that into if() ?

Thanks,

/mjt

