Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bKjRC-0003Kg-Qt
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jul 2016 05:48:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bKjR9-00032x-PA
	for qemu-trivial@nongnu.org; Wed, 06 Jul 2016 05:48:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1bKjR8-0007Tx-1w
	for qemu-trivial@nongnu.org; Wed, 06 Jul 2016 05:48:06 -0400
Received: from [59.151.112.132] (port=34910 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1bKjR2-0007ON-CZ; Wed, 06 Jul 2016 05:48:00 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8418817"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Jul 2016 15:39:18 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 2E006418A72E;
	Wed,  6 Jul 2016 15:39:13 +0800 (CST)
Received: from [10.167.225.55] (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Wed, 6 Jul 2016 15:39:12 +0800
Message-ID: <577CB6CD.5060102@cn.fujitsu.com>
Date: Wed, 6 Jul 2016 15:44:13 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: =?UTF-8?B?QW5kcmVhcyBGw6RyYmVy?= <afaerber@suse.de>
CC: qemu trival <qemu-trivial@nongnu.org>, qemu devel <qemu-devel@nongnu.org>
References: <1465889269-7226-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<577C9CA0.8050505@cn.fujitsu.com> <577CB17F.1070708@suse.de>
In-Reply-To: <577CB17F.1070708@suse.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: 2E006418A72E.A6B1F
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [PATCH] qom/object: fix comment typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jul 2016 09:48:08 -0000

On 07/06/2016 03:21 PM, Andreas Färber wrote:
> Am 06.07.2016 um 07:52 schrieb Changlong Xie:
>> Would any maintainer pick this one?
>
> Please in the future use just "qom:" in the subject. How to find out?

Ok

> git log --oneline -- include/qom/object.h

Useful git command, i'll add it to my bash aliases

>
> Also please mention the typo in the commit message. Fixing.
>

Yep

Thanks
	-Xie

> Thanks,
> Andreas
>
>>
>> On 06/14/2016 03:27 PM, Changlong Xie wrote:
>>> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
>>> ---
>>>    include/qom/object.h | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/qom/object.h b/include/qom/object.h
>>> index 99de539..925c279 100644
>>> --- a/include/qom/object.h
>>> +++ b/include/qom/object.h
>>> @@ -901,7 +901,7 @@ GSList *object_class_get_list(const char
>>> *implements_type,
>>>    void object_ref(Object *obj);
>>>
>>>    /**
>>> - * qdef_unref:
>>> + * object_unref:
>>>     * @obj: the object
>>>     *
>>>     * Decrease the reference count of a object.  A object cannot be
>>> freed as long
>>>
>>
>>
>
>



