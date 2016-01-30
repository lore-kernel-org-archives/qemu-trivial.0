Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aPRtV-0000Fm-BP
	for mharc-qemu-trivial@gnu.org; Sat, 30 Jan 2016 04:32:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPRtT-0000F3-2G
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:32:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPRtP-0007sE-2b
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:32:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:54761)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aPRtO-0007qR-R7
	for qemu-trivial@nongnu.org; Sat, 30 Jan 2016 04:32:31 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A69D041CA2;
	Sat, 30 Jan 2016 12:32:13 +0300 (MSK)
To: James Nutaro <nutaro@gmail.com>, qemu-trivial@nongnu.org
References: <CANVkX9HFRVH1n4WpHbZ23EGH6UFtrTCrh2r_CDHMPNtmU3w5_A@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Openpgp: id=6EE195D1886E8FFB810D4324457CE0A0804465C5
Organization: Telecom Service, JSC
Message-ID: <56AC831D.2080809@msgid.tls.msk.ru>
Date: Sat, 30 Jan 2016 12:32:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <CANVkX9HFRVH1n4WpHbZ23EGH6UFtrTCrh2r_CDHMPNtmU3w5_A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: Re: [Qemu-trivial] [PATCH] Added code for synchronzing the internal
 simulation clock with an external simulation clock
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
X-List-Received-Date: Sat, 30 Jan 2016 09:32:36 -0000

13.01.2016 18:35, James Nutaro wrote:
> 
> This patch adds an interface via UNIX shared memory for pacing the execution of QEMU to match an external simulation clock. The aim is to allow QEMU to be used as a module inside of a larger simulation system.
> 
> The body of the patch is below.
> 
[...]
> ---
>  Makefile.target          |   2 +-
>  cpus.c                   |   9 ++++-
>  include/qemu/thread.h    |   8 ++++
>  qqq.c                    | 101 +++++++++++++++++++++++++++++++++++++++++++++++
>  qqq.h                    |  67 +++++++++++++++++++++++++++++++
>  util/qemu-thread-posix.c |  14 +++++++
>  vl.c                     |   5 +++
>  7 files changed, 204 insertions(+), 2 deletions(-)
>  create mode 100644 qqq.c
>  create mode 100644 qqq.h

Now I wonder what it has to do with -trivial and why it hasn't
been sent to -devel.  It's a new subsystem, so to say... :)

Please post it to qemu-devel mailinglist at least.

Thanks,

/mjt

