Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goTgQ-00031c-B5
	for mharc-qemu-trivial@gnu.org; Tue, 29 Jan 2019 08:44:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1goTgN-0002zQ-SY
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 08:44:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1goTgM-0000LT-Cq
	for qemu-trivial@nongnu.org; Tue, 29 Jan 2019 08:44:07 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35036)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1goTgI-0000IV-Vc; Tue, 29 Jan 2019 08:44:03 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A45112BCE;
	Tue, 29 Jan 2019 13:44:01 +0000 (UTC)
Received: from thuth.com (ovpn-116-120.ams2.redhat.com [10.36.116.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 82A765C21F;
	Tue, 29 Jan 2019 13:44:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	liam.merwick@oracle.com
Date: Tue, 29 Jan 2019 14:43:58 +0100
Message-Id: <1548769438-28942-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 29 Jan 2019 13:44:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] target/m68k: Fix LGPL information in the
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
X-List-Received-Date: Tue, 29 Jan 2019 13:44:09 -0000

It's either "GNU *Library* General Public License version 2" or
"GNU Lesser General Public License version *2.1*", but there was
no "version 2.0" of the "Lesser" license. So assume that version
2.1 is meant here.
Also some files mention the GPL instead of the LGPL after declaring
that the files are licensed under the LGPL, so change these spots to
use LGPL, too.

Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Fixed typos in the patch description

 linux-user/m68k/target_cpu.h     | 4 ++--
 linux-user/m68k/target_structs.h | 2 +-
 target/m68k/cpu.h                | 4 ++--
 target/m68k/fpu_helper.c         | 4 ++--
 target/m68k/gdbstub.c            | 2 +-
 target/m68k/helper.c             | 4 ++--
 target/m68k/op_helper.c          | 2 +-
 target/m68k/translate.c          | 4 ++--
 8 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/linux-user/m68k/target_cpu.h b/linux-user/m68k/target_cpu.h
index 611df06..7a26f3c 100644
--- a/linux-user/m68k/target_cpu.h
+++ b/linux-user/m68k/target_cpu.h
@@ -7,12 +7,12 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
+ * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
diff --git a/linux-user/m68k/target_structs.h b/linux-user/m68k/target_structs.h
index a003676..e373d48 100644
--- a/linux-user/m68k/target_structs.h
+++ b/linux-user/m68k/target_structs.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index b288a38..f154565 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -7,12 +7,12 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
+ * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
diff --git a/target/m68k/fpu_helper.c b/target/m68k/fpu_helper.c
index 6eeffdf..b35489b 100644
--- a/target/m68k/fpu_helper.c
+++ b/target/m68k/fpu_helper.c
@@ -7,12 +7,12 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
+ * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
diff --git a/target/m68k/gdbstub.c b/target/m68k/gdbstub.c
index 99e5be8..fd2bb46 100644
--- a/target/m68k/gdbstub.c
+++ b/target/m68k/gdbstub.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/m68k/helper.c b/target/m68k/helper.c
index 917d46e..3e26d33 100644
--- a/target/m68k/helper.c
+++ b/target/m68k/helper.c
@@ -7,12 +7,12 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
+ * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 8d09ed9..76f4399 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 752e46e..6217a68 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -7,12 +7,12 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
+ * Lesser General Public License for more details.
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
-- 
1.8.3.1


