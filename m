Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZB52b-0004F4-UY
	for mharc-qemu-trivial@gnu.org; Fri, 03 Jul 2015 13:46:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZB52Y-0004Dt-TG
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 13:46:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZB52V-0004ru-HB
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 13:46:18 -0400
Received: from mail-vn0-f53.google.com ([209.85.216.53]:46644)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZB52V-0004rg-DH
	for qemu-trivial@nongnu.org; Fri, 03 Jul 2015 13:46:15 -0400
Received: by vnbg190 with SMTP id g190so16350796vnb.13
	for <qemu-trivial@nongnu.org>; Fri, 03 Jul 2015 10:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=qop2aDKRComqDdGKwVaVyneN3d480subO0aX7a4sGRU=;
	b=mWYRliRb6bkN6ARouUlH37XTboRjxWF1UO4OqH6KGUzMD7k+vU8m/9cu4lCTYKO45c
	68BlDeimvLkb0XgfmJix8+ZFn/0sssr49Hk7IMrHbbsSBarbFm8aR5ZlIesj8kPjMUXo
	Hqd6vllzczF3gnPXA1Wp5jeL2Dd46KxOg45+f4H+RJm+A///t1j1TAIRI6uJIQk4UBt5
	Vg79hGrwB0yM+mYz2ErbptwHDWlFGtyNAUh12u+/TuCAg+ReOLUpQMw0pGbL3EShFwdp
	biQiL3L7fFY7wC5hv2raicN++oaLUXsqRn5VunY4dKB2K5KayKcZzQlTj1vbnV3ngf9Z
	5Fng==
X-Gm-Message-State: ALoCoQlWKwZF+66R/2fKs26iCSDyiVXF4fIxUBn6w+r6deLaHTCoLUNXUK2kmfnWFE3PguSJ3pte
X-Received: by 10.52.114.42 with SMTP id jd10mr37244619vdb.90.1435945574862;
	Fri, 03 Jul 2015 10:46:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Fri, 3 Jul 2015 10:45:55 -0700 (PDT)
In-Reply-To: <87twtlywwy.fsf@blackfin.pond.sub.org>
References: <1435933104-15216-1-git-send-email-peter.maydell@linaro.org>
	<87twtlywwy.fsf@blackfin.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2015 18:45:55 +0100
Message-ID: <CAFEAcA99xWs0+c+V0xzb4WVM=afHPhauftEKe0bbePro8tBZRA@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.53
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Stop including
	qemu-common.h in memory.h
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
X-List-Received-Date: Fri, 03 Jul 2015 17:46:20 -0000

On 3 July 2015 at 18:26, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Including qemu-common.h from other header files is generally a bad
>> idea, because it means it's very easy to end up with a circular
>> dependency. For instance, if we wanted to include memory.h from
>> qom/cpu.h we'd end up with this loop:
>>  memory.h -> qemu-common.h -> cpu.h -> cpu-qom.h -> qom/cpu.h -> memory.h
>>
>> Remove the include from memory.h. This requires us to fix up a few
>> other files which were inadvertently getting declarations indirectly
>> through memory.h.
>>
>> The biggest change is splitting the fprintf_function typedef out
>> into its own header so other headers can get at it without having
>> to include qemu-common.h.
>
> Why not simply put it in qemu/typedefs.h?

I thought about that, but that header claims it is specifically for
opaque typedefs, and also I didn't really want to add the stdio.h
and compiler.h includes to it.

-- PMM

