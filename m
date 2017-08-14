Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhDE3-0003kp-17
	for mharc-qemu-trivial@gnu.org; Mon, 14 Aug 2017 07:08:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDE1-0003j9-Bh
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:08:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dhDE0-0004lp-II
	for qemu-trivial@nongnu.org; Mon, 14 Aug 2017 07:08:01 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dhDDt-0004gu-TM; Mon, 14 Aug 2017 07:07:54 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 3CE3740D22;
	Mon, 14 Aug 2017 14:07:46 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id A87E5B75;
	Mon, 14 Aug 2017 14:07:43 +0300 (MSK)
Received: (nullmailer pid 31396 invoked by uid 1000);
	Mon, 14 Aug 2017 11:07:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Mon, 14 Aug 2017 14:07:37 +0300
Message-Id: <cover.1502708830.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 0/7] Trivial patches for 2017-08-14
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
X-List-Received-Date: Mon, 14 Aug 2017 11:08:02 -0000

There are just a few small thigs, I've omitted larger series for now.

The following changes since commit 9db6ffc76676731a25a5538ab71e8ca6ac234f80:

  Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2017-08-11 15:11:50 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to a808c0865b720e22ca2929ec3d362d4610fbad51:

  hw/misc/mmio_interface: Return after error_setg() to avoid crash (2017-08-14 13:06:54 +0300)

----------------------------------------------------------------
trivial patches for 2017-08-14

----------------------------------------------------------------
Cleber Rosa (3):
      qemu-iotests: get rid of _full_imgproto_details()
      qemu-iotests: remove commented out variables
      qemu-iotests: remove comment about root privileges requirement

Eduardo Otubo (1):
      unicore32: abort when entering "x 0" on the monitor

Eric Blake (1):
      libqtest: Fix typo in comments

Thomas Huth (2):
      qemu-doc: Fix "-net van" typo
      hw/misc/mmio_interface: Return after error_setg() to avoid crash

 hw/misc/mmio_interface.c     |  2 ++
 qemu-doc.texi                |  2 +-
 target/unicore32/softmmu.c   |  8 ++++----
 tests/libqtest.h             |  8 ++++----
 tests/qemu-iotests/check     | 13 +------------
 tests/qemu-iotests/common.rc |  5 -----
 6 files changed, 12 insertions(+), 26 deletions(-)

