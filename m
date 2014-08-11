Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XGpEy-0003VP-Ny
	for mharc-qemu-trivial@gnu.org; Mon, 11 Aug 2014 09:02:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEr-0003HA-7B
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XGpEl-0003hV-BC
	for qemu-trivial@nongnu.org; Mon, 11 Aug 2014 09:02:13 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:25432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XGpEY-0003dG-Sy; Mon, 11 Aug 2014 09:01:55 -0400
Received: from 172.24.2.119 (EHLO szxeml407-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id BXZ04221; Mon, 11 Aug 2014 21:01:20 +0800 (CST)
Received: from localhost (10.177.19.102) by szxeml407-hub.china.huawei.com
	(10.82.67.94) with Microsoft SMTP Server id 14.3.158.1; Mon, 11 Aug 2014
	21:01:10 +0800
From: <arei.gonglei@huawei.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 11 Aug 2014 21:00:56 +0800
Message-ID: <1407762058-11512-7-git-send-email-arei.gonglei@huawei.com>
X-Mailer: git-send-email 1.7.3.1.msysgit.0
In-Reply-To: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
References: <1407762058-11512-1-git-send-email-arei.gonglei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: peter.maydell@linaro.org, peter.crosthwaite@xilinx.com,
	weidong.huang@huawei.com, mst@redhat.com,
	qemu-trivial@nongnu.org, mjt@tls.msk.ru, marcel.a@redhat.com,
	luonengjun@huawei.com, armbru@redhat.com, lcapitulino@redhat.com,
	Gonglei <arei.gonglei@huawei.com>, av1474@comtv.ru,
	kraxel@redhat.com, stefanha@redhat.com, imammedo@redhat.com,
	dmitry@daynix.com, pbonzini@redhat.com,
	peter.huangpeng@huawei.com, eblake@redhat.com, afaerber@suse.de,
	dgilbert@redhat.com
Subject: [Qemu-trivial] [PATCH v5 6/8] spice: don't use 'Yoda conditions'
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
X-List-Received-Date: Mon, 11 Aug 2014 13:02:19 -0000

From: Gonglei <arei.gonglei@huawei.com>

imitate nearby code about using '!value' or 'value == NULL'

Signed-off-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 ui/spice-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ui/spice-core.c b/ui/spice-core.c
index 7bb91e6..1a2fb4b 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -677,7 +677,7 @@ void qemu_spice_init(void)
 
     if (tls_port) {
         x509_dir = qemu_opt_get(opts, "x509-dir");
-        if (NULL == x509_dir) {
+        if (!x509_dir) {
             x509_dir = ".";
         }
 
@@ -803,7 +803,7 @@ void qemu_spice_init(void)
 
     seamless_migration = qemu_opt_get_bool(opts, "seamless-migration", 0);
     spice_server_set_seamless_migration(spice_server, seamless_migration);
-    if (0 != spice_server_init(spice_server, &core_interface)) {
+    if (spice_server_init(spice_server, &core_interface) != 0) {
         error_report("failed to initialize spice server");
         exit(1);
     };
-- 
1.7.12.4



