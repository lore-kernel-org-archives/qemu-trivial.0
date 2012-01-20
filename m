Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RoCbu-0008NA-Ct
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2012 06:26:22 -0500
Received: from eggs.gnu.org ([140.186.70.92]:60382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RoCbr-0008By-DZ
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:26:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1RoCbp-0002iS-9S
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:26:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:14246)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1RoCbi-0002h6-2p; Fri, 20 Jan 2012 06:26:10 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q0KBQ9CU028203
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 20 Jan 2012 06:26:09 -0500
Received: from yakj.usersys.redhat.com (ovpn-112-23.ams2.redhat.com
	[10.36.112.23])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q0KBQ70G014899; Fri, 20 Jan 2012 06:26:07 -0500
Message-ID: <4F194F4E.9060901@redhat.com>
Date: Fri, 20 Jan 2012 12:26:06 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <1327057522-6590-1-git-send-email-pbonzini@redhat.com>
	<4F194D46.1050501@siemens.com>
In-Reply-To: <4F194D46.1050501@siemens.com>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Fri, 20 Jan 2012 11:26:21 -0000

On 01/20/2012 12:17 PM, Jan Kiszka wrote:
> On 2012-01-20 12:05, Paolo Bonzini wrote:
>> get_clock_realtime accesses the host_clock, not the rt_clock.
>>
>> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>
>> ---
>>   qemu-timer.c |    2 +-
>>   qemu-timer.h |    4 ++--
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/qemu-timer.c b/qemu-timer.c
>> index cd026c6..4a14a6d 100644
>> --- a/qemu-timer.c
>> +++ b/qemu-timer.c
>> @@ -436,7 +436,7 @@ int64_t qemu_get_clock_ns(QEMUClock *clock)
>>               return cpu_get_clock();
>>           }
>>       case QEMU_CLOCK_HOST:
>> -        now = get_clock_realtime();
>> +        now = get_clock_host();
>>           last = clock->last;
>>           clock->last = now;
>>           if (now<  last) {
>> diff --git a/qemu-timer.h b/qemu-timer.h
>> index de17f3b..b180fca 100644
>> --- a/qemu-timer.h
>> +++ b/qemu-timer.h
>> @@ -93,7 +93,7 @@ static inline int64_t get_ticks_per_sec(void)
>>   }
>>
>>   /* real time host monotonic timer */
>> -static inline int64_t get_clock_realtime(void)
>> +static inline int64_t get_clock_host(void)
>
> It accesses the host realtime clock, so get_clock_host_realtime would be
> optimal. In that light, the comment above should be fixed as well.

Yeah, however, realtime is quite confusing because CLOCK_MONOTONIC is 
part of the "real-time clock API".  The code is much clearer than the 
comment, I'll remove it completely.  v2 on the way.

Paolo


