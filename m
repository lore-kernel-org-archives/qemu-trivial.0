Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c2762-0005Wt-9c
	for mharc-qemu-trivial@gnu.org; Wed, 02 Nov 2016 21:45:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1c2760-0005Vl-1y
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 21:45:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1c275z-0004yG-CJ
	for qemu-trivial@nongnu.org; Wed, 02 Nov 2016 21:45:36 -0400
Received: from [59.151.112.132] (port=30244 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1c275u-0004qJ-Mt; Wed, 02 Nov 2016 21:45:31 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12616342"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 03 Nov 2016 09:45:17 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 382AE43972CB;
	Thu,  3 Nov 2016 09:45:12 +0800 (CST)
Received: from [10.167.226.56] (10.167.226.56) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Thu, 3 Nov 2016 09:45:11 +0800
To: Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>, QEMU
	Developer <qemu-devel@nongnu.org>
References: <20161101171927.25684-1-sw@weilnetz.de>
	<ccba1848-3170-c3d1-07ea-bfa2a02e70b6@redhat.com>
	<fa396830-84d2-734a-c51a-7d3073b10183@cn.fujitsu.com>
	<ea7009c1-75d9-a7ea-641d-399d3b9c6689@redhat.com>
CC: QEMU Trivial <qemu-trivial@nongnu.org>, Li Zhijian
	<lizhijian@cn.fujitsu.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <ee023b26-8365-fd5f-1a2f-3794abcec8b9@cn.fujitsu.com>
Date: Thu, 3 Nov 2016 09:44:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <ea7009c1-75d9-a7ea-641d-399d3b9c6689@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 382AE43972CB.AABD0
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs: Fix typos found by
 codespell
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
X-List-Received-Date: Thu, 03 Nov 2016 01:45:37 -0000



On 11/02/2016 09:29 PM, Eric Blake wrote:
> On 11/01/2016 08:32 PM, Zhang Chen wrote:
>
>>>> I still don't understand the comment in docs/colo-proxy.txt.
>>> Me neither.
>>>
>>>
>> Which part of the docs/colo-proxy.txt?
> The one quoted below.
>
>> Perhaps I can explain it more clearly and make the doc better.
>>
>>>> +++ b/docs/colo-proxy.txt
>>>> @@ -158,7 +158,7 @@ secondary.
>>>>      == Usage ==
>>>>    -Here, we use demo ip and port discribe more clearly.
>>>> +Here, we use demo ip and port describe more clearly.
>>>>    Primary(ip:3.3.3.3):
>>>>    -netdev
>>>> tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
>>>>    -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
>>> Maybe:
>>>
>>> Here is an example using demonstration IP and port addresses to more
>>> clearly describe the usage.
>>>
>>> The remaining hunks are clear improvements, so:
>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> It's easier to understand.
> Okay, so you like my proposal for a potential reword.  Now, who should
> submit it as a patch? Stefan (since he found the confusing sentence in
> the first place), you (since you wrote most of the document to begin
> with), or me (since I proposed wording that you like)?
>

I will submit the patch later, if you think that's OK.


-- 
Thanks
zhangchen




