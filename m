Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZlAr-0005BZ-Jf
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 17:45:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZlAp-00059x-E6
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:45:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZlAo-0006Lz-Hi
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:45:55 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36099)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZlAi-0006KA-9c; Mon, 24 Jul 2017 17:45:48 -0400
Received: by mail-qk0-x244.google.com with SMTP id d136so11124460qkg.3;
	Mon, 24 Jul 2017 14:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=S6Wu+dyvrbMyoUrlWli4uVYhs73JhK5iAhS4lZXXDrU=;
	b=bj1s+92O8oeTfdWZHdbLwXtgKlFLWSxckzleN9ttuD1OVs/LWjNAQeg1nzfY1pEQRM
	q4HnbKclJZvZN90Hw15FtPqQR/YRXgzYkRYwn0rsfUpTMDZSQ48rV5Q4ZGsAYjL4TDBE
	wzGWpUK73fjqF+UkjtTFXKgWbfRYUXz5wTYHMqyD1Fjwqv8jrFILYtuUP7HpzseOPDEq
	9XOciY0KMxUrOQhbEt0ZGqDDZZ4oxMRRHR4uZH+yIAq/+d1m1Rm2MusECWkRqT+wD6lP
	9k2gFKHfDQnB4alH+Oh+ks10bqT07CP4rZqDyiezc2uSOeQUZ0l4u3jj7gu8kkCOYVGC
	Kt1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=S6Wu+dyvrbMyoUrlWli4uVYhs73JhK5iAhS4lZXXDrU=;
	b=pNoawa4Usmrn4Kv56AjVH8Gngs8HxGgXuDbgoL+nvWLy8HDS3bYExtkkqDyphpbtOC
	mxCArromWHFiiLX9DtuBcDiu90C94RorU/BlLRwg6PDHDWqhfo4zZLYJP9rtmI/Adwmz
	hw7MO7sqbLA0H03RqH7twjuyTZ/Gej3zuVB/lR7cfXhz5sqxX9bH92DPVtWImjThZatX
	gzMrq5/q+wyEWp2kcj05ufBxwhxb7zJSuD01FbW/DXbX52gImo9Hgxjyh+oBTmVCYjy6
	Ohnw6pJc31Pj+lqaS5sSG7wi0LLV2p247ERwph3xcf9m2oswx0iZwH5K2MWnkN1UOH8u
	s1ww==
X-Gm-Message-State: AIVw113jZ92iKxvAvXPshwom3QSDhmwssZkv/+3tl6VnzP6Zhq+Y+FvE
	TIJQW3oRk2FfkPHIxmzAYQ==
X-Received: by 10.55.76.200 with SMTP id z191mr21012465qka.8.1500932747314;
	Mon, 24 Jul 2017 14:45:47 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9311788qtt.18.2017.07.24.14.45.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 14:45:46 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-23-f4bug@amsat.org>
	<CAFEAcA9dciLWNYce7+4HjW1Cu4pEJ1V9gHQ2pokBECCj0mp1QA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1c5022a5-8036-36b7-d167-4c187ea7dbc2@amsat.org>
Date: Mon, 24 Jul 2017 18:45:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dciLWNYce7+4HjW1Cu4pEJ1V9gHQ2pokBECCj0mp1QA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [PATCH for 2.10 22/35] arm/vexpress: fix
 potential memory leak
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
X-List-Received-Date: Mon, 24 Jul 2017 21:45:56 -0000

On 07/24/2017 06:11 PM, Peter Maydell wrote:
> On 24 July 2017 at 19:27, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Reorder to only allocate if required.
>>
>> hw/arm/vexpress.c:667:13: warning: Potential leak of memory pointed to by 'flashalias'
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/arm/vexpress.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
>> index 528c65ddb6..76c4d84482 100644
>> --- a/hw/arm/vexpress.c
>> +++ b/hw/arm/vexpress.c
>> @@ -553,8 +553,6 @@ static void vexpress_common_init(MachineState *machine)
>>       MemoryRegion *sysmem = get_system_memory();
>>       MemoryRegion *vram = g_new(MemoryRegion, 1);
>>       MemoryRegion *sram = g_new(MemoryRegion, 1);
>> -    MemoryRegion *flashalias = g_new(MemoryRegion, 1);
>> -    MemoryRegion *flash0mem;
>>       const hwaddr *map = daughterboard->motherboard_map;
>>       int i;
>>
>> @@ -657,6 +655,9 @@ static void vexpress_common_init(MachineState *machine)
>>       }
>>
>>       if (map[VE_NORFLASHALIAS] != -1) {
>> +        MemoryRegion *flashalias = g_new(MemoryRegion, 1);
>> +        MemoryRegion *flash0mem;
>> +
>>           /* Map flash 0 as an alias into low memory */
>>           flash0mem = sysbus_mmio_get_region(SYS_BUS_DEVICE(pflash0), 0);
>>           memory_region_init_alias(flashalias, NULL, "vexpress.flashalias",
>> --
>> 2.13.3
> 
> flashalias is no different from any of the other MemoryRegion*
> variables we allocate here with g_new() -- they all
> leak, and it doesn't matter because the function
> runs once and we want the MemoryRegions to survive
> until the end of the simulation.
> 
> These days we could in theory clean this up by
> switching from doing g_new() to having a set of
> MemoryRegion fields in the VexpressMachineState
> struct (compare hw/arm/mps2.c).

I agree with the analyzer here, why allocate something you'll never use?
However this is not the case here since in your commit 6ec1588e097 both 
legacy/a9 and aseries/a15 use NORFLASHALIAS to remap their flash at 0.

Anyway patch dropped.

Thanks,

Phil.

