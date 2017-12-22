Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eSTxz-00028e-44
	for mharc-qemu-trivial@gnu.org; Fri, 22 Dec 2017 15:30:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eSTxx-00026Q-0V
	for qemu-trivial@nongnu.org; Fri, 22 Dec 2017 15:30:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1eSTxw-0006A2-79
	for qemu-trivial@nongnu.org; Fri, 22 Dec 2017 15:30:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56094)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1eSTxo-00064N-Sl; Fri, 22 Dec 2017 15:30:41 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C6CAF1555A;
	Fri, 22 Dec 2017 20:30:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-74.ams2.redhat.com
	[10.36.116.74])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DF047C83C;
	Fri, 22 Dec 2017 20:30:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id C9BD61138645; Fri, 22 Dec 2017 21:30:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	"qemu-devel\@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
	<6bad4084f4cbc290e2e9f1a72fcfcda7223383ec.1513790495.git.alistair.francis@xilinx.com>
	<87lghulqno.fsf@dusky.pond.sub.org>
	<1cfb1217-e32d-8e91-da46-07f1c72be77f@redhat.com>
	<CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
Date: Fri, 22 Dec 2017 21:30:37 +0100
In-Reply-To: <CAKmqyKPyL8B5ZjEUePkqVbzP8kVmM48vWML41PRXVVO7LVmMpg@mail.gmail.com>
	(Alistair Francis's message of "Fri, 22 Dec 2017 11:57:20 -0800")
Message-ID: <87a7yah5ea.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 22 Dec 2017 20:30:39 +0000 (UTC)
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
X-List-Received-Date: Fri, 22 Dec 2017 20:30:50 -0000

Alistair Francis <alistair.francis@xilinx.com> writes:

> On Fri, Dec 22, 2017 at 9:17 AM, Thomas Huth <thuth@redhat.com> wrote:
>> On 22.12.2017 16:37, Markus Armbruster wrote:
>>> Second thoughts...
>>>
>>> Alistair Francis <alistair.francis@xilinx.com> writes:
>> [...]
>>>>  #include "qemu/osdep.h"
>>>> +#include "qemu/error-report.h"
>>>>  #include "qapi/error.h"
>>>>  #include "qemu-common.h"
>>>>  #include "cpu.h"
>>>> @@ -1311,8 +1312,8 @@ static void omap_prcm_apll_update(struct omap_prcm_s *s)
>>>>      /* TODO: update clocks */
>>>>
>>>>      if (mode[0] == 1 || mode[0] == 2 || mode[1] == 1 || mode[1] == 2)
>>>> -        fprintf(stderr, "%s: bad EN_54M_PLL or bad EN_96M_PLL\n",
>>>> -                        __func__);
>>>> +        error_report("%s: bad EN_54M_PLL or bad EN_96M_PLL",
>>>> +                     __func__);
>>>>  }
>>>
>>> This one's different: we neither exit() nor return a "failed" status to
>>> the caller.
>>>
>>> We get here when the guest writes something funny to a certain
>>> memory-mapped I/O register.  In other words, it's guest misbehavior, not
>>> a user error.  I doubt it should be reported with error_report().
>>> Peter, do we have a canonical way to report or log  guest misbehavior?
>>
>> qemu_log_mask(LOG_GUEST_ERROR, ...) ?
>
> That seems like the best option to me.

Suggest:

1. Keep converting fatal errors (the ones that exit())

2. Keep converting recoverable errors (the ones that return failure)

3. You can leave the prints that are neither alone.  You can also
   convert to logging or tracing, as appropriate, but that requires
   understanding the code.

Makes sense?

