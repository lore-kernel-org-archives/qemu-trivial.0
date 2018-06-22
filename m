Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fWSO3-0002Gw-Pg
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2018 16:10:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50729)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSO1-0002FD-1J
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 16:10:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSNz-0002y6-NA
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2018 16:10:24 -0400
Received: from mail-qk0-x22b.google.com ([2607:f8b0:400d:c09::22b]:34800)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWSNu-0002wS-Uf; Fri, 22 Jun 2018 16:10:19 -0400
Received: by mail-qk0-x22b.google.com with SMTP id q70-v6so4377994qke.1;
	Fri, 22 Jun 2018 13:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=S742fyqUhwmBfafC9BxD8PchPr/FFLH/smvpJc7XSwE=;
	b=oFEDJItJ/HkxM2IjqJbf2DUx0M4pycLOKH09NgdApYoIvq28SPwpNWaQMY+vMhnqy9
	FFZIuMFEUnK9FkP9BED6PHDfWIcCtBhlHQ6UWzV0xaIKr5/LIbp9v8nx8CW3tx4wuFOu
	PX9uQesw7OXkKxEVOWvfCIuq/Fy+kJ/3VDtmuENkPqDBy3azRxFiLdxhCinISKo14Sqr
	pcHpB+1hTnWahtt2b1NOCOQdS6W/AbKJtw38LZlQNMu5RWBCijvZnq4PC3RkHUr2ghaA
	Hn73nopCUw0aPaoct52S7W636kZAI+RzdJ/QwchFC1/aP/I6emEdd0j6Xk4Hhe5EJ98u
	1+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=S742fyqUhwmBfafC9BxD8PchPr/FFLH/smvpJc7XSwE=;
	b=NijYM3n6+CAZKK9g9Bnq2mzkNLjTap7bE/9pKzabWkZ0VwKBVMw4+VM/AMEr+pQqSk
	6R4GHb1eGWvc0/T0J19dXtFTrlMzam7kVkKDEZFqG25NvEqCz/YWdDLLIeFTUQyH9gp1
	qWaVoYHhFAQoEJL1FB8P4B3UU4Iz82Laaqdz+d5lrZjyDsEtXa20DsAsoHoFs7Xjz5Dr
	Tba3H3QVWQuVrwe7eg2M/p31EDOgkcwfXVyzySQwZdtD4lBUIcnvS1Pjg7JjdU4JDkCP
	vcMVjPtdfw/uXfYfb6rY4G3xG3MQ20ZvuL0sVb9iWk15WdPzB68wtuAQFroWz+9MMPAW
	h2wA==
X-Gm-Message-State: APt69E2uWSpSfgqbknKTDBX+9FBbNcKRe93ttAgd9WDrvA+JEfOalzKA
	xIVN4P5S/n35ESAd7s58RciJ2qHW
X-Google-Smtp-Source: ADUXVKLYjo5/WQpNeQek9emzXBTLFA6eNwDHA/19CWxH+neEt6fwZ7YSSkjM9TXXjhQFutNY0Xaigw==
X-Received: by 2002:a37:d4d1:: with SMTP id
	s78-v6mr2559137qks.244.1529698218293; 
	Fri, 22 Jun 2018 13:10:18 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	o31-v6sm5446788qte.16.2018.06.22.13.10.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 13:10:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-arm@nongnu.org
References: <20180622134036.23182-1-f4bug@amsat.org>
	<20180622134036.23182-8-f4bug@amsat.org>
	<e98bac2c-ce0b-e226-3d96-004e46478f2f@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <8256c2d4-722c-299f-e8e3-42c1a7f68e1d@amsat.org>
Date: Fri, 22 Jun 2018 17:10:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <e98bac2c-ce0b-e226-3d96-004e46478f2f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::22b
Subject: Re: [Qemu-trivial] [PATCH v2 07/14] hw/i2c/omap_i2c: Use
 qemu_log_mask(UNIMP) instead of fprintf
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
X-List-Received-Date: Fri, 22 Jun 2018 20:10:26 -0000

On 06/22/2018 04:38 PM, Thomas Huth wrote:
> On 22.06.2018 15:40, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  hw/i2c/omap_i2c.c | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/i2c/omap_i2c.c b/hw/i2c/omap_i2c.c
>> index 26e3e5ebf6..690876e43e 100644
>> --- a/hw/i2c/omap_i2c.c
>> +++ b/hw/i2c/omap_i2c.c
>> @@ -17,6 +17,7 @@
>>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>>   */
>>  #include "qemu/osdep.h"
>> +#include "qemu/log.h"
>>  #include "hw/hw.h"
>>  #include "hw/i2c/i2c.h"
>>  #include "hw/arm/omap.h"
>> @@ -339,14 +340,15 @@ static void omap_i2c_write(void *opaque, hwaddr addr,
>>              }
>>              break;
>>          }
>> -        if ((value & (1 << 15)) && !(value & (1 << 10))) {	/* MST */
>> -            fprintf(stderr, "%s: I^2C slave mode not supported\n",
>> -                            __func__);
>> +        if ((value & (1 << 15)) && !(value & (1 << 10))) { /* MST */
> 
> Please keep the white spaces before the comment if you don't change
> anything else.

This is a <tab> and checkpatch complains...

I can use 4 spaces for this tab. I tried to align with other tab-aligned
comments I didn't modify, but the result is messier. Thus a simple space.

> 
>> +            qemu_log_mask(LOG_UNIMP, "%s: I^2C slave mode not supported\n",
>> +                          __func__);
>>              break;
>>          }
>> -        if ((value & (1 << 15)) && value & (1 << 8)) {		/* XA */
>> -            fprintf(stderr, "%s: 10-bit addressing mode not supported\n",
>> -                            __func__);
>> +        if ((value & (1 << 15)) && value & (1 << 8)) { /* XA */
> 
> dito.
> 
>> +            qemu_log_mask(LOG_UNIMP,
>> +                          "%s: 10-bit addressing mode not supported\n",
>> +                          __func__);
> 
> Apart from the nits, looks fine to me, so once you've fixed that:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

