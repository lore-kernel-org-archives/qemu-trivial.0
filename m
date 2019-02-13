Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwx8-0005Wy-Ok
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 11:00:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33171)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtwx6-0005UL-3b
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 11:00:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtwx4-0006SH-DU
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 11:00:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:2763)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtwx0-00068n-HA; Wed, 13 Feb 2019 10:59:54 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BAF9C0669C2;
	Wed, 13 Feb 2019 15:59:40 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D0FC5D9C6;
	Wed, 13 Feb 2019 15:59:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Stafford Horne <shorne@gmail.com>,
	Jia Liu <proljc@gmail.com>
Cc: qemu-trivial@nongnu.org
Date: Wed, 13 Feb 2019 16:59:37 +0100
Message-Id: <1550073577-4248-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 13 Feb 2019 15:59:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] target/openrisc: Fix LGPL information in the
 file headers
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
X-List-Received-Date: Wed, 13 Feb 2019 16:00:01 -0000

It's either "GNU *Library* General Public License version 2" or "GNU
Lesser General Public License version *2.1*", but there was no "version
2.0" of the "Lesser" license. So assume that version 2.1 is meant here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/openrisc/cputimer.c               | 2 +-
 hw/openrisc/openrisc_sim.c           | 2 +-
 hw/openrisc/pic_cpu.c                | 2 +-
 linux-user/openrisc/target_cpu.h     | 2 +-
 linux-user/openrisc/target_structs.h | 2 +-
 target/openrisc/cpu.h                | 2 +-
 target/openrisc/exception.c          | 2 +-
 target/openrisc/exception_helper.c   | 2 +-
 target/openrisc/fpu_helper.c         | 2 +-
 target/openrisc/insns.decode         | 2 +-
 target/openrisc/interrupt.c          | 2 +-
 target/openrisc/machine.c            | 2 +-
 target/openrisc/mmu.c                | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/hw/openrisc/cputimer.c b/hw/openrisc/cputimer.c
index 850f887..fe95efc 100644
--- a/hw/openrisc/cputimer.c
+++ b/hw/openrisc/cputimer.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index 7d3b734..0a906d8 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/hw/openrisc/pic_cpu.c b/hw/openrisc/pic_cpu.c
index 569b443..2f53cfc 100644
--- a/hw/openrisc/pic_cpu.c
+++ b/hw/openrisc/pic_cpu.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/linux-user/openrisc/target_cpu.h b/linux-user/openrisc/target_cpu.h
index d1ea450..32ff135 100644
--- a/linux-user/openrisc/target_cpu.h
+++ b/linux-user/openrisc/target_cpu.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/linux-user/openrisc/target_structs.h b/linux-user/openrisc/target_structs.h
index afbb7ad..e98e2bc 100644
--- a/linux-user/openrisc/target_structs.h
+++ b/linux-user/openrisc/target_structs.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index f1b31bc..c104a4b 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/exception.c b/target/openrisc/exception.c
index 49470be..28c1fce 100644
--- a/target/openrisc/exception.c
+++ b/target/openrisc/exception.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/exception_helper.c b/target/openrisc/exception_helper.c
index 6073a5b..0797cc9 100644
--- a/target/openrisc/exception_helper.c
+++ b/target/openrisc/exception_helper.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/fpu_helper.c b/target/openrisc/fpu_helper.c
index 265ce13..b9d2ebb 100644
--- a/target/openrisc/fpu_helper.c
+++ b/target/openrisc/fpu_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/insns.decode b/target/openrisc/insns.decode
index dad68c8..7df81c1 100644
--- a/target/openrisc/insns.decode
+++ b/target/openrisc/insns.decode
@@ -6,7 +6,7 @@
 # This library is free software; you can redistribute it and/or
 # modify it under the terms of the GNU Lesser General Public
 # License as published by the Free Software Foundation; either
-# version 2 of the License, or (at your option) any later version.
+# version 2.1 of the License, or (at your option) any later version.
 #
 # This library is distributed in the hope that it will be useful,
 # but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/interrupt.c b/target/openrisc/interrupt.c
index bbae956..ee280df 100644
--- a/target/openrisc/interrupt.c
+++ b/target/openrisc/interrupt.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/machine.c b/target/openrisc/machine.c
index 5d822f7..c9e0848 100644
--- a/target/openrisc/machine.c
+++ b/target/openrisc/machine.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index e7d5219..5dec68d 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- 
1.8.3.1


