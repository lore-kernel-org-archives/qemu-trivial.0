Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTlDY-0004AF-LH
	for mharc-qemu-trivial@gnu.org; Wed, 18 Jan 2017 03:03:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTlDT-00046I-C8
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 03:03:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTlDS-0004Jy-HG
	for qemu-trivial@nongnu.org; Wed, 18 Jan 2017 03:03:35 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:36400)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTlDN-0004Dj-9u; Wed, 18 Jan 2017 03:03:29 -0500
Received: by mail-pf0-x243.google.com with SMTP id 19so604698pfo.3;
	Wed, 18 Jan 2017 00:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=pchlWDhFVMHHD8PDvN34AbhTKAqlQd4yNj5zr7xkLdg=;
	b=PBn+e+lKPAkO4poVyGmfrCG6M2+XgwDeiuZWBQ/jSh0s734QNnjAdmhUnSXEKHJhd5
	1YcIi1YlMfZsqGeISmn6JWz9tgtrDWHLCDf1BPUTp3UgsO8QJg93lWvm3NddhW0w3y7P
	mDfBpnCRqzNqJvfstVjJysXjQGgfjqEFdrb4U+Ox8KzCANE0M6SccXsOJzvnpFHxz0rJ
	Lq4zpVtdDK06iRepk/SjPVzcyRkpMDyRDj7hKjK+TxLOfWAEzG0XqbUOiM+Fi0FwRnU3
	ETMXpZnzaIqkmA1DKcfC+hTs/7Lauc4H9LUMlVLto4d4YeUzLNoYkl4P7veuysdoBXPo
	qtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=pchlWDhFVMHHD8PDvN34AbhTKAqlQd4yNj5zr7xkLdg=;
	b=I1nQF4qRMYZ/GD0w3FCcENVlEtOp7xeWooAtZUAgxVbtmE4D9x43Y9xXNTawbtdPst
	VPtYnjlLii0a+NsQDIdf6rJkIAoAKKaQJFHquvWDy4z6F+6pfg3xHfPHI1e/4vB/Sa/X
	5ek2pfNSGlJq/PlZ/HoOQjObaP4FoTU2sCEAkmXxlhvUXBKIQ1uNiUC0D4jKA4/x/eZL
	EU2kbS61QMC/+8GyJFRM4DwalnURhJbpgstNTCe6J7xsYQr6zmclueVYFG+1nfUwegiO
	YmHi8SnXXew82+auTFh8AlTwIiKNDkrQMyLLUKBtkFeGp3YO888MPw1OM3FHq5XDzQbT
	qOTA==
X-Gm-Message-State: AIkVDXKTwlzoSUiIg+fp/DKIHu4Ppuzm8Wc3BJ1P0FSJdcalDyn4rn16h9+dMnaTpEMC2w==
X-Received: by 10.99.61.13 with SMTP id k13mr2469855pga.154.1484726608116;
	Wed, 18 Jan 2017 00:03:28 -0800 (PST)
Received: from yzy-ge62-2qd.DHCP (v133-130-103-189.a02c.g.tyo1.static.cnode.io.
	[133.130.103.189])
	by smtp.gmail.com with ESMTPSA id e6sm61658133pgf.4.2017.01.18.00.03.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Jan 2017 00:03:27 -0800 (PST)
From: Ziyue Yang <skiver.cloud.yzy@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Ziyue Yang <yzylivezh@hotmail.com>, Ziyue Yang <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 16:02:41 +0800
Message-Id: <1484726561-16441-1-git-send-email-skiver.cloud.yzy@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
Subject: [Qemu-trivial] [PATCH v5 1/2] gdbstub.c: fix GDB connection
 segfault caused by empty machines
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2017 08:03:39 -0000

From: Ziyue Yang <yzylivezh@hotmail.com>

This patch is to fix the segmentation fault caused by attaching
GDB to a QEMU instance initialized with "-M none" option.

The bug can be reproduced by

> ./qemu-system-x86_64 -M none -nographic -S -s

and attach a GDB to it by

> gdb -ex 'target remote :1234

The segmentation fault was originally caused by trying to read
the information about CPU when communicating with GDB. However,
it's impossible for any control flow to exist on an empty machine,
nor can CPU's be hot plugged to an empty machine later by QOM
commands. So I think simply disabling GDB connections on empty
machines makes sense.

Signed-off-by: Ziyue Yang <skiver.cloud.yzy@gmail.com>
---
 gdbstub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index de62d26..426d55e 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -18,6 +18,7 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "qemu/cutils.h"
 #include "cpu.h"
 #ifdef CONFIG_USER_ONLY
@@ -1731,6 +1732,12 @@ int gdbserver_start(const char *device)
     CharDriverState *mon_chr;
     ChardevCommon common = { 0 };

+    if (!first_cpu) {
+        error_report("gdbstub: meaningless to attach gdb to a "
+                     "machine without any CPU.");
+        return -1;
+    }
+
     if (!device)
         return -1;
     if (strcmp(device, "none") != 0) {
--
2.7.4


