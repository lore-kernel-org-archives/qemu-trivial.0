Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UpDWn-0004pf-T6
	for mharc-qemu-trivial@gnu.org; Wed, 19 Jun 2013 04:14:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UpDWj-0004lH-SM
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:14:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UpDWh-0000w7-3P
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:14:01 -0400
Received: from mail-bk0-x236.google.com ([2a00:1450:4008:c01::236]:53714)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UpDWg-0000vr-TO
	for qemu-trivial@nongnu.org; Wed, 19 Jun 2013 04:13:59 -0400
Received: by mail-bk0-f54.google.com with SMTP id it16so2208013bkc.13
	for <qemu-trivial@nongnu.org>; Wed, 19 Jun 2013 01:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=tLCxhSz33jy3ZKFUJn+A+LR/cPkevR9F/2ydhVYDX9A=;
	b=oDdcHavBvkGSWoMcFzhYCy6yLc0TBJCBR3WlVi+DVlLxCDKb7MLuEZ7IBdAiqMrApG
	y/kUNiympF667l+8QgiKJGtJd3pOO7uSgU59U4d8dh/3AcyENJ6pJZNm3DCDhjaDqwLS
	0nwPStSQwtgtb64/1JlUwZ4doq5BvsPwUwqGtDI38fUrHigHwGzDgmOQQdm12RYquVzC
	3Egh2NRz6HZDeQVR/Zi5DtrEfMpcvarzYwU0BwK6Tv1k24kYPxxZqkTcOKjyc15RCc9K
	PgbFpXdLhl3hSUVGIKH/NYtJl1GtKDae293zgzn71upu4H1xPV6s2/vYrWqznzL7x14z
	LV0A==
MIME-Version: 1.0
X-Received: by 10.204.55.201 with SMTP id v9mr221022bkg.149.1371629637819;
	Wed, 19 Jun 2013 01:13:57 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Wed, 19 Jun 2013 01:13:57 -0700 (PDT)
In-Reply-To: <51C16755.9050700@msgid.tls.msk.ru>
References: <cover.1371553360.git.peter.crosthwaite@xilinx.com>
	<f65ba24ae67c04af46940c8cc67093894af97871.1371553360.git.peter.crosthwaite@xilinx.com>
	<51C16755.9050700@msgid.tls.msk.ru>
Date: Wed, 19 Jun 2013 18:13:57 +1000
X-Google-Sender-Auth: w5PDFo5oK7c4-Dckx-4NdZL9C44
Message-ID: <CAEgOgz4rOGjnaHEV9v88SiLS3MpWTrpfaf2B7yw9mU-B5GYq9Q@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQm6q413C4rF5i3YCKtLpoUtHGxRaZ2jwQi5N2xGS/ftItsQRD6Kje65BkZeHm0M8W79wg5b
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::236
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
X-List-Received-Date: Wed, 19 Jun 2013 08:14:04 -0000

Hi Michael,

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
> And looking at this file, I think it deserves some good type changes.  For
> example, all these _shift are unsigned, and most are actually used as masks,
> in form (1<<shift), instead of directly (except of erase_shift).
>

All sounds fair. Ill have another look in the context of type
changing, and factoring out some commonality. Your able to take P2
without conflict? :)

Regards,
Peter

> Thanks,
>
> /mjt
>

