Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eWMAV-0002CT-Jl
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jan 2018 07:59:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eWMAQ-0002B1-Ln
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 07:59:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eWMAN-0003Sy-IM
	for qemu-trivial@nongnu.org; Tue, 02 Jan 2018 07:59:42 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52124)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eWMAE-0003RG-EU; Tue, 02 Jan 2018 07:59:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD0819D1F8;
	Tue,  2 Jan 2018 12:59:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-115.ams2.redhat.com
	[10.36.116.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 338865D965;
	Tue,  2 Jan 2018 12:59:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A7687113864C; Tue,  2 Jan 2018 13:59:26 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel\@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
	<CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
	<87a7yah5ea.fsf@dusky.pond.sub.org>
	<CAKmqyKO5sKdiZJ65teDxa16PCE71WCLay7cOAQJQdyS-EVNOJg@mail.gmail.com>
Date: Tue, 02 Jan 2018 13:59:26 +0100
In-Reply-To: <CAKmqyKO5sKdiZJ65teDxa16PCE71WCLay7cOAQJQdyS-EVNOJg@mail.gmail.com>
	(Alistair Francis's message of "Fri, 22 Dec 2017 12:58:53 -0800")
Message-ID: <87608k4dsh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 02 Jan 2018 12:59:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6 04/29] hw/arm: Replace
 fprintf(stderr, "*\n" with error_report()
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
X-List-Received-Date: Tue, 02 Jan 2018 12:59:43 -0000

Alistair Francis <alistair.francis@xilinx.com> writes:

> On Fri, Dec 22, 2017 at 12:30 PM, Markus Armbruster <armbru@redhat.com> wrote:
>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>
>>> On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
>>>> On 22.12.2017 16:37, Markus Armbruster wrote:
>>>>> Second thoughts...
>>>>>
>>>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>>> [...]
>>>>>>  #include "qemu/osdep.h"
>>>>>> +#include "qemu/error-report.h"
>>>>>>  #include "qapi/error.h"
>>>>>>  #include "qemu-common.h"
>>>>>>  #include "cpu.h"
>>>>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>>>>      /* TODO: update clocks */
>>>>>>
>>>>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>>>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>>>>> -                        __func__);
>>>>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>>>>> +                     __func__);
>>>>>>  }
>>>>>
>>>>> This one's different: we neither exit() nor return a "failed" status to
>>>>> the caller.
>>>>>
>>>>> We get here when the guest writes something funny to a certain
>>>>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>>>>> a user error.  I doubt it should be reported with error_report().
>>>>> Peter, do we have a canonical way to report or log  guest misbehavior?
>>>>
>>>> qemu_log_mask(LOG_GUEST_ERROR, ...) ?
>>>
>>> That seems like the best option to me.
>>
>> Suggest:
>>
>> 1. Keep converting fatal errors (the ones that exit())
>>
>> 2. Keep converting recoverable errors (the ones that return failure)
>>
>> 3. You can leave the prints that are neither alone.  You can also
>>    convert to logging or tracing, as appropriate, but that requires
>>    understanding the code.
>>
>> Makes sense?
>
> Does this apply to new patches after this series or to this series as
> well? The series is mostly just mechanical find/replace. I really
> don't want to have to dig through every patch to figure out what to
> change/not change.

I understand your reluctance to sort patch hunks into buckets 1., 2. and
3. manually: there's an awful lot of hunks to sort.

We know we have many fprintf() that should be error_report(),
error_setg(), logging or tracing.

We know we have error_report() that should be error_setg().

Converting fprintf() to error_report() where we should really use
something else makes the situation worse, I'm afraid.

Since we need to sort, and sorting manually isn't practical, we need to
automate.

The patterns to recognize are 1. fprintf() followed by exit() and
2. fprintf() followed by return failure.

Recognizing the patterns when there's stuff between fprintf() and exit()
/ return may exceed sed's power.  Feels like a Coccinelle job to me.
Let's focus on the common case where exit() / return follows fprintf()
immediately.

Let's start with the easiest case: exit().  I figure that's still in
reach of your find + sed tooling.

Recognizing "return failure" is slightly harder, because error values
aren't always obvious.  Common ones are return NULL, return -1, return
-EFOO.

I hope that peeling off truly simple cases like this will reduce the
remaining hunks sufficiently to permit manual review.  If it doesn't, we
should still get a major part of your work without making the situation
worse.

