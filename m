Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xoke0-00009B-LC
	for mharc-qemu-trivial@gnu.org; Wed, 12 Nov 2014 22:00:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xokdv-0008Pm-6U
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 22:00:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xokdo-0002d7-PQ
	for qemu-trivial@nongnu.org; Wed, 12 Nov 2014 22:00:17 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:8104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XokdZ-0002HN-F4; Wed, 12 Nov 2014 21:59:58 -0500
Received: from 172.24.2.119 (EHLO szxeml404-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AXA65419; Thu, 13 Nov 2014 10:59:50 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml404-hub.china.huawei.com
	(10.82.67.59) with Microsoft SMTP Server id 14.3.158.1; Thu, 13 Nov 2014
	10:59:40 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 13 Nov 2014 10:59:35 +0800
Message-ID: <1415847577-5820-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020202.54641EA7.0017, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: ad3918326460d0fc7d95d20791f42c29
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, peter.huangpeng@huawei.com,
	mst@redhat.com
Subject: [Qemu-trivial] [PATCH 0/2] acpi-build: trivial fixes
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
X-List-Received-Date: Thu, 13 Nov 2014 03:00:24 -0000

From: Gonglei <arei.gonglei@huawei.com>

Those two fixes make sence and have no risk for
being applied in qemu-2.2 release version.

Thanks,

Gonglei (2):
  acpi-build: adjust indention 8 -> 4 spaces
  acpi-build: Make DPRINTF working for acpi-build

 hw/i386/acpi-build.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

-- 
1.7.12.4



