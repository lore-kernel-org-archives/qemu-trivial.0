Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aqY0j-0007Pq-25
	for mharc-qemu-trivial@gnu.org; Wed, 13 Apr 2016 23:32:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47070)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1aqY0h-0007MU-GT
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2016 23:32:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1aqY0g-0003pI-Hm
	for qemu-trivial@nongnu.org; Wed, 13 Apr 2016 23:32:03 -0400
Received: from [59.151.112.132] (port=3617 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1aqY0a-0003n8-Q6; Wed, 13 Apr 2016 23:31:57 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5583484"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Apr 2016 11:31:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id F1077408D27F;
	Thu, 14 Apr 2016 11:31:52 +0800 (CST)
Received: from [10.167.225.55] (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Thu, 14 Apr 2016 11:31:52 +0800
Message-ID: <570F0FDB.2080701@cn.fujitsu.com>
Date: Thu, 14 Apr 2016 11:34:51 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Wei, Jiangang" <weijg.fnst@cn.fujitsu.com>, "qemu-devel@nongnu.org"
	<qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>
References: <1458036463-20180-1-git-send-email-weijg.fnst@cn.fujitsu.com>
	<1460603955.2269.29.camel@localhost>
In-Reply-To: <1460603955.2269.29.camel@localhost>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: F1077408D27F.A7254
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] accel: make
 configure_accelerator return void
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
X-List-Received-Date: Thu, 14 Apr 2016 03:32:04 -0000

On 04/14/2016 11:19 AM, Wei, Jiangang wrote:
> ping...
> Any comments?
> On Tue, 2016-03-15 at 18:07 +0800, Wei Jiangang wrote:
>> Return the negated value of accel_initialised is meaningless,
>> and the caller vl doesn't check it.
>>
>> Signed-off-by: Wei Jiangang <weijg.fnst@cn.fujitsu.com>
>> ---
>>   accel.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/accel.c b/accel.c
>> index 0510b90..403eb5e 100644
>> --- a/accel.c
>> +++ b/accel.c
>> @@ -77,7 +77,7 @@ static int accel_init_machine(AccelClass *acc, MachineState *ms)
>>       return ret;
>>   }
>>
>> -int configure_accelerator(MachineState *ms)
>> +void configure_accelerator(MachineState *ms)
>>   {
>>       const char *p;
>>       char buf[10];
>> @@ -128,8 +128,6 @@ int configure_accelerator(MachineState *ms)
>>       if (init_failed) {
>>           fprintf(stderr, "Back to %s accelerator.\n", acc->name);
>>       }
>> -
>> -    return !accel_initialised;
>>   }

Have you compiled the code with this path?

Thanks
	-Xie
>>
>>
>
>
>



