Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gqZ5P-0003XQ-IZ
	for mharc-qemu-trivial@gnu.org; Mon, 04 Feb 2019 02:54:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48518)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqZ5M-0003Vj-Ha
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 02:54:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gqZ5K-0002LT-Lu
	for qemu-trivial@nongnu.org; Mon, 04 Feb 2019 02:54:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35072)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gqZ5G-0002Iw-Mt; Mon, 04 Feb 2019 02:54:26 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 25A582CD81B;
	Mon,  4 Feb 2019 07:54:23 +0000 (UTC)
Received: from thuth.com (ovpn-117-5.ams2.redhat.com [10.36.117.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0F91B5D6A9;
	Mon,  4 Feb 2019 07:54:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Anthony Green <green@moxielogic.com>
Date: Mon,  4 Feb 2019 08:54:18 +0100
Message-Id: <1549266858-5043-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 04 Feb 2019 07:54:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] target/moxie: Fix LGPL information in the
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
X-List-Received-Date: Mon, 04 Feb 2019 07:54:33 -0000

It's either "GNU *Library* General Public License version 2" or "GNU
Lesser General Public License version *2.1*", but there was no "version
2.0" of the "Lesser" license. So assume that version 2.1 is meant here.
Also the files mentioned the GPL instead of the LGPL after declaring
that the files are licensed under the LGPL, so change these spots to
use LGPL, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/moxie/cpu.c       | 2 +-
 target/moxie/cpu.h       | 4 ++--
 target/moxie/helper.c    | 4 ++--
 target/moxie/mmu.c       | 4 ++--
 target/moxie/translate.c | 4 ++--
 5 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 8d67eb6..46434e6 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -13,7 +13,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/cpu.h b/target/moxie/cpu.h
index d40f1e6..080df4e 100644
--- a/target/moxie/cpu.h
+++ b/target/moxie/cpu.h
@@ -6,14 +6,14 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/helper.c b/target/moxie/helper.c
index 5b1532b..f3d8ee7 100644
--- a/target/moxie/helper.c
+++ b/target/moxie/helper.c
@@ -6,14 +6,14 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/mmu.c b/target/moxie/mmu.c
index bd90b1e..87783a3 100644
--- a/target/moxie/mmu.c
+++ b/target/moxie/mmu.c
@@ -6,14 +6,14 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
diff --git a/target/moxie/translate.c b/target/moxie/translate.c
index 29da02b..68ca223 100644
--- a/target/moxie/translate.c
+++ b/target/moxie/translate.c
@@ -5,7 +5,7 @@
  *
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public License
- * as published by the Free Software Foundation; either version 2 of
+ * as published by the Free Software Foundation; either version 2.1 of
  * the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful, but
@@ -13,7 +13,7 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  * Lesser General Public License for more details.
  *
- * You should have received a copy of the GNU General Public License
+ * You should have received a copy of the GNU Lesser General Public License
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-- 
1.8.3.1


