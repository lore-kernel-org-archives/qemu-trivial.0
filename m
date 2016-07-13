Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bNIQe-0005gF-EX
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jul 2016 07:34:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNIQb-0005dd-OU
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 07:34:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNIQZ-0003lD-PD
	for qemu-trivial@nongnu.org; Wed, 13 Jul 2016 07:34:08 -0400
Received: from [59.151.112.132] (port=7702 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bNIQS-0003j7-P7; Wed, 13 Jul 2016 07:34:02 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8667818"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 13 Jul 2016 19:33:28 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BA18041C0BB2;
	Wed, 13 Jul 2016 19:33:29 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 13 Jul 2016 19:33:15 +0800
To: Paolo Bonzini <pbonzini@redhat.com>, <qemu-devel@nongnu.org>
References: <1468400796-30474-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<4b36498b-a15f-1da3-0792-40709c2c230d@redhat.com>
CC: <qemu-trivial@nongnu.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <578628A0.60400@cn.fujitsu.com>
Date: Wed, 13 Jul 2016 19:40:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <4b36498b-a15f-1da3-0792-40709c2c230d@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: BA18041C0BB2.A82F3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH] qemu-timer: remove unnecessary code
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
X-List-Received-Date: Wed, 13 Jul 2016 11:34:10 -0000



On 07/13/2016 06:21 PM, Paolo Bonzini wrote:
>
>
> On 13/07/2016 11:06, Cao jin wrote:
>> When passed argument 'ns' is 0, macro DIV_ROUND_UP will return 0 also.
>
> It's potentially slower though.
>

Is it because the function in the i/o loop path, so the potentially 
extra arithmetical instructions matters?

> Paolo
>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   qemu-timer.c | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>
>> diff --git a/qemu-timer.c b/qemu-timer.c
>> index eb22e92..cfe0893 100644
>> --- a/qemu-timer.c
>> +++ b/qemu-timer.c
>> @@ -285,12 +285,8 @@ int qemu_timeout_ns_to_ms(int64_t ns)
>>           return -1;
>>       }
>>
>> -    if (!ns) {
>> -        return 0;
>> -    }
>> -
>>       /* Always round up, because it's better to wait too long than to wait too
>> -     * little and effectively busy-wait
>> +     * short and effectively busy-wait
>>        */
>>       ms = DIV_ROUND_UP(ns, SCALE_MS);
>>
>>
>
>
>

-- 
Yours Sincerely,

Cao jin



