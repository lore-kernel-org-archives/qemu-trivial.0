Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSQgA-00021Q-Nz
	for mharc-qemu-trivial@gnu.org; Sun, 28 Oct 2012 07:05:18 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQg8-0001uz-EO
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQg7-0007uK-Fb
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:16 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:63527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TSQg4-0007pH-G5; Sun, 28 Oct 2012 07:05:12 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2423304lbb.4
	for <multiple recipients>; Sun, 28 Oct 2012 04:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RnUvt9k3wT4f6l527fDNeCeXmcYxkzJT+v127Ict6iE=;
	b=sIKoJ87VVnneYmYr0JPxynzRyHuuBMEET7VWNTYE/ZqTpJcYgBay25uDDhA4RXbruc
	TP59JpVA7iLN4rx3Dlwuj6hwM/bKDi4eB0LDCOZhtBWDvjMegtLp5mNmjYtRJgArO1EV
	mqP0MOn2zGQhaFVWMOnOFIV11O71gX/qVxfD/VIyjPoHhBRHv1yZ+SFKexzNBP93HvXi
	6tAmnSOt8DYYeZIRQCp7coIfoceQqnSLuy99OnzWI6wCzN/F7RJFrqgKGMSjRK4NR2fu
	m1MOduDnaPjq8AFLe2hqwRf7cHyXfCWCO57hfS6959DbOeUHPPRofBWHhy5AuiwIs27L
	fOYA==
Received: by 10.152.146.67 with SMTP id ta3mr24371990lab.23.1351422311150;
	Sun, 28 Oct 2012 04:05:11 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id ft3sm2070067lbb.1.2012.10.28.04.05.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Oct 2012 04:05:10 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Oct 2012 11:04:45 +0000
Message-Id: <cover.1351422116.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
Subject: [Qemu-trivial] [PATCH v2 0/6] static patches
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
X-List-Received-Date: Sun, 28 Oct 2012 11:05:17 -0000

v2: extract function removal patches, skip ARM

Blue Swirl (6):
  target-sparc: make do_unaligned_access static
  vl.c: add missing static
  vnc: add missing static
  ppc: add missing static
  target-ppc: make some functions static
  exec: make some functions static

 console.h                  |    2 --
 cpu-common.h               |    5 -----
 exec-all.h                 |    2 --
 exec.c                     |   15 +++++++++------
 hw/adb.c                   |    8 ++++----
 hw/adb.h                   |    4 ----
 hw/nvram.h                 |   10 +---------
 hw/ppc.c                   |   16 ++++++++--------
 memory-internal.h          |    2 --
 sysemu.h                   |    5 -----
 target-ppc/cpu.h           |    7 -------
 target-ppc/mmu_helper.c    |   11 ++++++-----
 target-sparc/cpu.h         |    3 ---
 target-sparc/ldst_helper.c |    8 ++++++--
 ui/vnc-jobs.c              |   10 +++++-----
 ui/vnc-jobs.h              |    1 -
 ui/vnc.c                   |   14 +++++++-------
 ui/vnc.h                   |    5 -----
 vl.c                       |   21 ++++++++++++---------
 19 files changed, 58 insertions(+), 91 deletions(-)

-- 
1.7.2.5


