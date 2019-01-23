Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmJDk-0004jm-73
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2019 09:09:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJDh-0004h9-3p
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:09:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJDb-0004FU-2M
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:09:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55080)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gmJDG-0003zh-6y; Wed, 23 Jan 2019 09:09:07 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58FFE80F7B;
	Wed, 23 Jan 2019 14:09:05 +0000 (UTC)
Received: from thuth.com (ovpn-116-107.ams2.redhat.com [10.36.116.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 19EEF6C20B;
	Wed, 23 Jan 2019 14:09:03 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Wed, 23 Jan 2019 15:08:55 +0100
Message-Id: <1548252536-6242-4-git-send-email-thuth@redhat.com>
In-Reply-To: <1548252536-6242-1-git-send-email-thuth@redhat.com>
References: <1548252536-6242-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 23 Jan 2019 14:09:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 3/4] target/tricore: Fix LGPL version number
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
X-List-Received-Date: Wed, 23 Jan 2019 14:09:34 -0000

It's either "GNU *Library* General Public version 2" or "GNU Lesser
General Public version *2.1*", but there was no "version 2.0" of the
"Lesser" library. So assume that version 2.1 is meant here.

Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/tricore/cpu-qom.h         | 2 +-
 target/tricore/cpu.c             | 2 +-
 target/tricore/cpu.h             | 2 +-
 target/tricore/fpu_helper.c      | 2 +-
 target/tricore/helper.c          | 2 +-
 target/tricore/helper.h          | 2 +-
 target/tricore/op_helper.c       | 2 +-
 target/tricore/translate.c       | 2 +-
 target/tricore/tricore-defs.h    | 2 +-
 target/tricore/tricore-opcodes.h | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/target/tricore/cpu-qom.h b/target/tricore/cpu-qom.h
index 6a69756..93c9d77 100644
--- a/target/tricore/cpu-qom.h
+++ b/target/tricore/cpu-qom.h
@@ -4,7 +4,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 2edaef1..e8d37e4 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tricore/cpu.h b/target/tricore/cpu.h
index c3665c6..00e69dc 100644
--- a/target/tricore/cpu.h
+++ b/target/tricore/cpu.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tricore/fpu_helper.c b/target/tricore/fpu_helper.c
index 31df462..d8a6c0d 100644
--- a/target/tricore/fpu_helper.c
+++ b/target/tricore/fpu_helper.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index dad7eea..0769046 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -4,7 +4,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tricore/helper.h b/target/tricore/helper.h
index e634d0c..f60e810 100644
--- a/target/tricore/helper.h
+++ b/target/tricore/helper.h
@@ -4,7 +4,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tricore/op_helper.c b/target/tricore/op_helper.c
index b57f353..ed9dc0c 100644
--- a/target/tricore/op_helper.c
+++ b/target/tricore/op_helper.c
@@ -4,7 +4,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index b5ab40d..14f0ddf 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tricore/tricore-defs.h b/target/tricore/tricore-defs.h
index 40abfaa..e871aa1 100644
--- a/target/tricore/tricore-defs.h
+++ b/target/tricore/tricore-defs.h
@@ -4,7 +4,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/tricore/tricore-opcodes.h b/target/tricore/tricore-opcodes.h
index 2c3baab..40bc121 100644
--- a/target/tricore/tricore-opcodes.h
+++ b/target/tricore/tricore-opcodes.h
@@ -4,7 +4,7 @@
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


