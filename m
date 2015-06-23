Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7DP4-0001ZJ-Fo
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jun 2015 21:53:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7DP1-0001Z7-Uq
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:53:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Z7DOy-00030v-PA
	for qemu-trivial@nongnu.org; Mon, 22 Jun 2015 21:53:31 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:28751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Z7DOy-0002xN-2I; Mon, 22 Jun 2015 21:53:28 -0400
Received: from 172.24.2.119 (EHLO szxeml433-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CPV49876; Tue, 23 Jun 2015 09:53:19 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml433-hub.china.huawei.com
	(10.82.67.210) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 23 Jun 2015 09:53:08 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 23 Jun 2015 09:53:03 +0800
Message-ID: <1435024385-9084-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>, mst@redhat.com
Subject: [Qemu-trivial] [PATCH 0/2] fix two overflow problems
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
X-List-Received-Date: Tue, 23 Jun 2015 01:53:32 -0000

From: Gonglei <arei.gonglei@huawei.com>


Gonglei (2):
  virito-pci: fix OVERRUN problem
  qdev: fix OVERFLOW_BEFORE_WIDEN

 hw/core/qdev-properties.c | 2 +-
 hw/virtio/virtio-pci.c    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
1.7.12.4



