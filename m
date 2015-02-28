Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YReYw-0005Sg-O0
	for mharc-qemu-trivial@gnu.org; Sat, 28 Feb 2015 05:23:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YReYt-0005Np-PL
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:23:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YReYs-0004VD-V6
	for qemu-trivial@nongnu.org; Sat, 28 Feb 2015 05:23:55 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:65488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YReYn-0004TT-Oj; Sat, 28 Feb 2015 05:23:50 -0500
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCK86038; Sat, 28 Feb 2015 18:23:44 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 28 Feb 2015 18:18:45 +0800
Message-ID: <54F19602.4010401@huawei.com>
Date: Sat, 28 Feb 2015 18:18:42 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1425118124-11888-1-git-send-email-arei.gonglei@huawei.com>
	<54F194B7.9080603@msgid.tls.msk.ru>
In-Reply-To: <54F194B7.9080603@msgid.tls.msk.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.54F19731.002E, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 407a32572244c559d6987f6933b6fa22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] e500: fix memory leak
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
X-List-Received-Date: Sat, 28 Feb 2015 10:23:56 -0000

On 2015/2/28 18:13, Michael Tokarev wrote:
> 28.02.2015 13:08, arei.gonglei@huawei.com пишет:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>> v2: fix compilation complaint. (mjt)
>> ---
>>  hw/ppc/e500.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
>> index 7e17d18..c060b50 100644
>> --- a/hw/ppc/e500.c
>> +++ b/hw/ppc/e500.c
>> @@ -309,8 +309,10 @@ static int ppce500_load_device_tree(MachineState *machine,
>>  
>>          fdt = load_device_tree(filename, &fdt_size);
>>          if (!fdt) {
>> +            g_free(filename);
>>              goto out;
>>          }
>> +        g_free(filename);
>>          goto done;
>>      }
> 
> 
> How about this?
> 
It's ok on function, but seems oddly, isn't it?

Regards,
-Gonglei
> --- a/hw/ppc/e500.c
> +++ b/hw/ppc/e500.c
> @@ -308,6 +308,7 @@ static int ppce500_load_device_tree(MachineState *machine,
>          }
> 
>          fdt = load_device_tree(filename, &fdt_size);
> +        g_free(filename);
>          if (!fdt) {
>              goto out;
>          }
> 
> Thanks,
> 
> /mjt
> 



