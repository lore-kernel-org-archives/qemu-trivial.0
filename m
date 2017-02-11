Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ccOBS-0002eZ-9x
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2017 22:17:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ccOBP-0002d6-Rp
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 22:17:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ccOBO-0003D4-Nf
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 22:17:07 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:34816)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ccOBK-0003AZ-2d; Fri, 10 Feb 2017 22:17:02 -0500
Received: by mail-qt0-x243.google.com with SMTP id s58so6703005qtc.2;
	Fri, 10 Feb 2017 19:17:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=4XEJLHtkXPcGbx3YEWTnUFlftc2RIjmbztaxsHhQ26k=;
	b=WWm7Ykdd1V+gRJxx67dAc3q1JHpuSbRRF2X0BaXhN9IqSQtVV2SzsILB3sHkMkCtAp
	xE0oiMQy9bDnOPdf90WgzCMtgtRA394MdKOAProDbhJqz6B9PPG78ik973OXp0EMKMM7
	M/g2/swTGHRwYdDX4YFUjLmgSF1wAy8uh1YIh+8FoxNC+ZQlCOhcFUjzi1s2REka9KKd
	IA3SHlT9Pm7hb1BggpRF98JZsEJl5lIM4egtm5nK+7BmHUKLJtLMZQV5UFhXDpqm42uh
	qUdboNuvloi4uR1EUVXPVU4fAvs451Gc+DmXtWIoBcP3dNiuZGr3/6498pbtEmxLkaYm
	83Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=4XEJLHtkXPcGbx3YEWTnUFlftc2RIjmbztaxsHhQ26k=;
	b=Q+aoaIChzF5NXYvVPjc5aGoDvfEk8XZjbt2W/HlnRY9ZgWMO8gBg1kkUPvmZCiffIT
	Ccyhy5m60GM+R6MdQN+jmeUc1kNrtZkYI40scjAvu8tnbGq1kCSFUDhjA4ZinulJjLJg
	tiMdpQU5WFIirWwJ0rn2htRBJk5trV1UfhHuXIYxz/+2qNHVsUrtlpfv6Dhqu1PgFxFN
	MDbIzbCHmJi2ZAmBO8eMV1Hovhf10ZWUe5ec1QI4XgOX6pq0Lw3NH7x0+OMbHqwPf6/O
	P8AFgPjm0F0d5DZsfY5Hp5ZR6u+UJ25F4uiRS4ItylFgrZf3oUF2xFD2Q8mu/PvJwd+X
	oZKw==
X-Gm-Message-State: AMke39lTGNG42ezxXdv79c8e2xszPKBWsyPP5QtBC1tj+bcoiAqVxFXasdrNGhkgovNGUg==
X-Received: by 10.200.51.100 with SMTP id u33mr11237878qta.110.1486783020011; 
	Fri, 10 Feb 2017 19:17:00 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v63sm1225481qkc.58.2017.02.10.19.16.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 19:16:59 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
References: <20170206233931.14921-1-f4bug@amsat.org>
	<20170206233931.14921-3-f4bug@amsat.org>
	<CAKmqyKMYmNeOOogS4+yv14M2CWTbBNtBP0jnO0DQEuScSp8eYw@mail.gmail.com>
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0bb2d93b-09c5-83f6-dbd1-90b940e96dba@amsat.org>
Date: Sat, 11 Feb 2017 00:16:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <CAKmqyKMYmNeOOogS4+yv14M2CWTbBNtBP0jnO0DQEuScSp8eYw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] register: fix incorrect
 read mask
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
X-List-Received-Date: Sat, 11 Feb 2017 03:17:09 -0000


On 02/10/2017 07:19 PM, Alistair Francis wrote:
> On Mon, Feb 6, 2017 at 3:39 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> The register_read() function expects a bitmask argument.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>
> The functionality of these two patches looks good to me.
>
> I think it's weird that we convert the write function in one patch
> (when we add the function) and the read in another.
>
> I think both patches should just be squashed together. It's a pretty
> small change.
>
> Thanks,
>
> Alistair

Sure, will do in v2.

Thanks!

>
>> ---
>>  hw/core/register.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/core/register.c b/hw/core/register.c
>> index 12f4c1e62d..482e3f827a 100644
>> --- a/hw/core/register.c
>> +++ b/hw/core/register.c
>> @@ -213,6 +213,7 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
>>      RegisterInfoArray *reg_array = opaque;
>>      RegisterInfo *reg = NULL;
>>      uint64_t read_val;
>> +    uint64_t re;
>>      int i;
>>
>>      for (i = 0; i < reg_array->num_elements; i++) {
>> @@ -228,7 +229,10 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
>>          return 0;
>>      }
>>
>> -    read_val = register_read(reg, size * 8, reg_array->prefix,
>> +    /* Generate appropriate read enable mask */
>> +    re = register_enabled_mask(reg->data_size, size);
>> +
>> +    read_val = register_read(reg, re, reg_array->prefix,
>>                               reg_array->debug);
>>
>>      return extract64(read_val, 0, size * 8);
>> --
>> 2.11.0
>>
>>

