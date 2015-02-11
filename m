Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YLOi0-0008NZ-04
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 23:15:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOha-0007kw-ES
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:15:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YLOhF-0004qp-2F
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 23:15:02 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:51644)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YLOhE-0004n8-Cf; Tue, 10 Feb 2015 23:14:40 -0500
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJJ50929; Wed, 11 Feb 2015 12:14:38 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml434-hub.china.huawei.com
	(10.82.67.225) with Microsoft SMTP Server id 14.3.158.1;
	Wed, 11 Feb 2015 12:12:30 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Wed, 11 Feb 2015 12:12:03 +0800
Message-ID: <1423627934-11676-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 00/11] trivial: Remove superfluous '\n'
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
X-List-Received-Date: Wed, 11 Feb 2015 04:15:26 -0000

From: Gonglei <arei.gonglei@huawei.com>

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



