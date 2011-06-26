Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QatjI-0004HJ-FE
	for mharc-qemu-trivial@gnu.org; Sun, 26 Jun 2011 14:06:44 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54948)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QatjE-0004GO-0I
	for qemu-trivial@nongnu.org; Sun, 26 Jun 2011 14:06:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QatjC-0000ky-9W
	for qemu-trivial@nongnu.org; Sun, 26 Jun 2011 14:06:39 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:52010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1Qatj7-0000kC-Gr; Sun, 26 Jun 2011 14:06:33 -0400
Received: by qwj8 with SMTP id 8so2365266qwj.4
	for <multiple recipients>; Sun, 26 Jun 2011 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=m8Z0rmHJQODWp1Mi6Ovcg8HluECQyp7Rkc0NCA/rv1c=;
	b=a759uzw1Kto7uhs0Uu1L/p6qiIktG0lEVCArxXEOFJwjsJGO/YjLWcJuUVowaQEM4U
	udxSwWlzpoIvCw15pUA+5YTmTfFGlvZ9TqNiWhUGNH+z1xujC0JrdnmfaPZ/0E6jm+YW
	KOP2RArXMrttaDlPfzNEjoD0gFfIsskR9MoH4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=SY44U8vqB/CR+r+5Qa7GXs70L1om4BpylupvI3LcDvWyulpzZPFB5sJK5Y/4WnCpbR
	Gd1srCw5at+cmPiH7jA6MKAcduqyh0WiKYVsut76VnuFqsmxR1wM8Y1vi7cQAT4qzHmF
	+WpsbekTdVLS3PlisJJmiWkuGhwwi38/mMD7w=
Received: by 10.224.46.21 with SMTP id h21mr4190292qaf.155.1309111593058; Sun,
	26 Jun 2011 11:06:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.73.129 with HTTP; Sun, 26 Jun 2011 11:06:13 -0700 (PDT)
In-Reply-To: <4E03564A.5060201@mail.berlios.de>
References: <BANLkTika6YmzRYAnta8TgQGpLSpoAdpKNQ@mail.gmail.com>
	<4DFC636D.9090800@mail.berlios.de>
	<20110623135202.GA12765@stefanha-thinkpad.localdomain>
	<4E03564A.5060201@mail.berlios.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 26 Jun 2011 21:06:13 +0300
Message-ID: <BANLkTikP6ietymb3Cg2V5TSPpnjMyWacqA@mail.gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
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
X-List-Received-Date: Sun, 26 Jun 2011 18:06:41 -0000

On Thu, Jun 23, 2011 at 6:05 PM, Stefan Weil <weil@mail.berlios.de> wrote:
> Am 23.06.2011 15:52, schrieb Stefan Hajnoczi:
>>
>> On Sat, Jun 18, 2011 at 10:35:57AM +0200, Stefan Weil wrote:
>>>
>>> Am 18.06.2011 07:13, schrieb Roy Tam:
>>>>
>>>> This patch fix conflicting types for 'INT32' in basetsd.h in including
>>>> qemu-common.h first.
>>>>
>>>>
>>>> Sign-off-by: Roy Tam<roytam@gmail.com>
>>>> --
>>>> diff --git a/ui/vnc-enc-tight.c b/ui/vnc-enc-tight.c
>>>> index 87fdf35..1591df0 100644
>>>> --- a/ui/vnc-enc-tight.c
>>>> +++ b/ui/vnc-enc-tight.c
>>>> @@ -28,6 +28,8 @@
>>>>
>>>> #include "config-host.h"
>>>>
>>>> +#include "qemu-common.h"
>>>> +
>>>> #ifdef CONFIG_VNC_PNG
>>>> #include<png.h>
>>>> #endif
>>>> @@ -36,8 +38,6 @@
>>>> #include<jpeglib.h>
>>>> #endif
>>>>
>>>> -#include "qemu-common.h"
>>>> -
>>>> #include "bswap.h"
>>>> #include "qint.h"
>>>> #include "vnc.h"
>>>
>>> Acked-by: Stefan Weil <weil@mail.berlios.de>
>>>
>>> The conflicting declaration is in jmorecfg.h which is included from
>>> jpeglib.h.
>>
>> Is the problem that the Windows headers included from qemu-common.h try
>> to #define INT32?
>> http://msdn.microsoft.com/en-us/library/aa383751(v=3Dvs.85).aspx
>>
>> In that case I think an explicit fix is better:
>>
>> #ifdef _WIN32
>> /* Include this before jpeglib.h for the INT32 definition */
>> #include <basetsd.h>
>> #endif
>>
>> ...followed by png/jpeg includes...
>>
>> Simply moving qemu-common.h provides no hints and is rather indirect.
>> Someone may move it back in the future.
>>
>> Stefan
>
> INT32 is declared in basetsd.h which is included from windows.h
> (with some indirections) which is included from qemu-os-win32.h
> which is included from qemu-common.h.
>
> INT32 is not a #define, but a data type (typedef) and very common
> for w32 compilations. Windows programmers don't include basetsd.h
> directly, but usually use windows.h.
>
> Including qemu-common.h right at the beginning (after config.h where
> needed) should be good practice for QEMU source code - like this:
>
> #include "config.h" =C2=A0 =C2=A0 =C2=A0 =C2=A0/* optional */
> #include "qemu-common.h"
> #include <system includes> /* without those that are included from
> qemu-common.h */
> ...
> #include "other local includes"
> ...
>
> As long as the maintainers don't accept patches which simply move
> qemu-common.h, there is no danger. :-)
>
> Of course a comment might be added. In most cases, I'm a great friend
> of good comments, but in this special case, I don't think it is necessary=
.
> It's a very special case of a typedef conflict caused by the mingw32
> version of jpeglib (which is obviously rarely used), and it might be fixe=
d
> in a newer version of jpeglib (so the comment would be no longer
> valid, and nobody would notice that).

We could also add a configure time check for this case for maximum
over engineering.

