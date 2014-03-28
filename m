Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTYgL-0001IR-9C
	for mharc-qemu-trivial@gnu.org; Fri, 28 Mar 2014 11:26:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60970)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WTYgI-0001DV-Tb
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 11:26:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WTYgI-0001Cu-5x
	for qemu-trivial@nongnu.org; Fri, 28 Mar 2014 11:26:54 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:47181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WTYgG-0001An-Bi; Fri, 28 Mar 2014 11:26:52 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WTYSn-0000Ww-RV; Fri, 28 Mar 2014 15:12:57 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri, 28 Mar 2014 15:12:54 +0000
Message-Id: <1396019577-2013-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 0/3] More fixes for undefined behaviour
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
X-List-Received-Date: Fri, 28 Mar 2014 15:26:55 -0000

These three patches provide more fixes for undefined behaviour
spotted by the clang sanitizer when doing "make check" runs.
I don't think these need to go into 2.0; I'm just sending them
out now so I don't forget about them...

Peter Maydell (3):
  hw/ide/ahci.c: Avoid shift left into sign bit
  int128.h: Avoid undefined behaviours involving signed arithmetic
  xbzrle.c: Avoid undefined behaviour with signed arithmetic

 hw/ide/ahci.c         | 4 ++--
 include/qemu/int128.h | 4 ++--
 xbzrle.c              | 8 +++++---
 3 files changed, 9 insertions(+), 7 deletions(-)

-- 
1.9.0


