Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkEQt-000324-OU
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:48:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43022)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XkEPG-0004GS-Ab
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XjqBi-0004sE-3W
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 09:55:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XjqBb-0004qC-LU; Thu, 30 Oct 2014 09:54:47 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 778FD46FA3;
	Thu, 30 Oct 2014 16:54:44 +0300 (MSK)
Message-ID: <54524324.9070202@msgid.tls.msk.ru>
Date: Thu, 30 Oct 2014 16:54:44 +0300
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
X-List-Received-Date: Fri, 31 Oct 2014 15:48:10 -0000

30.10.2014 10:10, Markus Armbruster wrote:
[]
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
> 
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

So I'm applying this -- which is your patch and your commit message, and
I really wonder why this is Reviewed-by and not Signed-off-by, with your
authorship?  It really should be...

Thanks,

/mjt


