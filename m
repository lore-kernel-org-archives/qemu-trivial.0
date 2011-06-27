Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qb3ET-0006qR-Vf
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jun 2011 00:15:34 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50786)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <roytam@gmail.com>) id 1Qb3EP-0006pC-Uf
	for qemu-trivial@nongnu.org; Mon, 27 Jun 2011 00:15:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <roytam@gmail.com>) id 1Qb3EO-0002Yd-If
	for qemu-trivial@nongnu.org; Mon, 27 Jun 2011 00:15:29 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:38034)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <roytam@gmail.com>)
	id 1Qb3EK-0002Xm-3n; Mon, 27 Jun 2011 00:15:24 -0400
Received: by wwf26 with SMTP id 26so3804230wwf.10
	for <multiple recipients>; Sun, 26 Jun 2011 21:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ZWBZ5x4hGiOIupaa0qi6v3DKRMtluzqrZ4Wv9zPkGNw=;
	b=mgMAbHJj3cN0JJCwADvmpjN8Azod+lKPDpZlaCgWjzNsZWIsRb4qKf1HuH64p/GWmM
	tTZOyN2rcIMAmFm4TYB6YaIoqZCfXvWFXtEPo1/hnWeJrDqsVUuPIKYHBzXFUjbUk1+W
	Lg1f3U04Vlt7F0gxdZVINcgCMVAdKT4aPjUGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=YEEGnKXMZB01AQ6hZ7hpQIZORk/MYGC69aSxKwKQvjUCEekX4HJwHN/eN/WcC25aNz
	iNDyhUqurL3eHODffPrPmkXzp9s7AiWOfoYGkGqr+83XfJM1A9UkRaUaZG4dI5hGfEyn
	KDeb+eK67cl2Kkaw5BelWbAB2eECpfWDDg6Qk=
Received: by 10.227.132.66 with SMTP id a2mr5162701wbt.81.1309148122207; Sun,
	26 Jun 2011 21:15:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.227.152.84 with HTTP; Sun, 26 Jun 2011 21:15:02 -0700 (PDT)
In-Reply-To: <BANLkTikp8PZoZVbeuHVgDsH2mpLxKs+ytg@mail.gmail.com>
References: <BANLkTika6YmzRYAnta8TgQGpLSpoAdpKNQ@mail.gmail.com>
	<4DFC636D.9090800@mail.berlios.de>
	<20110623135202.GA12765@stefanha-thinkpad.localdomain>
	<4E03564A.5060201@mail.berlios.de>
	<BANLkTikP6ietymb3Cg2V5TSPpnjMyWacqA@mail.gmail.com>
	<4E07907F.1060703@mail.berlios.de>
	<BANLkTimZkQ9qBC+Rt0+CCV4TNKTRgttr9A@mail.gmail.com>
	<BANLkTikp8PZoZVbeuHVgDsH2mpLxKs+ytg@mail.gmail.com>
From: Roy Tam <roytam@gmail.com>
Date: Mon, 27 Jun 2011 12:15:02 +0800
Message-ID: <BANLkTikAi4eRX3PfRN+xKYWEMMC8=cZbVw@mail.gmail.com>
To: TeLeMan <geleman@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: Blue Swirl <blauwirbel@gmail.com>, Stefan Weil <weil@mail.berlios.de>,
	qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
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
X-List-Received-Date: Mon, 27 Jun 2011 04:15:31 -0000

Hi,

2011/6/27 TeLeMan <geleman@gmail.com>:
> This patch breaks the compilation with --enable-vnc-png:
>
> =A0CC =A0 =A0ui/vnc-enc-tight.o
> In file included from /usr/include/png.h:518,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from ui/vnc-enc-tight.c:34:
> /usr/include/pngconf.h:371: error: expected '=3D', ',', ';', 'asm' or
> '__attribute__' before '.' token
> /usr/include/pngconf.h:372: error: expected '=3D', ',', ';', 'asm' or
> '__attribute__' before 'include'
> make: *** [ui/vnc-enc-tight.o] Error 1
>

Works for me here.
But for the configure script, I need modifying to pass instead of giving er=
ror.

