Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Thx04-00056q-U4
	for mharc-qemu-trivial@gnu.org; Mon, 10 Dec 2012 01:38:00 -0500
Received: from eggs.gnu.org ([208.118.235.92]:39520)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Thx02-0004zz-JD
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:37:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1Thx01-0007AC-3d
	for qemu-trivial@nongnu.org; Mon, 10 Dec 2012 01:37:58 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:38918)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1Thwzx-00079c-Ia; Mon, 10 Dec 2012 01:37:53 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	E39E37280048; Mon, 10 Dec 2012 07:37:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id PMJdoHuHo8PM; Mon, 10 Dec 2012 07:37:51 +0100 (CET)
Received: from [192.168.178.20] (p5086F143.dip.t-dialin.net [80.134.241.67])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	3C926728001C; Mon, 10 Dec 2012 07:37:51 +0100 (CET)
Message-ID: <50C5833E.2020404@weilnetz.de>
Date: Mon, 10 Dec 2012 07:37:50 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: John Spencer <maillist-qemu@barfooze.de>
References: <50C57E3D.9010708@barfooze.de>
In-Reply-To: <50C57E3D.9010708@barfooze.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
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
X-List-Received-Date: Mon, 10 Dec 2012 06:37:59 -0000

Am 10.12.2012 07:16, schrieb John Spencer:

Your patch is not shown here because you had attached it to your email.
Please use "git send-email" to send patches.See also
http://wiki.qemu.org/Contribute/SubmitAPatch.

In your patch, you replaced a wrong forward declarationof function setgroups
by an include statement using grp.h. That's fine.

Reviewed-by: Stefan Weil <sw@weilnetz.de>

There are more extern declarations in linux-user/syscall.c.
Even if they are correct, they should be replaced by include statements.
If there will be a v2 of your patch series, you could add patches
for those declarations, too.

Regards
Stefan Weil


