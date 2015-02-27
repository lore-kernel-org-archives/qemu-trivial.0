Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRFhM-0002bQ-8q
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 02:51:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFhH-0002Nh-1i
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YRFh8-0007VT-3f
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 02:50:55 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:59880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YRFh7-0007Ta-AP; Fri, 27 Feb 2015 02:50:46 -0500
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BCJ70333; Fri, 27 Feb 2015 15:50:35 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 27 Feb 2015 15:50:26 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 27 Feb 2015 15:50:10 +0800
Message-ID: <1425023419-12244-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54F021CB.0109, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 123be4ce10636f993b70e809d8c1ae88
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH 0/9] Coverity defects fixes
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
X-List-Received-Date: Fri, 27 Feb 2015 07:50:56 -0000

From: Gonglei <arei.gonglei@huawei.com>

All those defects are spotted by Coverity, which
classed in high impact outstanding defects.
Reports come from scan.coverity.com for Qemu.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: qemu-trivial@nongnu.org

Gonglei (9):
  nbd: fix resource leak
  arm: fix memory leak
  sparc/leon3.c: fix memory leak
  macio: fix possible memory leak
  e500: fix memory leak
  9pfs: fix memory leak
  milkymist.c: fix memory leak
  sysbus: fix memory leak
  microblaze: fix memory leak

 block/nbd.c               |  1 +
 hw/9pfs/virtio-9p-local.c | 10 ++--------
 hw/arm/digic_boards.c     |  1 +
 hw/arm/highbank.c         |  1 +
 hw/arm/vexpress.c         |  1 +
 hw/arm/virt.c             |  1 +
 hw/core/sysbus.c          |  2 ++
 hw/lm32/milkymist.c       |  1 +
 hw/microblaze/boot.c      |  4 +++-
 hw/misc/macio/macio.c     |  3 ++-
 hw/ppc/e500.c             |  1 +
 hw/sparc/leon3.c          |  1 +
 12 files changed, 17 insertions(+), 10 deletions(-)

-- 
1.7.12.4



