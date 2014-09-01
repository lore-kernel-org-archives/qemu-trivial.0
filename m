Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XOMEo-0006OD-MS
	for mharc-qemu-trivial@gnu.org; Mon, 01 Sep 2014 03:41:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49362)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XOMEi-0006GB-7I
	for qemu-trivial@nongnu.org; Mon, 01 Sep 2014 03:41:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XOMEd-0002yH-Dj
	for qemu-trivial@nongnu.org; Mon, 01 Sep 2014 03:41:12 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:17722)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XOMEO-0002nT-5O; Mon, 01 Sep 2014 03:40:52 -0400
Received: from 172.24.2.119 (EHLO szxeml463-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BYW41864; Mon, 01 Sep 2014 15:40:40 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml463-hub.china.huawei.com
	(10.82.67.206) with Microsoft SMTP Server id 14.3.158.1; Mon, 1 Sep 2014
	15:40:28 +0800
Message-ID: <540422E9.9060001@huawei.com>
Date: Mon, 1 Sep 2014 15:40:25 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1409138333-12644-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140827091827.4de1dc59@redhat.com> <5400347A.9040105@huawei.com>
	<20140829085521.788ce268@redhat.com>
In-Reply-To: <20140829085521.788ce268@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, lersek@redhat.com,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH] dump: let dump_error printf the error
	reason
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
X-List-Received-Date: Mon, 01 Sep 2014 07:41:17 -0000

On 2014/8/29 20:55, Luiz Capitulino wrote:
> On Fri, 29 Aug 2014 16:06:18 +0800
> zhanghailiang<zhang.zhanghailiang@huawei.com>  wrote:
>
>> On 2014/8/27 21:18, Luiz Capitulino wrote:
>>> On Wed, 27 Aug 2014 19:18:53 +0800
>>> zhanghailiang<zhang.zhanghailiang@huawei.com>   wrote:
>>>
>>>> The second parameter of dump_error is unused, but one purpose of
>>>> using this function is to report the error info.
>>>>
>>>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>>>> ---
>>>>    dump.c | 3 +++
>>>>    1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/dump.c b/dump.c
>>>> index 71d3e94..0f44e9d 100644
>>>> --- a/dump.c
>>>> +++ b/dump.c
>>>> @@ -83,6 +83,9 @@ static int dump_cleanup(DumpState *s)
>>>>
>>>>    static void dump_error(DumpState *s, const char *reason)
>>>>    {
>>>> +    if (reason) {
>>>> +        error_report("%s", reason);
>>>> +    }
>>>>        dump_cleanup(s);
>>>>    }
>>>>
>>>
>>> Good catch, but error_report() will report the error only to the user. This
>>> is QMP code, so we have to use the Error API.
>>>
>>> I think that the best way to solve this is to make dump_error() fill an
>>> Error object (eg. by calling error_setg()) and then returning it after
>>> the call to dump_cleanup(). Of course that you will have to change _all_
>>> code paths calling dump_error() to propagate the error up.
>>>
>>> For more information on this, please read docs/writing-qmp-commands.txt.
>>> You can also take a look at simple commands doing error propagation, like
>>> qmp_cont() or qmp_block_passwd().
>>>
>>> .
>>>
>> Hi,
>>
>> Thanks for your review.
>>
>> Actually, for all paths that call dump_error, at last they will come into a
>> common path which will call error_setg().
>>
>> The call process as below:
>> qmp_dump_guest_memory
>> (1)	-->create_kdump_vmcore
>> 		-->write_start_flat_header
>> 			-->dump_error
>> 		-->write_end_flat_header
>> 			-->dump_error
>> 		...
>>           -->error_set(errp, QERR_IO_ERROR)(if create_kdump_vmcore failed)
>> (2)	-->create_vmcore
>> 		-->dump_begin
>> 			-->write_elf64_header
>> 				-->dump_error
>> 			-->write_elf64_note
>> 				-->dump_error
>> 			...
>> 		-->dump_iterate
>> 			-->write_data
>> 				-->dump_error
>> 			...
>> 	-->error_set(errp, QERR_IO_ERROR)(if create_kdump_vmcore failed)
>>
>> And a short *IO ERROR* info will be returned to the caller of qmp_dump_guest_memory.
>>
>> So, is it OK in dump_error just report the detailed error info to users
>> (actually, it will be stored in qemu log)? Or should these error info
>> also returned to the caller?
>
> The errors should be propagated up to the caller. This way they can be
> consumed by QMP and HMP.
>

OK, I will fix this and submit the second version. Thanks:)

>>
>> What's your suggestion? Thanks.:)
>>
>> Best Regards,
>> zhanghailiang
>>
>>
>>
>>
>
>
> .
>



