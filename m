Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bO0oe-0001hJ-AR
	for mharc-qemu-trivial@gnu.org; Fri, 15 Jul 2016 06:57:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47555)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bO0oc-0001fN-7O
	for qemu-trivial@nongnu.org; Fri, 15 Jul 2016 06:57:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1bO0oY-0004EZ-4O
	for qemu-trivial@nongnu.org; Fri, 15 Jul 2016 06:57:53 -0400
Received: from [59.151.112.132] (port=15177 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1bO0oL-0004D7-Da; Fri, 15 Jul 2016 06:57:38 -0400
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; 
   d="scan'208";a="8751972"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Jul 2016 18:57:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 0FCA6498F58D;
	Fri, 15 Jul 2016 18:57:18 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.279.2; Fri, 15 Jul 2016 18:57:16 +0800
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1468501843-14927-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<57879CFA.9040700@redhat.com> <57884102.3050905@cn.fujitsu.com>
	<20160715104009.GE25692@stefanha-x1.localdomain>
CC: Eric Blake <eblake@redhat.com>, <qemu-devel@nongnu.org>,
	<qemu-trivial@nongnu.org>, <famz@redhat.com>, <stefanha@redhat.com>,
	<qemu-block@nongnu.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <5788C334.7070008@cn.fujitsu.com>
Date: Fri, 15 Jul 2016 19:04:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <20160715104009.GE25692@stefanha-x1.localdomain>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 0FCA6498F58D.AE485
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-block] [Qemu-devel] [PATCH] aio_ctx_check:
 follow CODING_STYLE
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
X-List-Received-Date: Fri, 15 Jul 2016 10:57:55 -0000



On 07/15/2016 06:40 PM, Stefan Hajnoczi wrote:
> On Fri, Jul 15, 2016 at 09:48:50AM +0800, Cao jin wrote:
>> On 07/14/2016 10:08 PM, Eric Blake wrote:
>>> On 07/14/2016 07:10 AM, Cao jin wrote:
>>>> replace tab with spaces
>>>>
>>>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>>>> ---
>>>>    async.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> Whitespace-only changes are best done as part of a series that is
>>> already touching nearby code for other reasons (depending on the size of
>>> the whitespace changes and on the rest of your patch, it may be okay to
>>> squash the whitespace change in place, or better to split into separate
>>> patches to make review of both patches easier).  Otherwise, it just
>>> makes 'git blame' output dirtier.
>>
>> I see.
>> Since async.c & aio-posix.c are belong to the same maintaiers, so, Fam &
>> Stefan, is it ok to squash this into that "remove useless parameter" patch?
>> If not, we can just forget this one.
>
> The "remove useless parameter" patch doesn't touch the function you are
> modifying here.  Please don't squash the patches.
>
> Since you have already posted this patch I will merge it.  In the future
> please don't submit whitespace changes, tiny coding style cleanups, etc
> in by themselves.
>
> Thanks for all your contributions.  I do not want to discourage you but
> my view is that code changes should only be made if they fix a bug,
> improve performance measurably, add a feature, or significantly improve
> the code.
>
> Every patch has a cost in terms of code review, merging/testing, backporting,
> bisecting, documentation, etc.  We could discuss each of these in detail
> but basically a code change creates work or takes time from one or more
> people in these areas.
>
> In a perfect world with unlimited resources all patches would be equally
> welcome.  Due to limited resources it's best to submit the types of
> patches I mentioned above where the cost/benefit ratio is favorable.
>
> Thanks,
> Stefan
>

Thanks Stefan, and sorry for the inconvenience brought to you. I thought 
this kind of tiny things would be very simple for maintainers, now I 
understand
-- 
Yours Sincerely,

Cao jin



