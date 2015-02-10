Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4Wi-0000ad-MK
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:42:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50969)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4Wb-0000LJ-4t
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:42:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4WZ-0004Sr-NI
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:42:21 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:55315)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4WT-0004Qj-Ot; Tue, 10 Feb 2015 01:42:14 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9A4AA41812;
	Tue, 10 Feb 2015 09:34:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 88F9B8C4;
	Tue, 10 Feb 2015 09:34:43 +0300 (MSK)
Received: (nullmailer pid 9331 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:49 +0300
Message-Id: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/46] Trivial patches for 2015-02-10
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
X-List-Received-Date: Tue, 10 Feb 2015 06:42:22 -0000

This is another pull request for trivial-patches tree.
This time it is sort of huge, consisting of 46 patches in total.
There are several patches and series which aren't applied to
-trivial but should -- I decided I'll send a pull request first
and apply the leftovers later, because there are important
changes in the tree and amount of leftovers is somewhat large.
This is a 3-week collection.

This request consists of a large number of trivial fixes from
the usual heros, Marcus and Stefen, who found several new ways
to find various small defects in the code.  There are several
linux-user fixes from Chen Gang, with some grammar fixes from
me -- not all of his changes has been applied so far.  There
are several bugfixes, -- eg, the libcacard linking fix, a buffer
overflow fix in inet_parse (which does not warrant a CVE# :);
and also there are some other stuff from here and there.

Please consider applying.

Thanks,

/mjt

The following changes since commit 89db21771782fd6050335e73542064f1187c9ced:

  qmp: unbreak build for non-vnc configuration (2015-02-09 22:36:04 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-02-10

for you to fetch changes up to 3ff64f1f9391a9b71d4dd58c6c4bbaa1db3dd430:

  virtio: Fix warning caused by missing 'static' attribute (2015-02-10 09:27:21 +0300)

----------------------------------------------------------------
trivial patches for 2015-02-10

----------------------------------------------------------------
Chen Gang S (4):
      linux-user/syscall.c: lock_iovec: unlock vec[i] in failure processing code block
      linux-user/syscall.c: Fix typo issue for using target_vec[i].iov_len instead of target_vec[i].iov_base
      linux-user/main.c: Use TARGET_SIG* instead of SIG*
      linux-user/syscall.c: do_ioctl_dm: Need to call unlock_user() before going to failure return in default case

Christian Borntraeger (1):
      vl.c: fix memory leak spotted by valgrind

Daniel P. Berrange (1):
      libcacard: stop linking against every single 3rd party library

Don Koch (4):
      Add tracing to xenfb.
      Add trace to ps2.c.
      Add/convert trace calls in pcnet-pci.c.
      Convert some debugging printfs to trace calls in pcnet.c.

Gonglei (2):
      fw_cfg: fix typos in comments: patch -> path
      virtfs-proxy-helper: Fix possible socket leak.

Greg Kurz (2):
      QJSON: fix typo in author's email address
      Fix name error in migration stream analyzation script

Kevin Wolf (1):
      qemu-sockets: Fix buffer overflow in inet_parse()

Markus Armbruster (15):
      target-mips: Clean up switch fall through after commit fecd264
      vl: Fix bogus error message for implied mon ID clashing
      qemu-option: Replace pointless use of g_malloc0() by g_malloc()
      qemu-option: Pair g_malloc() with g_free(), not free()
      spapr_vio: Pair g_malloc() with g_free(), not free()
      usb: Pair g_malloc() with g_free(), not free()
      util/uri: uri_new() can't fail, drop dead error handling
      util/uri: realloc2n() can't fail, drop dead error handling
      util/uri: URI member path can be null, compare more carfully
      onenand: g_malloc() can't fail, bury dead error handling
      rtl8139: g_malloc() can't fail, bury dead error handling
      kvm: g_malloc() can't fail, bury dead error handling
      rdma: g_malloc0() can't fail, bury dead error handling
      vnc: g_realloc() can't fail, bury dead error handling
      translate-all: Use g_try_malloc() for dynamic translator buffer

Maxim Ostapenko (1):
      linux-user: wrong TARGET_SI_PAD_SIZE value for some targets.

Paolo Bonzini (4):
      cpu-exec: drop dead assignment
      cpu-exec: simplify icount code
      qemu-sockets: improve error reporting in unix_listen_opts
      aes: remove a dead return statement

Stefan Weil (10):
      disas/cris: Fix warning caused by missing 'static' attribute
      disas/sh4: Fix warning caused by missing 'static' attribute
      migration: Fix warning caused by missing declaration of vmstate_dummy
      migration: Fix warnings caused by missing 'static' attribute
      moxie: Fix warning caused by missing include statement
      serial: Fix warnings caused by missing 'static' attribute
      spice: Add missing 'static' attribute
      stubs: Fix warning caused by missing include statement
      vga: Fix warning caused by missing 'static' attribute
      virtio: Fix warning caused by missing 'static' attribute

Thomas Huth (1):
      qemu-log: Correct help text of 'log cpu_reset'

 cpu-exec.c                   | 12 +++------
 disas/cris.c                 |  2 +-
 disas/sh4.c                  |  2 +-
 fsdev/virtfs-proxy-helper.c  | 13 ++++++---
 hw/block/onenand.c           |  8 +-----
 hw/char/serial.c             | 14 +++++-----
 hw/char/virtio-serial-bus.c  |  2 +-
 hw/core/fw-path-provider.c   |  2 +-
 hw/display/vga.c             |  2 +-
 hw/display/xenfb.c           |  5 ++++
 hw/input/ps2.c               | 16 +++++++++++
 hw/net/pcnet-pci.c           | 49 +++++++++++++--------------------
 hw/net/pcnet.c               | 28 ++++++-------------
 hw/net/rtl8139.c             | 14 ----------
 hw/ppc/spapr.c               |  2 +-
 hw/ppc/spapr_vio.c           |  2 +-
 hw/usb/desc-msos.c           |  2 +-
 include/migration/vmstate.h  |  2 --
 kvm-all.c                    |  4 ---
 libcacard/Makefile           |  2 ++
 linux-user/main.c            | 64 ++++++++++++++++++++++----------------------
 linux-user/syscall.c         |  9 ++++++-
 linux-user/syscall_defs.h    |  9 ++++++-
 migration/rdma.c             | 11 +++-----
 qemu-log.c                   |  2 +-
 qjson.c                      |  2 +-
 scripts/analyze-migration.py |  2 +-
 spice-qemu-char.c            |  2 +-
 stubs/qtest.c                |  2 +-
 target-mips/translate.c      |  4 +++
 target-moxie/machine.c       |  1 +
 trace-events                 | 41 ++++++++++++++++++++++++++++
 translate-all.c              |  2 +-
 ui/vnc.c                     |  4 ---
 util/aes.c                   |  2 +-
 util/qemu-option.c           |  8 +++---
 util/qemu-sockets.c          | 26 +++++++++++++-----
 util/uri.c                   | 61 +++++++++--------------------------------
 vl.c                         |  7 +++--
 39 files changed, 224 insertions(+), 218 deletions(-)

