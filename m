Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4EEI-0006Lo-El
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 12:56:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54999)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1T4EEF-0006EV-OU
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 12:56:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1T4EE7-0003v4-QF
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 12:56:27 -0400
Received: from goliath.siemens.de ([192.35.17.28]:33703)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1T4EE7-0003uL-FZ; Wed, 22 Aug 2012 12:56:19 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id q7MGuFPd022021;
	Wed, 22 Aug 2012 18:56:16 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q7MGuFYW029546;
	Wed, 22 Aug 2012 18:56:15 +0200
Message-ID: <50350F2F.1060900@siemens.com>
Date: Wed, 22 Aug 2012 18:56:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <Pine.GSO.4.64.1208221718470.28960@mono>
	<5034FB7D.5050009@siemens.com> <503508CE.1020908@weilnetz.de>
	<50350C58.8060306@siemens.com>
In-Reply-To: <50350C58.8060306@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.28
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] console: Correct
 computation of bytes per pixel from bits per pixel
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
X-List-Received-Date: Wed, 22 Aug 2012 16:56:29 -0000

On 2012-08-22 18:44, Jan Kiszka wrote:
> On 2012-08-22 18:29, Stefan Weil wrote:
>> Am 22.08.2012 17:32, schrieb Jan Kiszka:
>>> On 2012-08-22 17:19, BALATON Zoltan wrote:
>>>> Division with round up is the correct way to compute this even if the
>>>> only case where division with round down gives incorrect result is
>>>> probably 15 bpp. This case was explicitely patched up in one of these
>>>> functions but was unhandled in the other. (I'm not sure about setting
>>>> 16 bpp for the 15bpp case either but I left that there for now.)
>>>>
>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>> ---
>>>>   console.c |    5 ++---
>>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>>
>>>>   v2: Use DIV_ROUND_UP and extended commit message
>>>>
>>>> diff --git a/console.c b/console.c
>>>> index 4525cc7..9df1701 100644
>>>> --- a/console.c
>>>> +++ b/console.c
>>>> @@ -1612,7 +1612,7 @@ PixelFormat
>>>> qemu_different_endianness_pixelformat(int bpp)
>>>>       memset(&pf, 0x00, sizeof(PixelFormat));
>>>>
>>>>       pf.bits_per_pixel = bpp;
>>>> -    pf.bytes_per_pixel = bpp / 8;
>>>> +    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
>>>>       pf.depth = bpp == 32 ? 24 : bpp;
>>>>
>>>>       switch (bpp) {
>>>> @@ -1661,13 +1661,12 @@ PixelFormat qemu_default_pixelformat(int bpp)
>>>>       memset(&pf, 0x00, sizeof(PixelFormat));
>>>>
>>>>       pf.bits_per_pixel = bpp;
>>>> -    pf.bytes_per_pixel = bpp / 8;
>>>> +    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
>>>>       pf.depth = bpp == 32 ? 24 : bpp;
>>>>
>>>>       switch (bpp) {
>>>>           case 15:
>>>>               pf.bits_per_pixel = 16;
>>>> -            pf.bytes_per_pixel = 2;
>>> Removed unintentionally?
>>>
>>> Jan
>>
>> 15 bpp no longer needs special handling because
>> the computation above is fixed by the same patch,
>> so the removal is correct.
> 
> Ok, actually starting to look at this code: This is apparently a code
> cleanup, not a bug fix like the subject suggests. No valid input for
> could have actually triggered the round-up issue. Please declare it as
> such. Bonus for abort() on the invalid default cases.

Well, do not abort on bpp == 0, the curses case.

Also, qemu_different_endianness_pixelformat is currently only called
with 16 or 32 bpp (see vga.c), but only handles 24 and 32. Fishy...

Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SDP-DE
Corporate Competence Center Embedded Linux

