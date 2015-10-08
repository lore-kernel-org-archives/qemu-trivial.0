Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkH0j-00055d-IQ
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 15:37:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyL-0004ar-Hi
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZkGyK-0006EV-LP
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 15:35:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZkGyG-0006Cd-OW; Thu, 08 Oct 2015 15:35:20 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 7A116C0B83C0;
	Thu,  8 Oct 2015 19:35:20 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-90.ams2.redhat.com [10.36.6.90])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98JZH3H009701; Thu, 8 Oct 2015 15:35:18 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 21:35:11 +0200
Message-Id: <1444332916-16476-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/5] Small optimizations for code using
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
X-List-Received-Date: Thu, 08 Oct 2015 19:35:26 -0000

There are a couple of spots in the QEMU code which use g_malloc0,
directly followed by a memset or memcpy which fill the whole
allocated buffer. In this case it either does not make sense to
zero the buffer via g_malloc0 first (so g_malloc should be used
instead), or if the second command is a memset(..., 0, ...), then
the memset does not make much sense, of course, since the buffer
has already been zeroed by the g_malloc0.

Thomas Huth (5):
  hw/dma/pxa2xx: Remove superfluous memset
  hw/scsi/spapr_vscsi: Remove superfluous memset
  hw/input/tsc210x: Remove superfluous memset
  tests/i44fx-test: No need for zeroing memory before memset
  linux-user/syscall: Replace g_malloc0 + memcpy with g_memdup

 hw/dma/pxa2xx_dma.c   | 1 -
 hw/input/tsc210x.c    | 8 ++------
 hw/scsi/spapr_vscsi.c | 1 -
 linux-user/syscall.c  | 3 +--
 tests/i440fx-test.c   | 2 +-
 5 files changed, 4 insertions(+), 11 deletions(-)

-- 
1.8.3.1


