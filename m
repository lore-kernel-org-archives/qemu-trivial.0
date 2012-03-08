Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5WYv-0004Xg-9y
	for mharc-qemu-trivial@gnu.org; Thu, 08 Mar 2012 01:10:53 -0500
Received: from eggs.gnu.org ([208.118.235.92]:41187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S5WYr-0004NU-TK
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 01:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S5WYq-0002s1-0E
	for qemu-trivial@nongnu.org; Thu, 08 Mar 2012 01:10:49 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48691)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1S5WYl-0002rE-JC; Thu, 08 Mar 2012 01:10:43 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	9102372800A0; Thu,  8 Mar 2012 07:10:41 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 1MFryoIehkKH; Thu,  8 Mar 2012 07:10:38 +0100 (CET)
Received: from [192.168.178.20] (p5086E596.dip.t-dialin.net [80.134.229.150])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	87396728009F; Thu,  8 Mar 2012 07:10:38 +0100 (CET)
Message-ID: <4F584D5E.304@weilnetz.de>
Date: Thu, 08 Mar 2012 07:10:38 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>
References: <1331168981-13139-1-git-send-email-david@gibson.dropbear.id.au>
	<1331168981-13139-2-git-send-email-david@gibson.dropbear.id.au>
In-Reply-To: <1331168981-13139-2-git-send-email-david@gibson.dropbear.id.au>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] cache-utils.h needs
	stdint.h for uintptr_t
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
X-List-Received-Date: Thu, 08 Mar 2012 06:10:51 -0000

Am 08.03.2012 02:09, schrieb David Gibson:
> cache-utils.h uses the C99 standard uintptr_t type.  However, that type
> comes from stdint.h which is not #included before cache-utils.h in all
> configurations.  This patch adds the necessary include to fix this.
>
> Signed-off-by: David Gibson<david@gibson.dropbear.id.au>
> ---
>   cache-utils.h |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/cache-utils.h b/cache-utils.h
> index 04a6e2e..b0f1786 100644
> --- a/cache-utils.h
> +++ b/cache-utils.h
> @@ -1,6 +1,8 @@
>   #ifndef QEMU_CACHE_UTILS_H
>   #define QEMU_CACHE_UTILS_H
>
> +#include<stdint.h>
> +
>   #if defined(_ARCH_PPC)
>   struct qemu_cache_conf {
>       unsigned long dcache_bsize;

The include statement is only needed for _ARCH_PPC.

See http://patchwork.ozlabs.org/patch/144763/ which
fixes the same issue.

Anthony, Blue, could someone please commit my patch?

Regards,

Stefan W.


