Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yn1Y2-0003Pq-Vx
	for mharc-qemu-trivial@gnu.org; Tue, 28 Apr 2015 05:11:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1Y0-0003MJ-RR
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:11:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Yn1Xx-0000Ep-D4
	for qemu-trivial@nongnu.org; Tue, 28 Apr 2015 05:11:20 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:37555)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Yn1Xw-0000BC-G0; Tue, 28 Apr 2015 05:11:17 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMW64235; Tue, 28 Apr 2015 17:11:11 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml432-hub.china.huawei.com
	(10.82.67.209) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 28 Apr 2015 17:11:01 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 28 Apr 2015 17:11:01 +0800
Message-ID: <1430212264-9672-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 0/3] trivial patches
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
X-List-Received-Date: Tue, 28 Apr 2015 09:11:21 -0000

From: Gonglei <arei.gonglei@huawei.com>

These trivial patches are collected by me
during qemu 2.3 hard-freeze time, which spoted by coverity.

Please ack or review if possible, thanks.

Gonglei (3):
  target-mips: fix memory leak
  xhci: remove unused code
  vhost-user: remove superfluous '\n' around error_report()

 hw/mips/mips_fulong2e.c |  1 +
 hw/mips/mips_malta.c    |  1 +
 hw/mips/mips_r4k.c      |  1 +
 hw/usb/hcd-xhci.c       |  1 -
 hw/virtio/vhost-user.c  | 22 +++++++++++-----------
 5 files changed, 14 insertions(+), 12 deletions(-)

-- 
1.7.12.4



