Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YGfD6-0007Vt-53
	for mharc-qemu-trivial@gnu.org; Wed, 28 Jan 2015 21:52:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YGfD3-0007UA-CW
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 21:51:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YGfCz-0004LP-BY
	for qemu-trivial@nongnu.org; Wed, 28 Jan 2015 21:51:57 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:3351)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YGfCy-0004KE-N3; Wed, 28 Jan 2015 21:51:53 -0500
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIS09433; Thu, 29 Jan 2015 10:51:42 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 29 Jan 2015 10:51:39 +0800
Message-ID: <54C9A028.3040509@huawei.com>
Date: Thu, 29 Jan 2015 10:51:20 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
References: <1422376711-31648-1-git-send-email-armbru@redhat.com>
	<87k307qho2.fsf@blackfin.pond.sub.org>
	<54C97F4F.1090905@huawei.com> <54C9992C.6070601@redhat.com>
In-Reply-To: <54C9992C.6070601@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Thu, 29 Jan 2015 02:51:58 -0000

On 2015/1/29 10:21, Eric Blake wrote:

> On 01/28/2015 05:31 PM, Gonglei wrote:
>> On 2015/1/28 19:16, Markus Armbruster wrote:
>>
>>> I screwed up cc: qemu-trivial, my apologies.
>>>
> 
>>>> Markus Armbruster (6):
>>>>   onenand: g_malloc() can't fail, bury dead error handling
>>>>   rtl8139: g_malloc() can't fail, bury dead error handling
>>>>   kvm: g_malloc() can't fail, bury dead error handling
>>>>   rdma: g_malloc0() can't fail, bury dead error handling
>>>>   vnc: g_realloc() can't fail, bury dead error handling
>>>>   translate-all: Use g_try_malloc() for dynamic translator buffer
>>>>
> 
>>>
>>
>> For serials:
> 
> s/serials/series/

Yes, thanks :)

> 
>> Reviewed-by: Gonglei <arei.gonglei@huawei.com>
>>
>> Regards,
>> -Gonglei
>>
>>
>>
>>
>>
> 




