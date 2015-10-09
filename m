Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zkp1Y-0004vL-TJ
	for mharc-qemu-trivial@gnu.org; Sat, 10 Oct 2015 03:57:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2O-0006sZ-FV
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1Zka2J-0005O3-Rn
	for qemu-trivial@nongnu.org; Fri, 09 Oct 2015 11:56:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1Zka2D-0004yp-PT; Fri, 09 Oct 2015 11:56:41 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id CFAD58CF55;
	Fri,  9 Oct 2015 15:56:40 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-4-95.ams2.redhat.com [10.36.4.95])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t99Fud3J025235; Fri, 9 Oct 2015 11:56:39 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  9 Oct 2015 17:56:34 +0200
Message-Id: <1444406198-6521-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 0/4] Small optimizations for code using
	g_malloc0 + memset/memcpy
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
X-List-Received-Date: Fri, 09 Oct 2015 15:56:56 -0000

There are a couple of spots in the QEMU code which use g_malloc0,
directly followed by a memset or memcpy which fill the whole
allocated buffer. In this case it either does not make sense to
zero the buffer via g_malloc0 first (so g_malloc should be used
instead), or if the second command is a memset(..., 0, ...), then
the memset does not make much sense, of course, since the buffer
has already been zeroed by the g_malloc0.

v2:
- Switched some of the g_malloc0()s to g_new0()s where appropriate
- Added Reviewed-by-s
- The spapr_vscsi patch has been picked up by David already, so not
  sending it again

Thomas Huth (4):
  hw/dma/pxa2xx: Remove superfluous memset
  hw/input/tsc210x: Remove superfluous memset
  tests/i44fx-test: No need for zeroing memory before memset
  linux-user/syscall: Replace g_malloc0 + memcpy with g_memdup

 hw/dma/pxa2xx_dma.c  | 3 +--
 hw/input/tsc210x.c   | 8 ++------
 linux-user/syscall.c | 3 +--
 tests/i440fx-test.c  | 2 +-
 4 files changed, 5 insertions(+), 11 deletions(-)

-- 
1.8.3.1


