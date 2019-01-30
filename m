Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gopq8-0001pz-GF
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopq5-0001mg-NS
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopq2-0006qU-GD
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:36 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:48659)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gopq2-0006pH-5m; Wed, 30 Jan 2019 08:23:34 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MatZr-1hQNdJ2H5X-00cSQ2; Wed, 30 Jan 2019 14:22:50 +0100
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
	Thomas Huth <thuth@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>
Date: Wed, 30 Jan 2019 14:22:10 +0100
Message-Id: <20190130132214.25493-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fmaab187ZqVUtPO50ga2ynq14m5SAqu6EQh5d9vriduf1zaJ36x
	lGhoPzVL1tiKWSw9p/c7QH4QneAdurynwleX4vWClSCiwRU1HykoSfI6rOfujsBPA0vVwk4
	D3ibrEUP3cuscagUtFvUwCfwWgJ0PzEQ3mNFGqCCNYregoqXIXO5Ri6GtCm/w7Jz4d9R947
	kkGmv6WO9ElyL/wAOPeLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I504VHOaSxk=:uj6oPiHxXSosjtJnqXd4Kz
	bLX/W8bLFVDsw6l7DERdQq0VKytqjnEi7ggU7KoqFlyCO7X4aCoVwnXasU//wrsEiKlVEtQAr
	dXdq2grbyixAvVoieguBrC6N1ToWfFB1WjOJsUYhsU0heasIkx2yO4uJS3ni9EV6+8EC9IWwg
	KsUltKreInsVvzyxpYX02fR6DcYkJofFJFQSqOBMs81DwzeXXTdJx+r59Y9oNjb8sa5xho0hN
	rle0KbdNZDnkyDeMGUY9+9gRUV2KcHiMUOh0XE1mSacjZtBGh7JlpeuELfcKH+Yocg3TsRvXJ
	6ZIbi+WGsoqWksbqvyWfvYMcQ0YhG9zpfGnyPByEEuFfH0kdcV1zihrjnBVVOZ9HDz0UAOKBM
	5YAILxzzRWkJpJCQrm9veLSD2bk9/AJzcAe9xFKbpDvR86BYdH0ijIOE9EcjQ9Dm0U1v65c/y
	WzpLzlMkJyHIH+Yv/n3vvu5cLgrn70h66ZTHJw4XuzHqffmzuUsQHWK/bLs40G7iQuJPqKSEl
	cmz+QDBZ4VvNEXVMVNKe5jAXHouHMVRnGs9OIqdpEREz37IypUxNl6EUOsc01on778pm/84PW
	zDZOdQsPvHk7WUcunVfTj1hhy0fXjgIF9vve8egZ3dE8e6UnfK+PlfnOUPOnrOnawgr+gyO+q
	Bd08Qrqflvo7CoX+KyWOicxTmO5os6IK4ge4D5fASiNSq6tm+2TIFC7VjOfgFTwKhL4JHs5W2
	HMGtWzRyPYxSzgN+ni8ieABqUA9VMW4uppiBtg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 09/13] tcg: Fix LGPL version number
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:39 -0000

From: Thomas Huth <thuth@redhat.com>

It's either "GNU *Library* General Public version 2" or "GNU Lesser
General Public version *2.1*", but there was no "version 2.0" of the
"Lesser" library. So assume that version 2.1 is meant here.

Cc: Richard Henderson <rth@twiddle.net>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1548252536-6242-5-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 accel/tcg/atomic_template.h  | 2 +-
 accel/tcg/cpu-exec-common.c  | 2 +-
 accel/tcg/cpu-exec.c         | 2 +-
 accel/tcg/cputlb.c           | 2 +-
 accel/tcg/softmmu_template.h | 2 +-
 accel/tcg/tcg-runtime-gvec.c | 2 +-
 accel/tcg/translate-all.c    | 2 +-
 accel/tcg/translate-all.h    | 2 +-
 accel/tcg/user-exec.c        | 2 +-
 tcg/tcg-gvec-desc.h          | 2 +-
 tcg/tcg-op-gvec.c            | 2 +-
 tcg/tcg-op-gvec.h            | 2 +-
 tcg/tcg-op-vec.c             | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/accel/tcg/atomic_template.h b/accel/tcg/atomic_template.h
index efde12fdb2..685602b076 100644
--- a/accel/tcg/atomic_template.h
+++ b/accel/tcg/atomic_template.h
@@ -7,7 +7,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 2988fde650..462a1f1865 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 6c4a33262f..7cf1292546 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index dad9b7796c..f580e4dd7e 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/accel/tcg/softmmu_template.h b/accel/tcg/softmmu_template.h
index b0adea045e..1fdd262ea4 100644
--- a/accel/tcg/softmmu_template.h
+++ b/accel/tcg/softmmu_template.h
@@ -11,7 +11,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/accel/tcg/tcg-runtime-gvec.c b/accel/tcg/tcg-runtime-gvec.c
index 9358749741..e2c6f24262 100644
--- a/accel/tcg/tcg-runtime-gvec.c
+++ b/accel/tcg/tcg-runtime-gvec.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 7364e8a071..8f593b926f 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/accel/tcg/translate-all.h b/accel/tcg/translate-all.h
index 08e2f23a46..64f5fd9a05 100644
--- a/accel/tcg/translate-all.h
+++ b/accel/tcg/translate-all.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index 66cc818e3f..0789984fe6 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tcg/tcg-gvec-desc.h b/tcg/tcg-gvec-desc.h
index 3b4c2d9c69..2dda7d6ba1 100644
--- a/tcg/tcg-gvec-desc.h
+++ b/tcg/tcg-gvec-desc.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 3ee44fcb75..0996ef0812 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tcg/tcg-op-gvec.h b/tcg/tcg-op-gvec.h
index 4734eef7de..850da32ded 100644
--- a/tcg/tcg-op-gvec.h
+++ b/tcg/tcg-op-gvec.h
@@ -6,7 +6,7 @@
  * This library is free software; you can redistribute it and/or
  * modify it under the terms of the GNU Lesser General Public
  * License as published by the Free Software Foundation; either
- * version 2 of the License, or (at your option) any later version.
+ * version 2.1 of the License, or (at your option) any later version.
  *
  * This library is distributed in the hope that it will be useful,
  * but WITHOUT ANY WARRANTY; without even the implied warranty of
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index 36f35022ac..27f65600c3 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
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
2.20.1


