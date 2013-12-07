Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VpBfX-0002p8-Kh
	for mharc-qemu-trivial@gnu.org; Sat, 07 Dec 2013 01:47:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VpBfR-0002hX-PG
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 01:47:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VpBfE-0000Gh-AR
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 01:47:09 -0500
Received: from mail-we0-f172.google.com ([74.125.82.172]:57035)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1VpBfE-0000GQ-4E
	for qemu-trivial@nongnu.org; Sat, 07 Dec 2013 01:46:56 -0500
Received: by mail-we0-f172.google.com with SMTP id w62so1576853wes.17
	for <qemu-trivial@nongnu.org>; Fri, 06 Dec 2013 22:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=DL2hI+8kv2gVm0cGrPdLb6gz4MpV5XolePF6YWlILTg=;
	b=SdI4imxpY9dzvb5QHpDP9Ck65FNoz5V1CTge0KUXp1YCi8BiG1xqBJVLpxkXsSekLG
	UNy+T4DdDcOTpcvRGuNT5m5tRJiYgaXcoTpirorbMzzFfPqyoTubzqzx42LNej4xBT68
	itoyd66KJTF4NcMicUcgmFAMRaVsdnrZyDAtk4fTilRi7xmYf+6LQpRsGfeQmBKaVhdy
	4pw9FKyZ/fTt6ugf0/Es/yGgkiFGkh19jdd1PHx3Xq0ZUjbni0jzMV4faWpdSQgry2Jb
	hn6I1yr4aBPmaIeC9v3RZ9jKd99VbCCU9yXVzzfwoHLa9Gb78PJddBsKfcMgJ2vvY/rQ
	E/hw==
X-Gm-Message-State: ALoCoQkCgXxa0kax6yWpWzsG+Wh9VI64iaxenXJ/7KOFQLvNDMJgTHUGho2X3sN4myQO/TDczem7
MIME-Version: 1.0
X-Received: by 10.180.189.49 with SMTP id gf17mr5627274wic.23.1386398814954;
	Fri, 06 Dec 2013 22:46:54 -0800 (PST)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.227.13.9 with HTTP; Fri, 6 Dec 2013 22:46:54 -0800 (PST)
In-Reply-To: <CAFEAcA-fp1rZunk=20dTK1henUHnSk3tNSFT-aFxwPkb+VW8Mw@mail.gmail.com>
References: <1386355410-10805-1-git-send-email-sw@weilnetz.de>
	<52A221B9.4040407@msgid.tls.msk.ru>
	<CAFEAcA-fp1rZunk=20dTK1henUHnSk3tNSFT-aFxwPkb+VW8Mw@mail.gmail.com>
Date: Sat, 7 Dec 2013 16:46:54 +1000
X-Google-Sender-Auth: 4YPtrfEO5j4hSoq9idIga2JoL7s
Message-ID: <CAEgOgz6yYPgPsURo8agk1bK7dWsSCrxUeiVHHLQxt+1OEzOXHg@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.172
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>,
	Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/arm/highbank: Simplify
 code (memory region in device state)
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
X-List-Received-Date: Sat, 07 Dec 2013 06:47:14 -0000

On Sat, Dec 7, 2013 at 5:24 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 6 December 2013 19:12, Michael Tokarev <mjt@tls.msk.ru> wrote:
>> 06.12.2013 22:43, Stefan Weil wrote:
>>> The memory region can be included by value instead of by reference in the
>>> device state (like it is done in other SoCs).

So following on from the logic below you'd be best to just drop the
parenthetic in the commit message. The change isn't exactly aligned to
the current ARM SOCification efforts. Just the sentance on its own is
enough motivation.

>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>  hw/arm/highbank.c |    7 +++----
>>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
>>> index fe98ef1..54384b3 100644
>>> --- a/hw/arm/highbank.c
>>> +++ b/hw/arm/highbank.c
>>> @@ -125,7 +125,7 @@ typedef struct {
>>>      SysBusDevice parent_obj;
>>>      /*< public >*/
>>>
>>> -    MemoryRegion *iomem;
>>> +    MemoryRegion iomem;
>>>      uint32_t regs[NUM_REGS];
>>>  } HighbankRegsState;
>>
>> Don't we have active maintainer for arm? (Who is Cc'd on the original patch).
>
> Yeah, and there's highbank related patches currently going through
> review so it might be better for me to take this in the target-arm queue
> (though for a trivial one like this it doesn't make much difference).
>
>>> @@ -154,10 +154,9 @@ static int highbank_regs_init(SysBusDevice *dev)
>>>  {
>>>      HighbankRegsState *s = HIGHBANK_REGISTERS(dev);
>>>
>>> -    s->iomem = g_new(MemoryRegion, 1);
>>> -    memory_region_init_io(s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
>>> +    memory_region_init_io(&s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
>>>                            "highbank_regs", 0x1000);
>>
>> I know right to nothing about arm, does it have any alignment requiriments,
>> which may break here?
>
> Hmm? This is just putting the MemoryRegion struct in the HighBankRegsState
> structure rather than allocating it via g_new(). That's all host related
> and in any case is the host C compiler's problem to deal with.
>

So I guess the correct course of action (ultimately) is to:

A: Core-ify these registers.
B: Factor out all devices including Coreified regs into a SoC container.

The state struct being change here would correspond to the corified
register block and not the SoC container.

But if you were to execute step A, you would make this change upon
migration of the device state struct to the new device. The patch also
simply stands in its own right as just the right thing to do. So.

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>

Reviewed-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>

> thanks
> -- PMM
>

