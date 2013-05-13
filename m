Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UblPP-0000hq-VC
	for mharc-qemu-trivial@gnu.org; Mon, 13 May 2013 01:34:52 -0400
Received: from eggs.gnu.org ([208.118.235.92]:32801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UblPN-0000dw-Px
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 01:34:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UblPM-0000NC-9k
	for qemu-trivial@nongnu.org; Mon, 13 May 2013 01:34:49 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1UblPJ-0000MK-F7; Mon, 13 May 2013 01:34:45 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	858DE7280034; Mon, 13 May 2013 07:34:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id HUSnsArau70q; Mon, 13 May 2013 07:34:42 +0200 (CEST)
Received: from [192.168.178.35] (p54AD9D19.dip0.t-ipconnect.de [84.173.157.25])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	46AC97280031; Mon, 13 May 2013 07:34:41 +0200 (CEST)
Message-ID: <51907B71.2040906@weilnetz.de>
Date: Mon, 13 May 2013 07:34:41 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: qiaonuohan@cn.fujitsu.com
References: <1367987941-26040-1-git-send-email-qiaonuohan@cn.fujitsu.com>
In-Reply-To: <1367987941-26040-1-git-send-email-qiaonuohan@cn.fujitsu.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove twice include of
	qemu-common.h
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
X-List-Received-Date: Mon, 13 May 2013 05:34:51 -0000

Am 08.05.2013 06:39, schrieb qiaonuohan@cn.fujitsu.com:
> From: Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
>
> This patch is used to remove twice include of "qemu-common.h" in
> block/win32-aio.c
>
> Signed-off-by: Qiao Nuohan <qiaonuohan@cn.fujitsu.com>
> ---
>  block/win32-aio.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
>
> diff --git a/block/win32-aio.c b/block/win32-aio.c
> index 5d0fbbf..fcb7c75 100644
> --- a/block/win32-aio.c
> +++ b/block/win32-aio.c
> @@ -25,7 +25,6 @@
>  #include "qemu/timer.h"
>  #include "block/block_int.h"
>  #include "qemu/module.h"
> -#include "qemu-common.h"
>  #include "block/aio.h"
>  #include "raw-aio.h"
>  #include "qemu/event_notifier.h"

Reviewed-by: Stefan Weil <sw@weilnetz.de>


