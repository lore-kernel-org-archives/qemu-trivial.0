Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buN48-0001Pj-9V
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 13:11:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53259)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buN45-0001LR-0b
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:11:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <michael@walle.cc>) id 1buN42-0006Bc-Px
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 13:11:35 -0400
Received: from ssl.serverraum.org ([213.133.101.245]:49298)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <michael@walle.cc>)
	id 1buN3y-00069D-5S; Wed, 12 Oct 2016 13:11:30 -0400
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 98EA122265;
	Wed, 12 Oct 2016 19:11:24 +0200 (CEST)
Authentication-Results: ssl.serverraum.org; dmarc=none header.from=walle.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
	s=mail2016061301; t=1476292284;
	bh=CKbg2+VWLwFOW049BbUo3VxlKSEHj8WwzoRh5gBeKjI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gIM8V3/Xpr2LJA/k5oJr07+LaH4KC0vQTps+BbiR6gsoUQWvhptg6wqqq4HZe4HGw
	q9Dco7E2KLocaCC5HsRMoICIbYBzgR+qzngGvVGpuKvCZBJ/zFJfrtnuDDGyAtpjzu
	sXIHYgkpctE4voc9mpSZ4Q+9F0D9EDWuZS+l/a0s=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 12 Oct 2016 19:11:24 +0200
From: Michael Walle <michael@walle.cc>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>, Thomas Huth <huth@tuxfamily.org>
In-Reply-To: <CAFEAcA_Ofp-OPk0WBr6jyZoGW+==yzU+MT3TMjyavVV1UceSDA@mail.gmail.com>
References: <1476289396-10780-1-git-send-email-michael@walle.cc>
	<CAFEAcA_Ofp-OPk0WBr6jyZoGW+==yzU+MT3TMjyavVV1UceSDA@mail.gmail.com>
Message-ID: <03c84be8a07e80bfcbc6692ebdddf3df@walle.cc>
X-Sender: michael@walle.cc
User-Agent: Roundcube Webmail/1.1.5
X-Virus-Scanned: clamav-milter 0.99.2 at web
X-Virus-Status: Clean
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 213.133.101.245
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-lm32: fix style issue
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Oct 2016 17:11:38 -0000

Am 2016-10-12 18:35, schrieb Peter Maydell:
> On 12 October 2016 at 17:23, Michael Walle <michael@walle.cc> wrote:
>> Both branches of the ternary operator have the same expressions. Drop 
>> the
>> operator.
>> 
>> This fixes: https://bugs.launchpad.net/qemu/+bug/1414293
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  target-lm32/translate.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/target-lm32/translate.c b/target-lm32/translate.c
>> index 2d8caeb..534c17c 100644
>> --- a/target-lm32/translate.c
>> +++ b/target-lm32/translate.c
>> @@ -343,7 +343,7 @@ static void dec_calli(DisasContext *dc)
>>  static inline void gen_compare(DisasContext *dc, int cond)
>>  {
>>      int rX = (dc->format == OP_FMT_RR) ? dc->r2 : dc->r1;
>> -    int rY = (dc->format == OP_FMT_RR) ? dc->r0 : dc->r0;
>> +    int rY = dc->r0;
>>      int rZ = (dc->format == OP_FMT_RR) ? dc->r1 : -1;
>>      int i;
> 
> This checks against the processor reference manual, so:
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> but I noticed while doing the review that our LOG_DIS
> is wrong for the compare-immediates:
> 
>         LOG_DIS("cmpei r%d, r%d, %d\n", dc->r0, dc->r1,
>                 sign_extend(dc->imm16, 16));
> 
> but the processor reference manual says cmpei's mnemonic
> should have dc->r1 first and dc->r0 second.

Hi Peter,

can I drop the DISAS_LM32 macro and just always enable the 
qemu_log_mask(CPU_LOG_TB_IN_ASM)? Looking at other CPUs this is 
sometimes a (debug) compile switch (eg ppc) and sometimes its always 
enabled (tilegx).

-michael

