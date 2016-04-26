Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1av35R-0005ic-Cz
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2016 09:31:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1auyKF-0001JV-2r
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 04:26:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>) id 1auyKE-0004p6-27
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2016 04:26:31 -0400
Received: from [59.151.112.132] (port=50200 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhoujie2011@cn.fujitsu.com>)
	id 1auyK7-0004oX-W6; Tue, 26 Apr 2016 04:26:24 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5963910"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Apr 2016 16:26:20 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7F60B408D29C;
	Tue, 26 Apr 2016 16:26:19 +0800 (CST)
Received: from [10.167.226.49] (10.167.226.49) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Tue, 26 Apr 2016 16:26:19 +0800
To: Christian Borntraeger <borntraeger@de.ibm.com>, <qemu-devel@nongnu.org>
References: <1461633961-31713-1-git-send-email-zhoujie2011@cn.fujitsu.com>
	<571F1CA4.70306@de.ibm.com>
CC: <qemu-trivial@nongnu.org>, <jasowang@redhat.com>
From: Zhou Jie <zhoujie2011@cn.fujitsu.com>
Message-ID: <571F262A.3020705@cn.fujitsu.com>
Date: Tue, 26 Apr 2016 16:26:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <571F1CA4.70306@de.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-yoursite-MailScanner-ID: 7F60B408D29C.AE47B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhoujie2011@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
X-Mailman-Approved-At: Tue, 26 Apr 2016 09:31:31 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net/tap: Allocating Large
 sized arrays to heap
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
X-List-Received-Date: Tue, 26 Apr 2016 08:26:32 -0000

On 2016/4/26 15:45, Christian Borntraeger wrote:
> On 04/26/2016 03:26 AM, Zhou Jie wrote:
>> net_init_tap has a huge stack usage of 8192 bytes approx.
>> Moving large arrays to heap to reduce stack usage.
>
> I am wondering. Why is 8k a problem for a user space program?
For 64bit machine it will be 16k.

> Please note that malloc/new like allocations are much more expensive
> than stack allocation in terms of performance. This does not matter
> here, but in your other patch that deals with the xmit function, I would
> not be surprised if that actually harms performance.
OK. I will note it.

Sincerely,
Zhou Jie

>
> Christian
>
>
>
>>
>> Signed-off-by: Zhou Jie <zhoujie2011@cn.fujitsu.com>
>> ---
>>   net/tap.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/net/tap.c b/net/tap.c
>> index 740e8a2..49817c7 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -769,8 +769,8 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>>               return -1;
>>           }
>>       } else if (tap->has_fds) {
>> -        char *fds[MAX_TAP_QUEUES];
>> -        char *vhost_fds[MAX_TAP_QUEUES];
>> +        char **fds = g_new(char *, MAX_TAP_QUEUES);
>> +        char **vhost_fds = g_new(char *, MAX_TAP_QUEUES);
>>           int nfds, nvhosts;
>>
>>           if (tap->has_ifname || tap->has_script || tap->has_downscript ||
>> @@ -818,6 +818,8 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>>                   return -1;
>>               }
>>           }
>> +        g_free(fds);
>> +        g_free(vhost_fds);
>>       } else if (tap->has_helper) {
>>           if (tap->has_ifname || tap->has_script || tap->has_downscript ||
>>               tap->has_vnet_hdr || tap->has_queues || tap->has_vhostfds) {
>>
>
>
>
>

-- 
------------------------------------------------
周潔
Dept 1
No. 6 Wenzhu Road,
Nanjing, 210012, China
TEL：+86+25-86630566-8557
FUJITSU INTERNAL：7998-8557
E-Mail：zhoujie2011@cn.fujitsu.com
------------------------------------------------



