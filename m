Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTS7-0000xS-U3
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:20:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58200)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTS5-0000wV-NH
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:20:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTS2-00053H-Ir
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:20:01 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:38721)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTS1-00052V-DM; Tue, 24 Feb 2015 23:19:58 -0500
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHQ40910; Wed, 25 Feb 2015 12:19:45 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:19:36 +0800
Message-ID: <54ED4D2F.7070408@huawei.com>
Date: Wed, 25 Feb 2015 12:18:55 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
	<1423627934-11676-4-git-send-email-arei.gonglei@huawei.com>
	<54E1BC31.4000301@msgid.tls.msk.ru>
In-Reply-To: <54E1BC31.4000301@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com
Subject: Re: [Qemu-trivial] [PATCH 03/11] pl330.c: remove superfluous '\n'
	around error_setg
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
X-List-Received-Date: Wed, 25 Feb 2015 04:20:02 -0000

On 2015/2/16 17:45, Michael Tokarev wrote:
> 11.02.2015 07:12, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  hw/dma/pl330.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/dma/pl330.c b/hw/dma/pl330.c
>> index 16cf77e..0f72b59 100644
>> --- a/hw/dma/pl330.c
>> +++ b/hw/dma/pl330.c
>> @@ -1566,7 +1566,7 @@ static void pl330_realize(DeviceState *dev, Error **errp)
>>          s->cfg[1] |= 5;
>>          break;
>>      default:
>> -        error_setg(errp, "Bad value for i-cache_len property: %" PRIx8 "\n",
>> +        error_setg(errp, "Bad value for i-cache_len property: %" PRIx8 "",
> 
> Not hugely important but there's no need in the trailing "" here and below.
> 
Fixed, thanks.

Regards,
-Gonglei



