Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XpaGZ-0006hn-R3
	for mharc-qemu-trivial@gnu.org; Sat, 15 Nov 2014 05:07:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGR-0006RG-UX
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XpaGN-0003vF-50
	for qemu-trivial@nongnu.org; Sat, 15 Nov 2014 05:07:31 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:2906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XpaG4-0003iE-0u; Sat, 15 Nov 2014 05:07:11 -0500
Received: from 172.24.2.119 (EHLO szxeml452-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CEL83188; Sat, 15 Nov 2014 18:07:00 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml452-hub.china.huawei.com
	(10.82.67.195) with Microsoft SMTP Server id 14.3.158.1;
	Sat, 15 Nov 2014 18:06:53 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 15 Nov 2014 18:06:41 +0800
Message-ID: <1416046008-7880-3-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
References: <1416046008-7880-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: weidong.huang@huawei.com, zhang.zhanghailiang@huawei.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 2/9] mips_mipssim: fix use-after-free for
	filename
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
X-List-Received-Date: Sat, 15 Nov 2014 10:07:36 -0000

From: Gonglei <arei.gonglei@huawei.com>

May pass freed pointer filename as an argument to error_report.

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
---
 hw/mips/mips_mipssim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index 7ea0b9a..5d44c3f 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -197,7 +197,7 @@ mips_mipssim_init(MachineState *machine)
         !kernel_filename && !qtest_enabled()) {
         /* Bail out if we have neither a kernel image nor boot vector code. */
         error_report("Could not load MIPS bios '%s', and no "
-                     "-kernel argument was specified", filename);
+                     "-kernel argument was specified", bios_name);
         exit(1);
     } else {
         /* We have a boot vector start address. */
-- 
1.7.12.4



