Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gopqI-0001yZ-6Q
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37402)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopqC-0001uj-CI
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopqA-00072X-GJ
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:44 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:39373)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gopq4-0006qC-7t; Wed, 30 Jan 2019 08:23:36 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MatZr-1hQNdN472J-00cSQ2; Wed, 30 Jan 2019 14:22:55 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Thomas Huth <thuth@redhat.com>, Liam Merwick <liam.merwick@oracle.com>
Date: Wed, 30 Jan 2019 14:22:12 +0100
Message-Id: <20190130132214.25493-12-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:3pNzAh0uy4xadtw2eVuagIEPb6ic17xXfQKtm5tp12Vr0fnGWKX
	ZgRoTGQnCJYKkYgAQqq3fUj2TEGxYFoiXrk2K7NfjaL8uk18NIilZmVosaLUs46GsbRBSvj
	pqYjapRqthRP+f3+tOMZCewGxgajqhuAbO7iVPeuyQG8YeymJcF7wYO3gSE0BOaljVXc5hT
	9yqqhhk/3Xa/sRV19Tp2Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:20m8/7pfm54=:vTsrCfik7TjcPUotg5RUMb
	rqn6qxB19IlTq5bd8EFuAg6u6LZbc0eWIQiyjQzZtNPDvRn/9r+vMTxkapJAfNUQCwRLtOnIZ
	CKj4IikEuQQWceuyv/lINFLmOFAP2syq1ark2+5D9BnYSdMWeccgJUR+ucgZ9vDA/RQh2E88H
	kx8n8yAIN59G7rbN9qNorlgNxG0BqFu4gyAe2/FWVXP/4/ZNq9cjnF9S0JRrkBygN0myCkhT9
	3JStJNrL1HNHNPwKFrO/T5ug8SaxyDCesvfA3BWqBrwijwU/qixGR6lmaAbsQXcrkuAzG6bUO
	4rJQThTsTRPtDIVWDFVFez4hLtKvrgqXLbgqCqzWP8oKpj0+HJzefPp2qKUhSlklM9j/OzbfJ
	IoDxX+RdBtKrm4MF4D9gSSgCByuexJTS3QNXys83strJexb0ASlRrv1GDk/Byu88DHyLPgwJ9
	8ehfeRgjiiHoar4cd3UFfA82X8/wzbTHJfsq9f915/f9X0DWo4lZfq/8ib61TQdWRzVZbuOdS
	ufxHXgpjyEbma+ufYQc2t9OGjwEx3arP+8IVInQFIEsIiz/9jvAp2FjQp8wW0LUY7Cztrjq7J
	2fKXeZvy0WU0k51KGlRm4hhj0U3wy1meqCDFVmpXvs2wlhjenXNj/z1ihLYinzaRouTA770TI
	/+/SbULNCj5kxln/PTGVkbSHeFOktHLjXgK1g1a4hJhaoQBlHzbM9kxHb5mJdFsONeSBe+UxB
	iBVRAh9Y4gvEEC1dldZV3AwYeoo9Dj9zNJaQvA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 11/13] target/m68k: Fix LGPL information in
 the file headers
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:46 -0000

From: Thomas Huth <thuth@redhat.com>

It's either "GNU *Library* General Public License version 2" or
"GNU Lesser General Public License version *2.1*", but there was
no "version 2.0" of the "Lesser" license. So assume that version
2.1 is meant here.
Also some files mention the GPL instead of the LGPL after declaring
that the files are licensed under the LGPL, so change these spots to
use LGPL, too.

Reviewed-by: Liam Merwick <liam.merwick@oracle.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <1548769438-28942-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
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
index 611df065ca..7a26f3c3fc 100644
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
index a003676548..e373d481e1 100644
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
index b288a3864e..f154565117 100644
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
index 6eeffdf9bb..b35489ba4e 100644
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
index 99e5be8132..fd2bb46c42 100644
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
index 917d46efcc..3e26d337bf 100644
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
index 8d09ed91c4..76f439985a 100644
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
index 752e46ef63..6217a683f1 100644
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
2.20.1


