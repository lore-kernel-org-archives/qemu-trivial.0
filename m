Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1arxNd-0001Ko-MT
	for mharc-qemu-trivial@gnu.org; Sun, 17 Apr 2016 20:49:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1arxNb-0001Ew-Gk
	for qemu-trivial@nongnu.org; Sun, 17 Apr 2016 20:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1arxNa-0005N1-N6
	for qemu-trivial@nongnu.org; Sun, 17 Apr 2016 20:49:31 -0400
Received: from [59.151.112.132] (port=4907 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1arxNU-00058a-J5; Sun, 17 Apr 2016 20:49:25 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="5679497"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 18 Apr 2016 08:49:04 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 847AB42B55E5;
	Mon, 18 Apr 2016 08:49:03 +0800 (CST)
Received: from [10.167.225.55] (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Mon, 18 Apr 2016 08:49:03 +0800
Message-ID: <57142FB7.6020901@cn.fujitsu.com>
Date: Mon, 18 Apr 2016 08:52:07 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Max Reitz <mreitz@redhat.com>, qemu devel <qemu-devel@nongnu.org>, qemu
	trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, Stefan
	Hajnoczi <stefanha@redhat.com>
CC: Wen Congyang <wency@cn.fujitsu.com>
References: <1460699173-31401-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<1460699173-31401-2-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<5712B5AA.8000707@redhat.com>
In-Reply-To: <5712B5AA.8000707@redhat.com>
Content-Type: text/plain; charset="iso-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 847AB42B55E5.A7C0C
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH v1 1/2] block: fix description of @stats
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
X-List-Received-Date: Mon, 18 Apr 2016 00:49:32 -0000

On 04/17/2016 05:59 AM, Max Reitz wrote:
> On 15.04.2016 07:46, Changlong Xie wrote:
>> Qemu does not support "info blockstats" now.
>
> It doesn't? Mine is more than happy to accept that command:
>
> $ x86_64-softmmu/qemu-system-x86_64 -nodefaults \
>      -drive if=none,id=drv0,driver=null-co \
>      -monitor stdio
> QEMU 2.5.90 monitor - type 'help' for more information
> (qemu) info blockstats
> drv0: rd_bytes=0 wr_bytes=0 rd_operations=0 wr_operations=0
> flush_operations=0 wr_total_time_ns=0 rd_total_time_ns=0
> flush_total_time_ns=0 rd_merged=0 wr_merged=0 idle_time_ns=0
>

It seems i missed something, you are right.

> Max
>
>> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
>> ---
>>   block/block-backend.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/block/block-backend.c b/block/block-backend.c
>> index d74f670..05d5d09 100644
>> --- a/block/block-backend.c
>> +++ b/block/block-backend.c
>> @@ -49,7 +49,7 @@ struct BlockBackend {
>>
>>       bool enable_write_cache;
>>
>> -    /* I/O stats (display with "info blockstats"). */
>> +    /* I/O stats (display with { "execute": "query-blockstats" }). */
>>       BlockAcctStats stats;
>>
>>       BlockdevOnError on_read_error, on_write_error;
>>
>
>



