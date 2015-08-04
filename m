Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMhZw-00054N-0P
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 15:08:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMhZt-000546-PS
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 15:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMhZn-0005yo-GG
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 15:08:45 -0400
Received: from mail-wi0-f177.google.com ([209.85.212.177]:36281)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMhZn-0005yh-AC
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 15:08:39 -0400
Received: by wicgj17 with SMTP id gj17so163600132wic.1
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 12:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=2gwW0avFQ9N53kpGkzl38JRoOhdjImwKlOvZqCRO57Y=;
	b=ABsfpmOPxapk5SMeiVdgqy6gv6/O5C8CrnO7UyAEZ1QrlgmUt/4vNCJ8OY2OonCcEc
	5sJnry/V0CaYVDG1Y5QUshG7/r5LeMGx9w6IOvCfo69w2WjNqVOPBFVdGjSmglB2twDx
	tT2mBAtbnLUgEOEXx90OPNHfItfWhwHk74hkYM1QxxoesM0+fQwKLqmWyUzpCf48yjPV
	bQStXGoJCsvySIlZosCx9HfDA9/nGWvyPe3oGhPhOW443ggxVwtLV++fpL4Bo42sVIYC
	Wxaczh7n0C9oAOl9w/pwa8Uw/EJtF6NBMXlK7yatDDGcRiUwRhNbuhmXhTtmEcltr3/+
	Z1Hw==
X-Gm-Message-State: ALoCoQlG89koWZSS7kTFby4X/CI1dLwRM3d1cvGuq3daHEROqOJdX0NweMKkWDWBm/JOewyVqVXm
X-Received: by 10.180.90.81 with SMTP id bu17mr1767080wib.35.1438715318711;
	Tue, 04 Aug 2015 12:08:38 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id
	lm16sm3779697wic.18.2015.08.04.12.08.37
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 12:08:37 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id B00B53E0557;
	Tue,  4 Aug 2015 20:08:36 +0100 (BST)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
	<20150804121616.GA8192@aurel32.net> <87h9ofks0j.fsf@linaro.org>
	<CAFEAcA9o7TOHEr_Uojan-uYWhvBpniYzG9hxG6102CAg+uWiwg@mail.gmail.com>
	<55C0D879.90404@twiddle.net> <87d1z3klyh.fsf@linaro.org>
	<55C0FFE2.5010502@twiddle.net>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
In-reply-to: <55C0FFE2.5010502@twiddle.net>
Date: Tue, 04 Aug 2015 20:08:36 +0100
Message-ID: <87a8u6lvm3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.177
Cc: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4 03/11] qemu-log: correct
	help text for -d cpu
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
X-List-Received-Date: Tue, 04 Aug 2015 19:08:46 -0000


Richard Henderson <rth@twiddle.net> writes:

> On 08/04/2015 10:22 AM, Alex Bennée wrote:
>> 
>> Richard Henderson <rth@twiddle.net> writes:
>> 
>>> On 08/04/2015 08:15 AM, Peter Maydell wrote:
>>>> On 4 August 2015 at 16:11, Alex Bennée <alex.bennee@linaro.org> wrote:
>>>>> Aurelien Jarno <aurelien@aurel32.net> writes:
>>>>>> On 2015-08-03 10:14, Alex Bennée wrote:
>>>>>> In practice this is not true for linked TB. Should we also disable TB
>>>>>> linking when this option is enabled?
>>>>>
>>>>> Good question. I suspect yes because if you've gone to level of wanting
>>>>> exec tracing you'll probably get confused by the chaining. Of course it
>>>>> will run a lot slower then.
>>>>
>>>> Unless the bug you were trying to track down is caused by the exec
>>>> chaining, of course... But yes, I think we get more people wanting
>>>> chaining to be disableable.
>>>>
>>>> Not sure we want to tie it to the 'cpu' debug option, though -- it
>>>> applies just as much to 'exec'.
>>>
>>> Does it make more sense to have a 'nochain' debug option, and not tie it to
>>> either 'cpu' or 'exec'?  It might be occasionally useful on its own, simply to
>>> determine if a bug does exist in the exec chaining.
>> 
>> Would that make sense as a debug option or should we have a specific set
>> of TCG options to alter its behaviour?
>
>
> That's what I'm saying -- probably a separate debug option is better.

Sorry I meant should we add it to -d (as in -d nochain) or have some tcg
opts (--tcg nochain,blah)

>
>
> r~

-- 
Alex Bennée

