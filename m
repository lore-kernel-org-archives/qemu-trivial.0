Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gopqD-0001wI-QA
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopq9-0001rH-E7
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopq7-0006v0-Ot
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:41 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:48705)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goppp-0006LX-5i; Wed, 30 Jan 2019 08:23:21 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N79q8-1hE3JO2Vlk-017TqL; Wed, 30 Jan 2019 14:22:42 +0100
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
Date: Wed, 30 Jan 2019 14:22:06 +0100
Message-Id: <20190130132214.25493-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fQNQLgZ8LlxtRcaHA0PFLjK3elyyjVgzJvUuPzylsV1miAtZiFe
	jBzx7gEuEEDo34A3SHdMSUUWn1gbVz5RzRzZZ1zajc4K+0bSgDfyaqGh47xfCMt2RFWBzsa
	mnbqcD9jrf6DQsRNSCsiUrtGgPPvN8F1tGUiko+LP6AQkoFkvQoCcDN5pHP0gE0MVe+fiFY
	FeUHsD4QCJAVMHhn7D0fw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZlfFz/oy/N8=:HFyB22Ep1sQMQZNJfUkFDE
	9zx8tvIGyCoPvZONt3jAvVhaluYydnG+IDIKQZQLt0sM9VO2eyHkTBjckkLJ3t36JFOvUE9Th
	c3u9pusV9kIT5daHFX2JX21sqshqE0GpPyrMeVKpgaIcUO97WetBR8r9V3dOQQqUutMUHlpYD
	Nfc7VbWSTHyUT+uclokDrEa2XaZy+s7AygVByZHLzMgEQFD5brOcu8ktRi/5wNJbImthWCcFW
	Kjz3Kk7ivTQKI1rja4LSn0YzaM9Aj0WJaGQJIU6I37/eUe+aZpFjUqH1o02qbzPon91EUnNpA
	xfE+dgFKxGq7XmF2G53akpAWWcYXMoeCsQs+0Mkc5aBA0HuM4wqmYos9DyiNqJ806mBLTBL04
	6uLSlUSFY9bjkiQI6D7LEolU7SmCHzOxUOnrH08ERH5/0dGuKzr5ywcOxviVV8isl5tHv9/Cl
	2YaI3ndInU/jsS9fKzjRFp/Cq7t/yJrO5CDySoSxIBNjtjTf8vSIS/ln4o4cTBqB1236wvbKy
	zy9e5lhek0CLL3fg/ax9JPe5hHlkfzg8pDT/TOFhCOYbrtJiLP+xLuu0VYSXl4OG1tnyDiYAr
	KRBnSc52PfKuL6jbjhA3jEc8OyLJ52pvs7q+8QKoqDybXlvWPaz0i6Eu+nJ1PYR3pwzw1fu0j
	s1sZ2uNkygjlgZgO9hawYAmOa5H1PuH25xDVKllGOUIpncqxxotqkq2V3euV8pf6+7dEfUFq+
	p9PQ2zfAE7J1g5LkNga80D9nX7ihnzKtTxohcA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 05/13] Don't talk about the LGPL if the file
 is licensed under the GPL
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:43 -0000

From: Thomas Huth <thuth@redhat.com>

Some files claim that the code is licensed under the GPL, but then
suddenly suggest that the user should have a look at the LGPL.
That's of course non-sense, replace it with the correct GPL wording
instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <1548255083-8190-1-git-send-email-thuth@redhat.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
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
index 825e2cff26..328d68c96b 100644
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
index 7dd21f0a67..4894d64330 100644
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
index aef38b881b..2af1c4a37e 100644
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
index 8f4ddde393..5ed77facd0 100644
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
index ba606c6bc0..71b8b215c6 100644
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
index e193022c03..689b585027 100644
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
index 416df7cdae..098d9d2dc0 100644
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
2.20.1


