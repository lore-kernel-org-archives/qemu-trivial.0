Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xjlxy-0005tG-5M
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 05:24:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xjlxs-0005lW-6o
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 05:24:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xjlxn-0003Dj-Px
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 05:24:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43821)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Xjlxe-0003Cq-Q6; Thu, 30 Oct 2014 05:24:06 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9U9Nt8K023362
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 30 Oct 2014 05:23:55 -0400
Received: from blackfin.pond.sub.org (ovpn-116-35.ams2.redhat.com
	[10.36.116.35])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9U9NrgL028578
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 30 Oct 2014 05:23:54 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id AB25030403B1; Thu, 30 Oct 2014 10:23:52 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414648877-13788-1-git-send-email-arei.gonglei@huawei.com>
	<87a94e6ni4.fsf@blackfin.pond.sub.org>
	<5451EBFB.1090407@msgid.tls.msk.ru>
Date: Thu, 30 Oct 2014 10:23:52 +0100
In-Reply-To: <5451EBFB.1090407@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Thu, 30 Oct 2014 10:42:51 +0300")
Message-ID: <87wq7h3o7r.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com, arei.gonglei@huawei.com,
	peter.huangpeng@huawei.com, qemu-devel@nongnu.org
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
X-List-Received-Date: Thu, 30 Oct 2014 09:24:24 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 30.10.2014 10:10, Markus Armbruster wrote:
>> <arei.gonglei@huawei.com> writes:
>> 
>>> From: Gonglei <arei.gonglei@huawei.com>
>>>
>>> After commit 4c7e251a (), when dump memory completed,
>>> the s->fd will be closed twice. We should return
>>> directly when dump completed.
>>>
>>> Using do/while block, make the badly chosen return
>>> values of get_next_block() more visible and fix
>>> this issue.
>>>
>>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> 
>> I'm afraid the commit message is a bit misleading.  Let's examine what
>> exactly happens.
>> 
>> dump_iterate() dumps blocks in a loop.  Eventually, get_next_block()
>> returns "no more".  We then call dump_completed().  But we neglect to
>> break the loop!  Broken in commit 4c7e251a.
>> 
>> Because of that, we dump the last block again.  This attempts to write
>> to s->fd, which fails if we're lucky.  The error makes dump_iterate()
>> return unsuccessfully.  It's the only way it can ever return.
>> 
>> Theoretical: if we're not so lucky, something else has opened something
>> for writing and got the same fd.  dump_iterate() then keeps looping,
>> messing up the something else's output, until a write fails, or the
>> process mercifully terminates.
>> 
>> Is this correct?
>
> Heh.  I was starring at all this last 20 minutes, re-reading the
> original v1 patch and your (Marcus) followup suggestion, trying to
> match the commit description with the actual happening and with the
> "no return" case which was before this patch.  Oh well.
>
> Yes, this looks correct indeed, we come to the same conclusion.
> But at this stage I really wonder if this is a -trivial material.

Distinguished old math professor does a proof on the blackboard.  At
some point he faces the audience and says "this is trivial".  Faces
blackboard, pauses.  "Is it trivial?"  Pauses again.  Storms out of the
classroom.  After ten minutes, he comes back and exclaims "it *is*
trivial!"

> (I can apply it to -trivial because no maintainer is listed for
> this file and because after some digging it becomes obvious).

Appreciated!

