Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TEREy-0005A3-Ht
	for mharc-qemu-trivial@gnu.org; Wed, 19 Sep 2012 16:51:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TEREs-0004qa-71
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 16:51:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TEREn-0006YJ-Qw
	for qemu-trivial@nongnu.org; Wed, 19 Sep 2012 16:51:18 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:54962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TEREi-0006Sc-AW; Wed, 19 Sep 2012 16:51:08 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	88D847280033; Wed, 19 Sep 2012 22:51:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id SIujJBRoFrsi; Wed, 19 Sep 2012 22:51:06 +0200 (CEST)
Received: from [192.168.178.20] (p54AD9A97.dip.t-dialin.net [84.173.154.151])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	0BB3E7280032; Wed, 19 Sep 2012 22:51:06 +0200 (CEST)
Message-ID: <505A3039.3070404@weilnetz.de>
Date: Wed, 19 Sep 2012 22:51:05 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1348072874-2096-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA8Yc1V1jnqrsOPT-JVgNX2RmkM2RoZUg2DzAHtW+dWtUA@mail.gmail.com>
In-Reply-To: <CAFEAcA8Yc1V1jnqrsOPT-JVgNX2RmkM2RoZUg2DzAHtW+dWtUA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pflash: Avoid warnings from
	coverity
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
X-List-Received-Date: Wed, 19 Sep 2012 20:51:22 -0000

Am 19.09.2012 18:45, schrieb Peter Maydell:
> On 19 September 2012 17:41, Stefan Weil <sw@weilnetz.de> wrote:
>> hw/pflash_cfi01.c:209:
>> check_return: Calling function "bdrv_write" without checking return value (as is done elsewhere 35 out of 37 times).
>>
>> hw/pflash_cfi02.c:144:
>> unterminated_default: The default case is not terminated by a 'break' statement.
>>
>> hw/pflash_cfi02.c:238:
>> check_return: Calling function "bdrv_write" without checking return value (as is done elsewhere 35 out of 37 times).
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   hw/pflash_cfi01.c |    6 ++++--
>>   hw/pflash_cfi02.c |    7 +++++--
>>   2 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/pflash_cfi01.c b/hw/pflash_cfi01.c
>> index 56ed33f..27ae4aa 100644
>> --- a/hw/pflash_cfi01.c
>> +++ b/hw/pflash_cfi01.c
>> @@ -205,8 +205,10 @@ static void pflash_update(pflash_t *pfl, int offset,
>>           /* round to sectors */
>>           offset = offset >> 9;
>>           offset_end = (offset_end + 511) >> 9;
>> -        bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
>> -                   offset_end - offset);
>> +        if (bdrv_write(pfl->bs, offset, pfl->storage + (offset << 9),
>> +                       offset_end - offset) == -1) {
>> +            fprintf(stderr, "pflash: Error writing to flash storage\n");
>> +        }
> ...shouldn't we be propagating the write error up to the guest?
> It feels like this change is just silencing the coverity error
> without actually fixing the underlying problem.
>
> -- PMM

As far as I know, there is no concept how a flash memory
can report a write error. Flash memory which cannot be
written is unusable.

hw/nand.c uses a similar handling for write errors,
but writes the error message to stdout (no good idea).

- Stefan


