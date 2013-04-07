Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UOiWm-00021R-Fs
	for mharc-qemu-trivial@gnu.org; Sun, 07 Apr 2013 01:52:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiWj-0001yZ-Ic
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:52:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiWg-0000WB-L8
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:52:29 -0400
Received: from mail-bk0-x236.google.com ([2a00:1450:4008:c01::236]:38993)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UOiWg-0000Vr-Em
	for qemu-trivial@nongnu.org; Sun, 07 Apr 2013 01:52:26 -0400
Received: by mail-bk0-f54.google.com with SMTP id q16so2607110bkw.41
	for <qemu-trivial@nongnu.org>; Sat, 06 Apr 2013 22:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=hNvI/DrHyZHqkNcEt45TzPgVOVtVvFjr2Pa4wYAfF2E=;
	b=Ri84JxSCH5B8J8OUBC6W3nUkyMuocKxsFUMOkl7MHhKQyrMJaePJmLSy3xAba9r99C
	23AzeAscWptpGjwcLY5WxQUNIigIRf1KkQ4sr8w2ch5tlD23XORZZ822b9508S/YfOnw
	2jBLpHFiKDBIpX/neAgIF3ujrCcHjpp9/Fti9cKuTAKLGMfzLAB1QASyoTyI6/p5Tlba
	XC28ylp2dNXnEj4123ab/usL6Du9VBZO97KWuHTZCbGdxEkJcDV0xU6AU2mMm7UgqwNN
	WI856+BM3YN6+CQdd6xvLZjn40gcLc4FH7wTbl4w6nrkXc89Pj9erRdoxLxeVWXC4Um3
	5BSw==
MIME-Version: 1.0
X-Received: by 10.204.188.81 with SMTP id cz17mr9063794bkb.91.1365313945205;
	Sat, 06 Apr 2013 22:52:25 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.21.8 with HTTP; Sat, 6 Apr 2013 22:52:25 -0700 (PDT)
In-Reply-To: <20130403065056.GD21321@smtp.vpn>
References: <cover.1364961975.git.peter.crosthwaite@xilinx.com>
	<ef1ea44a6c6f5d9846c3492006094044bbd805c3.1364961975.git.peter.crosthwaite@xilinx.com>
	<20130403065056.GD21321@smtp.vpn>
Date: Sun, 7 Apr 2013 15:52:25 +1000
X-Google-Sender-Auth: ZDD9SHRZ4-TZ31pz6DgHsU1ZRn0
Message-ID: <CAEgOgz4OqAn4p_x2xVp-jrcQjjpNFQ50s36HPRRGqfKyMrSOig@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
X-Gm-Message-State: ALoCoQm4EOXSllwn0hiFWCbQHAFO2Q35e30UmoslvpAyVV9PX94tqUkQ0/dX2eYxmknjZmZ1LZIT
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/4] m25p80: Fix debug
	messages.
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
X-List-Received-Date: Sun, 07 Apr 2013 05:52:30 -0000

Hi Edgar,

On Wed, Apr 3, 2013 at 4:50 PM, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
> On Wed, Apr 03, 2013 at 02:09:16PM +1000, Peter Crosthwaite wrote:
>> Some dodgy casts were making a mess of these msgs.
>
>
> Hi Peter
>
>>
>> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>> ---
>>
>>  hw/m25p80.c |    6 +++---
>>  1 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/m25p80.c b/hw/m25p80.c
>> index 55e9d0d..34b476b 100644
>> --- a/hw/m25p80.c
>> +++ b/hw/m25p80.c
>> @@ -538,15 +538,15 @@ static uint32_t m25p80_transfer8(SSISlave *ss, uint32_t tx)
>>      switch (s->state) {
>>
>>      case STATE_PAGE_PROGRAM:
>> -        DB_PRINT("page program cur_addr=%lx data=%x\n", s->cur_addr,
>> -                 (uint8_t)tx);
>> +        DB_PRINT("page program cur_addr=%lx data=%x\n", (unsigned)s->cur_addr,
>
> Shouldn't this be using PRIx64 for cur_addr?
>

Yes, fixed in v2. Also used PRIx8 for the uint8_ts around the place.

Regards,
Peter

>
>> +                 (unsigned)(uint8_t)tx);
>>          flash_write8(s, s->cur_addr, (uint8_t)tx);
>>          s->cur_addr++;
>>          break;
>>
>>      case STATE_READ:
>>          r = s->storage[s->cur_addr];
>> -        DB_PRINT("READ 0x%lx=%x\n", s->cur_addr, r);
>> +        DB_PRINT("READ 0x%lx=%x\n", (unsigned)s->cur_addr, (unsigned)r);
>
>
> same here.
>
>
>>          s->cur_addr = (s->cur_addr + 1) % s->size;
>>          break;
>>
>> --
>> 1.7.0.4
>>
>>
>

