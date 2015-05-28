Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxx6z-0007tX-8i
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 08:40:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxx6u-0007lT-Ub
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:40:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxx6t-00083G-TU
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 08:40:32 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:49445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxx6o-0007vz-HV; Thu, 28 May 2015 08:40:27 -0400
Received: from 172.24.2.119 (EHLO szxeml426-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id BGR96152; Thu, 28 May 2015 20:40:04 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml426-hub.china.huawei.com (10.82.67.181) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 20:39:55 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 20:39:40 +0800
Message-ID: <1432816784-12436-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.55670CA4.02BC, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 082e4fa7b007f1a95dcaf5b94ffb9efd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH v2 0/4] Fix memory leak due to calling
	qemu_find_file and not freeing return buf
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
X-List-Received-Date: Thu, 28 May 2015 12:40:34 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

Before I sent some patches to fix memory leak spotted by valgrind. Then
I'd like to dig deeper and find that two places have memory leak due to
calling qemu_find_file and not freeing return buf. Then through code
searching another two places are found. So this patchset is to fix them.

changes since v1:
   address Michael Tokarev's comments
  * remove unnecessary free before exit()
  * fix error message

Shannon Zhao (4):
  hw/display/cg3.c: Fix memory leak
  hw/alpha/dp264.c: Fix memory leak spotted by valgrind
  hw/ppc/e500.c: Fix memory leak
  hw/display/tcx.c: Fix memory leak spotted by valgrind

 hw/alpha/dp264.c | 7 ++++---
 hw/display/cg3.c | 3 ++-
 hw/display/tcx.c | 3 ++-
 hw/ppc/e500.c    | 1 +
 4 files changed, 9 insertions(+), 5 deletions(-)

-- 
2.0.4



