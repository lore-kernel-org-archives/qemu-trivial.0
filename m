Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMfz2-0006Dl-0R
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 13:26:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMfyy-00069h-Cm
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 13:26:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMfys-0004J4-QP
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 13:26:29 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:34403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMfys-0004Ip-Jr
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 13:26:26 -0400
Received: by wibud3 with SMTP id ud3so186661685wib.1
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 10:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=S+u+Y/vMrlwiCHHJkSV7bEgc350Sjx5qNnVa9/00QUY=;
	b=jK1jnoLEo4HlUPjnKXXAKf+0nXbnGaxftrIbgG5iPY435t8uwpXWULNvNGYVXQ86DA
	0f9TeCZRXD4YUEQR7gA6cSXF+x4mfGk3K4wHJJjr67/spHmaTxOW5v57+ZOY44YQ7jf3
	OuTT58n58tBAvGyNjP5b8WH4WLbx+zWKoQbVTu8Nszrob+9+z1l2kEvMblebuNOWNlEH
	9WlHeJpkmFG92ky+cjr6fOVr2HPElzfm3jgrZbbOGZgTJ73mCS1gDDV0X5w4bNp8/3xH
	vqIv8edgh9HAW4rdrmxbnro/+sQy3iarKe5szrsXkJgjH2ZvsGZk8+dicym4doWxUuql
	kS/w==
X-Gm-Message-State: ALoCoQly2mMeiSQ/AeLNNIXUffE0YgbM1goJg5HrRYO/vFiUuQ7Wj3UiOJR1yNu8BgbYu9YQZ5Gg
X-Received: by 10.180.108.203 with SMTP id hm11mr10415036wib.54.1438709186009; 
	Tue, 04 Aug 2015 10:26:26 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	ej5sm2863155wjd.22.2015.08.04.10.26.24
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 10:26:25 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id E68363E04A7;
	Tue,  4 Aug 2015 18:26:23 +0100 (BST)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-10-git-send-email-alex.bennee@linaro.org>
	<55C0CFB9.3090105@twiddle.net>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
In-reply-to: <55C0CFB9.3090105@twiddle.net>
Date: Tue, 04 Aug 2015 18:26:23 +0100
Message-ID: <87bnenkls0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.175
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, crosthwaitepeter@gmail.com, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v4 09/11] target-arm: dfilter support for
	in_asm, op, opt_op
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
X-List-Received-Date: Tue, 04 Aug 2015 17:26:34 -0000


Richard Henderson <rth@twiddle.net> writes:

> On 08/03/2015 02:14 AM, Alex Bennée wrote:
>> Each individual architecture needs to use the qemu_log_in_addr_range()
>> feature for enabling in_asm and marking blocks for op/opt_op output.
>> 
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>  target-arm/translate-a64.c | 6 ++++--
>>  target-arm/translate.c     | 6 ++++--
>>  2 files changed, 8 insertions(+), 4 deletions(-)
>> 
>> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
>> index 689f2be..0b0f4ae 100644
>> --- a/target-arm/translate-a64.c
>> +++ b/target-arm/translate-a64.c
>> @@ -11026,7 +11026,8 @@ void gen_intermediate_code_internal_a64(ARMCPU *cpu,
>>              gen_io_start();
>>          }
>>  
>> -        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT))) {
>> +        if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP | CPU_LOG_TB_OP_OPT) &&
>> +                     qemu_log_in_addr_range(dc->pc))) {
>>              tcg_gen_debug_insn_start(dc->pc);
>>          }
>
> If there's more than one or two ranges, it's probably quicker to
> generate the debug opcode regardless of the range.  Remember, this
> check is happening once per insn, not once per tb.

Maybe I should hoist the check up to the start of a block? This would
mean we would dump all instructions in a block even if they went past
the end-point but the reverse case is probably just confusing.

We'll still not dump anything that starts outside the range.

>
>
> r~

-- 
Alex Bennée

