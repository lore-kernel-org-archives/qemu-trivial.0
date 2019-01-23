Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmJDP-0004Tq-TS
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2019 09:09:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJDN-0004Rk-IM
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:09:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJDL-00047I-Jy
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:09:13 -0500
Received: from mx1.redhat.com ([209.132.183.28]:59834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gmJDE-0003yw-Iu; Wed, 23 Jan 2019 09:09:05 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2084D2EE5;
	Wed, 23 Jan 2019 14:09:03 +0000 (UTC)
Received: from thuth.com (ovpn-116-107.ams2.redhat.com [10.36.116.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9E8ED6C205;
	Wed, 23 Jan 2019 14:09:02 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Stafford Horne <shorne@gmail.com>
Date: Wed, 23 Jan 2019 15:08:54 +0100
Message-Id: <1548252536-6242-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1548252536-6242-1-git-send-email-thuth@redhat.com>
References: <1548252536-6242-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Wed, 23 Jan 2019 14:09:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/4] target/openrisc: Fix LGPL version number
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
X-List-Received-Date: Wed, 23 Jan 2019 14:09:14 -0000

It's either "GNU *Library* General Public version 2" or "GNU Lesser
General Public version *2.1*", but there was no "version 2.0" of the
"Lesser" library. So assume that version 2.1 is meant here.

Cc: Stafford Horne <shorne@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/openrisc/cpu.c              | 2 +-
 target/openrisc/exception.h        | 2 +-
 target/openrisc/gdbstub.c          | 2 +-
 target/openrisc/helper.h           | 2 +-
 target/openrisc/interrupt_helper.c | 2 +-
 target/openrisc/sys_helper.c       | 2 +-
 target/openrisc/translate.c        | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index fb7cb5c..541b2a6 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/exception.h b/target/openrisc/exception.h
index 4ec56b4..c9c4e47 100644
--- a/target/openrisc/exception.h
+++ b/target/openrisc/exception.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/gdbstub.c b/target/openrisc/gdbstub.c
index f9af650..43b1a18 100644
--- a/target/openrisc/gdbstub.c
+++ b/target/openrisc/gdbstub.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/helper.h b/target/openrisc/helper.h
index 9db9bf3..96d79a8 100644
--- a/target/openrisc/helper.h
+++ b/target/openrisc/helper.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/interrupt_helper.c b/target/openrisc/interrupt_helper.c
index 9c5489f..ab4ea88 100644
--- a/target/openrisc/interrupt_helper.c
+++ b/target/openrisc/interrupt_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
index b66a45c..05f66c4 100644
--- a/target/openrisc/sys_helper.c
+++ b/target/openrisc/sys_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index c089914..89680f8 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
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


