Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL5cQ-0007l8-0c
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 02:52:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL5cN-0007g4-RL
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:52:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1YL5cN-0004eq-4M
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 02:52:23 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:54575)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1YL5cG-0004cu-5m; Tue, 10 Feb 2015 02:52:16 -0500
Received: from 172.24.2.119 (EHLO szxeml425-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CJI54352; Tue, 10 Feb 2015 15:52:03 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml425-hub.china.huawei.com
	(10.82.67.180) with Microsoft SMTP Server id 14.3.158.1;
	Tue, 10 Feb 2015 15:51:27 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Tue, 10 Feb 2015 15:51:21 +0800
Message-ID: <1423554683-2968-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, stefano.stabellini@eu.citrix.com
Subject: [Qemu-trivial] [PATCH v2 0/2] xen_pt: fix two Coverity defects
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
X-List-Received-Date: Tue, 10 Feb 2015 07:52:24 -0000

From: Gonglei <arei.gonglei@huawei.com>

v2 -> v1:
 - change the method of check in patch 2.(Stefano)
 - add ACK of Stefano in patch 1.

Gonglei (2):
  xen-pt: fix Negative array index read
  xen-pt: fix Out-of-bounds read

 hw/xen/xen_pt_config_init.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
1.7.12.4



