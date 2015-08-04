Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMfvL-0004ij-HD
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 13:22:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMfvA-0004bs-D4
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 13:22:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMfv7-0002zb-7Z
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 13:22:36 -0400
Received: from mail-wi0-f179.google.com ([209.85.212.179]:35774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1ZMfv7-0002zT-1E
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 13:22:33 -0400
Received: by wibxm9 with SMTP id xm9so175934473wib.0
	for <qemu-trivial@nongnu.org>; Tue, 04 Aug 2015 10:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:references:from:to:cc:subject:in-reply-to:date
	:message-id:mime-version:content-type:content-transfer-encoding;
	bh=itoVEpjI5Xk3z8n1EdX/iBpiqwX72ZTF6fOgz6E+8RY=;
	b=hJdAymVgb1IPAOpXysiFzDC4wSMi8AoMbtMtVsgUODHjkx4HNRtchiqI3GywQuFkxm
	S68GJA+qdal+8hQTkdk6YzhQqCLY3gvrGZbStkh1EKvx7OHsKlXXtqKYOUI0+PiGGwOt
	fda1RHb2jArq9Cov5PeM4trMXYoRRb35uvFgoexN2T0KeMFaM1wR/4smAbnsb3cRTw6d
	gjGGBAT5QArAQdog86g35yOl2VXvE8KduZEcgbbKkNO3ruBwotkeag4f7yhwI25k6PFj
	8zQ3HDEMoA8+pMYcf/RT6xc6O3qu/s4AOz0LN5HV0KVgqd2e+lfCi1JQVhOfQJkAN4pc
	YHJg==
X-Gm-Message-State: ALoCoQn5omu9qpbp2e+/MW8ssu9fJ1CjukmnfO2V8HshZ5dNoxCUHM31Fosq+zsR/B0spf/b8w5P
X-Received: by 10.181.25.234 with SMTP id it10mr859586wid.41.1438708952511;
	Tue, 04 Aug 2015 10:22:32 -0700 (PDT)
Received: from zen.linaro.local ([81.128.185.34])
	by smtp.gmail.com with ESMTPSA id ib9sm2878739wjb.2.2015.08.04.10.22.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Aug 2015 10:22:31 -0700 (PDT)
Received: from zen.linaro.local (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 35E6B3E04A7;
	Tue,  4 Aug 2015 18:22:30 +0100 (BST)
References: <1438593291-27109-1-git-send-email-alex.bennee@linaro.org>
	<1438593291-27109-4-git-send-email-alex.bennee@linaro.org>
	<20150804121616.GA8192@aurel32.net> <87h9ofks0j.fsf@linaro.org>
	<CAFEAcA9o7TOHEr_Uojan-uYWhvBpniYzG9hxG6102CAg+uWiwg@mail.gmail.com>
	<55C0D879.90404@twiddle.net>
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <rth@twiddle.net>
In-reply-to: <55C0D879.90404@twiddle.net>
Date: Tue, 04 Aug 2015 18:22:30 +0100
Message-ID: <87d1z3klyh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.179
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
X-List-Received-Date: Tue, 04 Aug 2015 17:22:43 -0000


Richard Henderson <rth@twiddle.net> writes:

> On 08/04/2015 08:15 AM, Peter Maydell wrote:
>> On 4 August 2015 at 16:11, Alex Bennée <alex.bennee@linaro.org> wrote:
>>> Aurelien Jarno <aurelien@aurel32.net> writes:
>>>> On 2015-08-03 10:14, Alex Bennée wrote:
>>>> In practice this is not true for linked TB. Should we also disable TB
>>>> linking when this option is enabled?
>>>
>>> Good question. I suspect yes because if you've gone to level of wanting
>>> exec tracing you'll probably get confused by the chaining. Of course it
>>> will run a lot slower then.
>> 
>> Unless the bug you were trying to track down is caused by the exec
>> chaining, of course... But yes, I think we get more people wanting
>> chaining to be disableable.
>> 
>> Not sure we want to tie it to the 'cpu' debug option, though -- it
>> applies just as much to 'exec'.
>
> Does it make more sense to have a 'nochain' debug option, and not tie it to
> either 'cpu' or 'exec'?  It might be occasionally useful on its own, simply to
> determine if a bug does exist in the exec chaining.

Would that make sense as a debug option or should we have a specific set
of TCG options to alter its behaviour?

>
>
> r~

-- 
Alex Bennée

