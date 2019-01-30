Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gopqJ-00020t-WA
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopqC-0001vR-Rv
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopqB-00074b-A2
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:44 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:45123)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goppw-0006g9-UU; Wed, 30 Jan 2019 08:23:29 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MQMm9-1gSe9F3XrF-00MH36; Wed, 30 Jan 2019 14:22:53 +0100
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
	Thomas Huth <thuth@redhat.com>
Date: Wed, 30 Jan 2019 14:22:11 +0100
Message-Id: <20190130132214.25493-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PXtBMKPq235MqQZ1jRD3HmR47swwHGHj4EWlVZqZgm136fCSnwV
	zXd2rsnQyzp0cxx2FL3ZTSYdxTFc5OBs3rYREEDow6+q/WoM80UO9T6YvoFLyAOKoS8KbzD
	w6GbKI2BHcLpBguc63QBu6B9N6u1IFkiZRaPulA429B0ogQ5cyj1D26O92EQEwc07MoPQj8
	pr6s/06gdFCsquqCTx6Hg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OtvqaIpTHvg=:Trv4EKdWuVm+a6T8zpyIsn
	BOg2ySVwyP0eLWS0R7j8tCChcGQFUPz6zS05f+9GQqnDL72X/TW6d5PaM8yGOR27x72C8kAcP
	1bGwQXqS4wwTNPDsshdHRZ1n3CEfS7+20u62rc8jUARIVn6ILpk6/wlhA/iFAvhrICJJhtDcV
	OQQIhZPOH4NvCKwy3KKLvrbr9yqDWsto01q5gevcH6mMjssZCXV8CGu0ZAc0J5YL9nlyHNw4H
	Jytf6U2OSJY7JjDvcihnabwMBzc379RtULz0kzfz2WcnwBuj6HL25YoHvyKNNvChzQQyOkJmp
	J/O/jticrz+UqfKLSSG0KZP+wAB1wNPAxtFd0qHdakBlx3MaXeRbLjphFFkfELzFl8SZWb9g9
	FzlqW/I6MgxMVpjweZVnC2n1RcWg1BUwBWChj7fl1FPm8wnjQ6L/y2rzV02e8rb7Kw7OiJ+Q9
	gdKZdDIBSYggt74OCqTJajVvSQBeLvpWWPLiyoSBmfg7MFmKefDHsyVaIvSisUy/dsNxzGobk
	+xErravtRtAdZQ7xPf7NxGs9tDb0Bv/nq7YpRsqGm9xosepHtJSmJL39wtC73L9XMX/FhZfQe
	eINCb0msEJmxElPyyY0t9WF2gsM5AJK214yFdS7xcXfLwFKJv9VQUp70fhmKW7StKkgkjPTZM
	k7FtpghjXku+3v69n1n7Pc8IX0BZlURN6rAerpv74HiiuJ92my5iALqeFrIoBdAobrFnupTHF
	x1QZREXTJunOad3CZKaAjIbt7ZVDIZVL+ZJE3g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 10/13] target/s390x: Fix LGPL version in the
 file header comments
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

Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Message-Id: <1548769067-20792-1-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/s390x/cc_helper.c   | 2 +-
 target/s390x/excp_helper.c | 2 +-
 target/s390x/fpu_helper.c  | 2 +-
 target/s390x/gdbstub.c     | 2 +-
 target/s390x/helper.c      | 2 +-
 target/s390x/int_helper.c  | 2 +-
 target/s390x/mem_helper.c  | 2 +-
 target/s390x/misc_helper.c | 2 +-
 target/s390x/translate.c   | 2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/s390x/cc_helper.c b/target/s390x/cc_helper.c
index 5d91e458a8..307ad61aee 100644
--- a/target/s390x/cc_helper.c
+++ b/target/s390x/cc_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 2a33222f7e..a758649f47 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/s390x/fpu_helper.c b/target/s390x/fpu_helper.c
index 1b662d2520..e921172bc4 100644
--- a/target/s390x/fpu_helper.c
+++ b/target/s390x/fpu_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/s390x/gdbstub.c b/target/s390x/gdbstub.c
index b8c81dadcf..df147596ce 100644
--- a/target/s390x/gdbstub.c
+++ b/target/s390x/gdbstub.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index 254631693d..3d74836a83 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/s390x/int_helper.c b/target/s390x/int_helper.c
index abf77a94e6..abbbc20d9c 100644
--- a/target/s390x/int_helper.c
+++ b/target/s390x/int_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/s390x/mem_helper.c b/target/s390x/mem_helper.c
index 490c43e6e6..a506d9ef99 100644
--- a/target/s390x/mem_helper.c
+++ b/target/s390x/mem_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/s390x/misc_helper.c b/target/s390x/misc_helper.c
index 3f91579570..52262f62df 100644
--- a/target/s390x/misc_helper.c
+++ b/target/s390x/misc_helper.c
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index b5bd56b7ee..6249c70d02 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
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
2.20.1


