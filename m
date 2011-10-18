Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGDIM-0005Zx-5d
	for mharc-qemu-trivial@gnu.org; Tue, 18 Oct 2011 13:17:42 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDIG-0005F0-1E
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:17:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RGDIB-00079O-Vk
	for qemu-trivial@nongnu.org; Tue, 18 Oct 2011 13:17:35 -0400
Received: from mail-bw0-f45.google.com ([209.85.214.45]:61941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RGDI9-00078p-Ty; Tue, 18 Oct 2011 13:17:30 -0400
Received: by bkat2 with SMTP id t2so1174951bka.4
	for <multiple recipients>; Tue, 18 Oct 2011 10:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=WG7qAWH+QZEgFJmP1pWd1Ej9gD9aM0yyUTqqObLjusE=;
	b=Do5/jT8l5ggbDNg+myU+XO+iOdbnC+43dKbz8+W7HFnRCyUpY/l+6akTwHhlH3nV30
	gJALnO+faPDXo9k5/l7z/4/YWPee34diSv3YpnpO6dGLHN59DXI+mJk1lM43TannG6wl
	eAmzyiVczXtJ+hvrTchGye/zU/qsnPO7gI+C4=
Received: by 10.204.129.22 with SMTP id m22mr2538584bks.22.1318958248057;
	Tue, 18 Oct 2011 10:17:28 -0700 (PDT)
Received: from localhost.localdomain (ppp83-237-3-205.pppoe.mtu-net.ru.
	[83.237.3.205])
	by mx.google.com with ESMTPS id fb9sm2929083bkc.4.2011.10.18.10.17.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 10:17:26 -0700 (PDT)
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Oct 2011 21:16:48 +0400
Message-Id: <1318958208-13965-1-git-send-email-pavel.borzenkov@gmail.com>
X-Mailer: git-send-email 1.7.7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] fw_cfg: check return value of fread()
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
X-List-Received-Date: Tue, 18 Oct 2011 17:17:40 -0000

Spotted by Clang Analyzer

Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
---
 hw/fw_cfg.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/hw/fw_cfg.c b/hw/fw_cfg.c
index 8df265c..1125e7d 100644
--- a/hw/fw_cfg.c
+++ b/hw/fw_cfg.c
@@ -113,6 +113,13 @@ static FILE *probe_splashfile(char *filename, int *file_sizep, int *file_typep)
     if (file_type == BMP_FILE) {
         fseek(fp, 28, SEEK_SET);
         fop_ret = fread(buf, 1, 2, fp);
+        if (fop_ret != 2) {
+            error_report("Could not read bpp value from '%s': %s",
+                         filename, strerror(errno));
+            fclose(fp);
+            fp = NULL;
+            return fp;
+        }
         bmp_bpp = (buf[0] + (buf[1] << 8)) & 0xffff;
         if (bmp_bpp != 24) {
             error_report("only 24bpp bmp file is supported.");
-- 
1.7.7


