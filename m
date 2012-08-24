Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4sSN-0004nM-Ne
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:53:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4sSG-0004Os-7R
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:53:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4sSE-0004ZB-Si
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:53:35 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:52340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4sS6-0004YH-Ts; Fri, 24 Aug 2012 07:53:27 -0400
Received: by lbbgm13 with SMTP id gm13so988581lbb.4
	for <multiple recipients>; Fri, 24 Aug 2012 04:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Me7fA+OX/DTOdju8DKHfzK/awhWFge2BOaUiWvveybg=;
	b=Lzl6QyhXXV89qy8Z+WCVaRq8TZqpkYyRi5SHFB91AOG4cH8nno/hkapa3Yr1RSvjIF
	JI6mztGJb8zD0uQ7GRhoWLEFWYnV20GTePjd8nZbVyUM8TdcBL/sliHBMIK6YNDHF2jT
	wcw1kknsQf6Xd+vYL8Nujj3gs5KP3/oVYUlK6jfxErxHU3ykUP7F+kIZb3+wwFU/TOPU
	BY13LT619uKrpo63UJqXAM1/7CPa2aDdo4rxF66hjc4jjawYqFheM7WB0vfTnrp2iXQE
	ObyQ44LuFdydySQHDj+NHCw5VVc2V1lZ9y0ru5iQ5LbCj+eebDZuczwYSqf/q45NfZ5x
	sg1w==
MIME-Version: 1.0
Received: by 10.152.113.68 with SMTP id iw4mr5469611lab.50.1345809205406; Fri,
	24 Aug 2012 04:53:25 -0700 (PDT)
Received: by 10.112.99.129 with HTTP; Fri, 24 Aug 2012 04:53:25 -0700 (PDT)
In-Reply-To: <503763B1.1040205@siemens.com>
References: <Pine.GSO.4.64.1208221718470.28960@mono>
	<5034FB7D.5050009@siemens.com> <503508CE.1020908@weilnetz.de>
	<50350C58.8060306@siemens.com>
	<20120824112021.GI10867@stefanha-thinkpad.localdomain>
	<503763B1.1040205@siemens.com>
Date: Fri, 24 Aug 2012 12:53:25 +0100
Message-ID: <CAJSP0QVHjXQZQqtsKRhpKmDxdGvAqpcaF1c=FDqHafaX2_EUYA@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>,
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
X-List-Received-Date: Fri, 24 Aug 2012 11:53:42 -0000

On Fri, Aug 24, 2012 at 12:21 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:
> On 2012-08-24 13:20, Stefan Hajnoczi wrote:
>> On Wed, Aug 22, 2012 at 06:44:08PM +0200, Jan Kiszka wrote:
>>> On 2012-08-22 18:29, Stefan Weil wrote:
>>>> Am 22.08.2012 17:32, schrieb Jan Kiszka:
>>>>> On 2012-08-22 17:19, BALATON Zoltan wrote:
>>>>>> Division with round up is the correct way to compute this even if the
>>>>>> only case where division with round down gives incorrect result is
>>>>>> probably 15 bpp. This case was explicitely patched up in one of these
>>>>>> functions but was unhandled in the other. (I'm not sure about setting
>>>>>> 16 bpp for the 15bpp case either but I left that there for now.)
>>>>>>
>>>>>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>>>>>> ---
>>>>>>   console.c |    5 ++---
>>>>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>>>>
>>>>>>   v2: Use DIV_ROUND_UP and extended commit message
>>>>>>
>>>>>> diff --git a/console.c b/console.c
>>>>>> index 4525cc7..9df1701 100644
>>>>>> --- a/console.c
>>>>>> +++ b/console.c
>>>>>> @@ -1612,7 +1612,7 @@ PixelFormat
>>>>>> qemu_different_endianness_pixelformat(int bpp)
>>>>>>       memset(&pf, 0x00, sizeof(PixelFormat));
>>>>>>
>>>>>>       pf.bits_per_pixel = bpp;
>>>>>> -    pf.bytes_per_pixel = bpp / 8;
>>>>>> +    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
>>>>>>       pf.depth = bpp == 32 ? 24 : bpp;
>>>>>>
>>>>>>       switch (bpp) {
>>>>>> @@ -1661,13 +1661,12 @@ PixelFormat qemu_default_pixelformat(int bpp)
>>>>>>       memset(&pf, 0x00, sizeof(PixelFormat));
>>>>>>
>>>>>>       pf.bits_per_pixel = bpp;
>>>>>> -    pf.bytes_per_pixel = bpp / 8;
>>>>>> +    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
>>>>>>       pf.depth = bpp == 32 ? 24 : bpp;
>>>>>>
>>>>>>       switch (bpp) {
>>>>>>           case 15:
>>>>>>               pf.bits_per_pixel = 16;
>>>>>> -            pf.bytes_per_pixel = 2;
>>>>> Removed unintentionally?
>>>>>
>>>>> Jan
>>>>
>>>> 15 bpp no longer needs special handling because
>>>> the computation above is fixed by the same patch,
>>>> so the removal is correct.
>>>
>>> Ok, actually starting to look at this code: This is apparently a code
>>> cleanup, not a bug fix like the subject suggests. No valid input for
>>> could have actually triggered the round-up issue. Please declare it as
>>> such. Bonus for abort() on the invalid default cases.
>>
>> I have updated the commit message to "console: Clean up bytes per pixel
>> calculation".
>
> I think there was a v3 on the list, didn't check the details yet, though.

Yes but it just adds more stuff that should be in separate patches.
Let's take v2 and additional changes can be done separately.

Stefan

