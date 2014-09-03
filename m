Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP5WK-0001a8-HB
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 04:02:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XP5WD-0001WO-NI
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 04:02:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XP5W8-00074J-UE
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 04:02:17 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:53927)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XP5Vx-00072t-0H; Wed, 03 Sep 2014 04:02:01 -0400
Received: from 172.24.2.119 (EHLO szxeml408-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ATW32885; Wed, 03 Sep 2014 16:01:47 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml408-hub.china.huawei.com
	(10.82.67.95) with Microsoft SMTP Server id 14.3.158.1; Wed, 3 Sep 2014
	16:01:39 +0800
Message-ID: <5406CAE1.301@huawei.com>
Date: Wed, 3 Sep 2014 16:01:37 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1409646337-22960-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<540620EC.20909@redhat.com>
In-Reply-To: <540620EC.20909@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.5406CAED.0072,ss=1,re=0.000,fgs=0,
	ip=0.0.0.0, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 4841a9f149dade6cf3e4f510fab6255b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, qemu-devel@nongnu.org,
	lcapitulino@redhat.com, peter.huangpeng@huawei.com, lersek@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] dump: let dump_error
 return error info to caller
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
X-List-Received-Date: Wed, 03 Sep 2014 08:02:23 -0000

On 2014/9/3 3:56, Eric Blake wrote:
> On 09/02/2014 02:25 AM, zhanghailiang wrote:
>> The second parameter of dump_error is unused, but one purpose of
>> using this function is to report the error info.
>>
>> Use error_set to return the error info to the caller.
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> ---
>>   V2:
>> - Return the error reason to the caller which suggested by Luiz Capitulino.
>> ---
>>   dump.c | 165 ++++++++++++++++++++++++++++++++---------------------------------
>>   1 file changed, 82 insertions(+), 83 deletions(-)
>>
>> diff --git a/dump.c b/dump.c
>> index 71d3e94..0ab72e7 100644
>> --- a/dump.c
>> +++ b/dump.c
>> @@ -81,9 +81,10 @@ static int dump_cleanup(DumpState *s)
>>       return 0;
>>   }
>>
>> -static void dump_error(DumpState *s, const char *reason)
>> +static void dump_error(DumpState *s, Error **errp, const char *reason)
>
> The Error **errp is typically listed last.
>
>>   {
>>       dump_cleanup(s);
>> +    error_setg(errp, "%s", reason);
>>   }
>>
>>   static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
>> @@ -99,7 +100,7 @@ static int fd_write_vmcore(const void *buf, size_t size, void *opaque)
>>       return 0;
>>   }
>>
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
>> +        dump_error(s, errp, "dump: failed to write elf header.\n");
>
> This ends up calling error_setg with a trailing newline, which should
> not be needed.  It looks like all of your conversions to the new
> dump_error should drop the \n in the message.
>

OK, i will fix it, Thanks.:)


