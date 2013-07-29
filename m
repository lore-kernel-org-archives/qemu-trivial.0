Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V3i67-0004XF-Tx
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jul 2013 03:42:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3i61-0004Oe-HI
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 03:42:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1V3i5v-00089C-7T
	for qemu-trivial@nongnu.org; Mon, 29 Jul 2013 03:42:21 -0400
Received: from hall.aurel32.net ([2001:470:1f0b:4a8::1]:56974)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1V3i5u-000894-Pr; Mon, 29 Jul 2013 03:42:15 -0400
Received: from anguille.univ-lyon1.fr ([134.214.4.207] helo=ohm.aurel32.net)
	by hall.aurel32.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <aurelien@aurel32.net>)
	id 1V3i5t-0007br-38; Mon, 29 Jul 2013 09:42:13 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.80)
	(envelope-from <aurelien@aurel32.net>)
	id 1V3i5n-0003Ax-Kg; Mon, 29 Jul 2013 09:42:07 +0200
Date: Mon, 29 Jul 2013 09:42:07 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20130729074207.GB5686@ohm.aurel32.net>
References: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1374910406-15273-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: Mutt 1.5.21 (2010-09-15)
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:470:1f0b:4a8::1
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL trivial 00/11] trivial
	patches for 2013-07-27
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
X-List-Received-Date: Mon, 29 Jul 2013 07:42:26 -0000

On Sat, Jul 27, 2013 at 11:33:15AM +0400, Michael Tokarev wrote:
> We collected a few more trivial patches this week, including a compile
> failure fix for 32bit builds by Stefan Weil.
> 
> Please pull.
> 
> The following changes since commit 200a06397f5d3e982028fd78b25b420507ade021:
> 
>   Merge remote-tracking branch 'afaerber/tags/qom-cpu-for-anthony' into staging (2013-07-26 17:53:19 -0500)
> 
> are available in the git repository at:
> 
> 
>   git://git.corpit.ru/qemu.git trivial-patches
> 
> for you to fetch changes up to 6c86f405efd6532b58ad1b607cc9f11e856ef5ca:
> 
>   target-mips: Remove assignment to a variable which is never used (2013-07-27 11:22:54 +0400)
> 
> ----------------------------------------------------------------
> Liu Ping Fan (1):
>       timer: make timers_state static
> 
> Petar Jovanovic (1):
>       linux-user: correct argument number for sys_mremap and sys_splice
> 
> Ramkumar Ramachandra (1):
>       qemu-options: mention C-a h in the -nographic doc
> 
> Stefan Weil (8):
>       aes: Remove unused code (NDEBUG, u16)
>       hw/9pfs: Fix potential memory leak and avoid reuse of freed memory
>       exec: Remove env from list of poisoned names
>       watchdog: Remove break after exit
>       PPC: dbdma: macio: Fix format specifiers (build regression)
>       misc: Fix new typos in comments and strings
>       misc: Use g_assert_not_reached for code which is expected to be unreachable
>       target-mips: Remove assignment to a variable which is never used
> 
>  block/vhdx.h                       |    2 +-
>  blockdev.c                         |    2 +-
>  cpus.c                             |    2 +-
>  docs/rdma.txt                      |    2 +-
>  hw/9pfs/virtio-9p-proxy.c          |    2 ++
>  hw/ide/macio.c                     |    9 +++++----
>  hw/net/vmxnet3.c                   |   16 ++++++++--------
>  hw/net/vmxnet_tx_pkt.c             |    2 +-
>  hw/usb/hcd-ehci.c                  |    8 ++++----
>  hw/virtio/virtio-balloon.c         |    4 ++--
>  hw/watchdog/watchdog.c             |    1 -
>  hw/xen/xen_pt.c                    |    3 ++-
>  include/exec/poison.h              |    1 -
>  linux-user/main.c                  |    4 ++--
>  migration-rdma.c                   |    4 ++--
>  net/eth.c                          |    2 +-
>  qdev-monitor.c                     |    4 ++--
>  qemu-options.hx                    |    3 ++-
>  target-arm/helper.c                |    2 +-
>  target-mips/op_helper.c            |    1 -
>  tests/test-qmp-input-visitor.c     |    2 +-
>  tests/test-qmp-output-visitor.c    |    4 ++--
>  tests/test-visitor-serialization.c |    8 ++++----
>  util/aes.c                         |    5 -----
>  24 files changed, 45 insertions(+), 48 deletions(-)
> 

Thanks, pulled.

-- 
Aurelien Jarno                          GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net

