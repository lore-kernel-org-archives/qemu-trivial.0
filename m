Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMdsl-0004Nn-KW
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 11:11:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMdsc-0004Ic-JC
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:11:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMdsX-0004xX-KP
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:11:50 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:38652)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMdsX-0004wV-F4
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 11:11:45 -0400
Received: by wibxm9 with SMTP id xm9so28335004wib.1
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 08:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=lPznzpu5HlGKW7amm9t22+vBNWVxxNkuV06jb7LaFNg=;
	b=APtiIqQl/gqKeLIoqVG/yrYedDZukWGlDyQbySk/LOiVgpKzDbj+044ITpPX1JJh8J
	0H7S8kKZ7DzWZFZSvtQXH2ZXxmS/5Gkn37gvijknB2Ss22qGK08YLmF630K+jVWE6kPa
	wo92TFxhpTMRqPkF9TVbsPbBs3er50A0if0Ge+KRFAsEVVGFWqwlK/NwUO71LxA2pb7e
	ohPpH9K19Evpe1eEKIO+JbfvezaRTOha78rca0env+u93QHItzCrP2cYMgArOzjT+WWO
	hAd8hRIRLpUwm0PEYEB6n9wiSpfWkm41la08EUO0sN6A3za7ka6eCB7036dyMEdf18bO
	c75g==
X-Gm-Message-State: ALoCoQl6jI25VQ3glUzpJ/rjfi/GYVDMGeDs/3DMHD5mKcL41TRVALPLKaaLcPFTgKE61c/Yy1Jl
X-Received: by 10.180.78.35 with SMTP id y3mr45977448wiw.62.1438701104898;
	Tue, 04 Aug 2015 08:11:44 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	bm9sm2873467wib.10.2015.08.04.08.11.41
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 08:11:43 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id EB8DD3E0557;
	Tue,  4 Aug 2015 16:11:40 +0100 (BST)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
	<20150804121616.GA8192@aurel32.net>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aurelien Jarno <aurelien@aurel32.net>
In-reply-to: <20150804121616.GA8192@aurel32.net>
Date: Tue, 04 Aug 2015 16:11:40 +0100
Message-ID: <87h9ofks0j.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, crosthwaitepeter@gmail.com,
	qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 03/11] qemu-log: correct help text for
	-d cpu
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
X-List-Received-Date: Tue, 04 Aug 2015 15:11:57 -0000


Aurelien Jarno <aurelien@aurel32.net> writes:

> On 2015-08-03 10:14, Alex Bennée wrote:
>> This doesn't just dump CPU state on translation but on every block
>> entrance.
>> 
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Reviewed-by: Andreas Färber <afaerber@suse.de>
>> 
>> ---
>> v4
>>   - add r-b tag
>> ---
>>  qemu-log.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/qemu-log.c b/qemu-log.c
>> index 13f3813..be8405e 100644
>> --- a/qemu-log.c
>> +++ b/qemu-log.c
>> @@ -105,7 +105,7 @@ const QEMULogItem qemu_log_items[] = {
>>      { CPU_LOG_EXEC, "exec",
>>        "show trace before each executed TB (lots of logs)" },
>>      { CPU_LOG_TB_CPU, "cpu",
>> -      "show CPU state before block translation" },
>> +      "show CPU registers before each executed TB (lots of logs)" },
>>      { CPU_LOG_MMU, "mmu",
>>        "log MMU-related activities" },
>>      { CPU_LOG_PCALL, "pcall",
>
> In practice this is not true for linked TB. Should we also disable TB
> linking when this option is enabled?

Good question. I suspect yes because if you've gone to level of wanting
exec tracing you'll probably get confused by the chaining. Of course it
will run a lot slower then.


-- 
Alex Bennée

