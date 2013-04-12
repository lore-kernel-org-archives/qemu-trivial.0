Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UQkd8-0005Ni-Kd
	for mharc-qemu-trivial@gnu.org; Fri, 12 Apr 2013 16:31:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50336)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UQkd6-0005K2-A6
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 16:31:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1UQkd5-00068n-8R
	for qemu-trivial@nongnu.org; Fri, 12 Apr 2013 16:31:28 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:49956)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1UQkd2-00067Q-Et; Fri, 12 Apr 2013 16:31:25 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	4B9157280041; Fri, 12 Apr 2013 22:31:22 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id L0EsUqgFArxY; Fri, 12 Apr 2013 22:31:20 +0200 (CEST)
Received: from [192.168.178.35] (p54ADBFC4.dip.t-dialin.net [84.173.191.196])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	443C2728002C; Fri, 12 Apr 2013 22:31:20 +0200 (CEST)
Message-ID: <51686F17.7070503@weilnetz.de>
Date: Fri, 12 Apr 2013 22:31:19 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1365730875-22854-1-git-send-email-aik@ozlabs.ru>
	<5167E747.2020106@suse.de>
	<20130412164715.GL5065@truffula.fritz.box>
	<51684621.7090204@weilnetz.de> <51686D39.3070209@ozlabs.ru>
In-Reply-To: <51686D39.3070209@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] bswap: fix compiler warning
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
X-List-Received-Date: Fri, 12 Apr 2013 20:31:29 -0000

Am 12.04.2013 22:23, schrieb Alexey Kardashevskiy:
> On 04/13/2013 03:36 AM, Stefan Weil wrote:
>> Am 12.04.2013 18:47, schrieb David Gibson:
>>> On Fri, Apr 12, 2013 at 12:51:51PM +0200, Andreas F=C3=A4rber wrote:
>>>> Am 12.04.2013 03:41, schrieb Alexey Kardashevskiy:
>>>>> The bswap functions use memcpy but the bswap.h header itself does
>>>>> not seem to
>>>>> include it in some configuration such as cross compiling for
>>>>> powerpc64
>>>>> on x86_64 machine (gcc 4.6.3 from ftp.kernel.org, headers/libs
>>>>> from FC18/ppc64),
>>>>> the example warning is below.
>>>>>
>>>>> The patch explicitly includes string.h.
>>>>>
>>>>>    CC    ppc64-softmmu/hw/virtio/virtio.o
>>>>> In file included from /home/alexey/qemu/include/libfdt_env.h:22:0,
>>>>>                   from
>>>>> /home/alexey/qemu/../lib4qemu/usr/include/libfdt.h:54,
>>>>>                   from /home/alexey/qemu/hw/nvram/spapr_nvram.c:25:
>>>>> /home/alexey/qemu/include/qemu/bswap.h: In function 'lduw_p':
>>>>> /home/alexey/qemu/include/qemu/bswap.h:244:5: warning: implicit
>>>>> declaration of function 'memcpy' [-Wimplicit-function-declaration]
>>>>> /home/alexey/qemu/include/qemu/bswap.h:244:5: warning:
>>>>> incompatible implicit declaration of built-in function 'memcpy'
>>>>> [enabled by default]
>>>>>
>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>> ---
>>>>>   include/qemu/bswap.h |    2 ++
>>>>>   1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/include/qemu/bswap.h b/include/qemu/bswap.h
>>>>> index d3af35d..d50de0d 100644
>>>>> --- a/include/qemu/bswap.h
>>>>> +++ b/include/qemu/bswap.h
>>>>> @@ -1,6 +1,8 @@
>>>>>   #ifndef BSWAP_H
>>>>>   #define BSWAP_H
>>>>>
>>>>> +#include <string.h>
>>>>> +
>>>>>   #include "config-host.h"
>>>>>   #include <inttypes.h>
>>>>>   #include <limits.h>
>>>> Including string.h is certainly the right thing to do, but why do yo=
u
>>>> single it out first?
>>> Yeah, it probably shouldn't go above the config header.  Otherwise
>>> it's the right thing.
>>
>> If string.h went directly after limits.h, we'd even preserve the
>> alphabetic order of the system headers :-)
>
> Ah. Misunderstood the original question :) Do I need to repost it?


Yes, please - I think that would be good. You can also cc your patch
to qemu-trivial@nongnu.org, so it will be committed as a trivial patch.