-    vnc_png_libs=3D"-lpng"
+    vnc_png_libs=3D"-lpng -lz"


> --
> SUN OF A BEACH
>
>
>
> On Mon, Jun 27, 2011 at 04:26, Blue Swirl <blauwirbel@gmail.com> wrote:
>> On Sun, Jun 26, 2011 at 11:03 PM, Stefan Weil <weil@mail.berlios.de> wro=
te:
>>> Am 26.06.2011 20:06, schrieb Blue Swirl:
>>>>
>>>> On Thu, Jun 23, 2011 at 6:05 PM, Stefan Weil<weil@mail.berlios.de> =A0=
wrote:
>>>>>
>>>>> Am 23.06.2011 15:52, schrieb Stefan Hajnoczi:
>>>>>>
>>>>>> On Sat, Jun 18, 2011 at 10:35:57AM +0200, Stefan Weil wrote:
>>>>>>>
>>>>>>> Am 18.06.2011 07:13, schrieb Roy Tam:
>>>>>>>>
>>>>>>>> This patch fix conflicting types for 'INT32' in basetsd.h in inclu=
ding
>>>>>>>> qemu-common.h first.
>>>>>>>>
>>>>>>>>
>>>>>>>> Sign-off-by: Roy Tam<roytam@gmail.com>
>>>>>>>> --
>>>
>>> ...
>>>>>>>
>>>>>>> The conflicting declaration is in jmorecfg.h which is included from
>>>>>>> jpeglib.h.
>>>>>>
>>>>>> Is the problem that the Windows headers included from qemu-common.h =
try
>>>>>> to #define INT32?
>>>>>> http://msdn.microsoft.com/en-us/library/aa383751(v=3Dvs.85).aspx
>>>>>>
>>>>>> In that case I think an explicit fix is better:
>>>>>>
>>>>>> #ifdef _WIN32
>>>>>> /* Include this before jpeglib.h for the INT32 definition */
>>>>>> #include<basetsd.h>
>>>>>> #endif
>>>>>>
>>>>>> ...followed by png/jpeg includes...
>>>>>>
>>>>>> Simply moving qemu-common.h provides no hints and is rather indirect=
.
>>>>>> Someone may move it back in the future.
>>>>>>
>>>>>> Stefan
>>>>>
>>>>> INT32 is declared in basetsd.h which is included from windows.h
>>>>> (with some indirections) which is included from qemu-os-win32.h
>>>>> which is included from qemu-common.h.
>>>>>
>>>>> INT32 is not a #define, but a data type (typedef) and very common
>>>>> for w32 compilations. Windows programmers don't include basetsd.h
>>>>> directly, but usually use windows.h.
>>>>>
>>>>> Including qemu-common.h right at the beginning (after config.h where
>>>>> needed) should be good practice for QEMU source code - like this:
>>>>>
>>>>> #include "config.h" =A0 =A0 =A0 =A0/* optional */
>>>>> #include "qemu-common.h"
>>>>> #include <system includes> /* without those that are included from
>>>>> qemu-common.h */
>>>>> ...
>>>>> #include "other local includes"
>>>>> ...
>>>>>
>>>>> As long as the maintainers don't accept patches which simply move
>>>>> qemu-common.h, there is no danger. :-)
>>>>>
>>>>> Of course a comment might be added. In most cases, I'm a great friend
>>>>> of good comments, but in this special case, I don't think it is
>>>>> necessary.
>>>>> It's a very special case of a typedef conflict caused by the mingw32
>>>>> version of jpeglib (which is obviously rarely used), and it might be
>>>>> fixed
>>>>> in a newer version of jpeglib (so the comment would be no longer
>>>>> valid, and nobody would notice that).
>>>>
>>>> We could also add a configure time check for this case for maximum
>>>> over engineering.
>>>
>>> ... which nobody wants. I suggest to apply the patch as it was sent
>>> by Roy. Stefan H. suggests to add a comment before the patch is applied=
.
>>>
>>> Both ways fix a (small) problem, so please just decide which
>>> solution you prefer.
>>
>> I applied the patch with a comment, thanks.
>>
>>
>

