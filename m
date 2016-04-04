Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1an4SR-0001iP-9Q
	for mharc-qemu-trivial@gnu.org; Mon, 04 Apr 2016 09:22:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1an4SK-0001bf-Hr
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 09:22:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1an4SH-0003SC-9l
	for qemu-trivial@nongnu.org; Mon, 04 Apr 2016 09:22:12 -0400
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231]:33764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1an4SH-0003S7-1R; Mon, 04 Apr 2016 09:22:09 -0400
Received: by mail-lf0-x231.google.com with SMTP id p188so143292264lfd.0;
	Mon, 04 Apr 2016 06:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=wUoS43KCz11OS3U8Iovmd4JknxaLc91WzcYqRmyep3k=;
	b=hGFBCOPqGhAOdtE2YQRlMyD46YnieYaHOWGhpUMCU3iPdN/3xmTGUIVr5mRFut3o0o
	KIyrJzkfYw6cQLhX/+wbPWPr4+/rp2fbdHKU7q1GLuAHTi9O9sYSU4LV9zhk0o7IIQ2g
	duPD7vsCvTMYyzYHWWUKemDh/IrL00JwPEAntYHYY7Wjy8IIiHEyfeC28bhQPnDf/oFU
	pug7J5kuhKQwRBsv1fXUGCc8xMr/O8Q2vmqnNJlbyfvnCZYmIrpRGgnM/3iehFmFT4oX
	lR8mctqeJYkRo1nZ8iw+ZH9wUVXv9tNEsM+sC4q0//ec/ntlZZHZWzbwkHlkF7DIR8n9
	/IkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=wUoS43KCz11OS3U8Iovmd4JknxaLc91WzcYqRmyep3k=;
	b=TUI8HL9P5ikjROn0l8+sq7vMhpcm/K7xEExR2EY5jROQU3qWyyG97VIeJR4ifUAQNS
	t/mve28LTRDsoP91Qwckv6nw5jc36xfP20aYnUHZb1sNvuTB2QtTE0vuHgCT1d9KDPIi
	w1XG73CHzjrZRnWoNFI1CXpdJd/pu4ag9ZUORvKzjYirm2lM4o0lO3MxpvIYotajFTbH
	HEdGN2Y3+GP/NbR/n5Tc2SNvSaQCni13+SLEH7rAIvGqsI6uP99rIpmAboL1oDnahrId
	UapJjSLuB3PzMhixycdAbn9lyFEvyKuJ6jfwXR//c4Kuag0pqyDro4sEJForFRwgo0QF
	+awg==
X-Gm-Message-State: AD7BkJKZtrVzUOhM+3LWyGvPzUMfz1GZSIDw0V74KUmxoZ1dSvWLQYU3qBTiTVpFnp/cKw==
X-Received: by 10.25.21.166 with SMTP id 38mr6169886lfv.160.1459776128149;
	Mon, 04 Apr 2016 06:22:08 -0700 (PDT)
Received: from [192.168.0.46] ([195.91.132.170])
	by smtp.gmail.com with ESMTPSA id
	o81sm4655295lfb.44.2016.04.04.06.22.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 04 Apr 2016 06:22:07 -0700 (PDT)
To: Stefan Weil <sw@weilnetz.de>, Sergey Fedorov <sergey.fedorov@linaro.org>, 
	qemu-devel@nongnu.org
References: <1459767918-796-1-git-send-email-sergey.fedorov@linaro.org>
	<5702567E.6060701@weilnetz.de>
From: Sergey Fedorov <serge.fdrv@gmail.com>
Message-ID: <57026A7E.1000506@gmail.com>
Date: Mon, 4 Apr 2016 16:22:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <5702567E.6060701@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] tci: Fix build with no '-DNDEBUG'
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
X-List-Received-Date: Mon, 04 Apr 2016 13:22:18 -0000

On 04/04/16 14:56, Stefan Weil wrote:
> Am 04.04.2016 um 13:05 schrieb Sergey Fedorov:
>> From: Sergey Fedorov <serge.fdrv@gmail.com>
>>
>> assert() always evaluates its argument so there's no need to #ifdef the
>> definitions which is only used for assert(). Actually, doing so
>> generates a compilation warning which is treated as an error in QEMU
>> build by default. Let compiler sort out and eliminate unnecessary
>> local variables.
>>
>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>> Signed-off-by: Sergey Fedorov <sergey.fedorov@linaro.org>
>> ---
>>  tci.c | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/tci.c b/tci.c
>> index 7cbb39ed4b6a..d709e008f3f9 100644
>> --- a/tci.c
>> +++ b/tci.c
>> @@ -472,10 +472,8 @@ uintptr_t tcg_qemu_tb_exec(CPUArchState *env, uint8_t *tb_ptr)
>>  
>>      for (;;) {
>>          TCGOpcode opc = tb_ptr[0];
>> -#if !defined(NDEBUG)
>>          uint8_t op_size = tb_ptr[1];
>>          uint8_t *old_code_ptr = tb_ptr;
>> -#endif
>>          tcg_target_ulong t0;
>>          tcg_target_ulong t1;
>>          tcg_target_ulong t2;
>
> This patch should not be applied.

Oops, you're right, it's a really silly patch.

>
> From the Linux man page for assert: "the macro assert() generates no code".
>
> Which variant of the assert macro evaluates its argument even when NDEBUG
> is defined? 

I'm not sure of how I got this misunderstanding :)

> On which system with which configuration did you see the
> problem?

I get the following error messages when I compile on Ubuntu 14.04.4 LTS.

$ /home/sergey/projects/qemu/configure
--target-list=x86_64-linux-user,x86_64-softmmu --enable-tcg-interpreter
$ make
...
/home/sergey/projects/qemu/tci.c: In function ‘tcg_qemu_tb_exec’:
/home/sergey/projects/qemu/tci.c:528:25: error: ‘old_code_ptr’
undeclared (first use in this function)
             assert(tb_ptr == old_code_ptr + op_size);
                         ^
/home/sergey/projects/qemu/tci.c:528:25: note: each undeclared
identifier is reported only once for each function it appears in
/home/sergey/projects/qemu/tci.c:528:40: error: ‘op_size’ undeclared
(first use in this function)
             assert(tb_ptr == old_code_ptr + op_size);
                                        ^
make[1]: *** [tci.o] Error 1

>
> There is indeed a regression in the current code. Commit
> d38ea87ac54af64ef611de434d07c12dc0399216 added an include statement
> which includes assert.h before NDEBUG is defined. This is wrong and
> needs a fix. Could you please try tci.c starting like this?
>
> /* Defining NDEBUG disables assertions (which makes the code faster). */
> #if !defined(CONFIG_DEBUG_TCG) && !defined(NDEBUG)
> # define NDEBUG
> #endif
>
> #include "qemu/osdep.h"
>

Doing so really helps. So what are the plans of how to fix the problem?

Thanks,
Sergey

