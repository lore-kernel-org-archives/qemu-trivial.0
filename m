Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YFZMm-00019i-5P
	for mharc-qemu-trivial@gnu.org; Sun, 25 Jan 2015 21:25:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1YFZMj-00017r-7m
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 21:25:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>) id 1YFZMi-0002gt-7J
	for qemu-trivial@nongnu.org; Sun, 25 Jan 2015 21:25:25 -0500
Received: from [59.151.112.132] (port=12717 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chen.fan.fnst@cn.fujitsu.com>)
	id 1YFZMd-0002fR-Ne; Sun, 25 Jan 2015 21:25:20 -0500
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56602503"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jan 2015 10:21:47 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0Q2Oaoc000334;
	Mon, 26 Jan 2015 10:24:36 +0800
Received: from [10.167.226.78] (10.167.226.78) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.181.6; Mon, 26 Jan 2015 10:25:19 +0800
Message-ID: <54C5A408.5000001@cn.fujitsu.com>
Date: Mon, 26 Jan 2015 10:18:48 +0800
From: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Alex Williamson <alex.williamson@redhat.com>
References: <1421898608-10313-1-git-send-email-chen.fan.fnst@cn.fujitsu.com>
	<54C0B156.3080608@linaro.org> <54C59333.8080005@cn.fujitsu.com>
	<1400861803.231065.1422237980435.JavaMail.zimbra@redhat.com>
In-Reply-To: <1400861803.231065.1422237980435.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.78]
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Eric Auger <eric.auger@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vfio: fix wrong initialize
	vfio_group_list
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
X-List-Received-Date: Mon, 26 Jan 2015 02:25:26 -0000


On 01/26/2015 10:06 AM, Alex Williamson wrote:
>
> ----- Original Message -----
>> CC: qemu-trivial@nongnu.org
>>
>> On 01/22/2015 04:14 PM, Eric Auger wrote:
>>> Hi Chen,
>>>
>>> thanks for correcting this mistake I introduced when moving code from
>>> pci to common.
>> so, can you check in this patch?
> I've got it queued up and while it's clearly an error, I don't see that the fix actually changes the resulting code, the parameter is ignored in the macro.  Am I missing something?  If that's the case, I'll include it in my next pull request, but I don't see any pressing reason to rush that request.  Thanks,
Yes, this patch can not affect  the result of the code execution for 
now, but I think it is also a typo mistake, if the macro 
QLIST_HEAD_INITIALIZER
will be changed and using the parameter in the future, this error will 
be difficultly found. I think the earlier found the earlier fixed.

Thanks,
Chen

>
> Alex
>
>>> On 01/22/2015 04:50 AM, Chen Fan wrote:
>>>> Signed-off-by: Chen Fan <chen.fan.fnst@cn.fujitsu.com>
>>>> ---
>>>>    hw/vfio/common.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>>>> index cf483ff..e71385e 100644
>>>> --- a/hw/vfio/common.c
>>>> +++ b/hw/vfio/common.c
>>>> @@ -32,7 +32,7 @@
>>>>    #include "trace.h"
>>>>    
>>>>    struct vfio_group_head vfio_group_list =
>>>> -    QLIST_HEAD_INITIALIZER(vfio_address_spaces);
>>>> +    QLIST_HEAD_INITIALIZER(vfio_group_list);
>>>>    struct vfio_as_head vfio_address_spaces =
>>>>        QLIST_HEAD_INITIALIZER(vfio_address_spaces);
>>>>    
>>>>
>>
> .
>


