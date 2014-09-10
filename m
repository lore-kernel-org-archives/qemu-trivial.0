Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XRdy2-0005S7-4h
	for mharc-qemu-trivial@gnu.org; Wed, 10 Sep 2014 05:13:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XRdxv-0005Es-CC
	for qemu-trivial@nongnu.org; Wed, 10 Sep 2014 05:13:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XRdxq-0007u7-1M
	for qemu-trivial@nongnu.org; Wed, 10 Sep 2014 05:13:27 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:64203)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XRdxe-0007rB-Vo; Wed, 10 Sep 2014 05:13:12 -0400
Received: from 172.24.2.119 (EHLO szxeml461-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AUD64825; Wed, 10 Sep 2014 17:13:06 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml461-hub.china.huawei.com
	(10.82.67.204) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 10 Sep 2014 17:12:56 +0800
Message-ID: <54101616.70606@huawei.com>
Date: Wed, 10 Sep 2014 17:12:54 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1409738096-35644-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<540F186C.2030508@redhat.com>
In-Reply-To: <540F186C.2030508@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.54101623.0009,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 4cf9a9536842f45c2f616f5b800bc6c2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, lcapitulino@redhat.com, lersek@redhat.com
Subject: Re: [Qemu-trivial] [PATCH v3] dump: let dump_error return error
	info to caller
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
X-List-Received-Date: Wed, 10 Sep 2014 09:13:32 -0000

On 2014/9/9 23:10, Eric Blake wrote:
> On 09/03/2014 03:54 AM, zhanghailiang wrote:
>> The second parameter of dump_error is unused, but one purpose of
>> using this function is to report the error info.
>>
>> Use error_set to return the error info to the caller.
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> ---
>>   V3:
>> - Drop the '\n' in the message when call dump_error(comment of Eric Blake)
>>   V2:
>> - Return the error reason to the caller which suggested by Luiz Capitulino.
>> ---
>>   dump.c | 165 ++++++++++++++++++++++++++++++++---------------------------------
>>   1 file changed, 82 insertions(+), 83 deletions(-)
>>
>> diff --git a/dump.c b/dump.c
>> index 71d3e94..a08a711 100644
>> --- a/dump.c
>> +++ b/dump.c
>> @@ -81,9 +81,10 @@ static int dump_cleanup(DumpState *s)
>>       return 0;
>>   }
>>
>> -static void dump_error(DumpState *s, const char *reason)
>> +static void dump_error(DumpState *s, Error **errp, const char *reason)
>
> I still think it is unusual to list the errp argument in the middle,
> instead of the end.  But not necessarily a show-stopper.
>

Good point, i will adjust its position to the end;-)

>
>> -static int write_elf64_header(DumpState *s)
>> +static int write_elf64_header(DumpState *s, Error **errp)
>>   {
>>       Elf64_Ehdr elf_header;
>>       int ret;
>> @@ -126,14 +127,14 @@ static int write_elf64_header(DumpState *s)
>>
>>       ret = fd_write_vmcore(&elf_header, sizeof(elf_header), s);
>>       if (ret<  0) {
>> -        dump_error(s, "dump: failed to write elf header.\n");
>> +        dump_error(s, errp, "dump: failed to write elf header.");
>
> We tend to avoid trailing '.' in error messages
>

OK, I will remove them.

>
>> +static int write_dump_pages(DumpState *s, Error **errp)
>>   {
>>       int ret = 0;
>>       DataCache page_desc, page_data;
>> @@ -1241,7 +1244,7 @@ static int write_dump_pages(DumpState *s)
>>       ret = write_cache(&page_data, buf, TARGET_PAGE_SIZE, false);
>>       g_free(buf);
>>       if (ret<  0) {
>> -        dump_error(s, "dump: failed to write page data(zero page).\n");
>> +        dump_error(s, errp, "dump: failed to write page data(zero page).");
>
> Pre-existing, but worth fixing: space before () in English sentences.
>

OK, will fix that, Thanks!


