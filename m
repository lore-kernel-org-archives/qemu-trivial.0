Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjkO2-00073W-EP
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 03:43:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XjkNw-0006wL-9V
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 03:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XjkNr-0006Cv-D2
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 03:43:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41566)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XjkNh-0006BE-8n; Thu, 30 Oct 2014 03:42:53 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id AF11446C2F;
	Thu, 30 Oct 2014 10:42:51 +0300 (MSK)
Message-ID: <5451EBFB.1090407@msgid.tls.msk.ru>
Date: Thu, 30 Oct 2014 10:42:51 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.8.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, arei.gonglei@huawei.com
References: <1414648877-13788-1-git-send-email-arei.gonglei@huawei.com>
	<87a94e6ni4.fsf@blackfin.pond.sub.org>
In-Reply-To: <87a94e6ni4.fsf@blackfin.pond.sub.org>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com, qemu-devel@nongnu.org,
	lcapitulino@redhat.com
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
X-List-Received-Date: Thu, 30 Oct 2014 07:43:13 -0000

30.10.2014 10:10, Markus Armbruster wrote:
> <arei.gonglei@huawei.com> writes:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> After commit 4c7e251a (), when dump memory completed,
>> the s->fd will be closed twice. We should return
>> directly when dump completed.
>>
>> Using do/while block, make the badly chosen return
>> values of get_next_block() more visible and fix
>> this issue.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> 
> I'm afraid the commit message is a bit misleading.  Let's examine what
> exactly happens.
> 
> dump_iterate() dumps blocks in a loop.  Eventually, get_next_block()
> returns "no more".  We then call dump_completed().  But we neglect to
> break the loop!  Broken in commit 4c7e251a.
> 
> Because of that, we dump the last block again.  This attempts to write
> to s->fd, which fails if we're lucky.  The error makes dump_iterate()
> return unsuccessfully.  It's the only way it can ever return.
> 
> Theoretical: if we're not so lucky, something else has opened something
> for writing and got the same fd.  dump_iterate() then keeps looping,
> messing up the something else's output, until a write fails, or the
> process mercifully terminates.
> 
> Is this correct?

Heh.  I was starring at all this last 20 minutes, re-reading the
original v1 patch and your (Marcus) followup suggestion, trying to
match the commit description with the actual happening and with the
"no return" case which was before this patch.  Oh well.

Yes, this looks correct indeed, we come to the same conclusion.
But at this stage I really wonder if this is a -trivial material.

(I can apply it to -trivial because no maintainer is listed for
this file and because after some digging it becomes obvious).

/mjt

> If yes, let's use this commit message:
> 
>     dump: Fix dump-guest-memory termination and use-after-close
> 
>     dump_iterate() dumps blocks in a loop.  Eventually, get_next_block()
>     returns "no more".  We then call dump_completed().  But we neglect to
>     break the loop!  Broken in commit 4c7e251a.
> 
>     Because of that, we dump the last block again.  This attempts to write
>     to s->fd, which fails if we're lucky.  The error makes dump_iterate()
>     return failure.  It's the only way it can ever return.
> 
>     Theoretical: if we're not so lucky, something else has opened something
>     for writing and got the same fd.  dump_iterate() then keeps looping,
>     messing up the something else's output, until a write fails, or the
>     process mercifully terminates.
> 
>     The obvious fix is to restore the return lost in commit 4c7e251a.  But
>     the root cause of the bug is needlessly opaque loop control.  Replace it
>     by a clean do ... while loop.
> 
>     This makes the badly chosen return values of get_next_block() more
>     visible.  Cleaning that up is outside the scope of this bug fix.
> 
> You can then add my R-by.
> 


