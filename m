Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RoCey-0002dF-BW
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2012 06:29:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RoCes-0002J6-Ud
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:29:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1RoCes-0003Jv-3W
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:29:26 -0500
Received: from david.siemens.de ([192.35.17.14]:21163)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1RoCef-0003I1-Sc; Fri, 20 Jan 2012 06:29:14 -0500
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id q0KBTAXD018239;
	Fri, 20 Jan 2012 12:29:10 +0100
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q0KBT7it003815;
	Fri, 20 Jan 2012 12:29:09 +0100
Message-ID: <4F195003.7050500@siemens.com>
Date: Fri, 20 Jan 2012 12:29:07 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1327057522-6590-1-git-send-email-pbonzini@redhat.com>
	<4F194D46.1050501@siemens.com> <4F194F4E.9060901@redhat.com>
In-Reply-To: <4F194F4E.9060901@redhat.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.14
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] rename get_clock_realtime
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
X-List-Received-Date: Fri, 20 Jan 2012 11:29:31 -0000

On 2012-01-20 12:26, Paolo Bonzini wrote:
> On 01/20/2012 12:17 PM, Jan Kiszka wrote:
>> On 2012-01-20 12:05, Paolo Bonzini wrote:
>>> get_clock_realtime accesses the host_clock, not the rt_clock.
>>>
>>> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
>>> ---
>>>   qemu-timer.c |    2 +-
>>>   qemu-timer.h |    4 ++--
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/qemu-timer.c b/qemu-timer.c
>>> index cd026c6..4a14a6d 100644
>>> --- a/qemu-timer.c
>>> +++ b/qemu-timer.c
>>> @@ -436,7 +436,7 @@ int64_t qemu_get_clock_ns(QEMUClock *clock)
>>>               return cpu_get_clock();
>>>           }
>>>       case QEMU_CLOCK_HOST:
>>> -        now = get_clock_realtime();
>>> +        now = get_clock_host();
>>>           last = clock->last;
>>>           clock->last = now;
>>>           if (now<  last) {
>>> diff --git a/qemu-timer.h b/qemu-timer.h
>>> index de17f3b..b180fca 100644
>>> --- a/qemu-timer.h
>>> +++ b/qemu-timer.h
>>> @@ -93,7 +93,7 @@ static inline int64_t get_ticks_per_sec(void)
>>>   }
>>>
>>>   /* real time host monotonic timer */
>>> -static inline int64_t get_clock_realtime(void)
>>> +static inline int64_t get_clock_host(void)
>>
>> It accesses the host realtime clock, so get_clock_host_realtime would be
>> optimal. In that light, the comment above should be fixed as well.
> 
> Yeah, however, realtime is quite confusing because CLOCK_MONOTONIC is 
> part of the "real-time clock API".  The code is much clearer than the 
> comment, I'll remove it completely.  v2 on the way.

There is CLOCK_MONOTONIC and CLOCK_REALTIME, and this function uses the
latter.

Jan

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

