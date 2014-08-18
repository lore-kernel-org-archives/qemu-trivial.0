Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XJArB-0008Ux-6v
	for mharc-qemu-trivial@gnu.org; Sun, 17 Aug 2014 20:31:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJAr5-0008NI-BA
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XJAr0-0004oD-Py
	for qemu-trivial@nongnu.org; Sun, 17 Aug 2014 20:31:23 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:11838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XJAqr-0004lJ-8i; Sun, 17 Aug 2014 20:31:09 -0400
Received: from 172.24.2.119 (EHLO SZXEML414-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYH36968; Mon, 18 Aug 2014 08:30:16 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by SZXEML414-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 18 Aug 2014 08:30:05 +0800
Message-ID: <53F14906.7020906@huawei.com>
Date: Mon, 18 Aug 2014 08:29:58 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1408001361-13580-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<1408001361-13580-7-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140814103137.GF31346@redhat.com>
In-Reply-To: <20140814103137.GF31346@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: kwolf@redhat.com, lkurusa@redhat.com, qemu-trivial@nongnu.org,
	jan.kiszka@siemens.com, riku.voipio@iki.fi, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, lcapitulino@redhat.com,
	stefanha@redhat.com, luonengjun@huawei.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, alex.bennee@linaro.org, rth@twiddle.net
Subject: Re: [Qemu-trivial] [PATCH v6 06/10] slirp/misc: Use g_malloc()
	instead of malloc()
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
X-List-Received-Date: Mon, 18 Aug 2014 00:31:27 -0000

On 2014/8/14 18:31, Michael S. Tsirkin wrote:
> On Thu, Aug 14, 2014 at 03:29:17PM +0800, zhanghailiang wrote:
>> Here we don't check the return value of malloc() which may fail.
>> Use the g_malloc() instead, which will abort the program when
>> there is not enough memory.
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
>
> OK, but then we need to find and replace free calls
> as well.
>

OK, i will do this, thanks. :)

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
>> --
>> 1.7.12.4
>>
>
> .
>



