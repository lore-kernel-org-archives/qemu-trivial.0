Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xje1W-0003Vd-ME
	for mharc-qemu-trivial@gnu.org; Wed, 29 Oct 2014 20:55:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46654)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xje1Q-0003UV-Ak
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 20:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xje1L-0006Z2-Fv
	for qemu-trivial@nongnu.org; Wed, 29 Oct 2014 20:55:28 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:40838)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xje1K-0006Yd-R4; Wed, 29 Oct 2014 20:55:23 -0400
Received: from 172.24.2.119 (EHLO SZXEML414-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWI15660; Thu, 30 Oct 2014 08:55:12 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML414-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 30 Oct 2014 08:55:05 +0800
Message-ID: <54518C61.9020405@huawei.com>
Date: Thu, 30 Oct 2014 08:54:57 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1414578500-10048-1-git-send-email-arei.gonglei@huawei.com>
	<87vbn2apjx.fsf@blackfin.pond.sub.org>
In-Reply-To: <87vbn2apjx.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.54518C71.01C2, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9aea5465f63276f3da9db40b1e859d26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"lcapitulino@redhat.com" <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dump: fix use-after-free
	for s->fd
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
X-List-Received-Date: Thu, 30 Oct 2014 00:55:33 -0000

On 2014/10/29 23:00, Markus Armbruster wrote:

> <arei.gonglei@huawei.com> writes:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> After commit 4c7e251a (), when dump memory completed,
>> the s->fd will be closed twice. We should return
>> directly when dump completed.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  dump.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/dump.c b/dump.c
>> index 06a4915..9d9a409 100644
>> --- a/dump.c
>> +++ b/dump.c
>> @@ -626,6 +626,7 @@ static void dump_iterate(DumpState *s, Error **errp)
>>          ret = get_next_block(s, block);
>>          if (ret == 1) {
>>              dump_completed(s);
>> +            return;
>>          }
>>      }
>>  }
> 
> What about less tortuous control structure?
> 
>     do {
>         block = s->next_block;
> 
>         size = block->target_end - block->target_start;
>         if (s->has_filter) {
>             size -= s->start;
>             if (s->begin + s->length < block->target_end) {
>                 size -= block->target_end - (s->begin + s->length);
>             }
>         }
>         write_memory(s, block, s->start, size, &local_err);
>         if (local_err) {
>             error_propagate(errp, local_err);
>             return;
>         }
> 
>     } while (!get_next_block(s, block))
> 
>     dump_completed();
> 
> Makes the badly chosen return values of of get_next_block() more
> visible.  Easy enough to fix if it bothers you.

Looks better. v2 will be posted, thanks :)

Best regards,
-Gonglei


