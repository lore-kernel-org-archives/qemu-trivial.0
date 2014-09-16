Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XTozo-00052s-QB
	for mharc-qemu-trivial@gnu.org; Tue, 16 Sep 2014 05:24:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XTozi-00051w-LX
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 05:24:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XTozZ-0001Ad-Qq
	for qemu-trivial@nongnu.org; Tue, 16 Sep 2014 05:24:18 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:49308)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XTozY-00012A-V2; Tue, 16 Sep 2014 05:24:09 -0400
Received: from 172.24.2.119 (EHLO szxeml401-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AUL05621; Tue, 16 Sep 2014 17:23:59 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml401-hub.china.huawei.com
	(10.82.67.31) with Microsoft SMTP Server id 14.3.158.1; Tue, 16 Sep 2014
	17:23:50 +0800
Message-ID: <541801A4.5050805@huawei.com>
Date: Tue, 16 Sep 2014 17:23:48 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>
References: <1410853532-9956-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<20140916111258.7f842ab8@nial.usersys.redhat.com>
In-Reply-To: <20140916111258.7f842ab8@nial.usersys.redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.541801B0.0067, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 2669b017bd5480c14ea8649399cc335d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl: Print maxmem in hex
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
X-List-Received-Date: Tue, 16 Sep 2014 09:24:23 -0000

On 2014/9/16 17:12, Igor Mammedov wrote:
> On Tue, 16 Sep 2014 15:45:32 +0800
> zhanghailiang<zhang.zhanghailiang@huawei.com>  wrote:
>
>> In error message, maxmem is printed in Dec but ram_size in Hex.
>> It is better to print them in same format.
>> Also use error_report instead of fprintf.
>>
>> Signed-off-by: zhanghailiang<zhang.zhanghailiang@huawei.com>
>> ---
>>   v2:
>> - Remove redundant "qemu:" in error message, for error_report already prepend
>>    a variation of "qemu" (comment of Eric Blake)
>> ---
>>   vl.c | 22 +++++++++++-----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/vl.c b/vl.c
>> index 5db0d08..71a831b 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -3358,34 +3358,34 @@ int main(int argc, char **argv, char **envp)
>>
>>                       sz = qemu_opt_get_size(opts, "maxmem", 0);
>>                       if (sz<  ram_size) {
>> -                        fprintf(stderr, "qemu: invalid -m option value: maxmem "
>> -                                "(%" PRIu64 ")<= initial memory ("
>> -                                RAM_ADDR_FMT ")\n", sz, ram_size);
>> +                        error_report("invalid -m option value: maxmem "
>> +                                "(0x%" PRIx64 ")<= initial memory (0x"
>> +                                RAM_ADDR_FMT ")", sz, ram_size);
>>                           exit(EXIT_FAILURE);
>>                       }
>>
>>                       slots = qemu_opt_get_number(opts, "slots", 0);
>>                       if ((sz>  ram_size)&&  !slots) {
>> -                        fprintf(stderr, "qemu: invalid -m option value: maxmem "
>> -                                "(%" PRIu64 ") more than initial memory ("
>> +                        error_report("invalid -m option value: maxmem "
>> +                                "(0x%" PRIx64 ") more than initial memory (0x"
>>                                   RAM_ADDR_FMT ") but no hotplug slots where "
>> -                                "specified\n", sz, ram_size);
>> +                                "specified", sz, ram_size);
>>                           exit(EXIT_FAILURE);
>>                       }
>>
>>                       if ((sz<= ram_size)&&  slots) {
>> -                        fprintf(stderr, "qemu: invalid -m option value:  %"
>> +                        error_report("invalid -m option value:  %"
>>                                   PRIu64 " hotplug slots where specified but "
>> -                                "maxmem (%" PRIu64 ")<= initial memory ("
>> -                                RAM_ADDR_FMT ")\n", slots, sz, ram_size);
>> +                                "maxmem (0x%" PRIx64 ")<= initial memory (0x"
>> +                                RAM_ADDR_FMT ")", slots, sz, ram_size);
>>                           exit(EXIT_FAILURE);
>>                       }
>>                       maxram_size = sz;
>>                       ram_slots = slots;
>>                   } else if ((!maxmem_str&&  slots_str) ||
>>                              (maxmem_str&&  !slots_str)) {
>> -                    fprintf(stderr, "qemu: invalid -m option value: missing "
>> -                            "'%s' option\n", slots_str ? "maxmem" : "slots");
>> +                     error_report("invalid -m option value: missing "
> indent error
>
>> +                            "'%s' option", slots_str ? "maxmem" : "slots");
>>                       exit(EXIT_FAILURE);
>>                   }
>>                   break;
>
> with above fixed,
>

Will fix it, Thanks;)

> Reviewed-By: Igor Mammedov<imammedo@redhat.com>
>
> .
>



