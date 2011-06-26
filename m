Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QavvG-0004Mf-67
	for mharc-qemu-trivial@gnu.org; Sun, 26 Jun 2011 16:27:14 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QavvC-0004M1-Cz
	for qemu-trivial@nongnu.org; Sun, 26 Jun 2011 16:27:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1QavvB-0002Gg-6d
	for qemu-trivial@nongnu.org; Sun, 26 Jun 2011 16:27:10 -0400
Received: from mail-qy0-f180.google.com ([209.85.216.180]:57637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1Qavv8-0002GM-CS; Sun, 26 Jun 2011 16:27:06 -0400
Received: by qyk30 with SMTP id 30so2789330qyk.4
	for <multiple recipients>; Sun, 26 Jun 2011 13:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=YukNmpvobUhMQnyPDTHqUG3tpoI+QnmY52rbWIrroEE=;
	b=jJiHPS8CLWI4h9z2Iau3XcgzMvo+rNPTaFdlwnnfSQV4pTwSeaOCQ8AUoO34EYWCOc
	1mock10z2RBDLYeCToHpj0oE7rtQY/OuCe5xqdLjfqqC6u+SSsYq73rFEe79nf1B8Kwt
	60mV7zOoLrmC/XTHtkp6i5SWx4NriGnThGIPE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=PQbuKlVCQvQHotKVjzy6P+qGvmsXBAyVEYRXVFGbWE9LDvzZHiFj/t7UAm9q1Wq2It
	ZrKV+tnKhUmrw1dItSDh7JL87Exjb45YVRNe7wUm2o3Q4c3mtKOIWpPxnwFgfF38l/SL
	Wtwfa+iYzjnaLNxnO/fc4ivU3mRjoJBxJ2K9A=
Received: by 10.224.126.71 with SMTP id b7mr1505179qas.205.1309120025333; Sun,
	26 Jun 2011 13:27:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.73.129 with HTTP; Sun, 26 Jun 2011 13:26:45 -0700 (PDT)
In-Reply-To: <4E07907F.1060703@mail.berlios.de>
References: <BANLkTika6YmzRYAnta8TgQGpLSpoAdpKNQ@mail.gmail.com>
	<4DFC636D.9090800@mail.berlios.de>
	<20110623135202.GA12765@stefanha-thinkpad.localdomain>
	<4E03564A.5060201@mail.berlios.de>
	<BANLkTikP6ietymb3Cg2V5TSPpnjMyWacqA@mail.gmail.com>
	<4E07907F.1060703@mail.berlios.de>
From: Blue Swirl <blauwirbel@gmail.com>
Date: Sun, 26 Jun 2011 23:26:45 +0300
Message-ID: <BANLkTimZkQ9qBC+Rt0+CCV4TNKTRgttr9A@mail.gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.180
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
X-List-Received-Date: Sun, 26 Jun 2011 20:27:12 -0000

On Sun, Jun 26, 2011 at 11:03 PM, Stefan Weil <weil@mail.berlios.de> wrote:
> Am 26.06.2011 20:06, schrieb Blue Swirl:
>>
>> On Thu, Jun 23, 2011 at 6:05 PM, Stefan Weil<weil@mail.berlios.de> =C2=
=A0wrote:
>>>
>>> Am 23.06.2011 15:52, schrieb Stefan Hajnoczi:
>>>>
>>>> On Sat, Jun 18, 2011 at 10:35:57AM +0200, Stefan Weil wrote:
>>>>>
>>>>> Am 18.06.2011 07:13, schrieb Roy Tam:
>>>>>>
>>>>>> This patch fix conflicting types for 'INT32' in basetsd.h in includi=
ng
>>>>>> qemu-common.h first.
>>>>>>
>>>>>>
>>>>>> Sign-off-by: Roy Tam<roytam@gmail.com>
>>>>>> --
>
> ...
>>>>>
>>>>> The conflicting declaration is in jmorecfg.h which is included from
>>>>> jpeglib.h.
>>>>
>>>> Is the problem that the Windows headers included from qemu-common.h tr=
y
>>>> to #define INT32?
>>>> http://msdn.microsoft.com/en-us/library/aa383751(v=3Dvs.85).aspx
>>>>
>>>> In that case I think an explicit fix is better:
>>>>
>>>> #ifdef _WIN32
>>>> /* Include this before jpeglib.h for the INT32 definition */
>>>> #include<basetsd.h>
>>>> #endif
>>>>
>>>> ...followed by png/jpeg includes...
>>>>
>>>> Simply moving qemu-common.h provides no hints and is rather indirect.
>>>> Someone may move it back in the future.
>>>>
>>>> Stefan
>>>
>>> INT32 is declared in basetsd.h which is included from windows.h
>>> (with some indirections) which is included from qemu-os-win32.h
>>> which is included from qemu-common.h.
>>>
>>> INT32 is not a #define, but a data type (typedef) and very common
>>> for w32 compilations. Windows programmers don't include basetsd.h
>>> directly, but usually use windows.h.
>>>
>>> Including qemu-common.h right at the beginning (after config.h where
>>> needed) should be good practice for QEMU source code - like this:
>>>
>>> #include "config.h" =C2=A0 =C2=A0 =C2=A0 =C2=A0/* optional */
>>> #include "qemu-common.h"
>>> #include <system includes> /* without those that are included from
>>> qemu-common.h */
>>> ...
>>> #include "other local includes"
>>> ...
>>>
>>> As long as the maintainers don't accept patches which simply move
>>> qemu-common.h, there is no danger. :-)
>>>
>>> Of course a comment might be added. In most cases, I'm a great friend
>>> of good comments, but in this special case, I don't think it is
>>> necessary.
>>> It's a very special case of a typedef conflict caused by the mingw32
>>> version of jpeglib (which is obviously rarely used), and it might be
>>> fixed
>>> in a newer version of jpeglib (so the comment would be no longer
>>> valid, and nobody would notice that).
>>
>> We could also add a configure time check for this case for maximum
>> over engineering.
>
> ... which nobody wants. I suggest to apply the patch as it was sent
> by Roy. Stefan H. suggests to add a comment before the patch is applied.
>
> Both ways fix a (small) problem, so please just decide which
> solution you prefer.

I applied the patch with a comment, thanks.

