Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHuLz-0006eH-4p
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2016 10:51:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuLw-0006ak-R5
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bHuLu-0005de-Uu
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2016 10:51:03 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:58021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLr-0005b0-ND; Tue, 28 Jun 2016 10:50:59 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bHuLk-00064u-3J; Tue, 28 Jun 2016 15:50:52 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Tue, 28 Jun 2016 15:50:45 +0100
Message-Id: <1467125451-16700-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH 0/6] Drop cpu_to_*w, *_to_cpup,
 document cpu_to_*, *_to_cpu
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
X-List-Received-Date: Tue, 28 Jun 2016 14:51:06 -0000

This patchset removes the final uses of the deprecated
cpu_to_*w() and *_to_cpup() conversion functions, and
then removes their implementations. We can then document
the remaining cpu_to_*() and *_to_cpu() conversion functions.

The block/qcow2 patch is in the qcow2 queue but not in master yet;
the hw/bt patch was posted a while back but not yet reviewed;
I've put them in this series so it's self-contained.
The 9p patch I thought I'd posted but apparently not.

Patches 4..6 are definitely new.

This is all pretty safe to go into 2.7, but the only justification
for doing so really is that it gets a pending item off my list
of things-in-flight :-)

thanks
-- PMM


Peter Maydell (6):
  fsdev/9p-iov-marshal.c: Don't use cpu_to_*w() functions
  block/qcow2: Don't use cpu_to_*w()
  hw/bt: Don't use cpu_to_*w() and *_to_cpup()
  bswap.h: Remove unused cpu_to_*w() and *_to_cpup()
  bswap.h: Fix comment typo
  bswap.h: Document cpu_to_* and *_to_cpu conversion functions

 block/qcow2-cluster.c  |  2 +-
 block/qcow2-refcount.c | 11 ++++----
 block/qcow2.c          |  6 ++---
 fsdev/9p-iov-marshal.c | 18 +++++--------
 hw/bt/hci.c            | 10 +++-----
 hw/bt/l2cap.c          | 12 ++++-----
 include/qemu/bswap.h   | 70 ++++++++++++++++++++++++++++++++++++++++++--------
 7 files changed, 83 insertions(+), 46 deletions(-)

-- 
1.9.1


