Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ywnvn-0002Ol-QK
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2015 04:40:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Ywnvh-0002HD-4v
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 04:40:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Ywnvc-0001C5-4f
	for qemu-trivial@nongnu.org; Mon, 25 May 2015 04:40:13 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:22068)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Ywnvb-0000u7-JM; Mon, 25 May 2015 04:40:08 -0400
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CLV99025; Mon, 25 May 2015 16:39:57 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.158.1; Mon, 25 May 2015 16:38:06 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 25 May 2015 16:37:54 +0800
Message-ID: <1432543077-12656-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 0/3] Fix memory leak spotted by valgrind
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
X-List-Received-Date: Mon, 25 May 2015 08:40:17 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

These patches fix memmory leak spotted by valgrind.

Shannon Zhao (3):
  hw/i386/pc_piix: Fix memory leak
  hw/ide/pci: Fix memory leak
  hw/i386/acpi-build: decref after use

 hw/i386/acpi-build.c | 1 +
 hw/i386/pc_piix.c    | 2 ++
 hw/ide/pci.c         | 1 +
 3 files changed, 4 insertions(+)

-- 
2.0.4



