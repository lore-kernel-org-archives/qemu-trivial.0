Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bNs8o-0005qO-6r
	for mharc-qemu-trivial@gnu.org; Thu, 14 Jul 2016 21:42:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNs8k-0005nY-0b
	for qemu-trivial@nongnu.org; Thu, 14 Jul 2016 21:42:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bNs8i-0000Vh-TF
	for qemu-trivial@nongnu.org; Thu, 14 Jul 2016 21:42:05 -0400
Received: from [59.151.112.132] (port=54624 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bNs8a-0000Tj-8g; Thu, 14 Jul 2016 21:41:56 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8732310"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jul 2016 09:41:50 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 28E3C42B87D8;
	Fri, 15 Jul 2016 09:41:49 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 15 Jul 2016 09:41:47 +0800
To: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>
References: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<57879CFA.9040700@redhat.com>
CC: <qemu-trivial@nongnu.org>, <famz@redhat.com>, <qemu-block@nongnu.org>,
	<stefanha@redhat.com>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <57884102.3050905@cn.fujitsu.com>
Date: Fri, 15 Jul 2016 09:48:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <57879CFA.9040700@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 28E3C42B87D8.A7A15
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] aio_ctx_check: follow
 CODING_STYLE
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
X-List-Received-Date: Fri, 15 Jul 2016 01:42:09 -0000



On 07/14/2016 10:08 PM, Eric Blake wrote:
> On 07/14/2016 07:10 AM, Cao jin wrote:
>> replace tab with spaces
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   async.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Whitespace-only changes are best done as part of a series that is
> already touching nearby code for other reasons (depending on the size of
> the whitespace changes and on the rest of your patch, it may be okay to
> squash the whitespace change in place, or better to split into separate
> patches to make review of both patches easier).  Otherwise, it just
> makes 'git blame' output dirtier.

I see.
Since async.c & aio-posix.c are belong to the same maintaiers, so, Fam & 
Stefan, is it ok to squash this into that "remove useless parameter" 
patch? If not, we can just forget this one.

-- 
Yours Sincerely,

Cao jin



