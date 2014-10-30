Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjnJd-00059b-FM
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 06:50:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjnJW-00051b-Cp
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 06:50:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XjnJR-0003hv-Vs
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 06:50:46 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:43318)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XjnJR-0003KJ-8I; Thu, 30 Oct 2014 06:50:41 -0400
Received: from 172.24.2.119 (EHLO szxeml421-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBO86537; Thu, 30 Oct 2014 18:50:31 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml421-hub.china.huawei.com
	(10.82.67.160) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 30 Oct 2014 18:50:24 +0800
Message-ID: <545217EA.3070200@huawei.com>
Date: Thu, 30 Oct 2014 18:50:18 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1414648877-13788-1-git-send-email-arei.gonglei@huawei.com>
	<87a94e6ni4.fsf@blackfin.pond.sub.org>	<5451EBFB.1090407@msgid.tls.msk.ru>
	<87wq7h3o7r.fsf@blackfin.pond.sub.org>
In-Reply-To: <87wq7h3o7r.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"lcapitulino@redhat.com" <lcapitulino@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] dump: fix use-after-free
 for s->fd
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
X-List-Received-Date: Thu, 30 Oct 2014 10:50:51 -0000

On 2014/10/30 17:23, Markus Armbruster wrote:

> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> 30.10.2014 10:10, Markus Armbruster wrote:
>>> <arei.gonglei@huawei.com> writes:
>>>
>>>> From: Gonglei <arei.gonglei@huawei.com>
>>>>
>>>> After commit 4c7e251a (), when dump memory completed,
>>>> the s->fd will be closed twice. We should return
>>>> directly when dump completed.
>>>>
>>>> Using do/while block, make the badly chosen return
>>>> values of get_next_block() more visible and fix
>>>> this issue.
>>>>
>>>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>>>
>>> I'm afraid the commit message is a bit misleading.  Let's examine what
>>> exactly happens.
>>>
>>> dump_iterate() dumps blocks in a loop.  Eventually, get_next_block()
>>> returns "no more".  We then call dump_completed().  But we neglect to
>>> break the loop!  Broken in commit 4c7e251a.
>>>
>>> Because of that, we dump the last block again.  This attempts to write
>>> to s->fd, which fails if we're lucky.  The error makes dump_iterate()
>>> return unsuccessfully.  It's the only way it can ever return.
>>>
>>> Theoretical: if we're not so lucky, something else has opened something
>>> for writing and got the same fd.  dump_iterate() then keeps looping,
>>> messing up the something else's output, until a write fails, or the
>>> process mercifully terminates.
>>>
>>> Is this correct?
>>
>> Heh.  I was starring at all this last 20 minutes, re-reading the
>> original v1 patch and your (Marcus) followup suggestion, trying to
>> match the commit description with the actual happening and with the
>> "no return" case which was before this patch.  Oh well.
>>
>> Yes, this looks correct indeed, we come to the same conclusion.
>> But at this stage I really wonder if this is a -trivial material.
> 
> Distinguished old math professor does a proof on the blackboard.  At
> some point he faces the audience and says "this is trivial".  Faces
> blackboard, pauses.  "Is it trivial?"  Pauses again.  Storms out of the
> classroom.  After ten minutes, he comes back and exclaims "it *is*
> trivial!"
> 

:)

>> (I can apply it to -trivial because no maintainer is listed for
>> this file and because after some digging it becomes obvious).
> 
> Appreciated!

Do I need to send v3 for changing commit message, or
/mjt do it directly? Thanks

Best regards,
-Gonglei


