Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEMk-00005w-Ft
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:23:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEMg-0008Qi-55
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:23:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEMf-0004B7-0D
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:23:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEMZ-000476-Fq; Sun, 24 Sep 2017 17:22:55 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7CD0641C92;
	Mon, 25 Sep 2017 00:22:53 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A69403C3;
	Mon, 25 Sep 2017 00:22:52 +0300 (MSK)
Received: (nullmailer pid 28238 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Mon, 25 Sep 2017 00:22:18 +0300
Message-Id: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/31] Trivial patches for 2017-09-25
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
X-List-Received-Date: Sun, 24 Sep 2017 21:23:03 -0000

This is a collection of trivial stuff collected for quite some time.
It includes various stuff, and just one series from
Philippe Mathieu-Daud=C3=A9 (MAINTAINERS update), - other his series are
in the works.

Thanks,

/mjt

The following changes since commit 460b6c8e581aa06b86f59eebd9e52edfe7adf4=
17:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into s=
taging (2017-09-23 12:55:40 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to 97fb016a2aae686098f01d1c2dc194ed0f8e1c36:

  hw/isa/pc87312: Mark the device with user_creatable =3D false (2017-09-=
25 00:09:11 +0300)

----------------------------------------------------------------
trivial patches for 2017-09-25

----------------------------------------------------------------
Alistair Francis (1):
      target/xtensa: Use the pre-defined MEMTXATTRS_UNSPECIFIED macro

Eduardo Otubo (2):
      filter-mirror: segfault when specifying non existent device
      dma/i82374: avoid double creation of i82374 device

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
 hw/dma/i82374.c             |  5 +++++
 hw/isa/pc87312.c            |  2 ++
 hw/misc/auxbus.c            | 11 +++++++++++
 hw/ppc/mac_newworld.c       | 11 +++--------
 hw/ppc/mac_oldworld.c       | 11 +++--------
 include/qemu/osdep.h        |  6 +++---
 include/qemu/thread-posix.h |  2 +-
 net/filter-mirror.c         | 14 +++++++++++---
 qemu-options.hx             |  4 ++--
 target/xtensa/op_helper.c   |  4 ++--
 tests/boot-sector.c         |  4 ++--
 util/qemu-thread-posix.c    | 10 +++++-----
 20 files changed, 104 insertions(+), 49 deletions(-)

