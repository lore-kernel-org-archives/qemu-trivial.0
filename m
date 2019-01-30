Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gopqE-0001we-1N
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopqA-0001rv-2Z
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopq8-0006vt-BJ
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:42 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:45317)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gopq0-0006nR-OA; Wed, 30 Jan 2019 08:23:33 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N1fei-1hHL5k26rA-011zf3; Wed, 30 Jan 2019 14:22:48 +0100
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
Date: Wed, 30 Jan 2019 14:22:09 +0100
Message-Id: <20190130132214.25493-9-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F3lU3uHqHdhZ0ljCLfZPtIBB/JoK8ak1qo+tcAQri4FL1l8q3DZ
	1356I6gi4UUyNZqOluAl+c1DMjHAE6uLbs0kbDiSzNrcaxhPc8GKTSyVlLG7Ub0R4/gb6hh
	6mjdoOxAUn+ui+jdgo0J5dT25/FdtWvzDdJ2SfeewoTvnQpwj+1P3oU8+sDiJjmsa/TYSS7
	jdZy9+tRnVEhLf3s8cWeg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XUjrLbazSgs=:mxvSkj9kTy7U+oWFPhSMSa
	a6W5ZBhESown6sO5bPonIvGcpeXhbp5x31uyf0c2mmGvD0CzOYwHbrp+Vk6ckALiwWh2EVtEg
	4u5HyTKE8rXdUHtWg/Kxo3rySbMLQRbcxvoWzln8Cc2tZ7OSVre6fygL8px3D1lpsVAnnBoJL
	PEofX1VGmZvlRmhQKMNXxMOAeZiJ5A8jpjSi01xKmc+oWQ2/cYXi9jKE018V6xmORW8cgVhNR
	rcr8gEbMeSacKA68GhaUms6a8KB8/eZ4NcUWTDp7MXx7B9WJ0e7z1a92IMkaSjalAY9EPqo6T
	wPCPYOMh+2vvrWnCws4QgPqL7iXNQ/UsNwrptnfegBejYGk9oIUCi8qqtnfpwmEJWxmPUWRKS
	WtatXz+qzoxyWKoeeNH/ueCWunpe6DIuxnyvr5SmOrpPD/bK5hzdFfwl2PBBJxqbQuwQ+16tY
	XdJaQqGn4e78p9L0hJIDQ3eMS4n+TEGoum7+UuysiAXpyVMohZF7wfxkxLeyuZzXyyxSEzbb9
	2fk/743AVGC6vpbQ/mh34m9kn7WJMZ8aBH6QS0y9gt+Egwb0a9VzC1Rh2/tFzHCVVghVL43+e
	w9zjEJw9vOk51LvEoFc9MN4kY6a08nsFyxBQPJW3vpp7v0WL9UcJKOYcjw+93zyDodtg1FfSU
	YLUE8alC64O9zPNQi4yBwL9ko+InN9gDfycrsSAudwhYCgZqXp2XJ5irHWBxHn8LuPzB9xrdB
	wcgIjDzk9yMTVC+74p80MQ4KDucV9+8XtJPzNg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: [Qemu-trivial] [PULL 08/13] target/tricore: Fix LGPL version number
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:44 -0000

From: Thomas Huth <thuth@redhat.com>

It's either "GNU *Library* General Public version 2" or "GNU Lesser
General Public version *2.1*", but there was no "version 2.0" of the
"Lesser" library. So assume that version 2.1 is meant here.

Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1548252536-6242-4-git-send-email-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
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
index 6a69756126..93c9d77fe3 100644
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
index 2edaef1aef..e8d37e4040 100644
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
index c3665c6ddd..00e69dc154 100644
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
index 31df462e4a..d8a6c0d25b 100644
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
index dad7eea085..0769046993 100644
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
index e634d0c680..f60e81096b 100644
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
index b57f35387d..ed9dc0c83e 100644
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
index b5ab40d4a2..14f0ddfa1e 100644
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
index 40abfaac14..e871aa1c6b 100644
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
index 2c3baab694..40bc121ba4 100644
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
2.20.1


