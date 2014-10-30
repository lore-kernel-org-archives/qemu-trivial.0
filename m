Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XjkFR-0004Of-NA
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 03:34:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38498)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XjkFL-0004Nf-Bg
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 03:34:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XjkFG-0003WX-Fq
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 03:34:15 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:17719)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XjkFF-0003Vq-Po; Thu, 30 Oct 2014 03:34:10 -0400
Received: from 172.24.2.119 (EHLO szxeml423-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWI62352; Thu, 30 Oct 2014 15:33:59 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml423-hub.china.huawei.com
	(10.82.67.162) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 30 Oct 2014 15:33:50 +0800
Message-ID: <5451E9DC.7020408@huawei.com>
Date: Thu, 30 Oct 2014 15:33:48 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>, <arei.gonglei@huawei.com>
References: <1414648877-13788-1-git-send-email-arei.gonglei@huawei.com>
	<87a94e6ni4.fsf@blackfin.pond.sub.org>
In-Reply-To: <87a94e6ni4.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.5451E9E8.00E8, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: f4e4ca9ed8972095d2655b25edd3f84f
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
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
X-List-Received-Date: Thu, 30 Oct 2014 07:34:20 -0000

On 2014/10/30 15:10, Markus Armbruster wrote:
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
>

Yep, this is really a stupid mistake i made when i do clean work for dump.c,
what lucky thing is there is no version release after the commit.
Thanks for your good catch.;)

> If yes, let's use this commit message:
>
>      dump: Fix dump-guest-memory termination and use-after-close
>
>      dump_iterate() dumps blocks in a loop.  Eventually, get_next_block()
>      returns "no more".  We then call dump_completed().  But we neglect to
>      break the loop!  Broken in commit 4c7e251a.
>
>      Because of that, we dump the last block again.  This attempts to write
>      to s->fd, which fails if we're lucky.  The error makes dump_iterate()
>      return failure.  It's the only way it can ever return.
>
>      Theoretical: if we're not so lucky, something else has opened something
>      for writing and got the same fd.  dump_iterate() then keeps looping,
>      messing up the something else's output, until a write fails, or the
>      process mercifully terminates.
>
>      The obvious fix is to restore the return lost in commit 4c7e251a.  But
>      the root cause of the bug is needlessly opaque loop control.  Replace it
>      by a clean do ... while loop.
>
>      This makes the badly chosen return values of get_next_block() more
>      visible.  Cleaning that up is outside the scope of this bug fix.
>
> You can then add my R-by.
>
>
>



