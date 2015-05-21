Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YvH3Y-00075t-8f
	for mharc-qemu-trivial@gnu.org; Wed, 20 May 2015 23:22:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54593)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YvH3W-000748-S1
	for qemu-trivial@nongnu.org; Wed, 20 May 2015 23:21:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YvH3V-0008Fg-Pw
	for qemu-trivial@nongnu.org; Wed, 20 May 2015 23:21:58 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:8843)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YvH3P-00089C-7E; Wed, 20 May 2015 23:21:51 -0400
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id COD23703; Thu, 21 May 2015 11:21:40 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 21 May 2015 11:21:39 +0800
Message-ID: <555D4F3A.7070902@huawei.com>
Date: Thu, 21 May 2015 11:21:30 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>
References: <1432176875-5984-1-git-send-email-arei.gonglei@huawei.com>
	<555D4BDD.5070604@redhat.com>
In-Reply-To: <555D4BDD.5070604@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-error: make the timestamp more
	obvious and clear
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
X-List-Received-Date: Thu, 21 May 2015 03:21:59 -0000

On 2015/5/21 11:07, Eric Blake wrote:
> On 05/20/2015 08:54 PM, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> before:
>>    (qemu) 2015-05-21T02:07:43.695065Z qemu-system-x86_64: test....
> 
> Ah, but the trailing Z is UTC,
> 
>> after applying this patch:
>>    (qemu) [2015-05-21T02:21:46.023619Z UTC] qemu-system-x86_64: test....
> 
> so this representation is now redundant for specifying the same timezone
> twice.  Basically, 'Z', '+0000', and ' UTC' are synonyms; I don't know
> if any one form is more popular than others, but I don't think we need
> this patch.
> 
Yes, I checked it too, please ignore the noise.

Regards,
-Gonglei
>>
>> Cc: Eric Blake <eblake@redhat.com>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  util/qemu-error.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/util/qemu-error.c b/util/qemu-error.c
>> index 9bba5f5..0b91cbc 100644
>> --- a/util/qemu-error.c
>> +++ b/util/qemu-error.c
>> @@ -212,7 +212,7 @@ void error_vreport(const char *fmt, va_list ap)
>>      if (enable_timestamp_msg) {
>>          g_get_current_time(&tv);
>>          timestr = g_time_val_to_iso8601(&tv);
> 
> Since glib already provided a trailing Z, it's actually more work to
> strip it and provide an alternative of ' UTC'; so I'm inclined to NACK
> this patch, unless anyone else has a strong opinion in favor of it.
> 
>> -        error_printf("%s ", timestr);
>> +        error_printf("[%s UTC] ", timestr);
>>          g_free(timestr);
>>      }
>>  
>>
> 



