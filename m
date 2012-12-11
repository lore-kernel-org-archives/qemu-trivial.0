Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TiEYr-0001MQ-Lv
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 20:23:05 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48400)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1TiEYm-0001MA-KJ
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 20:23:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1TiEYk-0004E3-9q
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 20:23:00 -0500
Received: from furnace.wzff.de ([2a01:4f8:150:63e2::9]:51690)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1TiEYk-0004Dz-38; Mon, 10 Dec 2012 20:22:58 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1TiEYf-0002wE-L1; Tue, 11 Dec 2012 02:22:55 +0100
Message-ID: <50C68B04.9020902@barfooze.de>
Date: Tue, 11 Dec 2012 02:23:16 +0100
From: John Spencer <maillist-qemu@barfooze.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110221 SUSE/3.1.8 Mail/1.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
	<1355122786-29243-3-git-send-email-maillist-qemu@barfooze.de>
	<50C6209F.8060506@weilnetz.de>
In-Reply-To: <50C6209F.8060506@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:150:63e2::9
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/4] fix implicit
 declaration of syscall() in	linux-user/syscall.c
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
X-List-Received-Date: Tue, 11 Dec 2012 01:23:04 -0000

On 12/10/2012 06:49 PM, Stefan Weil wrote:
> Am 10.12.2012 07:59, schrieb John Spencer:
>> +#include<sys/syscall.h>

>
> This is a workaround for a missing declaration of function syscall
> in musl's unistd.h. See my comment to patch 1 for more information.
>

thanks for noticing! fixed in musl:

http://git.musl-libc.org/cgit/musl/commit/?id=baf246e559e915a78a9703e10d15020c7edee423

how do we proceed with the 2 good patches ? is there anything i have to 
do to get them merged, now that you put the "Reviewed-by" stamp on them ?

Thanks,
John Spencer

