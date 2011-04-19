Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QCHLS-0002g3-F5
	for mharc-qemu-trivial@gnu.org; Tue, 19 Apr 2011 16:16:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59566)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QCHLQ-0002bO-Bp
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 16:16:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QCHLP-0007sA-Lt
	for qemu-trivial@nongnu.org; Tue, 19 Apr 2011 16:16:20 -0400
Received: from mail-vw0-f45.google.com ([209.85.212.45]:37427)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1QCHLN-0007rt-Dd; Tue, 19 Apr 2011 16:16:17 -0400
Received: by vws17 with SMTP id 17so67412vws.4
	for <multiple recipients>; Tue, 19 Apr 2011 13:16:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.107.5 with SMTP id gy5mr3396779vdb.62.1303244176373; Tue,
	19 Apr 2011 13:16:16 -0700 (PDT)
Received: by 10.52.165.106 with HTTP; Tue, 19 Apr 2011 13:16:16 -0700 (PDT)
In-Reply-To: <BANLkTik3Xi_0Std-TXRmDOz=WmxB3YhhXA@mail.gmail.com>
References: <1303203461-30776-1-git-send-email-peter.maydell@linaro.org>
	<BANLkTi=5edYcRWOahB1hyDxCPtWjyXmHBQ@mail.gmail.com>
	<BANLkTik3bYHBHufOzd1D8SAy7G7RjQVH-A@mail.gmail.com>
	<BANLkTik3Xi_0Std-TXRmDOz=WmxB3YhhXA@mail.gmail.com>
Date: Tue, 19 Apr 2011 21:16:16 +0100
Message-ID: <BANLkTinvEQJH46DTuJOpADo30SqJ2V=xBg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.212.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Make
 epoll_create1 test work around SPARC glibc bug
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Apr 2011 20:16:21 -0000

On 19 April 2011 20:59, Blue Swirl <blauwirbel@gmail.com> wrote:
> On Tue, Apr 19, 2011 at 10:48 PM, Peter Maydell
> <peter.maydell@linaro.org> wrote:
>> On 19 April 2011 20:37, Blue Swirl <blauwirbel@gmail.com> wrote:
>>> But then epoll would not be used.
>>
>> I think that's fine -- on a system which isn't advertising epoll
>> in its include files we shouldn't be trying to use it. It might
>> be buggy, or not the same function at all, for instance.
>>
>> Anybody who actually cares about epoll can upgrade their libc :-)
>
> Maybe epoll is not so interesting as madvise.

Indeed, it isn't; the only reason we check for it in configure is
so we know whether we can pass through the relevant syscalls for
linux-user mode. it's a pretty recent innovation so any guest app
using it should have a fallback path if it gets ENOSYS.
Incidentally, note that this configure check is for epoll_create1(),
not epoll_create(). [Some systems have only the former, so it has
a separate configure check.]

madvise() is used by qemu itself, so we care more there.

> But the check is not very specific, there could be some unrelated
> warning with the headers.

The check isn't supposed to be very specific; the idea is that it
does basically what the actual qemu source code does, ie just
use the function in a program that's compiled with -Werror. If there's
an unrelated problem with the header that produces a compile
warning then we also want that to cause the test to fail, because
that too will cause qemu compilation to fail later.

I think that the ideal for configure tests is that they test
for exactly the set of functionality used by the program itself;
that's what I'm trying to do here.

> How about checking in the compiled file for
> for example EPOLLIN, that should give a clear build failure if the
> header is missing?

If the header was missing then that would already be causing a
compilation failure. The issue with this particular version of
SPARC glibc is that the header is present but doesn't declare the
function.

Looking for EPOLLIN isn't a useful test for "is epoll_create1()
present and OK?" because:
(1) EPOLLIN will be defined on systems which only have epoll_create(),
so "is EPOLLIN present?" can be true when "is epoll_create1() OK?" is false
(2) we don't ever actually use EPOLLIN, so checking for it could
potentially cause us to not use epoll_create1() even if it was
present and usable

-- PMM

