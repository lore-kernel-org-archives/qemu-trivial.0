Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vp11e-00037R-6W
	for mharc-qemu-trivial@gnu.org; Fri, 06 Dec 2013 14:25:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vp10r-0002Dx-Cz
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:24:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vp10n-0000Q7-9q
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:24:33 -0500
Received: from mail-pb0-f48.google.com ([209.85.160.48]:47238)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Vp10n-0000Pz-3n
	for qemu-trivial@nongnu.org; Fri, 06 Dec 2013 14:24:29 -0500
Received: by mail-pb0-f48.google.com with SMTP id md12so1609228pbc.21
	for <qemu-trivial@nongnu.org>; Fri, 06 Dec 2013 11:24:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ul0apiFlL+Aqob8qQwUArVtQQgBS3QWflphWawqOjfw=;
	b=Gy5bsaqqCDRRvEeoXevuLjx+NG4NbCTwO6HCEEIuS26u2mJhudLWq8Y2L+ucgTCE2n
	axWkhA+9PKh28eXteN0y15FiE3FeDwWnDVfq3qfNBqaOAI8RXppK27j4cK2JH7wixQZI
	LUn7rjhFVEwHQBVyllHeI4q+/y1NP6DjcFqRbjx5oC6oqbR+5mMTqVlSWpH+i9nBDVSQ
	iptI2w2KwZHvap+wyOsmiUk/KuWTZXENT0clSCqBnRTfsZytYyiECpJtr8f71DWZQr5F
	f0t1ObBNTWA/IYSjV8bfKSSmd/9dZ5mVaHF/hn6HrQn6N4Ezd2MI6KBWDKMybH0oOndh
	4KrA==
X-Gm-Message-State: ALoCoQljrHYznpbrMeXF1nphlnDztxHkMJH8kmjNCVTp2cjtQ4EZ3kfnOicgiWYGgYR0UaCpQTTW
X-Received: by 10.66.160.2 with SMTP id xg2mr5973238pab.23.1386357868179; Fri,
	06 Dec 2013 11:24:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.70.82.227 with HTTP; Fri, 6 Dec 2013 11:24:08 -0800 (PST)
In-Reply-To: <52A221B9.4040407@msgid.tls.msk.ru>
References: <1386355410-10805-1-git-send-email-sw@weilnetz.de>
	<52A221B9.4040407@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2013 19:24:08 +0000
Message-ID: <CAFEAcA-fp1rZunk=20dTK1henUHnSk3tNSFT-aFxwPkb+VW8Mw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.48
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>,
	Mark Langsdorf <mark.langsdorf@calxeda.com>
Subject: Re: [Qemu-trivial] [PATCH] hw/arm/highbank: Simplify code (memory
 region in device state)
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
X-List-Received-Date: Fri, 06 Dec 2013 19:25:20 -0000

On 6 December 2013 19:12, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 06.12.2013 22:43, Stefan Weil wrote:
>> The memory region can be included by value instead of by reference in the
>> device state (like it is done in other SoCs).
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>  hw/arm/highbank.c |    7 +++----
>>  1 file changed, 3 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
>> index fe98ef1..54384b3 100644
>> --- a/hw/arm/highbank.c
>> +++ b/hw/arm/highbank.c
>> @@ -125,7 +125,7 @@ typedef struct {
>>      SysBusDevice parent_obj;
>>      /*< public >*/
>>
>> -    MemoryRegion *iomem;
>> +    MemoryRegion iomem;
>>      uint32_t regs[NUM_REGS];
>>  } HighbankRegsState;
>
> Don't we have active maintainer for arm? (Who is Cc'd on the original patch).

Yeah, and there's highbank related patches currently going through
review so it might be better for me to take this in the target-arm queue
(though for a trivial one like this it doesn't make much difference).

>> @@ -154,10 +154,9 @@ static int highbank_regs_init(SysBusDevice *dev)
>>  {
>>      HighbankRegsState *s = HIGHBANK_REGISTERS(dev);
>>
>> -    s->iomem = g_new(MemoryRegion, 1);
>> -    memory_region_init_io(s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
>> +    memory_region_init_io(&s->iomem, OBJECT(s), &hb_mem_ops, s->regs,
>>                            "highbank_regs", 0x1000);
>
> I know right to nothing about arm, does it have any alignment requiriments,
> which may break here?

Hmm? This is just putting the MemoryRegion struct in the HighBankRegsState
structure rather than allocating it via g_new(). That's all host related
and in any case is the host C compiler's problem to deal with.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

