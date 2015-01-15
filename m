Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YBfpf-0002BE-0S
	for mharc-qemu-trivial@gnu.org; Thu, 15 Jan 2015 03:31:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfpc-00027K-8p
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:31:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YBfpb-0008Ko-4G
	for qemu-trivial@nongnu.org; Thu, 15 Jan 2015 03:31:08 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:42913)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YBfpW-0008IG-Ej; Thu, 15 Jan 2015 03:31:02 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 00F4E40D9C;
	Thu, 15 Jan 2015 11:30:51 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id C9DD48C4;
	Thu, 15 Jan 2015 11:30:51 +0300 (MSK)
Received: (nullmailer pid 31338 invoked by uid 1000);
	Thu, 15 Jan 2015 08:30:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 15 Jan 2015 11:30:38 +0300
Message-Id: <cover.1421310394.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/12] Trivial patches for 2015-01-15
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
X-List-Received-Date: Thu, 15 Jan 2015 08:31:09 -0000

This is a next trivial-patches pull request, since the previous one
which was at 2014-12-11 - 4 weeks ago.  Only 12 patches in 4 weeks.
There's nothing exciting in there, but there are several (small)
bugfixes.

Please consider applying/pulling.

With the introduction of pbonzini's "misc" patches tree I'm not
sure current trivial-patches is worth to keep.  Paolo does much
better job in this area than me.

Thanks,

/mjt

The following changes since commit b629a38a13745d62d44de8ebb00f4e38ec6d8f7e:

  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into staging (2015-01-14 18:02:47 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-01-15

for you to fetch changes up to 99efa84d5c02e33bcca7be83dd7cabc4b0f22f14:

  vl.c: fix some alignment issues (2015-01-15 10:44:13 +0300)

----------------------------------------------------------------
trivial patches for 2015-01-15

----------------------------------------------------------------
David Morrison (1):
      target-openrisc: bugfix for dec_sys to decode instructions correctly

Don Slutz (1):
      Do not hang on full PTY

Marcel Apfelbaum (1):
      vl.c: fix some alignment issues

Paolo Bonzini (2):
      vt82c686: avoid out-of-bounds read
      blizzard: do not depend on VGA internals

Peter Maydell (2):
      tests/hd-geo-test.c: Remove unused test_image variable
      migration/qemu-file.c: Don't shift left into sign bit

SeokYeon Hwang (1):
      translate-all: Mark map_exec() with the 'unused' attribute

Stefan Weil (3):
      target-tricore: Fix new typos
      target-arm: Fix typo in comment (seperately -> separately)
      misc: Fix new typos in comments

Thomas Huth (1):
      Makefile: Remove config.status and common.env during 'make distclean'

 Makefile                         |  4 ++--
 hw/display/blizzard.c            |  1 -
 hw/isa/vt82c686.c                |  2 +-
 include/hw/hotplug.h             |  2 +-
 migration/qemu-file.c            |  2 +-
 qemu-char.c                      |  1 +
 target-arm/helper.c              |  2 +-
 target-openrisc/translate.c      |  2 +-
 target-tricore/csfr.def          |  2 +-
 target-tricore/translate.c       |  2 +-
 target-tricore/tricore-opcodes.h |  4 ++--
 tests/ahci-test.c                |  2 +-
 tests/hd-geo-test.c              |  2 --
 translate-all.c                  |  4 ++--
 vl.c                             | 38 +++++++++++++++++++-------------------
 15 files changed, 34 insertions(+), 36 deletions(-)

