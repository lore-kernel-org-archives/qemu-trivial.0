Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hDtwt-0004P0-F9
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2019 12:50:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hDtwr-0004OX-Mo
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 12:50:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hDtwq-0004rL-Hi
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 12:50:13 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hDtwq-0004qb-8W
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 12:50:12 -0400
Received: by mail-ot1-x344.google.com with SMTP id d24so16163412otl.11
	for <qemu-trivial@nongnu.org>; Tue, 09 Apr 2019 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cqzjqiQW6DBOypW8tH2F85uqTEEblvG6EsvNDEkVoUM=;
	b=vLP+Q4MOr8pqSSEUQOnqJfwsk5KUU6V2W0DdjSH4EKc6p0QrTungUxmFnez5aqYvp+
	KmuJsHYAfSD+TUPMI1YnEfV4VdYsR3OEtaHcyPpTC1zTjBWWQ4Bofr5nk7FnK5/FbWOX
	WeNUpsL0YV4nu15/cv0d8ckKdrG12KEMTtxD90itrL6KvVmBmfFqql8IVCdJ8PRkeI7W
	CcMfVCSG2torAIN2e8nm3VaHlgmYdketlGZMKOSdPSkReKR7BzVUuUpCXfJSV0MzR+Pd
	vcfXVJfTXHfSjQGPycF9b0eWYO7XBRGeLZDvckrOibJmk8ArrRiwPXPbpKB5Cwj8PvWj
	EOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cqzjqiQW6DBOypW8tH2F85uqTEEblvG6EsvNDEkVoUM=;
	b=bHOb6pBm9M9QDozd0hKCjwISjr7quzIPj4z8R8C44B8/TzHH8b63tROb06yS0e9bI+
	3jvlhca/z3BhZ0+WahhbR76XbVqQXqumEPwWBMKvat+tjyFxNSQGX0TARJHcf83cEfbd
	/jHF2+ckmfYMpFN0K5vN84krT3DQrT7ELunylwzhddj57ysS0vo/k+T9nYSR8pTJYJ30
	hRxYB7E9PIZ9urHu9B8TofjrwNrxIZhFJjr2C0VN4UY/bA/j0/AuzdufeWs9Cx/NzoWa
	Q4xbpgdJlBPua778u6adTrwqU8A0gIUZhreBZ2iwa3Jkervx7eUqCtE+PGxxfOY3JK0o
	rViQ==
X-Gm-Message-State: APjAAAV16yWmoFyWeYyWQEvBsGdpZTjpkeDovFnFD4OIxVN7gyOjcq3B
	/ra3sCLkwO8of2JkOGLIy/TDrOp5RsQwJgLIYUPNrA==
X-Google-Smtp-Source: APXvYqxycs0aZGgKNLfinuz21m0dURJAaLb+fmEv9expE67wNbyK2W7qfTZKfSoFigWR0ZdV80AWkCcfK1j9upORysI=
X-Received: by 2002:a05:6830:164a:: with SMTP id
	h10mr25411669otr.323.1554828611134; 
	Tue, 09 Apr 2019 09:50:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190409155635.10276-1-aruna.15@cse.mrt.ac.lk>
	<CAFEAcA-k0KEsjb0VvbhhkpvTN7nFBDNtqKwx-Lai5uYbCkztJA@mail.gmail.com>
	<CAH95U0j6rHGdZj4B8DK-Ty-SqZHMb3Kmg16w+j3jx5bdkeijLQ@mail.gmail.com>
In-Reply-To: <CAH95U0j6rHGdZj4B8DK-Ty-SqZHMb3Kmg16w+j3jx5bdkeijLQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Apr 2019 17:50:00 +0100
Message-ID: <CAFEAcA9DSaZE-dsKV4321meT2hBEJRLmWBLF0U5o0jG=mzcmRA@mail.gmail.com>
To: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Header cleanups
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
X-List-Received-Date: Tue, 09 Apr 2019 16:50:15 -0000

On Tue, 9 Apr 2019 at 17:42, Aruna Jayasena <aruna.15@cse.mrt.ac.lk> wrote:
>
> Yeah this is a stand alone patch.

OK, thanks -- just wanted to check there wasn't a missing
bit. I think this could go in via the qemu-trivial tree
so I have cc'd them.

We're in the middle of a release at the moment, but we
should reopen for development in a couple of weeks. If
this patch still hasn't gone anywhere by a week or so after
that then please follow up with a 'ping' to check it hasn't
been forgotten by accident.

> On Tue, Apr 9, 2019 at 10:10 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Tue, 9 Apr 2019 at 16:58, Aruna Jayasena <aruna.15@cse.mrt.ac.lk> wrote:
>> >
>> > Removed unwanted includes from cpu-common.h
>> > This task was under https://wiki.qemu.org/Contribute/BiteSizedTasks
>> >
>> > Signed-off-by: Aruna Jayasena <aruna.15@cse.mrt.ac.lk>
>> >
>> > ---
>> >  include/exec/cpu-common.h | 2 --
>> >  1 file changed, 2 deletions(-)
>> >
>> > diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
>> > index cef8b88a2a..a3594f3f50 100644
>> > --- a/include/exec/cpu-common.h
>> > +++ b/include/exec/cpu-common.h
>> > @@ -7,8 +7,6 @@
>> >  #include "exec/hwaddr.h"
>> >  #endif
>> >
>> > -#include "qemu/bswap.h"
>> > -#include "qemu/queue.h"
>> >  #include "qemu/fprintf-fn.h"
>> >
>>
>> I was surprised that no .c files are implicitly relying
>> on these includes, but apparently none are, so we can
>> safely remove them.
>>
>> A couple of notes:
>>  * this doesn't need to go to qemu-stable as it's just a
>>    code cleanup
>>  * did something go wrong with your sending of this patch?
>>    Its subject is "PATCH 0/4" which would usually indicate
>>    a cover letter for a four-patch series, but this seems
>>    to be a stand-alone patch.
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

