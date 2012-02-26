Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S1jJ0-0007Qz-2t
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2012 13:58:46 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S1jIw-0007Ey-PD
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 13:58:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1S1jIv-0007LZ-KI
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2012 13:58:42 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:59945)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1S1jIs-0007LG-Sv; Sun, 26 Feb 2012 13:58:39 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	EABFE728009A; Sun, 26 Feb 2012 19:58:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id wdwvyFP5bsvt; Sun, 26 Feb 2012 19:58:37 +0100 (CET)
Received: from [192.168.178.20] (p5086FEE3.dip.t-dialin.net [80.134.254.227])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	133017280013; Sun, 26 Feb 2012 19:58:37 +0100 (CET)
Message-ID: <4F4A80DC.6000106@weilnetz.de>
Date: Sun, 26 Feb 2012 19:58:36 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.27) Gecko/20120216 Thunderbird/3.1.19
MIME-Version: 1.0
To: Anthony Liguori <anthony@codemonkey.ws>
References: <1330263596-4988-1-git-send-email-sw@weilnetz.de>
	<4F4A6041.5060102@codemonkey.ws>
In-Reply-To: <4F4A6041.5060102@codemonkey.ws>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.47.199.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix spelling in comments
	(iff -> if)
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
X-List-Received-Date: Sun, 26 Feb 2012 18:58:44 -0000

Am 26.02.2012 17:39, schrieb Anthony Liguori:
> On 02/26/2012 07:39 AM, Stefan Weil wrote:
>> Signed-off-by: Stefan Weil<sw@weilnetz.de>
>> ---
>>   a.out.h                |    2 +-
>>   arm-dis.c              |   22 +++++++++++-----------
>>   block.c                |    2 +-
>>   block/qcow2-refcount.c |    4 ++--
>>   hw/alpha_typhoon.c     |    2 +-
>>   hw/hid.h               |    2 +-
>>   hw/pcnet.c             |    2 +-
>>   m68k-dis.c             |    4 ++--
>>   memory.h               |    4 ++--
>>   monitor.c              |    2 +-
>>   net/socket.c           |    2 +-
>>   qemu-img.c             |    2 +-
>>   tcg/hppa/tcg-target.c  |    6 +++---
>>   13 files changed, 28 insertions(+), 28 deletions(-)
>>
>> diff --git a/a.out.h b/a.out.h
>> index 33ca7f7..7ea8d5a 100644
>> --- a/a.out.h
>> +++ b/a.out.h
>> @@ -136,7 +136,7 @@ struct external_scnhdr {
>>    */
>>   struct external_lineno {
>>     union {
>> -    host_ulong l_symndx; /* function name symbol index, iff l_lnno 0 */
>
> I don't know if this is the intention but this may be short hand for 
> 'if and only if'.  I do use this short hand quite a bit myself.
>
> http://en.wikipedia.org/wiki/If_and_only_if
>
> Regards,
>
> Anthony Liguori

Thank you for this information which was new for me.

I reviewed my own patch, and there are indeed some 'iff' which might
be used for 'if and only if'. Others cannot have this meaning because
there are several alternatives with the same result. For the
description of function return values 'if and only if' also looks strange.
Some comments just translate an if statement in text.
Here 'if and only if' would not match the C code which only says 'if'.

I'll send new patches for these different categories, then it will
be easier to accept or reject them.

Many authors regard "iff" as unsuitable in formal writing
(citation from Wikipedia).Personally, I'd also prefer to see
'if and only if' in full length or in symbolic notation (<==>)
when this is the intention, not an abbreviation like 'iff'.

Regards,

Stefan Weil


