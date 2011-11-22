Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSeNw-0005Zf-9U
	for mharc-qemu-trivial@gnu.org; Mon, 21 Nov 2011 19:38:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RSeNn-0003G2-1i
	for qemu-trivial@nongnu.org; Mon, 21 Nov 2011 19:38:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RSe8I-00031z-Pl
	for qemu-trivial@nongnu.org; Mon, 21 Nov 2011 19:22:46 -0500
Received: from mail-yx0-f173.google.com ([209.85.213.173]:44799)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RSe8E-0002zd-Nn; Mon, 21 Nov 2011 19:22:38 -0500
Received: by yenq2 with SMTP id q2so6408136yen.4
	for <multiple recipients>; Mon, 21 Nov 2011 16:22:04 -0800 (PST)
Received: by 10.236.154.193 with SMTP id h41mr23231662yhk.15.1321921324816;
	Mon, 21 Nov 2011 16:22:04 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id 33sm33988163ano.1.2011.11.21.16.22.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 Nov 2011 16:22:04 -0800 (PST)
Message-ID: <4ECAEB2A.8010201@codemonkey.ws>
Date: Mon, 21 Nov 2011 18:22:02 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1321788870-27848-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1321788870-27848-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Include zlib.h using
	#include <>
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
X-List-Received-Date: Tue, 22 Nov 2011 00:38:49 -0000

On 11/20/2011 05:34 AM, Stefan Weil wrote:
> zlib.h is not a local include file, therefore it should be included
> using<>  instead of "".
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>

Applied.  Thanks.

Regards,

Anthony Liguori

> ---
>   block/vmdk.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/block/vmdk.c b/block/vmdk.c
> index e53a2f0..96f7d5d 100644
> --- a/block/vmdk.c
> +++ b/block/vmdk.c
> @@ -26,7 +26,7 @@
>   #include "qemu-common.h"
>   #include "block_int.h"
>   #include "module.h"
> -#include "zlib.h"
> +#include<zlib.h>
>
>   #define VMDK3_MAGIC (('C'<<  24) | ('O'<<  16) | ('W'<<  8) | 'D')
>   #define VMDK4_MAGIC (('K'<<  24) | ('D'<<  16) | ('M'<<  8) | 'V')


