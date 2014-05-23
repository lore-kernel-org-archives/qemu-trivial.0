Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wnw4B-0002C3-MU
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 16:27:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wnw44-000240-Ot
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:27:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wnw3z-0005Jz-9m
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:27:40 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34463)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wnw3o-0005Ic-3m; Fri, 23 May 2014 16:27:24 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 938A642B94;
	Sat, 24 May 2014 00:27:21 +0400 (MSK)
Message-ID: <537FAF29.3080600@msgid.tls.msk.ru>
Date: Sat, 24 May 2014 00:27:21 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.5.0
MIME-Version: 1.0
To: Le Tan <tamlokveer@gmail.com>, qemu-devel@nongnu.org
References: <1400631039-7208-1-git-send-email-tamlokveer@gmail.com>
	<1400631039-7208-3-git-send-email-tamlokveer@gmail.com>
In-Reply-To: <1400631039-7208-3-git-send-email-tamlokveer@gmail.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>, peter.crosthwaite@xilinx.com,
	qemu-trivial@nongnu.org, jan.kiszka@web.de,
	Stefan Hajnoczi <stefanha@redhat.com>, afaerber@suse.de
Subject: Re: [Qemu-trivial] [PATCH 2/2] block: replace fprintf(stderr,
 ...) with error_report()
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
X-List-Received-Date: Fri, 23 May 2014 20:27:46 -0000

21.05.2014 04:10, Le Tan wrote:
> Replace fprintf(stderr,...) with error_report() in files block/*, block.c,
> block-migration.c and blockdev.c. The trailing "\n"s of the @fmt argument
> have been removed because @fmt of error_report() should not contain newline.
> 
> Signed-off-by: Le Tan <tamlokveer@gmail.com>
> ---
>  block-migration.c      |    5 +--
>  block.c                |    4 +-
>  block/qcow2-refcount.c |  114 ++++++++++++++++++++++++------------------------
>  block/qcow2.c          |   18 ++++----
>  block/raw-posix.c      |   10 ++---
>  block/raw-win32.c      |    6 +--
>  block/ssh.c            |    2 +-
>  block/vdi.c            |   15 ++++---
>  block/vmdk.c           |   15 +++----
>  block/vpc.c            |    4 +-
>  block/vvfat.c          |   69 +++++++++++++++--------------
>  blockdev.c             |    6 +--
>  12 files changed, 132 insertions(+), 136 deletions(-)

That's a rather large -trivial patch... ;)

Please check this patch using ./tools/checkpatch.pl - it will show
many whitespace issues.

I'd apply it to -trivial (after fixing the whitespace issues), all
the actual changes look sane.  But Cc'ing kwolf and stefanha too
(who are the block subsystem maintainers), because the patch touches
too many of block code.

Thanks,

/mjt


