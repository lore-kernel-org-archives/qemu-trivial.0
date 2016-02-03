Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aR2Zq-0001ry-0A
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 13:54:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aR2Zn-0001rc-6R
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 13:54:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aR2Zj-0008IU-WF
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 13:54:51 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:37471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1aR2Zj-0008IC-Ot
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 13:54:47 -0500
Received: by mail-wm0-x22a.google.com with SMTP id l66so84600937wml.0
	for <qemu-trivial@nongnu.org>; Wed, 03 Feb 2016 10:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=references:user-agent:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=yJ1KBdh4Ndv6KfTTnpSw2OUjtAloPZ7lLlNf7Vrxsbg=;
	b=JcWpO1tlcOdy5bYiCkGARgGV4mwgevWdlX1WWIkaGNow+x8FUUjTDVFIHDpPQUzSHz
	oBRyPMgKnqvJHJ2hFpOAtf9TdCXqwEeA5CjTvqyAP8fRCYQ1jXKz3RnN+dQaj2YS5jW6
	zEIQ0x6Dach67mZjBwDHLTslF2AG7ftELeXsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:user-agent:from:to:cc:subject
	:in-reply-to:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=yJ1KBdh4Ndv6KfTTnpSw2OUjtAloPZ7lLlNf7Vrxsbg=;
	b=JKc/YrW8o6BE2ZqvQ/vdMHbFGffQxSgU+0x57Tpb+Kg6AmfSAddCkH2oSXkfk5u6xr
	AG21Y48IphaDcczpIGgV3CRDw5u5dYLR/E2+ehSU9ANAdoXc/RAbZeTshGtbKr0+Vpu/
	uGCXcFqFeIKTpf+iTGbveu8ipaz3zfOW8o3Fei4FkkpL922sW2UEM75RJPb/SlE0caMV
	tzy3kxxUL3ygCc2zJuTtAANr78m2e5/zTjTXQQLYJB0YELe2PAHsP4Z2S61vR2ijdC8f
	yPbHFVS8a86pAPg+0AE+LeL4K0HEQR1xJOkNzi75bAINCmeVPOu+sJ2oAOt3ROh84mLp
	zRrg==
X-Gm-Message-State: AG10YOS4STD/Cz4HC4Ievi/5EvtoZ9ansy3lRdUz8c6z2rQTkyFzctx4lvYISx/f9rzRjYfJ
X-Received: by 10.194.103.131 with SMTP id fw3mr4090701wjb.55.1454525686726;
	Wed, 03 Feb 2016 10:54:46 -0800 (PST)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id s2sm6935370wjs.39.2016.02.03.10.54.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Feb 2016 10:54:45 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 58FFC3E0679;
	Wed,  3 Feb 2016 18:54:45 +0000 (GMT)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-12-git-send-email-alex.bennee@linaro.org>
	<20150804123331.GB8960@aurel32.net>
User-agent: mu4e 0.9.17; emacs 25.0.90.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aurelien Jarno <aurelien@aurel32.net>
In-reply-to: <20150804123331.GB8960@aurel32.net>
Date: Wed, 03 Feb 2016 18:54:45 +0000
Message-ID: <87y4b1oc96.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 11/11] cputlb: modernise the debug
	support
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
X-List-Received-Date: Wed, 03 Feb 2016 18:54:52 -0000


Aurelien Jarno <aurelien@aurel32.net> writes:

> On 2015-08-03 10:14, Alex Bennée wrote:
>> To avoid cluttering the code with #ifdef legs we wrap up the print
>> statements into a tlb_debug() macro. As access to the virtual TLB can
>> get quite heavy defining DEBUG_TLB_LOG will ensure all the logs go to
>> the qemu_log target of CPU_LOG_MMU instead of stderr.
>>
>> I've also removed DEBUG_TLB_CHECK which wasn't used.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>
>> ---
>> v2
>>   - ensure the compiler checks format strings even if debug is optimised out
>> ---
>>  cputlb.c | 54 +++++++++++++++++++++++++++++++++++-------------------
>>  1 file changed, 35 insertions(+), 19 deletions(-)
>>
>> diff --git a/cputlb.c b/cputlb.c
>> index a506086..7095e6f 100644
>> --- a/cputlb.c
>> +++ b/cputlb.c
>> @@ -30,8 +30,30 @@
>>  #include "exec/ram_addr.h"
>>  #include "tcg/tcg.h"
>>
>> -//#define DEBUG_TLB
>> -//#define DEBUG_TLB_CHECK
>> +/* DEBUG defines, enable DEBUG_TLB_LOG to log to the CPU_LOG_MMU target */
>> +/* #define DEBUG_TLB */
>> +/* #define DEBUG_TLB_LOG */
>> +
>> +#ifdef DEBUG_TLB
>> +# define DEBUG_TLB_GATE 1
>> +# ifdef DEBUG_TLB_LOG
>> +#  define DEBUG_TLB_LOG_GATE 1
>> +# else
>> +#  define DEBUG_TLB_LOG_GATE 0
>> +# endif
>> +#else
>> +# define DEBUG_TLB_GATE 0
>> +# define DEBUG_TLB_LOG_GATE 0
>> +#endif
>> +
>> +#define tlb_debug(fmt, ...) do { \
>> +    if (DEBUG_TLB_LOG_GATE) { \
>> +        qemu_log_mask(CPU_LOG_MMU, "%s: " fmt, __func__, \
>> +                      ## __VA_ARGS__); \
>> +    } else if (DEBUG_TLB_GATE) { \
>> +        fprintf(stderr, "%s: " fmt, __func__, ## __VA_ARGS__); \
>> +    } \
>> +} while (0)
>
> Do we really want to support sending debug logs to either the logfile or
> stderr? It's already possible to send the debug logs through stderr when
> not specifying -D file.

It preserves the old behaviour (and the general behaviour of DEBUG_FOO
going to stderr). However I'm happy to make it default to using the log
output.

It does raise the question of if we should just enable the debugging by
default?

--
Alex Bennée

