Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDuP-00010G-KK
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:14:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XkDta-0001eT-0Y
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:14:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1Xk63c-0004h2-GU
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 02:51:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47028)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1Xk63X-0004bD-4h; Fri, 31 Oct 2014 02:51:31 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9V6pK1q025377
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 31 Oct 2014 02:51:20 -0400
Received: from blackfin.pond.sub.org (ovpn-116-39.ams2.redhat.com
	[10.36.116.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9V6pIBw022778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 31 Oct 2014 02:51:20 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 4A93230403B2; Fri, 31 Oct 2014 07:51:18 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414648877-13788-1-git-send-email-arei.gonglei@huawei.com>
	<87a94e6ni4.fsf@blackfin.pond.sub.org>
	<54524324.9070202@msgid.tls.msk.ru>
Date: Fri, 31 Oct 2014 07:51:18 +0100
In-Reply-To: <54524324.9070202@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Thu, 30 Oct 2014 16:54:44 +0300")
Message-ID: <87wq7grau1.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.huangpeng@huawei.com,
	arei.gonglei@huawei.com, qemu-devel@nongnu.org, lcapitulino@redhat.com
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
X-List-Received-Date: Fri, 31 Oct 2014 15:14:35 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> 30.10.2014 10:10, Markus Armbruster wrote:
> []
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
>> 
>> If yes, let's use this commit message:
>> 
>>     dump: Fix dump-guest-memory termination and use-after-close
>> 
>>     dump_iterate() dumps blocks in a loop.  Eventually, get_next_block()
>>     returns "no more".  We then call dump_completed().  But we neglect to
>>     break the loop!  Broken in commit 4c7e251a.
>> 
>>     Because of that, we dump the last block again.  This attempts to write
>>     to s->fd, which fails if we're lucky.  The error makes dump_iterate()
>>     return failure.  It's the only way it can ever return.
>> 
>>     Theoretical: if we're not so lucky, something else has opened something
>>     for writing and got the same fd.  dump_iterate() then keeps looping,
>>     messing up the something else's output, until a write fails, or the
>>     process mercifully terminates.
>> 
>>     The obvious fix is to restore the return lost in commit 4c7e251a.  But
>>     the root cause of the bug is needlessly opaque loop control.  Replace it
>>     by a clean do ... while loop.
>> 
>>     This makes the badly chosen return values of get_next_block() more
>>     visible.  Cleaning that up is outside the scope of this bug fix.
>> 
>> You can then add my R-by.
>
> So I'm applying this -- which is your patch and your commit message, and
> I really wonder why this is Reviewed-by and not Signed-off-by, with your
> authorship?  It really should be...

You can add mine in addition to Gonglei's.

Signed-off-by: Markus Armbruster <armbru@redhat.com>

