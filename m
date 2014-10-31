Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkDyV-0004i8-9z
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 11:18:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46199)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkDuj-0008Rk-8H
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 11:18:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xk5Qs-0005Cm-C0
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 02:11:39 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:5431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xk5Qm-0004xu-8C; Fri, 31 Oct 2014 02:11:29 -0400
Received: from 172.24.2.119 (EHLO szxeml416-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDS24286; Fri, 31 Oct 2014 14:11:21 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml416-hub.china.huawei.com
	(10.82.67.155) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 31 Oct 2014 14:11:13 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 31 Oct 2014 14:10:59 +0800
Message-ID: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
	peter.huangpeng@huawei.com, stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH 0/2] tap: add cleanup logic avoiding leaking
	fd
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
X-List-Received-Date: Fri, 31 Oct 2014 15:18:49 -0000

From: Gonglei <arei.gonglei@huawei.com>

Gonglei (2):
  tap: remove close(fd)
  tap: fix possible fd leak

 net/tap.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

-- 
1.7.12.4



