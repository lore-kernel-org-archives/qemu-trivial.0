Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RIQRW-0004yR-RV
	for mharc-qemu-trivial@gnu.org; Mon, 24 Oct 2011 15:44:18 -0400
Received: from eggs.gnu.org ([140.186.70.92]:32809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RIQRP-0004cs-31
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2011 15:44:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RIQRI-0003Lk-IR
	for qemu-trivial@nongnu.org; Mon, 24 Oct 2011 15:44:10 -0400
Received: from mail-gy0-f173.google.com ([209.85.160.173]:38711)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RIQRB-0003ID-Q2; Mon, 24 Oct 2011 15:43:57 -0400
Received: by gyg10 with SMTP id 10so7687318gyg.4
	for <multiple recipients>; Mon, 24 Oct 2011 12:43:56 -0700 (PDT)
Received: by 10.236.181.35 with SMTP id k23mr36792865yhm.93.1319485436736;
	Mon, 24 Oct 2011 12:43:56 -0700 (PDT)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id x3sm62959221anl.6.2011.10.24.12.43.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Oct 2011 12:43:55 -0700 (PDT)
Message-ID: <4EA5BFF9.8050707@codemonkey.ws>
Date: Mon, 24 Oct 2011 14:43:53 -0500
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1319485183-9492-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1319485183-9492-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] main-loop: Add missing
	include file
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
X-List-Received-Date: Mon, 24 Oct 2011 19:44:17 -0000

On 10/24/2011 02:39 PM, Stefan Weil wrote:
> stdint.h defines the POSIX data types and is needed
> for MinGW-w64 (and maybe other hosts).
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   main-loop.c |    1 +
>   1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/main-loop.c b/main-loop.c
> index bfecdb7..d9585f8 100644
> --- a/main-loop.c
> +++ b/main-loop.c
> @@ -22,6 +22,7 @@
>    * THE SOFTWARE.
>    */
>   #include "config-host.h"
> +#include<stdint.h>      /* uint8_t, ... */

Any reason not to use qemu-common?

Regards,

Anthony Liguori

>   #include<unistd.h>
>   #include<signal.h>
>   #include<time.h>


