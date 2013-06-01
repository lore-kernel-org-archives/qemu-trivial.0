Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uij3t-0002cW-UH
	for mharc-qemu-trivial@gnu.org; Sat, 01 Jun 2013 06:29:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uij3r-0002WU-Ml
	for qemu-trivial@nongnu.org; Sat, 01 Jun 2013 06:29:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uij3q-00017T-GN
	for qemu-trivial@nongnu.org; Sat, 01 Jun 2013 06:29:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55114)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uij3m-00016e-Tu; Sat, 01 Jun 2013 06:29:19 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 41D644019C;
	Sat,  1 Jun 2013 14:29:16 +0400 (MSK)
Message-ID: <51A9CCFB.1000109@msgid.tls.msk.ru>
Date: Sat, 01 Jun 2013 14:29:15 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org
X-Enigmail-Version: 1.6a1pre
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [GIT PULL] Trivial patches for 2013-06-01
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
X-List-Received-Date: Sat, 01 Jun 2013 10:29:24 -0000

Hello.

After a bit more than 2 weeks of silence, I'm asking for a pull from
the trivial-patches queue. I didn't ask for the pull request last
week because there basically was nothing to pull, but now we have
something finally ;)

Please pull.

Thanks,

/mjt

The following changes since commit dec3fc9657e0682637de4d5a29d947284d01985c:

  target-i386: Fix aflag logic for CODE64 and the 0x67 prefix (2013-05-31 12:51:07 -0500)

are available in the git repository at:

  git://git.corpit.ru/qemu.git trivial-patches

for you to fetch changes up to a4cc73d629d43c8a4d171d043ff229a959df3ca6:

  do not check pointers after dereferencing them (2013-06-01 14:25:39 +0400)

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      qemu: fix out of tree cross compile

Ed Maste (3):
      configure: remove confusing file manipulation
      configure: try pkg-config ncurses first
      m25p80: Add Micron n25q032a

Hu Tao (1):
      rtc: remove rtc_set_date

Lei Li (3):
      linux-user: Fix typo in comment
      docs: Fix typo and update file in migration
      migration: Remove duplicate bandwidth_limit set

Michael Tokarev (2):
      don't run pkg-config for features explicitly disabled
      slirp: cleanup leftovers from misc.h

Paolo Bonzini (1):
      do not check pointers after dereferencing them

Stefan Weil (1):
      Remove unnecessary break statements

liguang (3):
      debugcon: fix always print "addr=0x0, val=0x0" bug when use DEBUG_DEBUGCON
      debugcon: make debug message more readable
      debugcon: fix compiler warning when open DEBUG_DEBUGCON

 configure                      |   34 +++++++++++-----------------------
 docs/migration.txt             |   17 +++++++++--------
 hw/block/m25p80.c              |    1 +
 hw/char/debugcon.c             |    4 ++--
 hw/display/cirrus_vga.c        |    1 -
 hw/timer/exynos4210_mct.c      |    1 -
 include/hw/timer/mc146818rtc.h |    1 -
 linux-user/syscall.c           |    2 +-
 migration.c                    |    1 -
 monitor.c                      |    2 +-
 savevm.c                       |    8 ++++----
 slirp/misc.h                   |   14 --------------
 target-arm/translate.c         |    1 -
 target-s390x/mem_helper.c      |    1 -
 target-unicore32/translate.c   |    1 -
 15 files changed, 29 insertions(+), 60 deletions(-)

