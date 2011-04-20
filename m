Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QCRHi-0000PG-AQ
	for mharc-qemu-trivial@gnu.org; Wed, 20 Apr 2011 02:53:10 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QCRHf-0000JA-IA
	for qemu-trivial@nongnu.org; Wed, 20 Apr 2011 02:53:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QCRHe-0005r0-E1
	for qemu-trivial@nongnu.org; Wed, 20 Apr 2011 02:53:07 -0400
Received: from mail-vx0-f173.google.com ([209.85.220.173]:49503)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1QCRHb-0005qW-Rp; Wed, 20 Apr 2011 02:53:03 -0400
Received: by vxb41 with SMTP id 41so363403vxb.4
	for <multiple recipients>; Tue, 19 Apr 2011 23:53:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.187.167 with SMTP id ft7mr10366276vdc.302.1303282382692;
	Tue, 19 Apr 2011 23:53:02 -0700 (PDT)
Received: by 10.52.165.106 with HTTP; Tue, 19 Apr 2011 23:53:02 -0700 (PDT)
In-Reply-To: <BANLkTi=Rnq-5OPDSEMPHZmjhQXRPLddWxA@mail.gmail.com>
References: <1303203461-30776-1-git-send-email-peter.maydell@linaro.org>
	<BANLkTi=5edYcRWOahB1hyDxCPtWjyXmHBQ@mail.gmail.com>
	<BANLkTik3bYHBHufOzd1D8SAy7G7RjQVH-A@mail.gmail.com>
	<BANLkTik3Xi_0Std-TXRmDOz=WmxB3YhhXA@mail.gmail.com>
	<BANLkTinvEQJH46DTuJOpADo30SqJ2V=xBg@mail.gmail.com>
	<BANLkTi=Rnq-5OPDSEMPHZmjhQXRPLddWxA@mail.gmail.com>
Date: Wed, 20 Apr 2011 07:53:02 +0100
Message-ID: <BANLkTimCYjx1JjT1Wb-Rt19TPG8pKfrGxA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Blue Swirl <blauwirbel@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.220.173
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
X-List-Received-Date: Wed, 20 Apr 2011 06:53:08 -0000

On 19 April 2011 21:36, Blue Swirl <blauwirbel@gmail.com> wrote:
> Sorry, I just picked a define without much thought. A more specific
> one would be flags parameter of epoll_create1(), like EPOLL_CLOEXEC or
> EPOLL_NONBLOCK. We don't use them now since the target system call
> argument is passed untranslated to host, but that is actually not
> correct, since the bit definitions could be different. So checking for
> one of those should be OK.

Unfortunately the header file on the system in question defines
both EPOLL_CLOEXEC and EPOLL_NONBLOCK even though it doesn't
prototype epoll_create1(). So this idea won't work.
The bug we are effectively trying to work around is the one fixed
by this libc patch:
http://sourceware.org/ml/libc-alpha/2010-08/msg00128.html

The only problem with the header is that it doesn't declare the
function, so the only way to detect it is to do something that
will fail if the function isn't declared, like compiling -Werror.

-- PMM

