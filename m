Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4Doo-00060U-Ld
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 12:30:10 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T4DoN-0005tc-6k
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 12:30:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1T4Do1-0008CP-Ce
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 12:29:43 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:43176)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1T4Dnl-0007w0-Lv; Wed, 22 Aug 2012 12:29:05 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	6E15D728002A; Wed, 22 Aug 2012 18:29:03 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id SK-AMrLW2PzM; Wed, 22 Aug 2012 18:29:03 +0200 (CEST)
Received: from [192.168.178.20] (p5086EC12.dip.t-dialin.net [80.134.236.18])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	C2A417280028; Wed, 22 Aug 2012 18:29:02 +0200 (CEST)
Message-ID: <503508CE.1020908@weilnetz.de>
Date: Wed, 22 Aug 2012 18:29:02 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <Pine.GSO.4.64.1208221718470.28960@mono>
	<5034FB7D.5050009@siemens.com>
In-Reply-To: <5034FB7D.5050009@siemens.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
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
X-List-Received-Date: Wed, 22 Aug 2012 16:30:09 -0000

Am 22.08.2012 17:32, schrieb Jan Kiszka:
> On 2012-08-22 17:19, BALATON Zoltan wrote:
>> Division with round up is the correct way to compute this even if the
>> only case where division with round down gives incorrect result is
>> probably 15 bpp. This case was explicitely patched up in one of these
>> functions but was unhandled in the other. (I'm not sure about setting
>> 16 bpp for the 15bpp case either but I left that there for now.)
>>
>> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
>> ---
>>   console.c |    5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>>   v2: Use DIV_ROUND_UP and extended commit message
>>
>> diff --git a/console.c b/console.c
>> index 4525cc7..9df1701 100644
>> --- a/console.c
>> +++ b/console.c
>> @@ -1612,7 +1612,7 @@ PixelFormat
>> qemu_different_endianness_pixelformat(int bpp)
>>       memset(&pf, 0x00, sizeof(PixelFormat));
>>
>>       pf.bits_per_pixel = bpp;
>> -    pf.bytes_per_pixel = bpp / 8;
>> +    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
>>       pf.depth = bpp == 32 ? 24 : bpp;
>>
>>       switch (bpp) {
>> @@ -1661,13 +1661,12 @@ PixelFormat qemu_default_pixelformat(int bpp)
>>       memset(&pf, 0x00, sizeof(PixelFormat));
>>
>>       pf.bits_per_pixel = bpp;
>> -    pf.bytes_per_pixel = bpp / 8;
>> +    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
>>       pf.depth = bpp == 32 ? 24 : bpp;
>>
>>       switch (bpp) {
>>           case 15:
>>               pf.bits_per_pixel = 16;
>> -            pf.bytes_per_pixel = 2;
> Removed unintentionally?
>
> Jan

15 bpp no longer needs special handling because
the computation above is fixed by the same patch,
so the removal is correct.

Stefan




