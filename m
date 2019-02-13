Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtwwC-0004bW-1r
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2019 10:59:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:32807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtww9-0004Xp-Ao
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 10:59:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gtww7-0005lw-UY
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2019 10:59:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:4131)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gtww2-0005dn-I7; Wed, 13 Feb 2019 10:58:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11A213B73D;
	Wed, 13 Feb 2019 15:58:53 +0000 (UTC)
Received: from thuth.com (ovpn-116-45.ams2.redhat.com [10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C57DD60856;
	Wed, 13 Feb 2019 15:58:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: qemu-trivial@nongnu.org
Date: Wed, 13 Feb 2019 16:58:50 +0100
Message-Id: <1550073530-4138-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 13 Feb 2019 15:58:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] target/sh4: Fix LGPL information in the file
 headers
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
X-List-Received-Date: Wed, 13 Feb 2019 15:59:02 -0000

It's either "GNU *Library* General Public License version 2" or "GNU
Lesser General Public License version *2.1*", but there was no "version
2.0" of the "Lesser" license. So assume that version 2.1 is meant here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 linux-user/sh4/target_cpu.h     | 2 +-
 linux-user/sh4/target_structs.h | 2 +-
 target/sh4/cpu.h                | 2 +-
 target/sh4/gdbstub.c            | 2 +-
 target/sh4/helper.c             | 2 +-
 target/sh4/op_helper.c          | 2 +-
 target/sh4/translate.c          | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux-user/sh4/target_cpu.h b/linux-user/sh4/target_cpu.h
index 1a647dd..b0be9a2 100644
--- a/linux-user/sh4/target_cpu.h
+++ b/linux-user/sh4/target_cpu.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/linux-user/sh4/target_structs.h b/linux-user/sh4/target_structs.h
index 3e832bf..00ac394 100644
--- a/linux-user/sh4/target_structs.h
+++ b/linux-user/sh4/target_structs.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 775b574..02a9f74 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/sh4/gdbstub.c b/target/sh4/gdbstub.c
index 13bea00..54568e9 100644
--- a/target/sh4/gdbstub.c
+++ b/target/sh4/gdbstub.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/sh4/helper.c b/target/sh4/helper.c
index 2ff0cf4..fa51269 100644
--- a/target/sh4/helper.c
+++ b/target/sh4/helper.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/sh4/op_helper.c b/target/sh4/op_helper.c
index 4f825ba..28027f9 100644
--- a/target/sh4/op_helper.c
+++ b/target/sh4/op_helper.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index ab254b0..631b576 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -6,7 +6,7 @@
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


