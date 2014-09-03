Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XP4Am-0001x0-Rm
	for mharc-qemu-trivial@gnu.org; Wed, 03 Sep 2014 02:36:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Af-0001hS-I4
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:36:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XP4Aa-0005ff-KP
	for qemu-trivial@nongnu.org; Wed, 03 Sep 2014 02:35:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XP4AL-0005b6-EW; Wed, 03 Sep 2014 02:35:37 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 13FC140748;
	Wed,  3 Sep 2014 10:35:36 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id F23BC6DF;
	Wed,  3 Sep 2014 10:35:35 +0400 (MSK)
Received: (nullmailer pid 1601 invoked by uid 1000);
	Wed, 03 Sep 2014 06:35:35 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  3 Sep 2014 10:35:25 +0400
Message-Id: <1409726135-1547-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/10] Trivial patches for 2014-09-03
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
X-List-Received-Date: Wed, 03 Sep 2014 06:36:03 -0000

Here's a next trivial-patches batch.  A few little things here and there.
Please consider applying.

Thanks,

/mjt

The following changes since commit 30eaca3acdf17d7bcbd1213eb149c02037edfb0b:

  Merge remote-tracking branch 'remotes/spice/tags/pull-spice-20140902-1' into staging (2014-09-02 10:26:10 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-09-03

for you to fetch changes up to 70381662aa97b294f3c81a085ed143f37f0ab0cb:

  slirp: Honour vlan/stack in hostfwd_remove commands (2014-09-02 22:38:16 +0400)

----------------------------------------------------------------
trivial patches for 2014-09-03

----------------------------------------------------------------
Chen Fan (3):
      query-memdev: fix potential memory leaks
      qom/object.c, hmp.c: fix string_output_get_string() memory leak
      hmp: fix MemdevList memory leak

Dmitry Fleytman (1):
      MAINTAINERS: Add VMWare devices maintainer

Fam Zheng (1):
      scripts: Remove scripts/qtest

Gonglei (1):
      Fix debug print warning

Li Liu (2):
      device_tree.c: redirect load_device_tree err message to stderr
      device_tree.c: dump all err mesages with error_report

Peter Maydell (1):
      slirp: Honour vlan/stack in hostfwd_remove commands

Richard W.M. Jones (1):
      curl: The macro that you have to uncomment to get debugging is DEBUG_CURL.

 MAINTAINERS            |    6 ++++++
 block/curl.c           |    2 +-
 device_tree.c          |   55 ++++++++++++++++++++++++------------------------
 hmp.c                  |    8 +++++--
 hw/i2c/pm_smbus.c      |    5 +++--
 hw/i386/pc.c           |    2 +-
 hw/input/pckbd.c       |    4 ++--
 hw/intc/i8259.c        |    2 +-
 hw/isa/apm.c           |    5 +++--
 hw/timer/mc146818rtc.c |    2 +-
 net/slirp.c            |    3 +--
 numa.c                 |   15 ++++++-------
 qom/object.c           |   12 +++++++++--
 scripts/qtest          |    5 -----
 14 files changed, 70 insertions(+), 56 deletions(-)
 delete mode 100755 scripts/qtest

