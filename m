Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bSx68-0004g3-AQ
	for mharc-qemu-trivial@gnu.org; Thu, 28 Jul 2016 22:00:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bSx64-0004em-R3
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 22:00:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bSx63-00062j-RK
	for qemu-trivial@nongnu.org; Thu, 28 Jul 2016 22:00:20 -0400
Received: from [59.151.112.132] (port=17265 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bSx5y-0005rU-3e; Thu, 28 Jul 2016 22:00:14 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="9281522"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 Jul 2016 09:59:31 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 3334442984C2;
	Fri, 29 Jul 2016 09:59:32 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 29 Jul 2016 09:59:32 +0800
To: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>
References: <1469703004-14800-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<579A2571.9060101@redhat.com>
CC: <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Gerd
	Hoffmann <kraxel@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <579ABA4F.7040907@cn.fujitsu.com>
Date: Fri, 29 Jul 2016 10:07:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <579A2571.9060101@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 3334442984C2.A69B8
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] util/qemu-sockets: revert
 Yoda Conditions to normal
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
X-List-Received-Date: Fri, 29 Jul 2016 02:00:21 -0000



On 07/28/2016 11:32 PM, Eric Blake wrote:
> On 07/28/2016 04:50 AM, Cao jin wrote:
>> Follow CODING_STYLE
>>
>> Cc: Daniel P. Berrange <berrange@redhat.com>
>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   util/qemu-sockets.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> Daniel P. Berrange make me realized there is Yoda Conditions in this file,
>> this file is mixed with both style, since I just touched this file, so,
>> reverting it is handy to me.
>>
>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> index 5e08723..a07acc5 100644
>> --- a/util/qemu-sockets.c
>> +++ b/util/qemu-sockets.c
>> @@ -386,7 +386,7 @@ static int inet_dgram_saddr(InetSocketAddress *sraddr,
>>           goto err;
>>       }
>>
>> -    if (0 != (rc = getaddrinfo(addr, port, &ai, &peer))) {
>> +    if ((rc = getaddrinfo(addr, port, &ai, &peer)) != 0) {
>
> CODING_STYLE is currently silent on whether assignment in conditionals
> is appropriate, so maybe that should be patched.  But most of our code
> prefers:
>
> rc = getaddrinfo();
> if (rc != 0) {
>

I prefer this style too, save seconds to think what's the value of 
assignment expression. Thanks for pointing it out:) v2 is coming.

> rather than assignments in the conditional.  I don't have any strong
> opinions on whether that would require a respin or whether your patch is
> fine as is.
>

-- 
Yours Sincerely,

Cao jin



