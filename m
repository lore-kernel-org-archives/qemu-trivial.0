Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMbkS-0003kJ-74
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 08:55:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMbkL-0003i7-Sv
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:55:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMbkG-0007kF-4F
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:55:09 -0400
Received: from mail-wi0-f177.google.com ([209.85.212.177]:34149)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMbkF-0007jT-UJ
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 08:55:04 -0400
Received: by wibud3 with SMTP id ud3so175850887wib.1
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 05:55:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=q+AnGqfnSm+1Kl5T5eFmn9f9n0/tGHe/wkGeYAwSuQ4=;
	b=RFSti0MDu7Fn2fBj45MtQVxjaBZvc64sCR9WlEhg8vqAIsnhb5LH/CHnec09EKoECf
	zujWqEzCs8ax6N5QlUqAjpHROtGSJbD2pesGo1uCx7G9svkWUnja7l6rT8GeQ+hlAy7F
	zoEfXYE8sb+We4MTdwyM/o+OK9lF9S1Cqu6yxdsKdU3Q/q5CBSEiQ9B8u5hwDt+IVLqD
	ALsshxHkclxDM6l0eKb3Y39Yq1HmoPLnEWe6JHeTa6LoNb3lksVcH040KGpK7ZjM/9Gt
	9WX2bLJ4rC91nWn19OoWlryxgiRGaZ11eWIiSfN8hnW28U++MtsnvDR8aM6+kGm5TW5J
	5eaQ==
X-Gm-Message-State: ALoCoQl3j88XSLmrPPCZqu9kObQEYlON26nW3Z0ov75EIsC+XlRAiv23rK4jyUdHL/srEKNiRdS7
X-Received: by 10.180.74.115 with SMTP id s19mr43209897wiv.18.1438692903254;
	Tue, 04 Aug 2015 05:55:03 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	bu12sm1702578wjb.44.2015.08.04.05.55.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 05:55:01 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id BA3343E0557;
	Tue,  4 Aug 2015 13:55:00 +0100 (BST)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-2-git-send-email-alex.bennee@linaro.org>
	<55BF6F68.1090103@redhat.com> <87k2tblcxq.fsf@linaro.org>
	<20150804115957.GA6574@aurel32.net>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Aurelien Jarno <aurelien@aurel32.net>
In-reply-to: <20150804115957.GA6574@aurel32.net>
Date: Tue, 04 Aug 2015 13:55:00 +0100
Message-ID: <87io8vkycb.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.177
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	crosthwaitepeter@gmail.com, qemu-devel@nongnu.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v4 01/11] tcg: add ability to dump
	/tmp/perf-<pid>.map files
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
X-List-Received-Date: Tue, 04 Aug 2015 12:55:14 -0000


Aurelien Jarno <aurelien@aurel32.net> writes:

> On 2015-08-04 08:39, Alex Bennée wrote:
>> 
>> Paolo Bonzini <pbonzini@redhat.com> writes:
>> 
>> > On 03/08/2015 11:14, Alex Bennée wrote:
>> >> This allows the perf tool to map samples to each individual translation
>> >> block. This could be expanded for user space but currently it gives
>> >> enough information to find any hotblocks by other means.
>> >> 
>> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> >
>> > What happens if you encounter a tb_flush?
>> 
>> At the point of a tb_flush all bets are off as we will re-generate all
>> the blocks at potentially different locations in the translation buffer.
>> However for most analysis cases you are unlikely to cause the code
>> buffer to overflow. Most other uses of tb_flush are the result
>> debugging.
>> 
>> I could add a printf when --perfmap is enabled to flag when a flush
>> happens to signal to the user? I guess some more caveats in the flag
>> description wouldn't hurt.
>> 
>> We could consider truncating and re-starting the JIT dump at each flush?
>
> You also need to take care about TB invalidation. When the last
> generated TB is invalidated, the code pointer is rolled back to the
> end of the previous TB. In that case the last entry of the dump might
> should be replaced by the new value. If the invalidated TB is not the
> last one, it is just left in the generated code.

Can we only invalidate the previous TB and not any earlier ones?

We could keep the output line until the next TB is generated but then
you would never have a mapping for the last TB generated.

-- 
Alex Bennée

