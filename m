Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYhr6-0002LB-7F
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 19:33:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYhr3-0002IH-SI
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 19:33:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eYhr1-0000Nq-An
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 19:33:25 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:36810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eYhr0-0000NW-Qi; Mon, 08 Jan 2018 19:33:23 -0500
Received: by mail-wm0-x244.google.com with SMTP id b76so17542207wmg.1;
	Mon, 08 Jan 2018 16:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=KlmCdve/cVN0vZ3zxijjiV174ba7i7AY1fgWMYvI2aM=;
	b=ejuEAGdAwdoTeT47L5R5QAdSEECom1C31DtKdfaWs5ZtsDULsE5rrgfXEpNqcY4m7u
	FITjf0xHBw+LKh3DsPd/mYrsV9c7vaS1cb312Aw0DtVVnl28rPO1Dl/rMN0dQ/Ay+yur
	Wq3S0mu/XOkR2NQMSY+wEp7aw7O6KhjqAiE/tboGXU5jKoEYVbRBsV+K3cgQTMbMeKcg
	sy7Cim1qlrh0zmlgKkhpmTKSRcppn8lYpbbsu0JxvFvg1EeCSbgalXi5ipN7LucOaU5a
	kmFrIaNaLDr6siakBlCBewgkzdyM5gG+weAukSTPqZ7ncmmvivN+yI4npyX/M34GIVAu
	TAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=KlmCdve/cVN0vZ3zxijjiV174ba7i7AY1fgWMYvI2aM=;
	b=pxJXyPzVJPh26N9kJs+5wesm+NoW+67cVgrFfwnCik2iaBf/infSlmR82a6G4XoH5c
	f194GRSS3rX90cPNSdUO0C1qwJyF/YsYtlMldG++GjwXdlexP7kehjdBG6O5eRDw9aLs
	E6FGd+WHOgoxRcT7RoouuIke2ff/C9hahqtON7fE8+UagAW9/LagansQEjfF8uoYL71m
	PEsrWO6CU2oc+gD0mrAx5pvUrtDH6RWM8Hu0HfywqIiUebxsDwHf/ADAS3l3FP8dVvGO
	bmIgZFUogvJOId1p+MhWum2mDb8UJU4MDNboDCXf4O9YK0MPOIkRZbLXhJl1tDWFTxO4
	oDsg==
X-Gm-Message-State: AKGB3mKPR7srUSJ0aLijSEaXlaKazoEuCGcwIzepIUi9JyrmpX75XDAb
	DdoBFgMHIHodGnxYbDyUwErtDNJaiw5kSqN+Np1PLfJDUas=
X-Google-Smtp-Source: ACJfBot9iiSwRebjSo+OChnWeYNXYG70AhN2V+Y252K7djIH8iZ0xES/gwVHyLkwgOfH2jtxfYfpDKFpWOFUY9dzfR0=
X-Received: by 10.28.208.79 with SMTP id h76mr9523465wmg.77.1515458001597;
	Mon, 08 Jan 2018 16:33:21 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Mon, 8 Jan 2018 16:32:51 -0800 (PST)
In-Reply-To: <87608k4dsh.fsf@dusky.pond.sub.org>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
	<CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
	<87a7yah5ea.fsf@dusky.pond.sub.org>
	<CAKmqyKO5sKdiZJ65teDxa16PCE71WCLay7cOAQJQdyS-EVNOJg@mail.gmail.com>
	<87608k4dsh.fsf@dusky.pond.sub.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Jan 2018 16:32:51 -0800
X-Google-Sender-Auth: DDtYIhOfMHXLX15Au4LaJKcU1_0
Message-ID: <CAKmqyKMz2tfJwu0Q5joHm99QLbJ-psU=sSgDQtLuFKjyKRmO-A@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Alistair Francis <alistair.francis@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
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
X-List-Received-Date: Tue, 09 Jan 2018 00:33:27 -0000

On Tue, Jan 2, 2018 at 4:59 AM, Markus Armbruster <armbru@redhat.com> wrote:
> Alistair Francis <alistair.francis@xilinx.com> writes:
>
>> On Fri, Dec 22, 2017 at 12:30 PM, Markus Armbruster <armbru@redhat.com> wrote:
>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>>
>>>> On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
>>>>> On 22.12.2017 16:37, Markus Armbruster wrote:
>>>>>> Second thoughts...
>>>>>>
>>>>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>>>>> [...]
>>>>>>>  #include "qemu/osdep.h"
>>>>>>> +#include "qemu/error-report.h"
>>>>>>>  #include "qapi/error.h"
>>>>>>>  #include "qemu-common.h"
>>>>>>>  #include "cpu.h"
>>>>>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>>>>>      /* TODO: update clocks */
>>>>>>>
>>>>>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>>>>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>>>>>> -                        __func__);
>>>>>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>>>>>> +                     __func__);
>>>>>>>  }
>>>>>>
>>>>>> This one's different: we neither exit() nor return a "failed" status to
>>>>>> the caller.
>>>>>>
>>>>>> We get here when the guest writes something funny to a certain
>>>>>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>>>>>> a user error.  I doubt it should be reported with error_report().
>>>>>> Peter, do we have a canonical way to report or log  guest misbehavior?
>>>>>
>>>>> qemu_log_mask(LOG_GUEST_ERROR, ...) ?
>>>>
>>>> That seems like the best option to me.
>>>
>>> Suggest:
>>>
>>> 1. Keep converting fatal errors (the ones that exit())
>>>
>>> 2. Keep converting recoverable errors (the ones that return failure)
>>>
>>> 3. You can leave the prints that are neither alone.  You can also
>>>    convert to logging or tracing, as appropriate, but that requires
>>>    understanding the code.
>>>
>>> Makes sense?
>>
>> Does this apply to new patches after this series or to this series as
>> well? The series is mostly just mechanical find/replace. I really
>> don't want to have to dig through every patch to figure out what to
>> change/not change.
>
> I understand your reluctance to sort patch hunks into buckets 1., 2. and
> 3. manually: there's an awful lot of hunks to sort.
>
> We know we have many fprintf() that should be error_report(),
> error_setg(), logging or tracing.
>
> We know we have error_report() that should be error_setg().
>
> Converting fprintf() to error_report() where we should really use
> something else makes the situation worse, I'm afraid.
>
> Since we need to sort, and sorting manually isn't practical, we need to
> automate.
>
> The patterns to recognize are 1. fprintf() followed by exit() and
> 2. fprintf() followed by return failure.
>
> Recognizing the patterns when there's stuff between fprintf() and exit()
> / return may exceed sed's power.  Feels like a Coccinelle job to me.
> Let's focus on the common case where exit() / return follows fprintf()
> immediately.
>
> Let's start with the easiest case: exit().  I figure that's still in
> reach of your find + sed tooling.
>
> Recognizing "return failure" is slightly harder, because error values
> aren't always obvious.  Common ones are return NULL, return -1, return
> -EFOO.
>
> I hope that peeling off truly simple cases like this will reduce the
> remaining hunks sufficiently to permit manual review.  If it doesn't, we
> should still get a major part of your work without making the situation
> worse.

Ok. So it is becoming apparent that this series is not going to be
accepted. I might just drop it and try and re-group with Coccinelle at
some point in the future.

If there is a subset of this series that is fine to go in I'm happy to
rebase and keep going, but at the moment it looks like starting again
is gong to be the least painful effort.

Alistair

>

