Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UXaX0-0003QX-4T
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2013 13:09:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXaWy-0003OD-2Q
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 13:09:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UXaWx-0002jt-0t
	for qemu-trivial@nongnu.org; Wed, 01 May 2013 13:09:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:53716)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UXaWo-0002hA-G9; Wed, 01 May 2013 13:09:14 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 30AF140073;
	Wed,  1 May 2013 21:09:13 +0400 (MSK)
Message-ID: <51814C37.4060000@msgid.tls.msk.ru>
Date: Wed, 01 May 2013 21:09:11 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: liguang <lig.fnst@cn.fujitsu.com>
References: <1367290790-19159-1-git-send-email-lig.fnst@cn.fujitsu.com>
In-Reply-To: <1367290790-19159-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] translate: remove
	redundantly included qemu/timer.h
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
X-List-Received-Date: Wed, 01 May 2013 17:09:25 -0000

30.04.2013 06:59, liguang wrote:
> Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
> ---
>  translate-all.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Hmm.  Does we require S-o-b line even for such a trivial (but nevertheless important) stuff?
Also, Peter, does your followup email mean your Rewieved-by should be added too?

Confused,

/mjt

> diff --git a/translate-all.c b/translate-all.c
> index da93608..d04a116 100644
> --- a/translate-all.c
> +++ b/translate-all.c
> @@ -55,7 +55,6 @@
>  #else
>  #include "exec/address-spaces.h"
>  #endif
> -#include "qemu/timer.h"
>  
>  #include "exec/cputlb.h"
>  #include "translate-all.h"
> 


