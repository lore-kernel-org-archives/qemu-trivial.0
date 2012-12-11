Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TiIzx-0002E4-5f
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2012 01:07:21 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58412)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TiIzt-00024J-NC
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2012 01:07:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TiIzs-000241-Jg
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2012 01:07:17 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:48193)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TiIzp-000234-F0; Tue, 11 Dec 2012 01:07:13 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	800DA7280049; Tue, 11 Dec 2012 07:07:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id hdHJOITlyC40; Tue, 11 Dec 2012 07:07:10 +0100 (CET)
Received: from [192.168.178.20] (p5086EF1B.dip.t-dialin.net [80.134.239.27])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	A1934728001C; Tue, 11 Dec 2012 07:07:10 +0100 (CET)
Message-ID: <50C6CD8D.6020901@weilnetz.de>
Date: Tue, 11 Dec 2012 07:07:09 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: John Spencer <maillist-qemu@barfooze.de>
References: <1355122786-29243-1-git-send-email-maillist-qemu@barfooze.de>
	<1355122786-29243-3-git-send-email-maillist-qemu@barfooze.de>
	<50C6209F.8060506@weilnetz.de> <50C68B04.9020902@barfooze.de>
In-Reply-To: <50C68B04.9020902@barfooze.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Tue, 11 Dec 2012 06:07:19 -0000

Am 11.12.2012 02:23, schrieb John Spencer:
> On 12/10/2012 06:49 PM, Stefan Weil wrote:
>> Am 10.12.2012 07:59, schrieb John Spencer:
>>> +#include<sys/syscall.h>
>
>>
>> This is a workaround for a missing declaration of function syscall
>> in musl's unistd.h. See my comment to patch 1 for more information.
>>
>
> thanks for noticing! fixed in musl:
>
> http://git.musl-libc.org/cgit/musl/commit/?id=baf246e559e915a78a9703e10d15020c7edee423 
>
>
> how do we proceed with the 2 good patches ? is there anything i have 
> to do to get them merged, now that you put the "Reviewed-by" stamp on 
> them ?
>
> Thanks,
> John Spencer


I assume that Stefan Hajnoczi will add them to the qemu-trivial queue.
Just wait and resend those patches if nothing happens the next two weeks.

Regards,
Stefan Weil


