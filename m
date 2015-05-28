Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yxvn6-000665-Vw
	for mharc-qemu-trivial@gnu.org; Thu, 28 May 2015 07:16:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxvn3-000627-HG
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:15:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1Yxvmz-0002xA-1G
	for qemu-trivial@nongnu.org; Thu, 28 May 2015 07:15:57 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:19707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1Yxvmy-0002tj-G6; Thu, 28 May 2015 07:15:52 -0400
Received: from 172.24.2.119 (EHLO szxeml432-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMA87066; Thu, 28 May 2015 19:14:30 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml432-hub.china.huawei.com (10.82.67.209) with Microsoft SMTP
	Server id 14.3.158.1; Thu, 28 May 2015 19:14:21 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Thu, 28 May 2015 19:13:45 +0800
Message-ID: <1432811625-13392-5-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
In-Reply-To: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
References: <1432811625-13392-1-git-send-email-zhaoshenglong@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, mjt@tls.msk.ru,
	shannon.zhao@linaro.org
Subject: [Qemu-trivial] [PATCH 4/4] hw/display/tcx.c: Fix memory leak
	spotted by valgrind
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
X-List-Received-Date: Thu, 28 May 2015 11:15:58 -0000

From: Shannon Zhao <shannon.zhao@linaro.org>

valgrind complains about:
==23693== 55 bytes in 1 blocks are definitely lost in loss record 1,277 of 2,014
==23693==    at 0x4C2845D: malloc (in /usr/lib64/valgrind/vgpreload_memcheck-amd64-linux.so)
==23693==    by 0x21B93F: malloc_and_trace (vl.c:2556)
==23693==    by 0x64C770E: g_malloc (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23693==    by 0x64DEFD7: g_strndup (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23693==    by 0x650181A: g_vasprintf (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23693==    by 0x64DF0CC: g_strdup_vprintf (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23693==    by 0x64DF188: g_strdup_printf (in /usr/lib64/libglib-2.0.so.0.3600.3)
==23693==    by 0x21A7B1: qemu_find_file (vl.c:2121)
==23693==    by 0x1E4F6E: tcx_realizefn (tcx.c:1013)
==23693==    by 0x26CC20: device_set_realized (qdev.c:1058)
==23693==    by 0x2B6766: property_set_bool (object.c:1514)
==23693==    by 0x2B5060: object_property_set (object.c:837)

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/display/tcx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/display/tcx.c b/hw/display/tcx.c
index a9f9f66..6c5e584 100644
--- a/hw/display/tcx.c
+++ b/hw/display/tcx.c
@@ -1014,6 +1014,7 @@ static void tcx_realizefn(DeviceState *dev, Error **errp)
     if (fcode_filename) {
         ret = load_image_targphys(fcode_filename, s->prom_addr,
                                   FCODE_MAX_ROM_SIZE);
+        g_free(fcode_filename);
         if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
             error_report("tcx: could not load prom '%s'", TCX_ROM_FILE);
         }
-- 
2.0.4



