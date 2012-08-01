Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwZjW-0006Ll-0m
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 10:17:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwZjT-0006LY-6i
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 10:17:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwZjR-00016U-7S
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 10:17:03 -0400
Received: from mail-yx0-f173.google.com ([209.85.213.173]:44345)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwZjR-00016N-40
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 10:17:01 -0400
Received: by yenl1 with SMTP id l1so7135298yen.4
	for <qemu-trivial@nongnu.org>; Wed, 01 Aug 2012 07:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=c4Os+1qlPJpJ8RM9seGC7GLT5MQg9flMfMCVKlB5vCE=;
	b=epUKxTs1HeTPSRzWsHRXfgE7P3t7DbhXQgULohvl24ax2Xq9jwvbKvAyz12u78Vlze
	1F+p0TlSueDVCsou3dc80XRvwpLozNgFof2YfhdEFH77hFIRISPaEWQqvOyPk2VUXCLP
	rnFKjY1s7p9rtMVjuQNvYV5ufzyCDt+MGo/Zuqj6sxUcPit+KK7aO3OhJgZBfKg+EePn
	Mqcjr0Gcvw2kjqnbrrLh7LCuBoUGxZMN+rH+fRBVp7Cs8V3Z8G7xrqJ9aVF8j06Q/IUu
	KMlhRTi8GSjLStc/DcbNznAowI4X9ztOQQ8Z/6ers3Rd7BUjF1SBLqFppLmBWyZ6YAHU
	9BuQ==
MIME-Version: 1.0
Received: by 10.50.237.73 with SMTP id va9mr5440192igc.3.1343830620211; Wed,
	01 Aug 2012 07:17:00 -0700 (PDT)
Received: by 10.50.237.41 with HTTP; Wed, 1 Aug 2012 07:17:00 -0700 (PDT)
In-Reply-To: <5019379B.5080206@redhat.com>
References: <1343828147-9446-1-git-send-email-peter.maydell@linaro.org>
	<5019379B.5080206@redhat.com>
Date: Wed, 1 Aug 2012 15:17:00 +0100
Message-ID: <CAFEAcA_d6M8J-PVnXUbuBZ58OA5gahNkziWOEmYLY0wpLDB7rw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Avi Kivity <avi@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmkj1PGnfMK1G0PTbvcdjMhV/4bKPswf9mC3VBhJkKh8TDFmbJnDIUvV8WdmbdtPvEQJGX8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] exec.c: Remove out of date comment
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
X-List-Received-Date: Wed, 01 Aug 2012 14:17:04 -0000

On 1 August 2012 15:05, Avi Kivity <avi@redhat.com> wrote:
> On 08/01/2012 04:35 PM, Peter Maydell wrote:
>> Remove an out of date comment: this comment used to be attached to
>> cpu_register_physical_memory_log(), before commit 0f0cb164 accidentally
>> inserted a couple of other functions between the comment and its function.
>> It is in any case obsolete since (a) the function arguments it refers
>> to have been replaced with a single MemoryRegionSection* argument and
>> (b) the inability to handle regions whose offset_within_address_space
>> and offset_within_region aren't equally aligned was fixed as part of
>> the rewrite of this code.
>
> (c) it doesn't use the conventional block comment style.

I agree that I don't like the aesthetics of this style of comment
but we don't actually mandate a One True Comment Format in HACKING
so I usually try to suppress my preferences in code review :-)

-- PMM

