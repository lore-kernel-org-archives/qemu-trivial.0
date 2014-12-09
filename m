Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XyEeu-0002Sy-0A
	for mharc-qemu-trivial@gnu.org; Tue, 09 Dec 2014 01:52:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XyEeo-0002Lt-Dv
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 01:52:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XyEej-0006YD-K5
	for qemu-trivial@nongnu.org; Tue, 09 Dec 2014 01:52:26 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:14706)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XyEeY-0006Ob-LZ; Tue, 09 Dec 2014 01:52:11 -0500
Received: from 172.24.2.119 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AYK81458; Tue, 09 Dec 2014 14:52:01 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml422-hub.china.huawei.com
	(10.82.67.161) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Dec 2014
	14:51:49 +0800
Message-ID: <54869C02.5090102@huawei.com>
Date: Tue, 9 Dec 2014 14:51:47 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, <qemu-trivial@nongnu.org>
References: <1418103867-11516-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<548690E3.2090705@weilnetz.de>
In-Reply-To: <548690E3.2090705@weilnetz.de>
Content-Type: text/plain; charset="iso-8859-15"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020203.54869C14.001D, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 18601038c735ebec71b46ffff82b27f6
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: armbru@redhat.com, qemu-devel@nongnu.org, afaerber@suse.de,
	peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vt82c686: fix coverity
 warning about out-of-bounds write
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
X-List-Received-Date: Tue, 09 Dec 2014 06:52:31 -0000

On 2014/12/9 14:04, Stefan Weil wrote:
> Am 09.12.2014 um 06:44 schrieb zhanghailiang:
>> Refactor superio_ioport_writeb to fix the out of bounds write warning.
>>
>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>> ---
>>   hw/isa/vt82c686.c | 39 ++++++++++++++++++---------------------
>>   1 file changed, 18 insertions(+), 21 deletions(-)
>>
>> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
>> index e0c235c..4516af0 100644
>> --- a/hw/isa/vt82c686.c
>> +++ b/hw/isa/vt82c686.c
>> @@ -50,13 +50,13 @@ typedef struct VT82C686BState {
>>   static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>>                                     unsigned size)
>>   {
>> -    int can_write;
>>       SuperIOConfig *superio_conf = opaque;
>>
>>       DPRINTF("superio_ioport_writeb  address 0x%x  val 0x%x\n", addr, data);
>>       if (addr == 0x3f0) {
>>           superio_conf->index = data & 0xff;
>>       } else {
>> +        int can_write = 1;
>
>
> IMHO using bool instead of int would be better here (and false, true in
> the following code).

OK, will fix in v2. Thanks.

>
>>           /* 0x3f1 */
>>           switch (superio_conf->index) {
>>           case 0x00 ... 0xdf:
>> @@ -70,28 +70,25 @@ static void superio_ioport_writeb(void *opaque, hwaddr addr, uint64_t data,
>>           case 0xfd ... 0xff:
>>               can_write = 0;
>>               break;
>> -        default:
>> -            can_write = 1;
>> -
>> -            if (can_write) {
>> -                switch (superio_conf->index) {
>> -                case 0xe7:
>> -                    if ((data & 0xff) != 0xfe) {
>> -                        DPRINTF("chage uart 1 base. unsupported yet\n");
>> -                    }
>> -                    break;
>> -                case 0xe8:
>> -                    if ((data & 0xff) != 0xbe) {
>> -                        DPRINTF("chage uart 2 base. unsupported yet\n");
>> -                    }
>> -                    break;
>> -
>> -                default:
>> -                    superio_conf->config[superio_conf->index] = data & 0xff;
>> -                }
>> +        case 0xe7:
>> +            if ((data & 0xff) != 0xfe) {
>> +                DPRINTF("chage uart 1 base. unsupported yet\n");
>
> This text looks strange. Maybe a typo?
>

Ah, Good catch, a typo, should be 'change'. will fix in v2, Thanks ;)

>> +                can_write = 0;
>> +            }
>> +            break;
>> +        case 0xe8:
>> +            if ((data & 0xff) != 0xbe) {
>> +                DPRINTF("chage uart 2 base. unsupported yet\n");
>
> This text looks strange. Maybe a typo?


>> +                can_write = 0;
>>               }
>> +            break;
>> +        default:
>> +            break;
>> +
>> +        }
>> +        if (can_write) {
>> +            superio_conf->config[superio_conf->index] = data & 0xff;
>>           }
>> -        superio_conf->config[superio_conf->index] = data & 0xff;
>>       }
>>   }
>
>
> Regards
> Stefan
>
>
> .
>



