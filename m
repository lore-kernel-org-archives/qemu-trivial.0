Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xgw4Z-0002HF-HW
	for mharc-qemu-trivial@gnu.org; Wed, 22 Oct 2014 09:35:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35536)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baloo@gandi.net>) id 1XgvvI-0007f0-D7
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 09:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <baloo@gandi.net>) id 1XgvvB-000807-Le
	for qemu-trivial@nongnu.org; Wed, 22 Oct 2014 09:25:55 -0400
Received: from mail4.gandi.net ([217.70.183.210]:37962)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <baloo@gandi.net>)
	id 1Xgvuz-0007yL-HM; Wed, 22 Oct 2014 09:25:37 -0400
Received: from localhost (mfiltercorp1-d.gandi.net [217.70.183.155])
	by mail4.gandi.net (Postfix) with ESMTP id 6C776120AAA;
	Wed, 22 Oct 2014 15:25:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mfiltercorp1-d.gandi.net
Received: from mail4.gandi.net ([217.70.183.210])
	by localhost (mfiltercorp1-d.gandi.net [217.70.183.155]) (amavisd-new,
	port 10024)
	with ESMTP id SDMIpgfahuNb; Wed, 22 Oct 2014 15:25:35 +0200 (CEST)
Received: from khany.gandi.net (baloo.gandi.net [217.70.181.57])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail4.gandi.net (Postfix) with ESMTPSA id 5A35C120A80;
	Wed, 22 Oct 2014 15:25:35 +0200 (CEST)
From: Arthur Gautier <baloo@gandi.net>
To: qemu-devel@nongnu.org
Date: Wed, 22 Oct 2014 15:25:20 +0200
Message-Id: <1413984320-28585-1-git-send-email-baloo@gandi.net>
X-Mailer: git-send-email 2.1.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 217.70.183.210
X-Mailman-Approved-At: Wed, 22 Oct 2014 09:35:29 -0400
Cc: qemu-trivial@nongnu.org, Arthur Gautier <baloo@gandi.net>
Subject: [Qemu-trivial] [PATCH] vmdk: Fix cylinders number during convert
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
X-List-Received-Date: Wed, 22 Oct 2014 13:26:02 -0000

We can not rely on int cast to get a correct number of cylinders. The
cylinders information was wrong in 49.9999% of cases.

This ensures the cylinders always gets the ceiling value.

Reviewed-by: William Dauchy <william@gandi.net>
Signed-off-by: Arthur Gautier <baloo@gandi.net>
---
 block/vmdk.c               |  4 +--
 tests/qemu-iotests/106     | 67 ++++++++++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/106.out |  5 ++++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100755 tests/qemu-iotests/106
 create mode 100644 tests/qemu-iotests/106.out

diff --git a/block/vmdk.c b/block/vmdk.c
index 4ae6c75..c22a6c6 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -1928,8 +1928,8 @@ static int vmdk_create(const char *filename, QemuOpts *opts, Error **errp)
                            parent_desc_line,
                            ext_desc_lines->str,
                            (flags & BLOCK_FLAG_COMPAT6 ? 6 : 4),
-                           total_size /
-                               (int64_t)(63 * number_heads * BDRV_SECTOR_SIZE),
+                           DIV_ROUND_UP(total_size,
+                               (int64_t)(63 * number_heads * BDRV_SECTOR_SIZE)),
                            number_heads,
                            adapter_type);
     desc_len = strlen(desc);
diff --git a/tests/qemu-iotests/106 b/tests/qemu-iotests/106
new file mode 100755
index 0000000..d17c588
--- /dev/null
+++ b/tests/qemu-iotests/106
@@ -0,0 +1,67 @@
+#!/bin/bash
+#
+# Create then convert raw to vmdk with a little image
+#
+# Copyright (C) 2014 Red Hat, Inc.
+#               2014 Gandi SAS
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+# creator
+owner=baloo@gandi.net
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+here=`pwd`
+tmp=/tmp/$$
+status=1	# failure is the default!
+
+_cleanup()
+{
+	_cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+
+_supported_fmt vmdk
+_supported_proto generic
+_supported_os Linux
+
+IMG_SIZE=1K
+
+TEST_IMG="$TEST_IMG.base" _make_test_img $IMG_SIZE | _filter_img_create
+
+#echo "=== Convert image to vmdk ==="
+#echo
+$QEMU_IMG convert -f raw -O vmdk "$TEST_IMG.base" "$TEST_IMG"
+
+echo "=== Check for correct number of cylinders ==="
+echo
+
+# Cylinders are in the top of the file
+CYLINDERS=`grep -a 'cylinders' $TEST_IMG | head -1 | sed -r 's/.*"([0-9]+)".*/\1/' | tr -d '\n'`
+
+
+# Check the cylinders number is plausible
+[ "x$CYLINDERS" = "x0" ] && (echo "Cylinders cannot be zero" >&2 && exit 1)
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/106.out b/tests/qemu-iotests/106.out
new file mode 100644
index 0000000..5d2f0a3
--- /dev/null
+++ b/tests/qemu-iotests/106.out
@@ -0,0 +1,5 @@
+QA output created by 106
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=1024 
+=== Check for correct number of cylinders ===
+
+*** done
diff --git a/tests/qemu-iotests/group b/tests/qemu-iotests/group
index b230996..0c68320 100644
--- a/tests/qemu-iotests/group
+++ b/tests/qemu-iotests/group
@@ -106,3 +106,4 @@
 103 rw auto quick
 104 rw auto
 105 rw auto quick
+106 rw auto quick
-- 
2.1.1


