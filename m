Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQ4d-0004aL-F3
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 11:41:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4b-0004Xp-2o
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4Z-00039p-78
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 11:41:01 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35547)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dvQ4Q-00034v-HF; Fri, 22 Sep 2017 11:40:50 -0400
Received: by mail-qk0-x241.google.com with SMTP id o77so871860qke.2;
	Fri, 22 Sep 2017 08:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=s/wKcSNmf1U9i/9PAV8GUsoUwcaK6iHcVPG7aHNgHME=;
	b=JCxoQNLNgFcFpQkNzMCs6hkH/137X1EPXkF+OKEM/56KnEQfhn2ZV4Gt2lbWrUNzXw
	pYubDrd+smXs3gPokJDGZFTbK3HUvtowU7g9t/Coli27V/PkYg+YMLYf/A6b7URxz4hR
	QKKKwo++xH9qFCNJP+X64Fvbbx/nzcu3W6nFdkgPTVtUvXC+eeDhi/swxEYPUS03jAws
	Qo6mUm6Hv1L5e9H128FwLnukT3M9o87wGN7JfuvEnzRqO4KjO5QdzLEnzoJC98wrRwch
	564ZOgfj6hYgjsbEHmwDPfoi/XNx65ikUbhck+MYM8hdk/BrbgLXo1tGB6JGELWP8Jw1
	MVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=s/wKcSNmf1U9i/9PAV8GUsoUwcaK6iHcVPG7aHNgHME=;
	b=qdQhTIQDH9FOb4n67kR+yGxBTBj16gWN7iEWkfAQVv/CDo4D8SiJop9Ft/rx48hOEF
	4WVg4kATciooFwjSEb719gW/6OJLjsS/sbGD7SqAvpoDoXEmsZY3LXE01F2cRY4ikfIo
	Yre2slVokBohKkbu6KGNohbpjxxOj2sj2nk2Y7JFEAOl8EzmDVJ1PmtH/mYCmURamgkZ
	2dFVgvZkh0+Q6tbBqouk9i64ntaCsx6FoQ3WcfabgefcE6kO/4auJ40O0wCw0rViTygw
	KZKOA6/SEYv9x9wlOuZWliXUGhwRVRYwUfWTogCf7eo5Pfcoi6qqGyvG3yj+vSDq4Ygh
	k76A==
X-Gm-Message-State: AHPjjUgXN46FAH/UiYZvxaV88ocMzHAB1tuQhVdXifm2A+l3dMYHildD
	sJp8RbTKNNnVOMP2q/CpUKU=
X-Google-Smtp-Source: AOwi7QDYGyAps3kKoP3cRZEFp92pf0SS9jGABcBrxcKwbBfoxJxn19e21niLsPAVcz/GRYBW1cosig==
X-Received: by 10.55.186.1 with SMTP id k1mr8544821qkf.28.1506094849955;
	Fri, 22 Sep 2017 08:40:49 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id z75sm71742qkb.71.2017.09.22.08.40.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Sep 2017 08:40:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Graf <agraf@suse.de>, Stafford Horne <shorne@gmail.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 22 Sep 2017 12:39:45 -0300
Message-Id: <20170922154014.29350-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170922154014.29350-1-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 05/34] misc: remove duplicated includes
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
X-List-Received-Date: Fri, 22 Sep 2017 15:41:02 -0000

exec: housekeeping (funny since 02d0e095031)

applied using ./scripts/clean-includes

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 accel/tcg/translate-all.c          | 1 -
 exec.c                             | 3 ---
 hw/arm/spitz.c                     | 1 -
 hw/char/xen_console.c              | 1 -
 hw/core/machine.c                  | 1 -
 hw/s390x/css.c                     | 1 -
 target/openrisc/exception_helper.c | 1 -
 tests/vhost-user-test.c            | 1 -
 util/qemu-sockets.c                | 1 -
 vl.c                               | 1 -
 10 files changed, 12 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 2d1ed06065..fb2ad21092 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -31,7 +31,6 @@
 #include "tcg.h"
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
-#include "exec/exec-all.h"
 #if defined(__FreeBSD__) || defined(__FreeBSD_kernel__)
 #include <sys/param.h>
 #if __FreeBSD_version >= 700104
