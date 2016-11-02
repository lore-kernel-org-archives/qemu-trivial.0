Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c1kO4-00016p-Ll
	for mharc-qemu-trivial@gnu.org; Tue, 01 Nov 2016 21:30:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1c1kO3-000164-76
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 21:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1c1kO2-0005pr-BW
	for qemu-trivial@nongnu.org; Tue, 01 Nov 2016 21:30:43 -0400
Received: from [59.151.112.132] (port=49113 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1c1kNx-0005iN-PO; Tue, 01 Nov 2016 21:30:38 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12576288"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Nov 2016 09:30:27 +0800
Received: from G08CNEXCHPEKD02.g08.fujitsu.local (unknown [10.167.33.83])
	by cn.fujitsu.com (Postfix) with ESMTP id 43E9643972CF;
	Wed,  2 Nov 2016 09:30:24 +0800 (CST)
Received: from [10.167.226.56] (10.167.226.56) by
	G08CNEXCHPEKD02.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Wed, 2 Nov 2016 09:30:23 +0800
To: Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>, QEMU
	Developer <qemu-devel@nongnu.org>
References: <20161101171927.25684-1-sw@weilnetz.de>
	<ccba1848-3170-c3d1-07ea-bfa2a02e70b6@redhat.com>
CC: QEMU Trivial <qemu-trivial@nongnu.org>, Li Zhijian
	<lizhijian@cn.fujitsu.com>, zhanghailiang <zhang.zhanghailiang@huawei.com>
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <fa396830-84d2-734a-c51a-7d3073b10183@cn.fujitsu.com>
Date: Wed, 2 Nov 2016 09:32:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <ccba1848-3170-c3d1-07ea-bfa2a02e70b6@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 43E9643972CF.A7FDB
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
X-List-Received-Date: Wed, 02 Nov 2016 01:30:44 -0000



On 11/02/2016 01:52 AM, Eric Blake wrote:
> On 11/01/2016 12:19 PM, Stefan Weil wrote:
>> Fix also some indefinite articles.
>>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>
>> I still don't understand the comment in docs/colo-proxy.txt.
> Me neither.
>
>

Which part of the docs/colo-proxy.txt?
Perhaps I can explain it more clearly and make the doc better.

>> +++ b/docs/colo-proxy.txt
>> @@ -158,7 +158,7 @@ secondary.
>>   
>>   == Usage ==
>>   
>> -Here, we use demo ip and port discribe more clearly.
>> +Here, we use demo ip and port describe more clearly.
>>   Primary(ip:3.3.3.3):
>>   -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
>>   -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
> Maybe:
>
> Here is an example using demonstration IP and port addresses to more
> clearly describe the usage.
>
> The remaining hunks are clear improvements, so:
> Reviewed-by: Eric Blake <eblake@redhat.com>

It's easier to understand.

Reviewed-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>



-- 
Thanks
zhangchen




