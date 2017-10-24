Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6yCy-0006X3-5L
	for mharc-qemu-trivial@gnu.org; Tue, 24 Oct 2017 08:21:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCt-0006TE-V9
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCs-0007EG-2r
	for qemu-trivial@nongnu.org; Tue, 24 Oct 2017 08:21:19 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:44182)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6yCe-00074H-V3; Tue, 24 Oct 2017 08:21:05 -0400
Received: by mail-qk0-x243.google.com with SMTP id r64so25927478qkc.1;
	Tue, 24 Oct 2017 05:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=fwHh1OAweOZOHx7kkW8yOHZufjrY41Xyf5L9ndLoZ3o=;
	b=HUlBg5ZjP5ajwGJnHgKUvWvGg6gQPrVIEzymqxbkBmUUA9kKkc3jOfE4eHHL6E0Jk1
	Lzr4kTMTrbK/t72eAwv4ioG5NQZsOJMi5VHRN+9vqPIBmPSY19IGK01ARIcxBsP2LyBM
	G2DAsxPerdoXRLhbuONgJxVrQloCoQvj8tqM2tdENTl3v3S7bu9fZX+g2SSe+HJgMhpM
	EfwMT9ZuFuWJgIGPxg56F2RvPLHLKiCanUBJj+lOe43cJog+MR0nCeXN/bELfXXEU7IJ
	IutWJVHqfEApGOClNPmEDjlqX4Md7C1ZstyZIv8/aFQz761ruDoIa+/nIxl/eHa472ww
	K9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=fwHh1OAweOZOHx7kkW8yOHZufjrY41Xyf5L9ndLoZ3o=;
	b=qi1TG+zpNAJWaH11VkOlSZ/xOGNRFP29YXGAf3+j4nsBdIIVITLXGv5JDEvA/bi730
	bYGeXAGhzYcnNPaI7E10oTnHtuYsQqehIuEQDM5RNfZWVyBG+pqnqbRTnmb9yED6v591
	LXwcAnPdwV+Fpg9PY5jrLQ2lX9QKyjmMAdYWzEOrJdYtYXlBSfIn/PqgQ+yPy4H0DCD0
	qMMJQlYe9KytRyviqjstoOUHS/OxKBNh7CFdKUlrXibRYjOUGr8SoSriIQMOcat9mMD5
	iwEHaP3qY6J8V+3YpMRi0YnXLLNXShwTI2H8fnjQhwiBxCGrBsNStp4Fa+Bqs7ym3+a7
	RzTQ==
X-Gm-Message-State: AMCzsaVsRTYRIundjrY8sUNXyrUQc8EfHfqd19SbA0DjYeepUmZeu90M
	WqnLZ2WT1Tb7wE90FdlAbic=
X-Google-Smtp-Source: ABhQp+QF7LYJzc9PVnSTlXbidnDXL6xecCdMhPxpr0ojYIKKsrDs06itpy5hI/rpASSSulbu68jDBw==
X-Received: by 10.55.180.132 with SMTP id d126mr24778644qkf.268.1508847664453; 
	Tue, 24 Oct 2017 05:21:04 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id n76sm103983qkn.85.2017.10.24.05.21.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 24 Oct 2017 05:21:03 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Amarnath Valluri <amarnath.valluri@intel.com>,
	Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Xu <peterx@redhat.com>
Date: Tue, 24 Oct 2017 09:20:43 -0300
Message-Id: <20171024122045.30072-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc1
In-Reply-To: <20171024122045.30072-1-f4bug@amsat.org>
References: <20171024122045.30072-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2 2/4] tpm: add stubs
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
X-List-Received-Date: Tue, 24 Oct 2017 12:21:21 -0000

Commit c37cacabf22 moved tpm_cleanup() in the main loop exit, however this
function is not available when compiling with --disable-tpm.

Provides necessary stubs to keep code clean of #ifdef'fery.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20171023102903.256AF7456A0@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Richard W.M. Jones <rjones@redhat.com>
---
 Makefile.objs       |  2 +-
 stubs/tpm.c         | 33 +++++++++++++++++++++++++++++++++
 MAINTAINERS         |  1 +
 stubs/Makefile.objs |  1 +
 4 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 stubs/tpm.c

diff --git a/Makefile.objs b/Makefile.objs
index d4f973a8fc..285c6f3c15 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -62,7 +62,7 @@ bt-host.o-cflags := $(BLUEZ_CFLAGS)
 common-obj-y += dma-helpers.o
 common-obj-y += vl.o
 vl.o-cflags := $(GPROF_CFLAGS) $(SDL_CFLAGS)
-common-obj-y += tpm.o
+common-obj-$(CONFIG_TPM) += tpm.o
 
 common-obj-$(CONFIG_SLIRP) += slirp/
 
diff --git a/stubs/tpm.c b/stubs/tpm.c
new file mode 100644
index 0000000000..c18aac1c73
--- /dev/null
+++ b/stubs/tpm.c
@@ -0,0 +1,33 @@
+/*
+ * TPM stubs
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "sysemu/tpm.h"
+#include "qmp-commands.h"
+
+int tpm_init(void)
+{
+    return 0;
+}
+
+void tpm_cleanup(void)
+{
+}
+
+TPMInfoList *qmp_query_tpm(Error **errp)
+{
+    return NULL;
+}
+
+TpmTypeList *qmp_query_tpm_types(Error **errp)
+{
+    return NULL;
+}
+
+TpmModelList *qmp_query_tpm_models(Error **errp)
+{
+    return NULL;
+}
diff --git a/MAINTAINERS b/MAINTAINERS
index 12175425a7..2650063242 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1544,6 +1544,7 @@ TPM
 M: Stefan Berger <stefanb@linux.vnet.ibm.com>
 S: Maintained
 F: tpm.c
+F: stubs/tpm.c
 F: hw/tpm/*
 F: include/hw/acpi/tpm.h
 F: include/sysemu/tpm*
diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
index c7594796c3..8cfe34328a 100644
--- a/stubs/Makefile.objs
+++ b/stubs/Makefile.objs
@@ -28,6 +28,7 @@ stub-obj-y += runstate-check.o
 stub-obj-y += set-fd-handler.o
 stub-obj-y += slirp.o
 stub-obj-y += sysbus.o
+stub-obj-y += tpm.o
 stub-obj-y += trace-control.o
 stub-obj-y += uuid.o
 stub-obj-y += vm-stop.o
-- 
2.15.0.rc1


