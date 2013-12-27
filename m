Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwfZc-00035p-3V
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2013 17:08:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZU-0002pP-Ls
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:08:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VwfZP-0003xz-NR
	for qemu-trivial@nongnu.org; Fri, 27 Dec 2013 17:07:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44868)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VwfZA-0003s3-05; Fri, 27 Dec 2013 17:07:36 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id EAD1F4389C;
	Sat, 28 Dec 2013 02:07:35 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 9BF7B5E0;
	Sat, 28 Dec 2013 02:07:34 +0400 (MSK)
Received: (nullmailer pid 10324 invoked by uid 1000);
	Fri, 27 Dec 2013 22:07:34 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Sat, 28 Dec 2013 02:07:13 +0400
Message-Id: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 00/17] trivial patches for 2013-12-27
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
X-List-Received-Date: Fri, 27 Dec 2013 22:08:01 -0000

Here are collected trivial patches for more than 2 weeks.
There's nothing exciting here, most stuff is really trivial,
including a few simple bugfixes.

Except of one patch by Stefan Weil, which basically re-writes
help text code in ./configure to be much simpler and shorter
and easier to read and manage.  While this change is trivial
indeed, it has a potential of being in conflict with other
changes/trees, if another tree is updating help text too.

Please pull.

Thanks,

/mjt

The following changes since commit f976b09ea249cccc3fd41c98aaf6512908db0b=
ae:

  PPC: Fix compilation with TCG debug (2013-12-22 19:15:55 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to 5e8138ec82e17b72a6686e7325285dd6a318ea7e:

  acpi unit-test: Remove temporary disk after test (2013-12-28 01:50:07 +=
0400)

----------------------------------------------------------------
Alexander Graf (1):
      x86: only allow real mode to access 32bit without LMA

Amos Kong (1):
      fix -boot strict regressed in commit 6ef4716

Fam Zheng (1):
      acpi unit-test: Remove temporary disk after test

Ingo van Lil (1):
      doc: Mention chardev:id in available devices for -serial

Michael Tokarev (1):
      vl: make boot_strict variable static (not used outside vl.c)

Stefan Weil (12):
      hw/arm/highbank: Simplify code (memory region in device state)
      openrisc: Fix spelling in comment (transaltion -> translation)
      misc: Use macro ARRAY_SIZE where possible
      ui/cocoa: Use macro ARRAY_SIZE where possible
      exynos4210: Use macro ARRAY_SIZE where possible
      linux-user: Use macro TARGET_NSIG_WORDS where possible
      target-m68k: Replace qemu_assert by hw_error
      configure: Rewrite code for help message
      configure: Python tests must be done before help message
      pxa27x: Reduce size of keyboard matrix mapping
      pxa27x: Add 'const' attribute to keyboard maps
      mainstone: Fix duplicate array values for key 'space'

 configure                   |  362 +++++++++++++++++++++----------------=
------
 hw/arm/highbank.c           |    7 +-
 hw/arm/mainstone.c          |   15 +-
 hw/arm/z2.c                 |    2 +-
 hw/audio/intel-hda.c        |    4 +-
 hw/char/exynos4210_uart.c   |    6 +-
 hw/input/pxa2xx_keypad.c    |    6 +-
 hw/misc/exynos4210_pmu.c    |    3 +-
 include/hw/arm/pxa.h        |    8 +-
 linux-user/signal.c         |    8 +-
 net/net.c                   |    2 +-
 qemu-char.c                 |    3 +-
 qemu-options.hx             |    2 +
 target-i386/helper.c        |    6 +
 target-m68k/translate.c     |   28 ++--
 target-openrisc/translate.c |    2 +-
 tests/acpi-test.c           |    5 +-
 ui/cocoa.m                  |    5 +-
 vl.c                        |    5 +-
 19 files changed, 242 insertions(+), 237 deletions(-)

