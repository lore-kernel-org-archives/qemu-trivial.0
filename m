Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4g9g-00018i-KG
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 19:50:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1V4g9a-0000ye-8m
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 19:50:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1V4g9U-00026Q-5i
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 19:50:02 -0400
Received: from mail-bk0-f50.google.com ([209.85.214.50]:55080)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1V4g9T-00026A-VC
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 19:49:56 -0400
Received: by mail-bk0-f50.google.com with SMTP id ik8so459238bkc.9
	for <qemu-trivial@nongnu.org>; Wed, 31 Jul 2013 16:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=nJQ71WDqDLLcFo4vpdXI4bbZqXuBSTElvwvv7fp4PpE=;
	b=FI3EiF7yL+QywYuOR5cgscAA5XiSPHCYuy/gxTlEu6LZZU6lHU77B7/V+Ep4vR8EvQ
	+4eaBnTtzxqeQEj+vESMVE3b+dCwn/nD5ZlbocabF3c9xfedBcVQYNGxMrizQS/w55PF
	m5k7793QbNY/73BHqmsJBPj1B8MaVY6gqDIkfRgysImOt7JI8pEoGykr0CK7vQmVRf92
	IAH4Qbnsj2sgV2BEnbrf4iuI2T9Rdvt1lootE+FUzHR4nkJqd5kROzvxdeIa9ehw59V0
	Q0Y8STr77xAHkbqfR6v7yv+qFQFTVoYaCxhSlANdatteaVPWOy/mNI1SV0n1Y7604FpM
	Rzow==
MIME-Version: 1.0
X-Received: by 10.204.3.10 with SMTP id 10mr10019604bkl.93.1375314594343; Wed,
	31 Jul 2013 16:49:54 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.229.206 with HTTP; Wed, 31 Jul 2013 16:49:54 -0700 (PDT)
In-Reply-To: <51C16755.9050700@msgid.tls.msk.ru>
References: <cover.1371553360.git.peter.crosthwaite@xilinx.com>
	<f65ba24ae67c04af46940c8cc67093894af97871.1371553360.git.peter.crosthwaite@xilinx.com>
	<51C16755.9050700@msgid.tls.msk.ru>
Date: Thu, 1 Aug 2013 09:49:54 +1000
X-Google-Sender-Auth: FeYUaa2L5DGKh9Vh_ouklrsTd1M
Message-ID: <CAEgOgz5ann=BwYLpQ1pzpPdAAn2rjwT0vn9MXY9=Df3LTjxw=A@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQnQpSzK7SmIJ/2G049v2EhMPeh2WfmThMRSn2DOB9TGHCw40XVT4FOAdqgmR9vaJJUgTXPv
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.214.50
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>, edgar.iglesias@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/5] block/nand: Factor
 out common code
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
X-List-Received-Date: Wed, 31 Jul 2013 23:50:06 -0000

On Wed, Jun 19, 2013 at 6:09 PM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 18.06.2013 15:08, peter.crosthwaite@xilinx.com wrote:
>> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>
>> Most of this computation of s->iolen is the same for both the if and
>> else paths here. Factor out the common parts outside the if.
>>
>> Cc: qemu-trivial@nongnu.org
>>
>> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>> ---
>>
>>  hw/block/nand.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/block/nand.c b/hw/block/nand.c
>> index 087ca14..6309f93 100644
>> --- a/hw/block/nand.c
>> +++ b/hw/block/nand.c
>> @@ -272,10 +272,10 @@ static void nand_command(NANDFlashState *s)
>>              break;
>>          offset = s->addr & ((1 << s->addr_shift) - 1);
>>          s->blk_load(s, s->addr, offset);
>> -        if (s->gnd)
>> -            s->iolen = (1 << s->page_shift) - offset;
>> -        else
>> -            s->iolen = (1 << s->page_shift) + (1 << s->oob_shift) - offset;
>> +        s->iolen = (1 << s->page_shift) - offset;
>> +        if (!s->gnd) {
>> +            s->iolen += 1 << s->oob_shift;
>> +        }
>
> Hm.  Can s->iolen become negative here?
>
> addr_shift can be either less or greather than page_shift.  When addr_shift
> is larger than page_shift (addr_shift=16, page_shift=11), offset may be up
> to 65535, in which case s->iolen may be -63487, even without additional
> oob_shift.
>
> I dunno if this is a concern, just.. asking.
>
> Besides, exactly the same expression is used in nand_getio() down this file,
> maybe a common function is in order? :)
>

Factored this out. Just added it to nand_blk_load_XXX().

Regards,
Peter

> And looking at this file, I think it deserves some good type changes.  For
> example, all these _shift are unsigned, and most are actually used as masks,
> in form (1<<shift), instead of directly (except of erase_shift).
>
> Thanks,
>
> /mjt
>

