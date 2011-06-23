Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZlTj-0008Iu-20
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 11:05:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZlTf-0008Hu-NN
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 11:05:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZlTe-00039j-5h
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 11:05:55 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49994)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QZlTZ-00038s-HZ; Thu, 23 Jun 2011 11:05:49 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	30A6472818A6; Thu, 23 Jun 2011 17:05:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 8vjeEmELY5Fv; Thu, 23 Jun 2011 17:05:47 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086FB6F.dip.t-dialin.net [80.134.251.111])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	1CB4372818A4; Thu, 23 Jun 2011 17:05:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QZlTW-0002Xv-Al; Thu, 23 Jun 2011 17:05:46 +0200
Message-ID: <4E03564A.5060201@mail.berlios.de>
Date: Thu, 23 Jun 2011 17:05:46 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110505 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <BANLkTika6YmzRYAnta8TgQGpLSpoAdpKNQ@mail.gmail.com>
	<4DFC636D.9090800@mail.berlios.de>
	<20110623135202.GA12765@stefanha-thinkpad.localdomain>
In-Reply-To: <20110623135202.GA12765@stefanha-thinkpad.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>,
	Roy Tam <roytam@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix MinGW compilation when
 --enable-vnc-jpeg is specified
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
X-List-Received-Date: Thu, 23 Jun 2011 15:05:57 -0000

Am 23.06.2011 15:52, schrieb Stefan Hajnoczi:
> On Sat, Jun 18, 2011 at 10:35:57AM +0200, Stefan Weil wrote:
>> Am 18.06.2011 07:13, schrieb Roy Tam:
>>> This patch fix conflicting types for 'INT32' in basetsd.h in including
>>> qemu-common.h first.
>>>
>>>
>>> Sign-off-by: Roy Tam<roytam@gmail.com>
>>> --
>>> diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
>>> index 87fdf35..1591df0 100644
>>> --- a/ui/vnc-enc-tight.c
>>> +++ b/ui/vnc-enc-tight.c
>>> @@ -28,6 +28,8 @@
>>>
>>> #include "config-host.h"
>>>
>>> +#include "qemu-common.h"
>>> +
>>> #ifdef CONFIG_VNC_PNG
>>> #include<png.h>
>>> #endif
>>> @@ -36,8 +38,6 @@
>>> #include<jpeglib.h>
>>> #endif
>>>
>>> -#include "qemu-common.h"
>>> -
>>> #include "bswap.h"
>>> #include "qint.h"
>>> #include "vnc.h"
>>
>> Acked-by: Stefan Weil <weil@mail.berlios.de>
>>
>> The conflicting declaration is in jmorecfg.h which is included from
>> jpeglib.h.
>
> Is the problem that the Windows headers included from qemu-common.h try
> to #define INT32?
> http://msdn.microsoft.com/en-us/library/aa383751(v=vs.85).aspx
>
> In that case I think an explicit fix is better:
>
> #ifdef _WIN32
> /* Include this before jpeglib.h for the INT32 definition */
> #include <basetsd.h>
> #endif
>
> ...followed by png/jpeg includes...
>
> Simply moving qemu-common.h provides no hints and is rather indirect.
> Someone may move it back in the future.
>
> Stefan

INT32 is declared in basetsd.h which is included from windows.h
(with some indirections) which is included from qemu-os-win32.h
which is included from qemu-common.h.

INT32 is not a #define, but a data type (typedef) and very common
for w32 compilations. Windows programmers don't include basetsd.h
directly, but usually use windows.h.

Including qemu-common.h right at the beginning (after config.h where
needed) should be good practice for QEMU source code - like this:

#include "config.h"        /* optional */
#include "qemu-common.h"
#include <system includes> /* without those that are included from 
qemu-common.h */
...
#include "other local includes"
...

As long as the maintainers don't accept patches which simply move
qemu-common.h, there is no danger. :-)

Of course a comment might be added. In most cases, I'm a great friend
of good comments, but in this special case, I don't think it is necessary.
It's a very special case of a typedef conflict caused by the mingw32
version of jpeglib (which is obviously rarely used), and it might be fixed
in a newer version of jpeglib (so the comment would be no longer
valid, and nobody would notice that).

Stefan


