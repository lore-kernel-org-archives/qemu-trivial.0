Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTisX-00020D-Lb
	for mharc-qemu-trivial@gnu.org; Mon, 15 Sep 2014 22:52:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XTisR-000203-Fr
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 22:52:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XTisM-0005dA-Fv
	for qemu-trivial@nongnu.org; Mon, 15 Sep 2014 22:52:23 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:64340)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XTisL-0005ct-M1; Mon, 15 Sep 2014 22:52:18 -0400
Received: from 172.24.2.119 (EHLO szxeml416-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBS63752; Tue, 16 Sep 2014 10:52:07 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml416-hub.china.huawei.com
	(10.82.67.155) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 16 Sep 2014 10:51:59 +0800
Message-ID: <5417A5CB.4010901@huawei.com>
Date: Tue, 16 Sep 2014 10:51:55 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1410835011-13292-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<5417A394.7050104@redhat.com>
In-Reply-To: <5417A394.7050104@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: Print maxmem in hex
 format for error message
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
X-List-Received-Date: Tue, 16 Sep 2014 02:52:28 -0000

On 2014/9/16 10:42, Eric Blake wrote:
> On 09/15/2014 08:36 PM, zhanghailiang wrote:
>> In error message, maxmem is printed in Dec but ram_size in Hex.
>> It is better to print them in same format.
>> Also use error_report instead of fprintf.
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> ---
>>   vl.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/vl.c b/vl.c
>> index 5db0d08..ea60f93 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -3358,34 +3358,34 @@ int main(int argc, char **argv, char **envp)
>>
>>                       sz = qemu_opt_get_size(opts, "maxmem", 0);
>>                       if (sz<  ram_size) {
>> -                        fprintf(stderr, "qemu: invalid -m option value: maxmem "
>> -                                "(%" PRIu64 ")<= initial memory ("
>> -                                RAM_ADDR_FMT ")\n", sz, ram_size);
>> +                        error_report("qemu: invalid -m option value: maxmem "
>> +                                "(0x%" PRIx64 ")<= initial memory (0x"
>> +                                RAM_ADDR_FMT ")", sz, ram_size);
>>                           exit(EXIT_FAILURE);
>>                       }
>>
>>                       slots = qemu_opt_get_number(opts, "slots", 0);
>>                       if ((sz>  ram_size)&&  !slots) {
>> -                        fprintf(stderr, "qemu: invalid -m option value: maxmem "
>> -                                "(%" PRIu64 ") more than initial memory ("
>> +                        error_report("qemu: invalid -m option value: maxmem "
>
> doesn't error_report already prepend  a variation of "qemu", making your
> "qemu: " redundant?
>

Yes, you are right, i will remove them, thanks;)


