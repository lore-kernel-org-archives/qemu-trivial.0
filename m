Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ThxUM-0003wA-K3
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 02:09:18 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxUH-0003fd-Al
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:09:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>) id 1ThxUE-0007Qn-TD
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 02:09:13 -0500
Received: from furnace.wzff.de ([2a01:4f8:150:63e2::9]:41797)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxU9-0007QF-5V; Mon, 10 Dec 2012 02:09:05 -0500
Received: from xdsl-188-155-204-150.adslplus.ch ([188.155.204.150]
	helo=[10.1.1.4])
	by furnace.wzff.de with esmtpsa (TLSv1:DHE-RSA-CAMELLIA256-SHA:256)
	(Exim 4.80.1 (FreeBSD)) (envelope-from <maillist-qemu@barfooze.de>)
	id 1ThxU6-000Kxy-GC; Mon, 10 Dec 2012 08:09:04 +0100
Message-ID: <50C58AA4.3020700@barfooze.de>
Date: Mon, 10 Dec 2012 08:09:24 +0100
From: John Spencer <maillist-qemu@barfooze.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.14) Gecko/20110221 SUSE/3.1.8 Mail/1.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <50C57E3D.9010708@barfooze.de> <50C5833E.2020404@weilnetz.de>
In-Reply-To: <50C5833E.2020404@weilnetz.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:150:63e2::9
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/4] linux-user/syscall.c:
 remove wrong forward decl of setgroups()
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
X-List-Received-Date: Mon, 10 Dec 2012 07:09:17 -0000

On 12/10/2012 07:37 AM, Stefan Weil wrote:
> Am 10.12.2012 07:16, schrieb John Spencer:
>
> Your patch is not shown here because you had attached it to your email.
> Please use "git send-email" to send patches.See also
> http://wiki.qemu.org/Contribute/SubmitAPatch.

thanks, resent with git send-email.
i hope it is ok now.

>
> In your patch, you replaced a wrong forward declarationof function
> setgroups
> by an include statement using grp.h. That's fine.
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
> There are more extern declarations in linux-user/syscall.c.
> Even if they are correct, they should be replaced by include statements.
> If there will be a v2 of your patch series, you could add patches
> for those declarations, too.

ok, will do separately after this first batch is merged.

Regards,
John Spencer

