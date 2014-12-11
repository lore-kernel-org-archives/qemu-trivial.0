Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xz8I6-0007mA-NR
	for mharc-qemu-trivial@gnu.org; Thu, 11 Dec 2014 13:16:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hx-0007VX-7y
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xz8Hs-0002tm-IZ
	for qemu-trivial@nongnu.org; Thu, 11 Dec 2014 13:16:33 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:34934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xz8Hi-0002j5-8V; Thu, 11 Dec 2014 13:16:18 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C797341D38;
	Thu, 11 Dec 2014 21:16:15 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B00B08BE;
	Thu, 11 Dec 2014 21:16:15 +0300 (MSK)
Received: (nullmailer pid 22953 invoked by uid 1000);
	Thu, 11 Dec 2014 18:16:15 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Dec 2014 21:15:48 +0300
Message-Id: <cover.1418321644.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/20] Trivial patches for 2014-12-11
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
X-List-Received-Date: Thu, 11 Dec 2014 18:16:38 -0000

This is the first pull request from trivial-patches tree for
quite some time, I was quiet during 2.2 freeze period and here's
what has been accumulated during the freeze.

As usual, there are many small things from Gonglei and some good
stuff from Marcus, plus some more from others, all pretty much
trivial.

Please pull.

Thanks,

/mjt

The following changes since commit 7fb8da2b8861795e0013e6ee97acd0363d868a=
35:

  Open 2.3 development tree (2014-12-09 21:48:34 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2014-12-11

for you to fetch changes up to 64baadc2726ae929660dd0c61a42e8d9f3ba1828:

  Sort include/qemu/typedefs.h (2014-12-11 21:00:30 +0300)

----------------------------------------------------------------
trivial patches for 2014-12-11

----------------------------------------------------------------
Amos Kong (1):
      qmp: fix typo in input-send-event examples

Antony Pavlov (1):
      pflash_cfi02.c: associate "cfi.pflash02" to "Storage devices" categ=
ory

Dr. David Alan Gilbert (1):
      Sort include/qemu/typedefs.h

Fam Zheng (1):
      configure: Replace which(1) with "has"

Gonglei (6):
      acpi-build: adjust indention 8 -> 4 spaces
      acpi-build: Make DPRINTF working for acpi-build
      virtio-bus: avoid breaking build when open DEBUG switch
      fw_cfg: remove superfluous blank line
      qapi-schema: fix typo about change-vnc-password
      virtio: remove useless declaration of virtio_net_init()

Markus Armbruster (5):
      Drop superfluous conditionals around qemu_opts_del()
      Drop superfluous conditionals around g_strdup()
      util: Drop superfluous conditionals around g_free()
      util: Fuse g_malloc(); memset() into g_new0()
      util: Use g_new() & friends where that makes obvious sense

Stefan Hajnoczi (1):
      hpet: increase spelling precision

Thomas Huth (1):
      get_maintainer.pl: Remove the --git-chief-penguins option

lijun (1):
      usb: delete redundant brackets in usb_host_handle_control()

zhanghailiang (2):
      target-s390x: fix possible out of bounds read
      vt82c686: fix coverity warning about out-of-bounds write

 backends/rng-random.c      |   6 +--
 configure                  |   2 +-
 hw/block/pflash_cfi02.c    |   1 +
 hw/core/qdev.c             |   4 +-
 hw/i386/acpi-build.c       |  22 ++++++----
 hw/isa/vt82c686.c          |  41 ++++++++----------
 hw/nvram/fw_cfg.c          |   1 -
 hw/timer/hpet.c            |   2 +-
 hw/tpm/tpm_passthrough.c   |   4 +-
 hw/usb/host-libusb.c       |   2 +-
 hw/virtio/virtio-bus.c     |   2 +-
 include/hw/virtio/virtio.h |   3 --
 include/qemu/typedefs.h    | 105 +++++++++++++++++++++------------------=
------
 qapi-schema.json           |   2 +-
 qemu-char.c                |   4 +-
 qmp-commands.hx            |   4 +-
 scripts/get_maintainer.pl  |  45 +------------------
 target-s390x/helper.c      |   6 +--
 util/hbitmap.c             |   4 +-
 util/iov.c                 |   4 +-
 util/uri.c                 |  94 +++++++++++++++++----------------------=
-
 21 files changed, 143 insertions(+), 215 deletions(-)

