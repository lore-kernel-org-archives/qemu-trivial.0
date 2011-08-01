Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QnmLQ-0000pa-Tr
	for mharc-qemu-trivial@gnu.org; Mon, 01 Aug 2011 02:51:20 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QnmLO-0000du-4b
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 02:51:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1QnmLN-0000lC-AM
	for qemu-trivial@nongnu.org; Mon, 01 Aug 2011 02:51:18 -0400
Received: from ozlabs.org ([203.10.76.45]:48614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1QnmLH-0000k9-P7; Mon, 01 Aug 2011 02:51:12 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 8EF56B70BB; Mon,  1 Aug 2011 16:51:07 +1000 (EST)
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-devel@nongnu.org
Date: Mon,  1 Aug 2011 16:49:59 +1000
Message-Id: <1312181399-29841-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 1.7.5.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Check fread() results to avoid gcc 4.6
	warnings
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
X-List-Received-Date: Mon, 01 Aug 2011 06:51:19 -0000

When compiling with gcc 4.6, some code in fw_cfg.c complains that fop_ret
is assigned but not used (which is true).  However, it looks like the
meaningless assignments to fop_ret were done to suppress other gcc warnings
due to the fact that fread() is labelled as warn_unused_result in glibc.

This patch avoids both errors, by actually checking the fread() result code
and dropping out with an error message if it fails.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/fw_cfg.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/hw/fw_cfg.c b/hw/fw_cfg.c
index a29db90..e4847b7 100644
--- a/hw/fw_cfg.c
+++ b/hw/fw_cfg.c
@@ -87,6 +87,13 @@ static FILE *probe_splashfile(char *filename, int *file_sizep, int *file_typep)
     /* check magic ID */
     fseek(fp, 0L, SEEK_SET);
     fop_ret = fread(buf, 1, 2, fp);
+    if (fop_ret != 2) {
+        error_report("Could not read header from '%s': %s",
+                     filename, strerror(errno));
+        fclose(fp);
+        fp = NULL;
+        return fp;
+    }
     filehead_value = (buf[0] + (buf[1] << 8)) & 0xffff;
     if (filehead_value == 0xd8ff) {
         file_type = JPG_FILE;
@@ -181,6 +188,12 @@ static void fw_cfg_bootsplash(FWCfgState *s)
         boot_splash_filedata_size = file_size;
         fseek(fp, 0L, SEEK_SET);
         fop_ret = fread(boot_splash_filedata, 1, file_size, fp);
+        if (fop_ret != file_size) {
+            error_report("failed to read data from '%s'.",
+                         boot_splash_filename);
+            fclose(fp);
+            return;
+        }
         fclose(fp);
         /* insert data */
         if (file_type == JPG_FILE) {
-- 
1.7.5.4


