Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T9Fdv-0005dV-4I
	for mharc-qemu-trivial@gnu.org; Wed, 05 Sep 2012 09:27:43 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9Fdj-00052G-Ki
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 09:27:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1T9Fdc-0003IR-JL
	for qemu-trivial@nongnu.org; Wed, 05 Sep 2012 09:27:31 -0400
Received: from mail-pz0-f45.google.com ([209.85.210.45]:33938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1T9FdR-0003HI-19; Wed, 05 Sep 2012 09:27:13 -0400
Received: by dadn15 with SMTP id n15so379467dad.4
	for <multiple recipients>; Wed, 05 Sep 2012 06:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=hVPxSrmnSnvohyabkT7W+sLtRoyMGYzNR0Sg2qGwGz0=;
	b=ouq+Cn+uP+XXBXrxddbrpe/DzaX4CSFKIthqmUP4Bay4tCEXs/oTEbbaWEOMrz1Ogp
	bI6W3u9jCL/5iiv7YPMqLYP3gJQ+p0/vuSsTsNtWXTv8UKduX1R2DOYMMhzJrGXCopRq
	X1/9rc9F84TgXJOI0vr8Rt4ujjUn91s2AZfo3lydgIW4IfACC4iEQx3GaJygOlNAwrEV
	5I1a51Os/kSE2i+gy4qsGovRNtQ1ST06dsrsbmba38IbWGggQpzDUGSRleDAQ9jpJg5a
	a5vCXbtOC5kVrrLIT56RAjjVhkukOWWikfaWrphlmTBkh76DsayIE7Sf2dljH3oexe49
	0lWw==
Received: by 10.68.241.228 with SMTP id wl4mr54186162pbc.51.1346851632187;
	Wed, 05 Sep 2012 06:27:12 -0700 (PDT)
Received: from localhost.localdomain ([106.3.103.158])
	by mx.google.com with ESMTPS id gh7sm1437989pbc.29.2012.09.05.06.27.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 06:27:10 -0700 (PDT)
From: riegamaths@gmail.com
To: qemu-devel <qemu-devel@nongnu.org>
Date: Wed,  5 Sep 2012 21:26:22 +0800
Message-Id: <1346851582-9296-1-git-send-email-riegamaths@gmail.com>
X-Mailer: git-send-email 1.7.12
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Dunrong Huang <riegamaths@gmail.com>
Subject: [Qemu-trivial] =?utf-8?q?=5BPATCH=5D_block=3A_Don=27t_forget_to_d?=
	=?utf-8?q?elete_temporary_file?=
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
X-List-Received-Date: Wed, 05 Sep 2012 13:27:41 -0000

From: Dunrong Huang <riegamaths@gmail.com>

The caller would not delete temporary file after failed get_tmp_filename().

Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
---
 block.c | 6 +++++-
 1 个文件被修改，插入 5 行(+)，删除 1 行(-)

diff --git a/block.c b/block.c
index 074987e..2bc9f75 100644
--- a/block.c
+++ b/block.c
@@ -433,7 +433,11 @@ int get_tmp_filename(char *filename, int size)
         return -EOVERFLOW;
     }
     fd = mkstemp(filename);
-    if (fd < 0 || close(fd)) {
+    if (fd < 0) {
+        return -errno;
+    }
+    if (close(fd) != 0) {
+        unlink(filename);
         return -errno;
     }
     return 0;
-- 
1.7.12


