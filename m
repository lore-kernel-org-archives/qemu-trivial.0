Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJdtv-0002tb-Gi
	for mharc-qemu-trivial@gnu.org; Tue, 19 Aug 2014 03:32:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41806)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJdtq-0002t2-Kz
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 03:32:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJdtl-00007y-VV
	for qemu-trivial@nongnu.org; Tue, 19 Aug 2014 03:32:10 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:38702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJdtl-00007Q-2R; Tue, 19 Aug 2014 03:32:05 -0400
Received: from 172.24.2.119 (EHLO szxeml421-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CAM31611; Tue, 19 Aug 2014 15:31:27 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml421-hub.china.huawei.com
	(10.82.67.160) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 19 Aug 2014 15:31:21 +0800
Message-ID: <53F2FD31.1010102@huawei.com>
Date: Tue, 19 Aug 2014 15:30:57 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1408348310-6628-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<53F1E445.1060301@msgid.tls.msk.ru>
In-Reply-To: <53F1E445.1060301@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, jan.kiszka@siemens.com, luonengjun@huawei.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH v7] slirp/misc: Use g_malloc() instead of
 malloc()
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
X-List-Received-Date: Tue, 19 Aug 2014 07:32:15 -0000

On 2014/8/18 19:32, Michael Tokarev wrote:
> 18.08.2014 11:51, zhanghailiang пишет:
>> Here we don't check the return value of malloc() which may fail.
>> Use the g_malloc() instead, which will abort the program when
>> there is not enough memory.
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
>> ---
>>   slirp/misc.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/slirp/misc.c b/slirp/misc.c
>> index b8eb74c..f7fe497 100644
>> --- a/slirp/misc.c
>> +++ b/slirp/misc.c
>> @@ -54,7 +54,7 @@ int add_exec(struct ex_list **ex_ptr, int do_pty, char *exec,
>>   	}
>>
>>   	tmp_ptr = *ex_ptr;
>> -	*ex_ptr = (struct ex_list *)malloc(sizeof(struct ex_list));
>> +	*ex_ptr = (struct ex_list *)g_malloc(sizeof(struct ex_list));
>
> There's a convinient macro in glib, g_new(typename, numelts).  Also
> there's a less commonly used g_renew() which is like realloc, but it
> is not applicable here.
>
Hmm, it is a good idea to use g_new instead of g_malloc,
we have to perform type cast for g_malloc.(BTW, i found in qemu there
are several places use g_malloc but not perform appropriate type
coercions)
I will modify this.Thanks :)

>>   	(*ex_ptr)->ex_fport = port;
>>   	(*ex_ptr)->ex_addr = addr;
>>   	(*ex_ptr)->ex_pty = do_pty;
>> @@ -235,7 +235,7 @@ strdup(str)
>>   {
>>   	char *bptr;
>>
>> -	bptr = (char *)malloc(strlen(str)+1);
>> +	bptr = (char *)g_malloc(strlen(str)+1);
>>   	strcpy(bptr, str);
>>
>>   	return bptr;
>
> Oh.  And this one should be removed completely.  It is a reimplementation
> of strdup() for system which lacks it.  This code should go, we don't build

I couldn't agree more, i will removed it.

> on such a system anyway and we always have g_strdup().  There's one more
> usage of strdup() in this file, btw.
>

OK, Thanks.

> I'm sorry for being so picky, and you're already at v7, but heck.. We should
> be more active at reviewing patches :)
>

Aha! ;),i really appreciate your help. I learned a lot. Thanks.

> Thanks,
>
> /mjt
>
> .
>



