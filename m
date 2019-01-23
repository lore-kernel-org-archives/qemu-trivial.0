Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmJsb-0003st-Di
	for mharc-qemu-trivial@gnu.org; Wed, 23 Jan 2019 09:51:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJsV-0003ps-VT
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:51:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gmJsT-0004Xy-CE
	for qemu-trivial@nongnu.org; Wed, 23 Jan 2019 09:51:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57668)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gmJsK-0004RC-JU; Wed, 23 Jan 2019 09:51:34 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 188DBC050069;
	Wed, 23 Jan 2019 14:51:28 +0000 (UTC)
Received: from thuth.com (ovpn-116-107.ams2.redhat.com [10.36.116.107])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2DB060478;
	Wed, 23 Jan 2019 14:51:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Date: Wed, 23 Jan 2019 15:51:23 +0100
Message-Id: <1548255083-8190-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 23 Jan 2019 14:51:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] Don't talk about the LGPL if the file is
 licensed under the GPL
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
X-List-Received-Date: Wed, 23 Jan 2019 14:51:45 -0000

Some files claim that the code is licensed under the GPL, but then
suddenly suggest that the user should have a look at the LGPL.
That's of course non-sense, replace it with the correct GPL wording
instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 crypto/afsplit.c           | 11 +++++------
 include/crypto/afsplit.h   | 11 +++++------
 include/hw/pci-host/gpex.h |  4 ++--
 include/hw/pci-host/q35.h  |  4 ++--
 include/qemu/range.h       | 11 +++++------
 target/i386/hvf/hvf.c      |  6 +++---
 util/range.c               | 11 +++++------
 7 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/crypto/afsplit.c b/crypto/afsplit.c
index 825e2cf..328d68c 100644
--- a/crypto/afsplit.c
+++ b/crypto/afsplit.c
@@ -8,19 +8,18 @@
  * Copyright (C) 2004, Clemens Fruhwirth <clemens@endorphin.org>
  * Copyright (C) 2009-2012, Red Hat, Inc. All rights reserved.
  *
- * This library is free software; you can redistribute it and/or
+ * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
  * as published by the Free Software Foundation; either version 2
  * of the License, or (at your option) any later version.
  *
- * This library is distributed in the hope that it will be useful,
+ * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ * General Public License for more details.
  *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
diff --git a/include/crypto/afsplit.h b/include/crypto/afsplit.h
index 7dd21f0..4894d64 100644
--- a/include/crypto/afsplit.h
+++ b/include/crypto/afsplit.h
@@ -3,19 +3,18 @@
  *
  * Copyright (c) 2015-2016 Red Hat, Inc.
  *
- * This library is free software; you can redistribute it and/or
+ * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public License
  * as published by the Free Software Foundation; either version 2
  * of the License, or (at your option) any later version.
  *
- * This library is distributed in the hope that it will be useful,
+ * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ * General Public License for more details.
  *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef QCRYPTO_AFSPLIT_H
diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
index aef38b8..2af1c4a 100644
--- a/include/hw/pci-host/gpex.h
+++ b/include/hw/pci-host/gpex.h
@@ -13,8 +13,8 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>
  */
 
 #ifndef HW_GPEX_H
diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
index 8f4ddde..5ed77fa 100644
--- a/include/hw/pci-host/q35.h
+++ b/include/hw/pci-host/q35.h
@@ -15,8 +15,8 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  * GNU General Public License for more details.
  *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>
  */
 
 #ifndef HW_Q35_H
diff --git a/include/qemu/range.h b/include/qemu/range.h
index ba606c6..71b8b21 100644
--- a/include/qemu/range.h
+++ b/include/qemu/range.h
@@ -3,19 +3,18 @@
  *
  * Copyright (c) 2015-2016 Red Hat, Inc.
  *
- * This library is free software; you can redistribute it and/or
+ * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public
  * License as published by the Free Software Foundation; either
  * version 2 of the License, or (at your option) any later version.
  *
- * This library is distributed in the hope that it will be useful,
+ * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ * General Public License for more details.
  *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #ifndef QEMU_RANGE_H
diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index e193022..689b585 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -13,10 +13,10 @@
  * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
+ * General Public License for more details.
  *
- * You should have received a copy of the GNU Lesser General Public
- * License along with this program; if not, see <http://www.gnu.org/licenses/>.
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
  *
  * This file contain code under public domain from the hvdos project:
  * https://github.com/mist64/hvdos
diff --git a/util/range.c b/util/range.c
index 416df7c..098d9d2 100644
--- a/util/range.c
+++ b/util/range.c
@@ -3,19 +3,18 @@
  *
  * Copyright (c) 2015-2016 Red Hat, Inc.
  *
- * This library is free software; you can redistribute it and/or
+ * This program is free software; you can redistribute it and/or
  * modify it under the terms of the GNU General Public
  * License as published by the Free Software Foundation; either
  * version 2 of the License, or (at your option) any later version.
  *
- * This library is distributed in the hope that it will be useful,
+ * This program is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * Lesser General Public License for more details.
- *
- * You should have received a copy of the GNU General Public
- * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ * General Public License for more details.
  *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 
 #include "qemu/osdep.h"
-- 
1.8.3.1


