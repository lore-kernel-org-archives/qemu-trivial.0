Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W70ao-0001wL-Aw
	for mharc-qemu-trivial@gnu.org; Sat, 25 Jan 2014 05:36:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W70ai-0001nj-8u
	for qemu-trivial@nongnu.org; Sat, 25 Jan 2014 05:36:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W70ad-0006vf-Ar
	for qemu-trivial@nongnu.org; Sat, 25 Jan 2014 05:35:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W70aT-0006cQ-7G; Sat, 25 Jan 2014 05:35:41 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 95B6F42E5A;
	Sat, 25 Jan 2014 14:35:31 +0400 (MSK)
Message-ID: <52E39373.7030604@msgid.tls.msk.ru>
Date: Sat, 25 Jan 2014 14:35:31 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20131103 Icedove/17.0.10
MIME-Version: 1.0
To: aliguori@amazon.com
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PULL 00/11] Trivial patches for 2014-01-16
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
X-List-Received-Date: Sat, 25 Jan 2014 10:36:01 -0000

Ping?

We've a few more patches in the queue, should I drop the ones from previous
week?

Thanks,

/mjt

16.01.2014 21:35, Michael Tokarev wrote:
> There's nothing exciting in there, but we have some small bugfixes here and
> there, and a few cosmetic changes too.
> 
> This is my first signed pull request too, based on my regular GnuPG key which
> I use to sign Debian packages.
> 
> Please pull.
> 
> Thanks,
> 
> /mjt
> 
> The following changes since commit 1cf892ca2689c84960b4ce4d2723b6bee453711c:
> 
>   SPARC: Fix LEON3 power down instruction (2014-01-15 15:37:33 +1000)
> 
> are available in the git repository at:
> 
>   git://git.corpit.ru/qemu.git tags/trivial-patches-2014-01-16
> 
> for you to fetch changes up to 2c02d1ad48ad44cf00522df7d8de9138689fac85:
> 
>   vl: Add a blank space between the variable and '=' (2014-01-16 15:23:41 +0400)
> 
> ----------------------------------------------------------------
> trivial-patches for 2014-01-16
> 
> ----------------------------------------------------------------
> David du Colombier (1):
>       ide: cmd_exec_dev_diagnostic() always set error register to 0x01
> 
> Eduardo Habkost (1):
>       Add bios-256k.bin to BLOBS on Makefile
> 
> Kewei Yu (1):
>       vl: Add a blank space between the variable and '='
> 
> Luiz Capitulino (1):
>       virtio-balloon: don't hardcode config size value
> 
> Namhyung Kim (2):
>       docs: Fix typo in QMP WAKEUP example
>       Fix typo of tiemr in timer.h
> 
> Pavel Zbitskiy (3):
>       linux-user: fixed s390x clone() argument order
>       linux-user: fixed getsockopt() optlen
>       linux-user: fixed recvfrom() addrlen
> 
> Stefan Weil (2):
>       exec: Exclude non portable function for MinGW
>       pc-bios: Remove execute flag from BIOS files
> 
>  Makefile                   |    2 +-
>  docs/qmp/qmp-events.txt    |    2 +-
>  hw/ide/core.c              |    1 +
>  hw/virtio/virtio-balloon.c |    7 ++++---
>  include/exec/ram_addr.h    |    2 ++
>  include/qemu/timer.h       |    6 +++---
>  linux-user/s390x/syscall.h |    2 +-
>  linux-user/syscall.c       |    4 ++--
>  pc-bios/kvmvapic.bin       |  Bin 9216 -> 9216 bytes
>  pc-bios/multiboot.bin      |  Bin 1024 -> 1024 bytes
>  pc-bios/sgabios.bin        |  Bin 4096 -> 4096 bytes
>  vl.c                       |    2 +-
>  12 files changed, 16 insertions(+), 12 deletions(-)
>  mode change 100755 => 100644 pc-bios/kvmvapic.bin
>  mode change 100755 => 100644 pc-bios/multiboot.bin
>  mode change 100755 => 100644 pc-bios/sgabios.bin
> 


