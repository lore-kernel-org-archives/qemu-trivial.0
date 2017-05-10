Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d8Lxp-0003Yd-Mg
	for mharc-qemu-trivial@gnu.org; Wed, 10 May 2017 03:23:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d8Lxk-0003V1-Rc
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 03:23:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1d8Lxe-00064a-UY
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 03:23:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1d8Lxa-00062L-8u; Wed, 10 May 2017 03:22:58 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 61158404EB;
	Wed, 10 May 2017 10:22:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 51E2B3BB;
	Wed, 10 May 2017 10:22:48 +0300 (MSK)
Received: (nullmailer pid 12232 invoked by uid 1000);
	Wed, 10 May 2017 07:22:48 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Wed, 10 May 2017 10:22:45 +0300
Message-Id: <cover.1494400777.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/23] Trivial patches for 2017-05-10
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
X-List-Received-Date: Wed, 10 May 2017 07:23:12 -0000

It is the same as previous pull request (from 2017-05-07),
but with author of single patch fixed. I've no idea how
it happened, I don't touch patches manually, only add
S-o-b and R-o-b using commit --amend.  Either way, it
is fixed now.  Not resending everything, only the fixed
patch.

/mjt

The following changes since commit 12a95f320a36ef66f724a49bb05e4fb553ac5d=
be:

  Merge remote-tracking branch 'kwolf/tags/for-upstream' into staging (20=
17-05-04 13:44:32 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to e1ae9fb6c2a35015ed4881def4a4a7b6be2d15f0:

  tests: Remove redundant assignment (2017-05-10 10:19:24 +0300)

----------------------------------------------------------------
trivial patches for 2017-05-10

----------------------------------------------------------------
Andreas Grapentin (1):
      use _Static_assert in QEMU_BUILD_BUG_ON

Chris Webb (1):
      virtfs: allow a device id to be specified in the -virtfs option

Craig Jellick (1):
      Add 'none' as type for drive's if option

Eric Blake (2):
      tests: Ignore more test executables
      tests: Ignore another built executable (test-hmp)

Fam Zheng (3):
      block: Make 'replication_state' an enum
      virtio-blk: Remove useless condition around g_free()
      tests: Remove redundant assignment

Ishani Chugh (1):
      Remove reduntant qemu: from error functions

KONRAD Frederic (1):
      ppc_booke: drop useless assignment

Kamil Rytarowski (2):
      scripts/qemu-binfmt-conf.sh: Fix shell portability issue
      scripts: Switch to more portable Perl shebang

Marc-Andr=C3=A9 Lureau (1):
      doc: fix function spelling

Paolo Bonzini (3):
      jazz_led: fix bad snprintf
      MAINTAINERS: Update paths for main loop
      MAINTAINERS: Update paths for AioContext implementation

Philippe Mathieu-Daud=C3=A9 (3):
      usb-ccid: make ccid_write_data_block() cope with null buffers
      device_tree: fix compiler warnings (clang 5)
      qga: fix compiler warnings (clang 5)

Saurav Sachidanand (1):
      util: Use g_malloc/g_free in envlist.c

Thomas Huth (2):
      qemu-doc: Fix broken URLs of amnhltm.zip and dosidle210.zip
      hw/core/generic-loader: Fix crash when running without CPU

sochin.jiang (1):
      channel-file: fix wrong parameter comments

 MAINTAINERS                     |  8 +++----
 block/replication.c             | 44 +++++++++++++++++++----------------=
---
 bsd-user/main.c                 | 14 ++++--------
 configure                       | 18 ++++++++++++++++
 device_tree.c                   |  1 +
 hw/block/virtio-blk.c           |  4 +---
 hw/core/generic-loader.c        |  9 ++++----
 hw/display/jazz_led.c           |  4 ++--
 hw/microblaze/boot.c            |  2 +-
 hw/nios2/boot.c                 |  2 +-
 hw/ppc/pnv.c                    |  2 +-
 hw/ppc/ppc_booke.c              |  1 -
 hw/s390x/sclp.c                 |  4 ++--
 hw/tricore/tricore_testboard.c  |  2 +-
 hw/usb/dev-smartcard-reader.c   |  5 ++++-
 include/io/channel-file.h       |  2 +-
 include/io/channel.h            |  2 +-
 include/qemu/compiler.h         |  4 +++-
 linux-user/main.c               |  9 +++-----
 numa.c                          |  4 ++--
 qemu-doc.texi                   | 10 ++++-----
 qemu-options.hx                 |  4 ++--
 qga/commands-posix.c            |  8 ++++---
 scripts/checkpatch.pl           |  3 ++-
 scripts/clean-header-guards.pl  |  3 ++-
 scripts/cleanup-trace-events.pl |  2 +-
 scripts/disas-objdump.pl        |  4 +++-
 scripts/get_maintainer.pl       |  3 ++-
 scripts/qemu-binfmt-conf.sh     |  4 ++--
 scripts/shaderinclude.pl        |  2 +-
 scripts/switch-timer-api        |  2 +-
 scripts/texi2pod.pl             |  4 +++-
 tests/.gitignore                |  4 ++++
 tests/postcopy-test.c           |  2 +-
 util/envlist.c                  | 47 +++++++++++++++++------------------=
------
 vl.c                            |  5 +++--
 36 files changed, 133 insertions(+), 115 deletions(-)

