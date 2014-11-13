Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XotLW-0007RH-7I
	for mharc-qemu-trivial@gnu.org; Thu, 13 Nov 2014 07:17:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XotLP-0007Ex-EJ
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 07:17:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XotLK-0001v0-J5
	for qemu-trivial@nongnu.org; Thu, 13 Nov 2014 07:17:47 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:24250)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XotL9-0001qT-Pg; Thu, 13 Nov 2014 07:17:32 -0500
Received: from 172.24.2.119 (EHLO szxeml450-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEJ67664; Thu, 13 Nov 2014 20:17:20 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml450-hub.china.huawei.com
	(10.82.67.193) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 13 Nov 2014 20:17:11 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 13 Nov 2014 20:17:05 +0800
Message-ID: <1415881027-8112-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	aneesh.kumar@linux.vnet.ibm.com, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 0/2] virtfs-proxy-helper: Fix Coverity warning
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
X-List-Received-Date: Thu, 13 Nov 2014 12:17:52 -0000

From: Gonglei <arei.gonglei@huawei.com>

Gonglei (2):
  virtfs-proxy-helper: Fix possible socket leak.
  virtfs-proxy-helper: Fix handle leak to make Coverity happy

 fsdev/virtfs-proxy-helper.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

-- 
1.7.12.4



