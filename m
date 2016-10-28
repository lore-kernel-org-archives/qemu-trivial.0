Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c08w5-0004NK-MG
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:19:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08w1-0004JU-Tv
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c08vx-0004cA-7Z
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:19:09 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:40869)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c08vr-0004Tz-KR; Fri, 28 Oct 2016 11:18:59 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 439924371C;
	Fri, 28 Oct 2016 18:18:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 26F9BB3E;
	Fri, 28 Oct 2016 18:18:56 +0300 (MSK)
Received: (nullmailer pid 6043 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Fri, 28 Oct 2016 18:18:31 +0300
Message-Id: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/23] Trivial patches for 2016-10-28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Oct 2016 15:19:11 -0000

Here's a next pull request for the trivial patches tree.
Nothing exciting is in there this time, small things
here and there.

Thanks,

/mjt

The following changes since commit fd209e4a773dd5a7fea79eaaffd276ebcb99e9=
2a:

  Merge remote-tracking branch 'remotes/jnsnow/tags/ide-pull-request' int=
o staging (2016-10-28 14:29:50 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to 630b210b9abbf362905a2096c22c5eb1d6224e77:

  Fix build for less common build directories names (2016-10-28 18:17:24 =
+0300)

----------------------------------------------------------------
trivial patches for 2016-10-28

----------------------------------------------------------------
Akanksha Srivastava (1):
      usb: Change *_exitfn return type from int to void

Anand J (2):
      scripts/clean-includes: added duplicate #include check
      clean-up: removed duplicate #includes

Changlong Xie (1):
      filter-dump: add missing "["

Daniel Shahaf (1):
      scripts/hxtool: fix undefined behavour of echo

Laurent Vivier (1):
      MAINTAINERS: qemu-trivial information

Marc-Andr=C3=A9 Lureau (1):
      monitor: deprecate 'default' option

Michael Tokarev (1):
      qemu-options.hx: set: fix copy-paste error

Michael Walle (7):
      target-lm32: fix style issue
      target-lm32: fix LOG_DIS operand order
      target-lm32: swap operand of wcsr in LOG_DIS()
      target-lm32: disable asm logging via LOG_DIS()
      lm32: milkymist-tmu2: fix integer overflow
      target-lm32: rewrite gen_compare()
      milkymist-pfpu: fix potential integer overflow

Peter Maydell (2):
      migration: Remove unneeded NULL check from migrate_fd_error()
      s390: avoid always-true comparison in s390_pci_generate_fid()

Stefan Weil (3):
      Makefile: Fix help text for target 'installer'
      qemu-ga: Remove stray 'q' in documentation
      Fix build for less common build directories names

Thomas Huth (2):
      hw/tpm/tpm_passthrough: Simplify if-statements a little bit
      hw/block/nvme: Simplify if-statements a little bit

zhanghailiang (1):
      colo-compare: remove unused struct CompareChardevProps and 'props' =
variable

 MAINTAINERS                         | 11 +++++++
 Makefile                            |  2 +-
 accel.c                             |  1 -
 cputlb.c                            |  1 -
 gdbstub.c                           |  1 -
 hw/block/nvme.c                     |  4 +--
 hw/display/milkymist-tmu2.c         |  2 +-
 hw/i386/acpi-build.c                |  1 -
 hw/microblaze/boot.c                |  1 -
 hw/mips/mips_malta.c                |  1 -
 hw/misc/milkymist-pfpu.c            |  2 +-
 hw/nvram/fw_cfg.c                   |  1 -
 hw/pci-bridge/pci_expander_bridge.c |  1 -
 hw/ppc/ppc405_boards.c              |  1 -
 hw/ppc/spapr.c                      |  1 -
 hw/s390x/s390-pci-bus.c             | 10 ++-----
 hw/timer/grlib_gptimer.c            |  1 -
 hw/tpm/tpm_passthrough.c            |  6 ++--
 hw/tpm/tpm_tis.c                    |  1 -
 hw/unicore32/puv3.c                 |  1 -
 hw/usb/ccid-card-emulated.c         |  3 +-
 hw/usb/ccid-card-passthru.c         |  6 ----
 hw/usb/ccid.h                       |  2 +-
 hw/usb/dev-mtp.c                    |  1 -
 hw/usb/dev-smartcard-reader.c       | 11 ++++---
 include/hw/i386/pc.h                |  1 -
 include/monitor/monitor.h           |  2 +-
 migration/migration.c               |  2 +-
 monitor.c                           |  4 +--
 net/colo-compare.c                  |  8 ------
 qemu-ga.texi                        |  2 +-
 qemu-io-cmds.c                      |  1 -
 qemu-options.hx                     | 12 ++++----
 qmp.c                               |  1 -
 scripts/clean-includes              | 56 +++++++++++++++++++++++++++----=
-----
 scripts/hxtool                      | 20 ++++++-------
 scripts/tracetool.py                |  2 +-
 target-i386/machine.c               |  3 --
 target-lm32/translate.c             | 57 ++++++++++++++++++-------------=
------
 target-mips/machine.c               |  1 -
 target-ppc/machine.c                |  1 -
 target-ppc/mem_helper.c             |  1 -
 target-sparc/machine.c              |  3 --
 target-xtensa/translate.c           |  1 -
 tests/crypto-tls-x509-helpers.h     |  3 --
 tests/vhost-user-test.c             |  2 --
 util/oslib-posix.c                  |  1 -
 vl.c                                | 12 ++------
 48 files changed, 121 insertions(+), 148 deletions(-)

