Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YeIE4-000692-IG
	for mharc-qemu-trivial@gnu.org; Sat, 04 Apr 2015 03:10:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIE1-00066n-Fd
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:10:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YeIE0-0006Sp-4Z
	for qemu-trivial@nongnu.org; Sat, 04 Apr 2015 03:10:37 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YeIDu-0006Q5-Nd; Sat, 04 Apr 2015 03:10:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5C44E40575;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3E0AD722;
	Sat,  4 Apr 2015 10:10:28 +0300 (MSK)
Received: (nullmailer pid 20939 invoked by uid 1000);
	Sat, 04 Apr 2015 07:10:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat,  4 Apr 2015 10:10:21 +0300
Message-Id: <cover.1428131273.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 0/5 for-2.3] Trivial patches for 2015-04-04
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
X-List-Received-Date: Sat, 04 Apr 2015 07:10:38 -0000

Here's a very small trivial-patches pull request for the upcoming 2.3
release.  There's nothing urgent here, so things can wait past 2.3,
but these things are also safe.  Only one "questionable" code change
is the removal of TARGET_HAS_SMC macro, but it was applied long ago
(to -trivial) and it looks safe too.

Please consider pulling/applying.

Thanks,

/mjt

The following changes since commit f2155a089600e80cf7bcdc814520ef3304882cc4:

  Update version for v2.3.0-rc2 release (2015-04-02 18:02:02 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-04-04

for you to fetch changes up to 9be6e69f12bc65e9c43ee5b8eb026412f11b8b71:

  vhost: fix typo in vq_index description (2015-04-04 09:48:19 +0300)

----------------------------------------------------------------
trivial patches for 2015-04-04

----------------------------------------------------------------
Emilio G. Cota (1):
      target-i386: remove superfluous TARGET_HAS_SMC macro

Eric Blake (1):
      gitignore: Ignore more .pod files.

Greg Kurz (1):
      vhost: fix typo in vq_index description

Jan Kiszka (1):
      pcspk: Fix I/O port name

Stefan Weil (1):
      target-tricore: Fix check which was always false

 .gitignore                 | 10 ++--------
 hw/audio/pcspk.c           |  2 +-
 include/hw/virtio/vhost.h  |  2 +-
 target-i386/cpu.h          |  2 --
 target-tricore/op_helper.c |  2 +-
 translate-all.c            |  4 ----
 6 files changed, 5 insertions(+), 17 deletions(-)

