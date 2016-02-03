Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aQw8e-00070j-RG
	for mharc-qemu-trivial@gnu.org; Wed, 03 Feb 2016 07:02:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQw8T-0006hZ-N0
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 07:02:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aQw8O-0004QY-VB
	for qemu-trivial@nongnu.org; Wed, 03 Feb 2016 07:02:13 -0500
Received: from [59.151.112.132] (port=3701 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aQw8J-0004Pn-J1; Wed, 03 Feb 2016 07:02:03 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="3278681"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Feb 2016 20:02:01 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 173A34219161;
	Wed,  3 Feb 2016 20:01:08 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Wed, 3 Feb 2016 20:02:00 +0800
To: Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <1454469583-15753-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<56B1A88C.6020604@msgid.tls.msk.ru>
	<87k2mmxhk9.fsf@blackfin.pond.sub.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56B1EC4F.8040109@cn.fujitsu.com>
Date: Wed, 3 Feb 2016 20:02:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87k2mmxhk9.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 173A34219161.A897E
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial@nongnu.org, imammedo@redhat.com, qemu-devel@nongnu.org,
	mst@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix inconsistency between
 comment and variable name
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
X-List-Received-Date: Wed, 03 Feb 2016 12:02:23 -0000



On 02/03/2016 05:35 PM, Markus Armbruster wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
>
>> 03.02.2016 06:19, Cao jin wrote:
>>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>>> ---
>>>   include/hw/qdev-core.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>>> index abcdee8..42fa5db 100644
>>> --- a/include/hw/qdev-core.h
>>> +++ b/include/hw/qdev-core.h
>>> @@ -221,7 +221,7 @@ typedef struct BusChild {
>>>
>>>   /**
>>>    * BusState:
>>> - * @hotplug_device: link to a hotplug device associated with bus.
>>> + * @hotplug_handler: link to a hotplug device associated with bus.
>>
>> Hmm.  Now while the field name in comment and in the structure
>> do match, the comment is still wrong, since it is a linke to
>> a handler, not a device… :)
>
> Do you mean to suggest the line should be changed to
>
>   * @hotplug_device: link to a hotplug handler associated with bus.
>
> ?
>
>

And sometimes a hotplug handler could be a bus, see 
qbus_set_bus_hotplug_handler(). on both case(device & bus), the actual 
hotplug handler called at last is a TYPE_HOTPLUG_HANDLER which reside in 
that device/bus, so I guess, the @hotplug_handler maybe fine:)

anyway, these terms could easily confuse newbies

-- 
Yours Sincerely,

Cao jin



