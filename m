Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHUyp-0003Kh-68
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 10:26:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHUyn-0003K6-1a
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 10:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHUyi-00037R-PG
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 10:26:48 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40067)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHUyi-0002ur-H3
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 10:26:44 -0400
Received: by mail-wr1-f66.google.com with SMTP id i17-v6so12776592wre.7
	for <qemu-trivial@nongnu.org>; Tue, 30 Oct 2018 07:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6nEYi0lCcDjUujqcir5OWPXfN0ltTyGHaALnxtDBiss=;
	b=A84F3MM1pSfpohwLjUqYYuXskR5W1TMuPHRTZvQay0rBG0aCtegg8d4d4nMb60BfIH
	Fauo9LLonSYgJpnLgW75WCoyBylmK/d5OG+QmqAYxvS22qIYo+1eUI7vU5HUvGtPN/Tb
	UBXyRI+N4SfX4zK8G9diIPvRh4LDI5J57PpQBf7ewF1TbiotYRhP5OKjkypS5YANwig2
	p+eKxH0hyOXaeCzikDMKuA9YrrJs1nWj8I5f0F86qyyNTRKtm/TP7XBTSJ9LnVN3dMn4
	BxQnuLcSkRWYS60/Anr0FPLjQzuhbiIl4Pf0dOouM8DUeY0nG4q8fxJHe5nZ510WSLVX
	NJbw==
X-Gm-Message-State: AGRZ1gK2X0jctfObCEIh5dYNPOu3Phq3soCI6s1jpOniViV6wQXsoxlb
	lZr+DuV3TE8ya0TyupFUS/+cFg==
X-Google-Smtp-Source: AJdET5fOPkuRERIVpnm98ed9Zya6aeBQP/E8Tt6O7KcTcy6UdkmEqQWIiE1erEKWlCej3bTVVPqKaA==
X-Received: by 2002:a5d:4406:: with SMTP id
	z6-v6mr4733173wrq.294.1540909585235; 
	Tue, 30 Oct 2018 07:26:25 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	x139-v6sm27512909wme.3.2018.10.30.07.26.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Oct 2018 07:26:24 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>
References: <20181030114048.21527-1-philmd@redhat.com>
	<20181030114048.21527-2-philmd@redhat.com>
	<CAFEAcA-yrZY3QD7ecOkQHU18qnU2y=G-QP+=ZZMhhnKTWwoVVw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bb6a600f-861e-57dd-0bdb-108eccbaf7fa@redhat.com>
Date: Tue, 30 Oct 2018 15:26:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-yrZY3QD7ecOkQHU18qnU2y=G-QP+=ZZMhhnKTWwoVVw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] hw/arm/xilinx_zynq: Use the
 ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 30 Oct 2018 14:26:50 -0000

On 30/10/18 15:07, Peter Maydell wrote:
> On 30 October 2018 at 11:40, Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   hw/arm/xilinx_zynq.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
>> index f1496d2927..57497b0c4d 100644
>> --- a/hw/arm/xilinx_zynq.c
>> +++ b/hw/arm/xilinx_zynq.c
>> @@ -294,7 +294,7 @@ static void zynq_init(MachineState *machine)
>>       busdev = SYS_BUS_DEVICE(dev);
>>       sysbus_mmio_map(busdev, 0, 0xF8003000);
>>       sysbus_connect_irq(busdev, 0, pic[45-IRQ_OFFSET]); /* abort irq line */
>> -    for (n = 0; n < 8; ++n) { /* event irqs */
>> +    for (n = 0; n < ARRAY_SIZE(dma_irqs); ++n) { /* event irqs */
>>           sysbus_connect_irq(busdev, n + 1, pic[dma_irqs[n] - IRQ_OFFSET]);
>>       }
>>
>> --
>> 2.17.2
> 
> Since this isn't related to the other patch, I'll just apply
> it to target-arm.next to save you carrying it around.

Thank you!

