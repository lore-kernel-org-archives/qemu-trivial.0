Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cTgp9-0004e5-PU
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2017 22:22:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTgp6-0004ch-DS
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 22:22:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <skiver.cloud.yzy@gmail.com>) id 1cTgp5-0006ML-Jl
	for qemu-trivial@nongnu.org; Tue, 17 Jan 2017 22:22:08 -0500
Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244]:35609)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <skiver.cloud.yzy@gmail.com>)
	id 1cTgp1-0006Ii-Bh; Tue, 17 Jan 2017 22:22:03 -0500
Received: by mail-pg0-x244.google.com with SMTP id 204so104793pge.2;
	Tue, 17 Jan 2017 19:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6os/60FhazItljLD20Jbz2fOHDLz55FEgC9WDKgunNc=;
	b=Q92FVf2HVEw624rqygm5C+FFzzAFtIm6sH4G2EL+0Crv+ZdfpZ1f7m+DUSZNsEZU8f
	16GMnSjVT3lM0J9yHy0mqX7aTWgIr0ncM0f7VM/FOoeejLNrWjVsqwASO3Bb2tXu0cJ3
	RK3zPaU5SrdE2PYzwxyReBaIg5iQ4LWvX8JUuYAXKmnmn2iXhjRnuoWlxN3fpC+HvREs
	dWOVAmN1TXyK6a7InCrcze9j7OYWZgRvFts6P47g15Xl7BlVKwJW0P3hwzAB/qbX49dq
	dYPIaydJtdivQJhAvjWpDaCLw61d6vCWtPR5vGSo+XJGt9esJ2YQAMneADKGk9wi9uuC
	9CpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6os/60FhazItljLD20Jbz2fOHDLz55FEgC9WDKgunNc=;
	b=nrOUXOAriVXCquD//QQuKcNFEPEROQuk9FNYQT7S4LlMr0qeaR/t7bFWqOl6CSZBR9
	BE4LU9NYxS7aZWzI39NBDu5kTJOo9Ppjcz+bRj6dSf9qbcBLMY+UJReKVc+XE9gNa5v7
	OhKxUN1bOzdFGUozhJzSbmc1TZ0BTk3JbvzMQgnZQl1OGZ2rsyL1MKNDls7F9WnS0hoi
	kQeEB68xyeaOqevjS1BezYuQ2KeweVRM9LDmepP99gDXIBpT6Bq1yjtda8UOZ6En8qG3
	og3PKFfWSlek0FhBTNykye/EKAjjizpnM6hcDVaYQ7t37O2tmPlxxkf/qVFUGL21Tk3A
	dxqQ==
X-Gm-Message-State: AIkVDXJB1/oqP5UfOl91ypXKdniNquka7RWjqEB3BB7kRWj4MLKo7BRJIYLXz8KV1p8Dmw==
X-Received: by 10.99.149.66 with SMTP id t2mr1354619pgn.156.1484709722470;
	Tue, 17 Jan 2017 19:22:02 -0800 (PST)
Received: from yzy-ge62-2qd.pku.edu.cn
	(v133-130-103-189.a02c.g.tyo1.static.cnode.io. [133.130.103.189])
	by smtp.gmail.com with ESMTPSA id
	h17sm58894792pfh.62.2017.01.17.19.21.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jan 2017 19:22:01 -0800 (PST)
From: Ziyue Yang <skiver.cloud.yzy@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Fam Zheng <famz@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Anthony Liguori <aliguori@us.ibm.com>,
	Ziyue Yang <yzylivezh@hotmail.com>, Ziyue Yang <skiver.cloud.yzy@gmail.com>
Date: Wed, 18 Jan 2017 11:21:39 +0800
Message-Id: <1484709699-3455-1-git-send-email-skiver.cloud.yzy@gmail.com>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c05::244
Subject: [Qemu-trivial] [PATCH v4 1/2] gdbstub.c: fix GDB connection
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
X-List-Received-Date: Wed, 18 Jan 2017 03:22:09 -0000

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

Also some updates from fprintf(stderr, ...) to error_report.

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


