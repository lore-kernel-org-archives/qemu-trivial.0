Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZDMYA-0003OK-QB
	for mharc-qemu-trivial@gnu.org; Thu, 09 Jul 2015 20:52:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDMY8-0003Ks-Dv
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 20:52:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1ZDMY5-00052w-8Q
	for qemu-trivial@nongnu.org; Thu, 09 Jul 2015 20:52:20 -0400
Received: from szxga01-in.huawei.com ([58.251.152.64]:51019)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1ZDMY4-00051K-MA; Thu, 09 Jul 2015 20:52:17 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CQZ76961; Fri, 10 Jul 2015 08:51:59 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml427-hub.china.huawei.com
	(10.82.67.182) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 10 Jul 2015 08:51:43 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 10 Jul 2015 08:51:26 +0800
Message-ID: <1436489490-236-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 58.251.152.64
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>
Subject: [Qemu-trivial] [PATCH 0/4] fix memory leak
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
X-List-Received-Date: Fri, 10 Jul 2015 00:52:21 -0000

From: Gonglei <arei.gonglei@huawei.com>

Spotted by Coverity.

Gonglei (4):
  cpu: fix memory leak
  ppc/spapr_drc: fix memory leak
  arm/xlnx-zynqmp: fix memory leak
  vl.c: fix memory leak

 hw/arm/xlnx-zynqmp.c | 4 ++--
 hw/ppc/spapr_drc.c   | 1 +
 target-i386/cpu.c    | 2 +-
 vl.c                 | 5 ++++-
 4 files changed, 8 insertions(+), 4 deletions(-)

-- 
1.7.12.4



