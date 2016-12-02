Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cCe51-0007e4-BG
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2016 22:00:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cCe4w-0007a1-AR
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2016 22:00:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>) id 1cCe4v-0005bL-MB
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2016 22:00:02 -0500
Received: from [59.151.112.132] (port=32109 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhangchen.fnst@cn.fujitsu.com>)
	id 1cCe4p-0005UU-PO; Thu, 01 Dec 2016 21:59:56 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="13529782"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 02 Dec 2016 10:59:47 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 8076F467048A;
	Fri,  2 Dec 2016 10:59:45 +0800 (CST)
Received: from [10.167.226.56] (10.167.226.56) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.319.2; Fri, 2 Dec 2016 10:59:44 +0800
To: Eric Blake <eblake@redhat.com>, qemu devel <qemu-devel@nongnu.org>, QEMU
	Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>
References: <1480575357-25056-1-git-send-email-zhangchen.fnst@cn.fujitsu.com>
	<a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
CC: Stefan Weil <sw@weilnetz.de>
From: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
Message-ID: <8b90a1da-a129-f2cb-4545-355348387925@cn.fujitsu.com>
Date: Fri, 2 Dec 2016 10:59:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <a1593129-ddb9-8e74-5865-b1e8400c991d@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.56]
X-yoursite-MailScanner-ID: 8076F467048A.AA115
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhangchen.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.8] docs: Fix
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
X-List-Received-Date: Fri, 02 Dec 2016 03:00:06 -0000



On 12/01/2016 10:57 PM, Eric Blake wrote:
> On 12/01/2016 12:55 AM, Zhang Chen wrote:
>> Say it in another way to make it easier to understand.
>>
>> Signed-off-by: Zhang Chen <zhangchen.fnst@cn.fujitsu.com>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
> I guess that's because I suggested the replacement text to use, even
> though I didn't write the patch.

Yes, In that case, should I change the signed-off-by to acked-by or 
remove it?

Thanks
Zhang Chen

> At any rate, since this is doc-only, it's safe for inclusion in 2.8, if
> the maintainer wants to send a last-minute pull request (but if it
> misses the release, that's okay too)
>
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> ---
>>   docs/colo-proxy.txt | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/colo-proxy.txt b/docs/colo-proxy.txt
>> index 76767cb..c4941de 100644
>> --- a/docs/colo-proxy.txt
>> +++ b/docs/colo-proxy.txt
>> @@ -158,7 +158,9 @@ secondary.
>>   
>>   == Usage ==
>>   
>> -Here, we use demo ip and port discribe more clearly.
>> +Here is an example using demonstration IP and port addresses to more
>> +clearly describe the usage.
>> +
>>   Primary(ip:3.3.3.3):
>>   -netdev tap,id=hn0,vhost=off,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown
>>   -device e1000,id=e0,netdev=hn0,mac=52:a4:00:12:78:66
>>

-- 
Thanks
zhangchen




