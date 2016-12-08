Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cEnbT-0004Sl-Ji
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2016 20:34:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cEnbQ-0004RR-3D
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 20:34:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cEnbE-0004Hm-10
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 20:34:28 -0500
Received: from [59.151.112.132] (port=12317 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1cEnaH-0003Ul-Bv; Wed, 07 Dec 2016 20:33:17 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13708547"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 08 Dec 2016 09:33:09 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id B76B346704A5;
	Thu,  8 Dec 2016 09:33:06 +0800 (CST)
Received: from [10.167.226.56] (10.167.226.56) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Thu, 8 Dec 2016 09:33:11 +0800
To: Stefan Hajnoczi <stefanha@gmail.com>, Laurent Vivier <laurent@vivier.eu>
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
	<a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
	<8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
	<063dfa33-2015-e566-c623-d59578c20fcd@redhat.com>
	<13aed710-c5d1-b1de-5922-52e3e53029f9@cn.fujitsu.com>
	<956d6c43-0904-e094-1adb-bb7c584967d0@vivier.eu>
	<20161207133049.GA32099@stefanha-x1.localdomain>
CC: Laurent Vivier <lvivier@redhat.com>, Eric Blake <eblake@redhat.com>, qemu
	devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <fc30a10e-10d5-6b53-d098-f00780cdbe16@cn.fujitsu.com>
Date: Thu, 8 Dec 2016 09:32:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161207133049.GA32099@stefanha-x1.localdomain>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: B76B346704A5.AA7C3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.9] docs: Fix
 description of the sentence
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
X-List-Received-Date: Thu, 08 Dec 2016 01:34:29 -0000



On 12/07/2016 09:30 PM, Stefan Hajnoczi wrote:
> On Wed, Dec 07, 2016 at 10:01:49AM +0100, Laurent Vivier wrote:
>> Le 07/12/2016 à 09:58, Zhang Chen a écrit :
>>>
>>> On 12/02/2016 03:57 PM, Laurent Vivier wrote:
>>>> On 02/12/2016 03:59, Zhang Chen wrote:
>>>>> On 12/01/2016 10:57 PM, Eric Blake wrote:
>>>>>> On 12/01/2016 12:55 AM, Zhang Chen wrote:
>>>>>>> Say it in another way to make it easier to understand.
>>>>>>>
>>>>>>> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
>>>>>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>>>>> I guess that's because I suggested the replacement text to use, even
>>>>>> though I didn't write the patch.
>>>>> Yes, In that case, should I change the signed-off-by to acked-by or
>>>>> remove it?
>>>> You can use "Suggested-by:"
>>>>
>>>> https://www.kernel.org/doc/Documentation/SubmittingPatches
>>>>
>>>> Laurent
>>>>
>>> Should I fix it? or can you pick up this directly for 2.8?
>> I don't think it is needed.
>> Perhaps Stefan H can take it directly in his staging tree?
> Too late for that now.  This should be merged through Jason Wang (net
> maintainer) like any other colo-proxy patch.
>

OK~ I change the subject to "for-2.9" and cc Jason.

Thanks
Zhang Chen


-- 
Thanks
zhangchen




