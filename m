Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhCeB-0007rR-Ia
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 03:17:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhCe6-0007qI-7s
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:17:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhCe1-00055P-Pc
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:17:18 -0400
Received: from mail-lb0-f179.google.com ([209.85.217.179]:64492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1XhCe1-000559-JJ
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:17:13 -0400
Received: by mail-lb0-f179.google.com with SMTP id l4so335705lbv.24
	for <qemu-trivial@nongnu.org>; Thu, 23 Oct 2014 00:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MAg7LFAMptDpVAaWSmwSGbp9fiohA2nWlpYpmkHwJDI=;
	b=PwEWP3AaDdRSRTXYIYQwsyrrffKIagRavJbQX5HXlymFu3i1QgOFNGl7L7nhv/30W9
	xTMzIeIonnTi8gwihl+FvukJhpvch986JMCZfaEi7zOJDkIadFxh1PMHDO5vWhurgkHg
	Q5vPFpWfwcDPhqH5DZ2a+5TE3IGg1EP0/lt1V216Cl6P/5fmhSVbCA0/Ml1tzvCE/mZf
	Ivx5Hi1ix0Md9EP+PTGKRhQuiM9NvrZUgUa6HEya8Lm49GYg3QwPX4bqjarXmjyxjQwR
	MeyhmtB2JogNOG6vfU/TrjkX4tb6D3aI7Oqz1hkfmMXVyaMjMwwExYsdJeDNKXyn83WO
	EutQ==
X-Gm-Message-State: ALoCoQmtcrUClsDjTV0QNjcYhyI8y3NCOqtde2YcGqKkTWLK0TCir/6POU8lAme0mybMhcv+IOL3
X-Received: by 10.112.130.41 with SMTP id ob9mr2963002lbb.74.1414048632638;
	Thu, 23 Oct 2014 00:17:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Thu, 23 Oct 2014 00:16:52 -0700 (PDT)
In-Reply-To: <5448A14D.7070007@msgid.tls.msk.ru>
References: <1411097848-3900-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<541D8812.1040406@msgid.tls.msk.ru>
	<87ppeow4uk.fsf@blackfin.pond.sub.org>
	<541FD10D.8000809@msgid.tls.msk.ru> <5448A14D.7070007@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Oct 2014 08:16:52 +0100
Message-ID: <CAFEAcA8cWmx5AJruWh0mrpTqNcdnCwTuw31-8Rmn8ELz3oC1+g@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.179
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	zhanghailiang <zhang.zhanghailiang@huawei.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Luonengjun <luonengjun@huawei.com>, peter.huangpeng@huawei.com,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1] vl: Fix possible freed
 memory accessing
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
X-List-Received-Date: Thu, 23 Oct 2014 07:17:22 -0000

On 23 October 2014 07:33, Michael Tokarev <mjt@tls.msk.ru> wrote:
> On 09/22/2014 11:34 AM, Michael Tokarev wrote:
>> 22.09.2014 10:23, Markus Armbruster wrote:
>>> Michael Tokarev <mjt@tls.msk.ru> writes:
>>>
>>>> Applied to -trivial, thank you!
>>>
>>> Makes my 'hmp: Remove "info pcmcia"' conflict.  Either revert this one
>>> before applying mine, or resolve the conflict and drop the paragraph
>>> about the bug from my commit message.
>>
>> Okay, I'll keep an eye on this -- I'm reverting the trivial patch
>> for now.
>
> So it looks like the original patch by zhanghailiang still applies,
> and your patch, `info pcmcia' removal, hasn't been applied for over
> a month. Should I apply the bugfix by zhanghailiang finally?

The 'remove info pcmcia' patch is in target-arm.next:
https://git.linaro.org/people/peter.maydell/qemu-arm.git/shortlog/refs/heads/target-arm.next

it's just that pressure of other stuff plus KVM Forum means
I haven't yet had a chance to scan for other ARM things to
pick up and flush the queue yet. I'll try to do that this
week.

thanks
-- PMM

