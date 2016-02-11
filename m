Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqDc-0001EX-Cu
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:19:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqDa-0001Aw-FU
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:19:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqDZ-0006GK-Hh
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:19:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:46559)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqDN-0006CE-AW; Thu, 11 Feb 2016 07:19:17 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 398B641451;
	Thu, 11 Feb 2016 15:19:05 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 5BDDCA8A;
	Thu, 11 Feb 2016 15:19:04 +0300 (MSK)
Received: (nullmailer pid 11170 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:49 +0300
Message-Id: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/14] Trivial patches for 2016-02-11
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
X-List-Received-Date: Thu, 11 Feb 2016 12:19:31 -0000

Here's yet another trivial-patches pull request.  There aren't many
patches in there this time, even if the previous pull request was
quite some time ago.

Speaking of the pull requests.  Maybe it is better to use the
same tag all the time, instead of separate tags for every pull?

Thanks,

/mjt

The following changes since commit 88c73d16ad1b6c22a2ab082064d0d521f756296a:

  memory: fix usage of find_next_bit and find_next_zero_bit (2016-02-10 22:38:24 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-02-11

for you to fetch changes up to 1834ed3afc578b8dbf39838cfdf27d457771a334:

  w32: include winsock2.h before windows.h (2016-02-11 15:15:47 +0300)

----------------------------------------------------------------
trivial patches for 2016-02-11

----------------------------------------------------------------
Alistair Francis (1):
      qom: Correct object_property_get_int() description

Cao jin (3):
      ES1370: QOMify
      Emulated CCID card: QOMify
      Passthru CCID card: QOMify

Christophe Fergeau (1):
      man: virtfs-proxy-helper: Rework awkward sentence

Daniel P. Berrange (1):
      char: fix parameter name / type in BSD codepath

Daniel Serpell (1):
      Adds keycode 86 to the hid_usage_keys translation table.

Michael Tokarev (2):
      remove libtool support
      s390x: remove s390-zipl.rom

Paolo Bonzini (3):
      cpu: cpu_save/cpu_load is no more
      qemu-sockets: simplify error handling
      w32: include winsock2.h before windows.h

Wei Yang (2):
      rdma: remove check on time_spent when calculating mbs
      qmp-spec: fix index in doc

 Makefile                       |   1 -
 configure                      |  86 +----------------------------------------
 docs/qmp-spec.txt              |   2 +-
 exec.c                         |   6 ---
 fsdev/virtfs-proxy-helper.texi |   4 +-
 hw/audio/es1370.c              |  10 +++--
 hw/input/hid.c                 |   2 +-
 hw/s390x/ipl.c                 |   2 +-
 hw/s390x/s390-virtio.c         |   1 -
 hw/usb/ccid-card-emulated.c    |  23 ++++++-----
 hw/usb/ccid-card-passthru.c    |  14 ++++---
 include/qemu-common.h          |   6 ---
 include/qom/object.h           |   2 +-
 include/sysemu/os-win32.h      |   2 +-
 migration/migration.c          |   4 +-
 pc-bios/README                 |   4 --
 pc-bios/s390-zipl.rom          | Bin 3304 -> 0 bytes
 qemu-char.c                    |   4 +-
 qemu-doc.texi                  |   1 -
 rules.mak                      |  18 ---------
 util/qemu-sockets.c            |   6 +--
 21 files changed, 44 insertions(+), 154 deletions(-)
 delete mode 100644 pc-bios/s390-zipl.rom

