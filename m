Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwj91-00066y-Ee
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 02:14:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37158)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwj8y-00065C-TN
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 02:14:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwj8x-0003h4-RT
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 02:14:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwj8s-0003ZU-BS; Tue, 26 Sep 2017 02:14:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3F87441F8B;
	Tue, 26 Sep 2017 09:14:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 22E7417;
	Tue, 26 Sep 2017 09:14:49 +0300 (MSK)
Received: (nullmailer pid 7284 invoked by uid 1000);
	Tue, 26 Sep 2017 06:14:49 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Tue, 26 Sep 2017 09:14:44 +0300
Message-Id: <cover.1506406399.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/29] Trivial patches for 2017-09-26
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
X-List-Received-Date: Tue, 26 Sep 2017 06:14:57 -0000

This is a resend of yesterday's pull request, with two patches
removed:
  filter-mirror: segfault when specifying non existent device
    (causes testsuite to fail)
  dma/i82374: avoid double creation of i82374 device
    (better version is in the work)

and with one patch with additional R-b line:
  remove trailing whitespace from qemu-options.hx

Not resending any patches, just the cover letter.

Please consider applying.

Thanks,

/mjt

The following changes since commit 1e3ee834083227f552179f6e43902cba5a866e=
6b:

  Merge remote-tracking branch 'remotes/thibault/tags/samuel-thibault' in=
to staging (2017-09-25 20:31:24 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to 35deebb2327227d8c5f4816476befb06f6329de6:

  hw/isa/pc87312: Mark the device with user_creatable =3D false (2017-09-=
26 09:11:23 +0300)

----------------------------------------------------------------
trivial patches for 2017-09-26

----------------------------------------------------------------
Alistair Francis (1):
      target/xtensa: Use the pre-defined MEMTXATTRS_UNSPECIFIED macro

Eric Blake (2):
      osdep: Fix ROUND_UP(64-bit, 32-bit)
      nbd-client: Use correct macro parenthesization

KONRAD Frederic (1):
      aux-to-i2c-bridge: don't allow user to create one

Kamil Rytarowski (2):
      Replace round_page() with TARGET_PAGE_ALIGN()
      Drop gld linker usage on SunOS

Liang Yan (2):
      hw/display/xenfb.c: Add trace_xenfb_key_event
      chardev/baum: fix baum that releases brlapi twice

Michael Tokarev (1):
      remove trailing whitespace from qemu-options.hx

Peter Maydell (1):
      util/qemu-thread-posix.c: Replace OS ifdefs with CONFIG_HAVE_SEM_TI=
MEDWAIT

Philippe Mathieu-Daud=C3=A9 (14):
      MAINTAINERS: add missing ARM entries
      MAINTAINERS: add missing STM32 entry
      MAINTAINERS: add missing entry for vhost
      MAINTAINERS: add missing VMWare entry
      MAINTAINERS: add missing Guest Agent entries
      MAINTAINERS: add missing qcow2 entry
      MAINTAINERS: add missing PCI entries
      MAINTAINERS: add missing SSI entries
      MAINTAINERS: add missing entries for throttling infra
      MAINTAINERS: add missing AIO entry
      MAINTAINERS: add missing entry for Generic Loader
      MAINTAINERS: add missing Cryptography entry
      MAINTAINERS: update docs/devel/ entries
      MAINTAINERS: update docs/interop/ entries

Stefan Weil (1):
      configure: Remove unused code (found by shellcheck)

Thomas Huth (4):
      trivial: Add missing "-m" parameter in docs/memory-hotplug.txt
      hw/display/virtio-gpu: Put the virtio-gpu-device into the display c=
ategory
      tests/boot-sector: Increase timeout to 600 seconds
      hw/isa/pc87312: Mark the device with user_creatable =3D false

 MAINTAINERS                 | 42 ++++++++++++++++++++++++++++++++-------=
---
 block/nbd-client.c          |  4 ++--
 chardev/baum.c              |  1 +
 configure                   | 17 +++++++++++++++--
 docs/memory-hotplug.txt     |  2 +-
 hw/display/trace-events     |  1 +
 hw/display/virtio-gpu.c     |  1 +
 hw/display/xenfb.c          |  1 +
 hw/isa/pc87312.c            |  2 ++
 hw/misc/auxbus.c            | 11 +++++++++++
 hw/ppc/mac_newworld.c       | 11 +++--------
 hw/ppc/mac_oldworld.c       | 11 +++--------
 include/qemu/osdep.h        |  6 +++---
 include/qemu/thread-posix.h |  2 +-
 qemu-options.hx             |  4 ++--
 target/xtensa/op_helper.c   |  4 ++--
 tests/boot-sector.c         |  4 ++--
 util/qemu-thread-posix.c    | 10 +++++-----
 18 files changed, 88 insertions(+), 46 deletions(-)

