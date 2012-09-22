Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFUHG-0004Wn-0i
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 14:18:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFUHD-0004Or-5a
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 14:18:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TFUHC-0005Cx-6q
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 14:18:03 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:34258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TFUH9-0005CG-Dg; Sat, 22 Sep 2012 14:17:59 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	574267280033; Sat, 22 Sep 2012 20:17:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id hCZQYIFcmr4r; Sat, 22 Sep 2012 20:17:58 +0200 (CEST)
Received: from [192.168.178.20] (p54ADAD92.dip.t-dialin.net [84.173.173.146])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	C1B347280032; Sat, 22 Sep 2012 20:17:57 +0200 (CEST)
Message-ID: <505E00D4.7040104@weilnetz.de>
Date: Sat, 22 Sep 2012 20:17:56 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1348169539-24797-1-git-send-email-sw@weilnetz.de>
	<20120922163216.GC14154@stefanha-thinkpad.localdomain>
	<505DFCFD.6010202@msgid.tls.msk.ru>
In-Reply-To: <505DFCFD.6010202@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: Blue Swirl <blauwirbel@gmail.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net/socket: Fix compiler
 warning (regression for MinGW)
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
X-List-Received-Date: Sat, 22 Sep 2012 18:18:04 -0000

Am 22.09.2012 20:01, schrieb Michael Tokarev:
> On 22.09.2012 20:32, Stefan Hajnoczi wrote:
>> On Thu, Sep 20, 2012 at 09:32:19PM +0200, Stefan Weil wrote:
>>> Add a type cast which was removed by commit
>>> 213fd5087e2e4e2da10ad266df0ba950cf7618bf again.
>>>
>>> Without it, MinGW compilers complain:
>>>
>>> net/socket.c:136: warning:
>>>   pointer targets in passing argument 2 of =E2=80=98sendto=E2=80=99 d=
iffer in signedness
>>> /usr/lib/gcc/amd64-mingw32msvc/4.4.4/../../../../amd64-mingw32msvc/in=
clude/winsock2.h:1313: note:
>>>   expected =E2=80=98const char *=E2=80=99 but argument is of type =E2=
=80=98const uint8_t *=E2=80=99
>> Wow, that's messed up.  sendto() is POSIX and the prototype shouldn't =
be
>> const char *.
>>
>> It's easy for someone to remove this cast in the future.  Please add a
>> comment explaining that it's needed because MinGW headers don't have t=
he
>> POSIX version of sendto().
> There's qemu_recv() in qemu-common.h, for exactly the same purpose.
> But qemu_recv() is much more evil, IMHO.
>
> Thanks,
>
> /mjt

Thanks for the hint.

I already sent v2 of my patch (with a comment as suggested by Stefan H.).

Of course we could also add a qemu_sendto to qemu-common.h.
Is there anybody who would prefer that solution?

Regards
Stefan W.


