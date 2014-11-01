Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkNq7-0006yA-Ay
	for mharc-qemu-trivial@gnu.org; Fri, 31 Oct 2014 21:50:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNpz-0006rl-0m
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XkNps-00023s-I3
	for qemu-trivial@nongnu.org; Fri, 31 Oct 2014 21:50:42 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:37007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XkNpr-00020A-EY; Fri, 31 Oct 2014 21:50:36 -0400
Received: from 172.24.2.119 (EHLO szxeml418-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBR29900; Sat, 01 Nov 2014 09:50:30 +0800 (CST)
Received: from localhost (10.177.22.69) by szxeml418-hub.china.huawei.com
	(10.82.67.157) with Microsoft SMTP Server id 14.3.158.1; Sat, 1 Nov 2014
	09:50:23 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
To: <qemu-trivial@nongnu.org>
Date: Sat, 1 Nov 2014 09:49:59 +0800
Message-ID: <1414806603-22556-1-git-send-email-zhang.zhanghailiang@huawei.com>
X-Mailer: git-send-email 1.9.2.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: pbonzini@redhat.com, zhanghailiang <zhang.zhanghailiang@huawei.com>,
	qemu-devel@nongnu.org, peter.huangpeng@huawei.com
Subject: [Qemu-trivial] [PATCH 0/4] Trivial patches about qemu-char
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
X-List-Received-Date: Sat, 01 Nov 2014 01:50:49 -0000

Patch 1 and 2 fix wrong check about in-parameter.
The last two patches convert some open functions to use Error API.

zhanghailiang (4):
  qemu-char: fix parameter check for qemu_chr_open_pipe
  spice-qemu-char: fix check for in-parameter
  qemu-char: convert some open functions to use Error API
  spice-qemu-char: convert open functions to use Error API

 include/ui/qemu-spice.h     |  9 +++----
 qemu-char.c                 | 58 +++++++++++++++++++++++----------------------
 spice-qemu-char.c           | 14 +++++------
 stubs/qemu-chr-open-spice.c |  4 ++--
 4 files changed, 44 insertions(+), 41 deletions(-)

-- 
1.7.12.4


