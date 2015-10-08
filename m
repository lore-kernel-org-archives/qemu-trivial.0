Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkGpU-0001Aq-4A
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 15:26:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkGmO-0007Vt-Il
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkGmN-0000sw-BI
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:23:04 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58697)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEQr-0000ki-Kp; Thu, 08 Oct 2015 12:52:42 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4714E40A55;
	Thu,  8 Oct 2015 19:52:30 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 31E3CA83;
	Thu,  8 Oct 2015 19:52:30 +0300 (MSK)
Received: (nullmailer pid 11975 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:09 +0300
Message-Id: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/19] Trivial patches for 2015-10-08
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
X-List-Received-Date: Thu, 08 Oct 2015 19:23:05 -0000

Another trivial-patches pull request.
Everything's trivial in there this time.

Please consider applying/pulling.

Thank you!

/mjt

The following changes since commit 31c9bd164ddb653915b9029ba0edd40cd57530=
d9:

  Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20151007' into =
staging (2015-10-08 15:33:56 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-10-08

for you to fetch changes up to deb847bfba7ee0ab8151842f5e9cb12d4daad3a3:

  tests: Unique test path for /string-visitor/output (2015-10-08 19:48:17=
 +0300)

----------------------------------------------------------------
trivial patches for 2015-10-08

----------------------------------------------------------------
Christopher Covington (1):
      s/cpu_get_real_ticks/cpu_get_host_ticks/

Daniel P. Berrange (1):
      Add .dir-locals.el file to configure emacs coding style

David Gibson (1):
      .travis.yml: Run make check for all targets, not just some

Dr. David Alan Gilbert (1):
      tests: Unique test path for /string-visitor/output

Guenter Roeck (1):
      imx_serial: Generate interrupt on tx empty if enabled

Marc-Andr=C3=A9 Lureau (1):
      qapi: add missing @

Markus Armbruster (2):
      rocker: Use g_new() & friends where that makes obvious sense
      linux-user: Use g_new() & friends where that makes obvious sense

Paolo Bonzini (3):
      block/ssh: remove dead code
      pci-assign: do not include sys/io.h
      pc: check for underflow in load_linux

Sai Pavan Boddu (2):
      sdhci: use PRIx64 for uint64_t type
      sdhci: Change debug prints to compile unconditionally

Shraddha Barke (4):
      target-microblaze: Remove unnecessary variable
      target-ppc: Remove unnecessary variable
      hw: timer: Remove unnecessary variable
      hw: char: Remove unnecessary variable

Stefan Weil (2):
      MAINTAINERS: Add NSIS file for W32, W64 hosts
      linux-user: Remove type casts to union type

 .dir-locals.el                     |  2 ++
 .travis.yml                        | 10 +--------
 MAINTAINERS                        |  1 +
 block/ssh.c                        |  5 +----
 bsd-user/main.c                    |  2 +-
 cpus.c                             |  6 +++---
 hw/char/etraxfs_ser.c              |  4 +---
 hw/char/imx_serial.c               |  4 +++-
 hw/i386/kvm/pci-assign.c           |  1 -
 hw/i386/pc.c                       |  4 ++++
 hw/intc/xics.c                     |  2 +-
 hw/net/rocker/rocker.c             |  2 +-
 hw/net/rocker/rocker_desc.c        |  4 ++--
 hw/net/rocker/rocker_fp.c          |  2 +-
 hw/net/rocker/rocker_of_dpa.c      |  9 ++++----
 hw/ppc/ppc.c                       |  4 ++--
 hw/sd/sdhci.c                      | 43 ++++++++++++++++++++------------=
------
 hw/timer/m48t59.c                  |  4 +---
 include/qemu/timer.h               | 20 +++++++++---------
 linux-user/elfload.c               |  2 +-
 linux-user/main.c                  |  6 +++---
 linux-user/syscall.c               | 10 ++++-----
 qapi/block.json                    |  2 +-
 target-alpha/sys_helper.c          |  2 +-
 target-microblaze/op_helper.c      |  4 +---
 target-ppc/kvm.c                   |  3 +--
 tests/test-string-output-visitor.c | 16 +++++++-------
 27 files changed, 83 insertions(+), 91 deletions(-)
 create mode 100644 .dir-locals.el

