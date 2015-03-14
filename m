Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YWd1d-0003UD-C4
	for mharc-qemu-trivial@gnu.org; Fri, 13 Mar 2015 23:46:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWd1b-0003Oo-Bp
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 23:46:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1YWd1a-0000yv-CP
	for qemu-trivial@nongnu.org; Fri, 13 Mar 2015 23:46:07 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:47849)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1YWd1Q-0000xT-Fp; Fri, 13 Mar 2015 23:45:57 -0400
Received: from 172.24.2.119 (EHLO szxeml434-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CIL74458; Sat, 14 Mar 2015 11:42:35 +0800 (CST)
Received: from HGHY1Z002260041.china.huawei.com (10.177.16.142) by
	szxeml434-hub.china.huawei.com (10.82.67.225) with Microsoft SMTP
	Server id 14.3.158.1; Sat, 14 Mar 2015 11:42:27 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 14 Mar 2015 11:42:10 +0800
Message-ID: <1426304530-9600-1-git-send-email-zhaoshenglong@huawei.com>
X-Mailer: git-send-email 1.9.0.msysgit.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, hangaohuai@huawei.com, qemu-trivial@nongnu.org,
	mjt@tls.msk.ru, peter.huangpeng@huawei.com,
	shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH] hw/bt/sdp: Fix resource leak detect by
	coverity
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
X-List-Received-Date: Sat, 14 Mar 2015 03:46:08 -0000

Free data in function sdp_attr_write after use.

Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
---
 hw/bt/sdp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/bt/sdp.c b/hw/bt/sdp.c
index 218e075..8e6d5e3 100644
--- a/hw/bt/sdp.c
+++ b/hw/bt/sdp.c
@@ -735,6 +735,7 @@ static void sdp_service_record_build(struct sdp_service_record_s *record,
         record->attribute_list[record->attributes ++].len = len;
         data += len;
     }
+    g_free(data);
 
     /* Sort the attribute list by the AttributeID */
     qsort(record->attribute_list, record->attributes,
-- 
1.8.3.1



