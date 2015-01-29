Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGd19-0001bF-BY
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 19:31:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YGd16-0001We-PJ
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 19:31:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YGd16-00089m-0t
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 19:31:28 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:50984)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YGd0z-00085o-2H; Wed, 28 Jan 2015 19:31:21 -0500
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIR91084; Thu, 29 Jan 2015 08:31:17 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml426-hub.china.huawei.com
	(10.82.67.181) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 29 Jan 2015 08:31:15 +0800
Message-ID: <54C97F4F.1090905@huawei.com>
Date: Thu, 29 Jan 2015 08:31:11 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1422376711-31648-1-git-send-email-armbru@redhat.com>
	<87k307qho2.fsf@blackfin.pond.sub.org>
In-Reply-To: <87k307qho2.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/6] Trivial cleanups around
	g_malloc()
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
X-List-Received-Date: Thu, 29 Jan 2015 00:31:29 -0000

On 2015/1/28 19:16, Markus Armbruster wrote:

> I screwed up cc: qemu-trivial, my apologies.
> 
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> I'm routing these patches through qemu-trivial, even though some of
>> them touch actively maintained code, and could go through the
>> respective tree instead:
>>
>> * PATCH 1 block (Kevin, Stefan)
>>
>> * PATCH 3 KVM (Paolo)
>>
>> * PATCH 4 migration (Juan, Amit)
>>
>> * PATCH 5 VNC (Gerd)
>>
>> If you want me to reroute any of them, let me know.
>>
>> Markus Armbruster (6):
>>   onenand: g_malloc() can't fail, bury dead error handling
>>   rtl8139: g_malloc() can't fail, bury dead error handling
>>   kvm: g_malloc() can't fail, bury dead error handling
>>   rdma: g_malloc0() can't fail, bury dead error handling
>>   vnc: g_realloc() can't fail, bury dead error handling
>>   translate-all: Use g_try_malloc() for dynamic translator buffer
>>
>>  hw/block/onenand.c |  8 +-------
>>  hw/net/rtl8139.c   | 14 --------------
>>  kvm-all.c          |  4 ----
>>  migration/rdma.c   |  3 ---
>>  translate-all.c    |  2 +-
>>  ui/vnc.c           |  4 ----
>>  6 files changed, 2 insertions(+), 33 deletions(-)
> 

For serials:
Reviewed-by: Gonglei <arei.gonglei@huawei.com>

Regards,
-Gonglei