diff --git a/exec.c b/exec.c
index a25a4c6018..a1fe82189c 100644
--- a/exec.c
+++ b/exec.c
@@ -18,8 +18,6 @@
  */
 #include "qemu/osdep.h"
 #include "qapi/error.h"
-#ifndef _WIN32
-#endif
 
 #include "qemu/cutils.h"
 #include "cpu.h"
@@ -51,7 +49,6 @@
 #include "trace-root.h"
 
 #ifdef CONFIG_FALLOCATE_PUNCH_HOLE
-#include <fcntl.h>
 #include <linux/falloc.h>
 #endif
 
diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index feccdb00d3..ac1e15cbbc 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -29,7 +29,6 @@
 #include "sysemu/block-backend.h"
 #include "hw/sysbus.h"
 #include "exec/address-spaces.h"
-#include "sysemu/sysemu.h"
 #include "cpu.h"
 
 #undef REG_FMT
diff --git a/hw/char/xen_console.c b/hw/char/xen_console.c
index 3643dfe067..5e68326c19 100644
--- a/hw/char/xen_console.c
+++ b/hw/char/xen_console.c
@@ -27,7 +27,6 @@
 #include "hw/hw.h"
 #include "chardev/char-fe.h"
 #include "hw/xen/xen_backend.h"
-#include "qapi/error.h"
 
 #include <xen/io/console.h>
 
diff --git a/hw/core/machine.c b/hw/core/machine.c
index 80647edc2a..4ad0e9a082 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -20,7 +20,6 @@
 #include "sysemu/numa.h"
 #include "qemu/error-report.h"
 #include "qemu/cutils.h"
-#include "sysemu/numa.h"
 #include "sysemu/qtest.h"
 
 static char *machine_get_accel(Object *obj, Error **errp)
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 75d4f301fb..3938fa5909 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -13,7 +13,6 @@
 #include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "hw/qdev.h"
-#include "qemu/error-report.h"
 #include "qemu/bitops.h"
 #include "qemu/error-report.h"
 #include "exec/address-spaces.h"
diff --git a/target/openrisc/exception_helper.c b/target/openrisc/exception_helper.c
index a8a5f69b05..6073a5b21c 100644
--- a/target/openrisc/exception_helper.c
+++ b/target/openrisc/exception_helper.c
@@ -21,7 +21,6 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
-#include "exec/exec-all.h"
 #include "exception.h"
 
 void HELPER(exception)(CPUOpenRISCState *env, uint32_t excp)
diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
index 4b98018478..e2c89ed376 100644
--- a/tests/vhost-user-test.c
+++ b/tests/vhost-user-test.c
@@ -21,7 +21,6 @@
 #include "libqos/libqos.h"
 #include "libqos/pci-pc.h"
 #include "libqos/virtio-pci.h"
-#include "qapi/error.h"
 
 #include "libqos/malloc-pc.h"
 #include "hw/virtio/virtio-net.h"
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index d149383bb9..d700caef45 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -26,7 +26,6 @@
 #include "qapi/error.h"
 #include "qemu/sockets.h"
 #include "qemu/main-loop.h"
-#include "qapi/clone-visitor.h"
 #include "qapi/qobject-input-visitor.h"
 #include "qapi/qobject-output-visitor.h"
 #include "qapi-visit.h"
diff --git a/vl.c b/vl.c
index 88ae727486..d6cb6751e6 100644
--- a/vl.c
+++ b/vl.c
@@ -95,7 +95,6 @@ int main(int argc, char **argv)
 #include "sysemu/kvm.h"
 #include "sysemu/hax.h"
 #include "qapi/qobject-input-visitor.h"
-#include "qapi/qobject-input-visitor.h"
 #include "qapi-visit.h"
 #include "qapi/qmp/qjson.h"
 #include "qemu/option.h"
-- 
2.14.1


