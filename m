Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YQTVe-0005wt-71
	for mharc-qemu-trivial@gnu.org; Tue, 24 Feb 2015 23:23:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58600)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVQ-0005K7-7t
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YQTVL-0006Ru-Ba
	for qemu-trivial@nongnu.org; Tue, 24 Feb 2015 23:23:27 -0500
Received: from szxga02-in.huawei.com ([119.145.14.65]:40062)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YQTVG-0006PM-Fc; Tue, 24 Feb 2015 23:23:19 -0500
Received: from 172.24.2.119 (EHLO szxeml431-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CHQ41234; Wed, 25 Feb 2015 12:23:15 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml431-hub.china.huawei.com
	(10.82.67.208) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 25 Feb 2015 12:23:06 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 25 Feb 2015 12:22:26 +0800
Message-ID: <1424838157-5524-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH v2 00/11] trivial: Remove superfluous '\n'
	around error_report/error_setg
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
X-List-Received-Date: Wed, 25 Feb 2015 04:23:33 -0000

From: Gonglei <arei.gonglei@huawei.com>

v2 -> v1:
 - remove superfluous "" in patch 3. (Michael Tokarev)
 - move qemu-img.c hunk from patch 5 to patch 1. (Markus)
 - add 'R-by' tag for this patch series.

Yestoday, I found that some files have superflous '\n' charactor
around error_report/error_setg when reviewed patches.

By a simply script, the below files were listed. Classify and fix
them. It's suitable for appling via qemu-trivial IMHO.


Gonglei (11):
  block: remove superfluous '\n' around error_report/error_setg
  a9gtimer: remove superfluous '\n' around error_setg
  pl330.c: remove superfluous '\n' around error_setg
  numa: remove superfluous '\n' around error_setg
  Remove superfluous '\n' around error_report()
  vhost-scsi: Remove superfluous '\n' around error_report()
  vfio: Remove superfluous '\n' around error_report()
  xtensa: Remove superfluous '\n' around error_report()
  tpm: Remove superfluous '\n' around error_report()
  arm/digic_boards: Remove superfluous '\n' around error_report()
  vhost: Remove superfluous '\n' around error_report()

 block/archipelago.c       |  6 +++---
 exec.c                    |  2 +-
 hw/arm/digic_boards.c     |  6 +++---
 hw/block/nand.c           |  2 +-
 hw/dma/pl330.c            |  4 ++--
 hw/ide/pci.c              |  2 +-
 hw/microblaze/boot.c      |  2 +-
 hw/scsi/vhost-scsi.c      |  6 +++---
 hw/timer/a9gtimer.c       |  2 +-
 hw/tpm/tpm_passthrough.c  | 12 ++++++------
 hw/vfio/common.c          | 10 +++++-----
 hw/virtio/vhost-backend.c |  2 +-
 hw/xtensa/sim.c           |  2 +-
 hw/xtensa/xtfpga.c        | 10 +++++-----
 migration/rdma.c          |  2 +-
 net/vhost-user.c          |  4 ++--
 numa.c                    |  6 +++---
 qemu-img.c                |  2 +-
 target-s390x/kvm.c        |  2 +-
 tpm.c                     |  2 +-
 trace/control.c           |  2 +-
 21 files changed, 44 insertions(+), 44 deletions(-)

-- 
1.7.12.4



