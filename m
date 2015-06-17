Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5IwD-0001TC-Pf
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jun 2015 15:23:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5IwB-0001QG-FH
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 15:23:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Z5IwA-00005t-Hs
	for qemu-trivial@nongnu.org; Wed, 17 Jun 2015 15:23:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Z5Iw4-0008WJ-FV; Wed, 17 Jun 2015 15:23:44 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D8EE34186B;
	Wed, 17 Jun 2015 22:23:43 +0300 (MSK)
Message-ID: <5581C93F.7070202@msgid.tls.msk.ru>
Date: Wed, 17 Jun 2015 22:23:43 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Frediano Ziglio <fziglio@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>
References: <1434028677-26160-1-git-send-email-fziglio@redhat.com>
In-Reply-To: <1434028677-26160-1-git-send-email-fziglio@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/2] Constify some variable
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
X-List-Received-Date: Wed, 17 Jun 2015 19:23:52 -0000

11.06.2015 16:17, Frediano Ziglio wrote:
> Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
> ---
>  hw/display/qxl-logger.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
> index c900c2c..d944d3f 100644
> --- a/hw/display/qxl-logger.c
> +++ b/hw/display/qxl-logger.c
> @@ -22,7 +22,7 @@
>  #include "qemu/timer.h"
>  #include "qxl.h"
>  
> -static const char *qxl_type[] = {
> +static const char *const qxl_type[] = {
...

Applied to trivial after adding subject prefix "hw/display/qxl-logger.c:".

Thanks,

/mjt

