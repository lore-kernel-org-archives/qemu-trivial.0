Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5Gh-0007a0-JB
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:29:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5Gf-0007We-03
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:29:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL5Gd-0006Rh-NG
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:29:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:44985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL5GY-0006QF-Jg; Tue, 10 Feb 2015 02:29:50 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id D5CC141812;
	Tue, 10 Feb 2015 10:29:48 +0300 (MSK)
Message-ID: <54D9B36C.1000405@msgid.tls.msk.ru>
Date: Tue, 10 Feb 2015 10:29:48 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
	<CAFEAcA-nR3zspLZ42W7Ey4EV1UM-RgiXkggmgfBWWDwRqYFqHA@mail.gmail.com>
In-Reply-To: <CAFEAcA-nR3zspLZ42W7Ey4EV1UM-RgiXkggmgfBWWDwRqYFqHA@mail.gmail.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/46] Trivial patches for
	2015-02-10
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
X-List-Received-Date: Tue, 10 Feb 2015 07:29:58 -0000

10.02.2015 10:14, Peter Maydell wrote:
>> The following changes since commit 89db21771782fd6050335e73542064f1187c9ced:
>>
>>   qmp: unbreak build for non-vnc configuration (2015-02-09 22:36:04 +0000)
>>
>> are available in the git repository at:
>>
>>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-02-10
>>
>> for you to fetch changes up to 3ff64f1f9391a9b71d4dd58c6c4bbaa1db3dd430:
>>
>>   virtio: Fix warning caused by missing 'static' attribute (2015-02-10 09:27:21 +0300)
> 
> Hi. I'm afraid this introduces a new compiler warning under clang:
> 
> disas/cris.c:1218:33: warning: unused variable 'cris_cond15s'
> [-Wunused-const-variable]
> static const struct cris_cond15 cris_cond15s[] =

Yes.  This variable/array is actually completely unused. I dropped
the patch in question from my pull request, and re-tagged it.  We'll
deal with this unused var later.  Here's a new pull request, now
with only 45 patches.

The following changes since commit 89db21771782fd6050335e73542064f1187c9ced:

  qmp: unbreak build for non-vnc configuration (2015-02-09 22:36:04 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-02-10

for you to fetch changes up to 43d735547b2a29cafd7d9529ac38734950b235f7:

  virtio: Fix warning caused by missing 'static' attribute (2015-02-10 10:26:05 +0300)

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

Stefan Weil (9):
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
 38 files changed, 223 insertions(+), 217 deletions(-)


Thanks,

/mjt

