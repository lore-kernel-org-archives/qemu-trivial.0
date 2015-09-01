Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZWjep-0000y0-3N
	for mharc-qemu-trivial@gnu.org; Tue, 01 Sep 2015 07:23:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZWjem-0000u9-5t
	for qemu-trivial@nongnu.org; Tue, 01 Sep 2015 07:23:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ZWjel-0006Mb-FW
	for qemu-trivial@nongnu.org; Tue, 01 Sep 2015 07:23:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1ZWjeg-0006Ku-E0; Tue, 01 Sep 2015 07:23:10 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id BF315368E3;
	Tue,  1 Sep 2015 11:23:09 +0000 (UTC)
Received: from [10.36.6.39] (vpn1-6-39.ams2.redhat.com [10.36.6.39])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t81BN8KE010088; Tue, 1 Sep 2015 07:23:08 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
	<1440703987-29012-7-git-send-email-lvivier@redhat.com>
	<CAFEAcA9cm4g0wOEAXGmhNZkWbD82o+eWkWpK4R-uorfFtJyOXA@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <55E58A9B.5060200@redhat.com>
Date: Tue, 1 Sep 2015 13:23:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9cm4g0wOEAXGmhNZkWbD82o+eWkWpK4R-uorfFtJyOXA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v3 6/9] arm: clarify the use of muldiv64()
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
X-List-Received-Date: Tue, 01 Sep 2015 11:23:17 -0000



On 01/09/2015 13:17, Peter Maydell wrote:
> On 27 August 2015 at 20:33, Laurent Vivier <lvivier@redhat.com> wrote:
>> muldiv64() is used to convert microseconds into CPU ticks.
>>
>> But it is not clear and not commented. This patch uses macro
>> to clearly identify what is used: time, CPU frequency and ticks.
>> For an elapsed time and a given frequency, we compute how many ticks
>>  we have.
>>
>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>> ---
>> v2: replace "arm: remove muldiv64()"
>>  target-arm/helper.c | 14 ++++++++------
>>  1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/target-arm/helper.c b/target-arm/helper.c
>> index 7df1f06..4455761 100644
>> --- a/target-arm/helper.c
>> +++ b/target-arm/helper.c
>> @@ -12,6 +12,8 @@
>>  #include <zlib.h> /* For crc32 */
>>  #include "exec/semihost.h"
>>
>> +#define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
> 
> LL suffix for large constants, please.

In fact, I didn't put the LL suffix to not force the use of a 64bit on a
32bit machines. Moreover in muldiv64() it is used as a 32bit value.

But if you think it is better, I will. Have I to resend the whole series
or only this patch ? Perhaps the commiter can edit it ?

> 
> Otherwise
> Acked-by: Peter Maydell <peter.maydell@linaro.org>
> 
> (assuming you're planning to put this somewhere other than the
> target-arm tree).
> 
> thanks
> -- PMM
> 

