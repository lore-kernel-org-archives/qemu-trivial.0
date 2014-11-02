Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XktnF-000430-NG
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 06:58:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51112)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xktn8-0003rd-FZ
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:57:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Xktn3-0002IX-HX
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 06:57:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:38812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Xktmt-0002Gj-78; Sun, 02 Nov 2014 06:57:39 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 7FE0B4028A;
	Sun,  2 Nov 2014 14:57:36 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3437B6FC;
	Sun,  2 Nov 2014 14:57:36 +0300 (MSK)
Received: (nullmailer pid 14943 invoked by uid 1000);
	Sun, 02 Nov 2014 11:57:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sun,  2 Nov 2014 14:57:12 +0300
Message-Id: <cover.1414929284.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/23] Trivial patches for 2014-11-02
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
X-List-Received-Date: Sun, 02 Nov 2014 11:58:00 -0000

Here's an almost 3-week trivial patches pull request.
Lots of small things here and there, many small bugfixes
too.  This is also a first pull request for which a
signature should finally be known to others.

Please consider applying/pulling.

/mjt

The following changes since commit ee29498e4f0f3eff90eeeb7f5fa1703abedd2f=
b6:

  Merge remote-tracking branch 'remotes/sstabellini/xen-2014-10-30' into =
staging (2014-10-30 20:28:09 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2014-11-02

for you to fetch changes up to f18a768efb990d9cd02911159de02e8ff5475239:

  vdi: wrapped uuid_unparse() in #ifdef (2014-11-02 10:05:35 +0300)

----------------------------------------------------------------
trivial patches for 2014-11-02

----------------------------------------------------------------
Alex Benn=C3=A9e (1):
      target-arm: A64: remove redundant store

Eduardo Habkost (4):
      tests: Add missing include to test-bitops.c
      bitops.h: Don't include qemu-common.h
      bitmap.h: Don't include qemu-common.h
      target-i386: Remove unused model_features_t struct

Gerd Hoffmann (1):
      sparse: fix build

Gonglei (4):
      dump: Fix dump-guest-memory termination and use-after-close
      tap_int.h: remove repeating NETWORK_SCRIPT defines
      tap: do not close(fd) in net_init_tap_one
      tap: fix possible fd leak in net_init_tap

Michael Tokarev (9):
      Revert "os-posix: report error message when lock file failed"
      net/slirp: specify logbase for smbd
      virtio-9p-proxy: Fix sockfd leak
      virtio-9p-proxy: fix error return in proxy_init()
      virtio-9p-proxy: improve error messages in connect_namedsocket()
      os-posix: use global daemon_pipe instead of cryptic fds[1]
      os-posix: replace goto again with a proper loop
      pidfile: stop making pidfile error a special case
      os-posix: reorder parent notification for -daemonize

Michal Privoznik (1):
      util: Improve os_mem_prealloc error message

Peter Maydell (1):
      target-xtensa: mark XtensaConfig structs as unused

SeokYeon Hwang (1):
      vdi: wrapped uuid_unparse() in #ifdef

zhanghailiang (1):
      target-tricore: check return value before using it

 block/vdi.c                    |    2 ++
 configure                      |    1 +
 dump.c                         |   11 +++----
 hw/9pfs/virtio-9p-proxy.c      |   11 ++++---
 hw/tricore/tricore_testboard.c |    2 +-
 include/qemu-common.h          |    1 -
 include/qemu/bitmap.h          |    6 +++-
 include/qemu/bitops.h          |    4 ++-
 net/slirp.c                    |    4 +--
 net/tap.c                      |    4 ++-
 net/tap_int.h                  |    3 --
 os-posix.c                     |   66 +++++++++++++++-------------------=
------
 os-win32.c                     |    5 ---
 target-arm/translate-a64.c     |    1 -
 target-i386/cpu.c              |    8 -----
 target-xtensa/core-dc232b.c    |    2 +-
 target-xtensa/core-dc233c.c    |    2 +-
 target-xtensa/core-fsf.c       |    2 +-
 tests/test-bitops.c            |    1 +
 util/oslib-posix.c             |    3 +-
 vl.c                           |    2 +-
 21 files changed, 59 insertions(+), 82 deletions(-)

