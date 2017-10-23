Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e6kMo-00005u-G7
	for mharc-qemu-trivial@gnu.org; Mon, 23 Oct 2017 17:34:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMl-0008Uo-HA
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:34:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMk-0000DO-JB
	for qemu-trivial@nongnu.org; Mon, 23 Oct 2017 17:34:35 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:48779)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e6kMi-0000CK-5Y; Mon, 23 Oct 2017 17:34:32 -0400
Received: by mail-qt0-x241.google.com with SMTP id f8so28047154qta.5;
	Mon, 23 Oct 2017 14:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=4qmuRjttY0F6mS/4IQEKKo3NhWyfY7E6Gt+msSMN9Ow=;
	b=cbalahLYj3A98nCq2kbGFU2/l5OJQUMvkrztA8VgavZUz6azmm2eBNBI+I0SaVi/Jg
	kflFj4UVmu4PlAXMyHRU6+APHYrBSg2/nJQes8+jvzevJJGjHaKrBjmf78i6tAUXRwYy
	bEj75yDukQSPFpAoTrVUveb3ObOFSkNCiCgpPjOVj9942MFKF5Wg4QPNSU8mYY3K+5FQ
	Ex5m0UorDlJV9c6LhvQQ0WwHrUBlWIWbP/ynoto4Peg2DamH2yisZ6lwiqnALM607Wfq
	97bOS3a0b6lgbnKKce82gCICzsewyg7X4zQStF40YlbZ9FDan4x5CWWoJElZhXBFBU0V
	R3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=4qmuRjttY0F6mS/4IQEKKo3NhWyfY7E6Gt+msSMN9Ow=;
	b=tkyksIVZLQrq8uBPV/6Pc5JAqr3R10MatW915KIhuOhYeQYU0ex5BFn0frkBnNccAp
	aXvTOWD9tZ8wWPdeGhW9uzf7mu4OgC7/SoRpY2OZ3nNhcEq6quvbU3RdLB7KKLlpLsVk
	L5Ib/bBxyG1wimquuYfkHbaP1FOfuSCzhOj/yZA/qw/wvyEf5ZGxNagqE0C0zU/WVTBp
	zVQWmryLRUT+IQgl8MeqUb+NNiT3KVBJ+Uhy4GFfXG6EzZLfQDvhWJqCNyYwuao5zDqM
	fcXVyDPDTTuI3mpkF4Ou3rJjjjfPvoutBexDtq2+UDGQo4MG8zvLGbRxsYgrATNuFZyC
	yd8w==
X-Gm-Message-State: AMCzsaUw9UUmkgvkwZopN/w7OFAlsX1VwlpdSJUcze2AmsZk0vxOVyBG
	cfZFX7YqIamsHci02XRgZh9THEUe
X-Google-Smtp-Source: ABhQp+TQvaR5hsn2Sd/nZSS4jOxSFSEi/UZup/6+cyhSuZs5uBbrt+bdR/WyC9dSZ0O0KZqEvewP3Q==
X-Received: by 10.237.53.92 with SMTP id b28mr23077527qte.280.1508794471617;
	Mon, 23 Oct 2017 14:34:31 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	s51sm5568381qtk.32.2017.10.23.14.34.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Oct 2017 14:34:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	"Richard W . M . Jones" <rjones@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Stefan Berger <stefanb@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>
Date: Mon, 23 Oct 2017 18:33:58 -0300
Message-Id: <20171023213359.23025-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc1
In-Reply-To: <20171023213359.23025-1-f4bug@amsat.org>
References: <20171023213359.23025-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 2/3] tpm: add stubs
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
X-List-Received-Date: Mon, 23 Oct 2017 21:34:37 -0000

this fixes compile with --disable-tpm

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Message-Id: <20171023102903.256AF7456A0@zero.eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 0000000000..6b90557e42
--- /dev/null
+++ b/stubs/tpm.c
@@ -0,0 +1,33 @@
+/*
+ * TPM configuration
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


