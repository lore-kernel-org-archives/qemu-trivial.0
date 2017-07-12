Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHqV-0000CX-V2
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:38:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqP-0008WS-Mk
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHqO-0005P5-Mp
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:38:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34469)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHqJ-0005Jf-4A; Wed, 12 Jul 2017 09:38:15 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BC39440D64;
	Wed, 12 Jul 2017 16:38:12 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 8ED84AC8;
	Wed, 12 Jul 2017 16:38:12 +0300 (MSK)
Received: (nullmailer pid 29029 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Wed, 12 Jul 2017 16:37:56 +0300
Message-Id: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/13] Trivial patches for 2017-07-12
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
X-List-Received-Date: Wed, 12 Jul 2017 13:38:23 -0000

The following changes since commit 6b06e3e49eb8c91cc286c16d6bf3181ac296f3=
3d:

  Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2017-07-10-v2=
' into staging (2017-07-10 16:12:47 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to 10cb4ec41734243b2798bd1d53919827eaccd673:

  qobject: Update coccinelle script to catch Q{INC, DEC}REF (2017-07-12 1=
6:34:44 +0300)

----------------------------------------------------------------
trivial patches for 2017-07-12

----------------------------------------------------------------
Eric Blake (2):
      qobject: Catch another straggler for use of qdict_put_str()
      qobject: Update coccinelle script to catch Q{INC, DEC}REF

Li Ping (1):
      qga-win32: Fix memory leak of device information set

Mao Zhongyi (1):
      util/qemu-sockets: Drop unused helper socket_address_to_string()

Max Filippov (1):
      target/xtensa: gdbstub: drop dead return statement

Paolo Bonzini (1):
      hxtool: remove dead -q option

Peter Maydell (2):
      configure: Handle having no c++ compiler in FORTIFY_SOURCE check
      include/hw/ptimer.h: Add documentation comments

Philippe Mathieu-Daud=C3=A9 (4):
      hw/misc: add missing includes
      hw/pci: define msi_nonbroken in pci-stub
      elf-loader: warn about invalid endianness
      hw/core: fix missing return value in load_image_targphys_as()

Thomas Huth (1):
      configure: Fix build with pkg-config and --static --enable-sdl

 configure                        |   8 ++-
 hw/core/loader.c                 |   5 +-
 hw/pci/pci-stub.c                |   3 +
 include/hw/misc/unimp.h          |   2 +
 include/hw/ptimer.h              | 120 +++++++++++++++++++++++++++++++++=
++++++
 include/qemu/sockets.h           |  15 -----
 qemu-img.c                       |   2 +-
 qga/commands-win32.c             |   5 +-
 scripts/coccinelle/qobject.cocci |   6 ++
 scripts/hxtool                   |  46 +--------------
 target/xtensa/gdbstub.c          |   1 -
 util/qemu-sockets.c              |  34 -----------
 12 files changed, 147 insertions(+), 100 deletions(-)

