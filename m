Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cdm1E-0000Sd-PC
	for mharc-qemu-trivial@gnu.org; Tue, 14 Feb 2017 17:56:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38563)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cdm1B-0000RL-St
	for qemu-trivial@nongnu.org; Tue, 14 Feb 2017 17:56:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cdm18-00027L-SB
	for qemu-trivial@nongnu.org; Tue, 14 Feb 2017 17:56:17 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33501)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cdm18-00027A-Nh; Tue, 14 Feb 2017 17:56:14 -0500
Received: by mail-qk0-x242.google.com with SMTP id 11so21058168qkl.0;
	Tue, 14 Feb 2017 14:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=SzYab0g/Gz+plr7lububySTaiRRc78KHjSkpDcv6TaU=;
	b=HTDH7V/TBsjE0IgEgjrFh9A5UmSW728sVMDQ9RbNH59bzeHgkghamAoM4hTlfYkNR+
	yOGAk7Mfd7oN532B2cxB6bpGVhfjBCQfu24jiWNOYOtfMDHA3Y/2BZJauN+37Qr6s0bg
	Ct14UEIklPssXPVqYhZGgVxoNotyg9GJwC9x8FfDxluljRNr5BRkbIMhLhneKzJsIA/V
	lZ761XMWcaQOMaHfYnf3EdxoJK3qIw2kRQYrPfInNYSS1rre/Z6FiOuga04qAf9zPWFM
	xZRRVTpTZZt4AZIC8JGQFufubJJHJlBds4Ubq9B6MqYnNKb06BeiBF1RrdBzY2NUoJ/d
	gHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=SzYab0g/Gz+plr7lububySTaiRRc78KHjSkpDcv6TaU=;
	b=mXYVPOmi/52ShqqZf7KtnJY5NUYUtmjyUtdToZOemrRBuSE0gAE36pSssyCrdIr0x8
	vmndc6PtYQWUQTg/AR5jZYDn1lDaDfNWvPX6rdNE/3JtB6l0n4ZY1YFMQjIzr3V2rcBI
	ceQ6M9J6ESBaSHgfOkr5Z5dGtVjN/Xp/IArEG0iJm5LBDBBgGBm3Di/qe/9HeC9jabRg
	444LhkxvXo057WBLZx5IUaS9swP5jOhNX8LlxsFZ1GucLpea+v6lwwykw01DRU/yL0cv
	sW+nfhS02TSBCE72yqueFeGQlLNIo5t8iK2LdRnFvp8u0imV9WYGQTmzFoCxJh0PtptL
	gK9g==
X-Gm-Message-State: AMke39nPoFAC9tJu0ueKfww6sdDKHJhcyFsn/UkFtSKqpNJnCYyEpUE+GU9Fxxnlo9aopA==
X-Received: by 10.55.165.131 with SMTP id o125mr29451797qke.254.1487112972562; 
	Tue, 14 Feb 2017 14:56:12 -0800 (PST)
Received: from yoga.lan ([138.117.48.226]) by smtp.gmail.com with ESMTPSA id
	x64sm1167965qke.60.2017.02.14.14.56.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Feb 2017 14:56:12 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Tue, 14 Feb 2017 19:55:35 -0300
Message-Id: <20170214225535.6880-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH v3] register: fix incorrect read mask
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
X-List-Received-Date: Tue, 14 Feb 2017 22:56:19 -0000

The register_read() and register_write() functions expect a bitmask argument.
To avoid duplicated code, a new inlined function register_enabled_mask() is
introduced.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>
---

 v3: clarify functions affected in the commit message.
 v2: squashed together both previous commits as suggested by Francis Alistair.

 hw/core/register.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 4bfbc508de..482e3f827a 100644
--- a/hw/core/register.c
+++ b/hw/core/register.c
@@ -59,6 +59,15 @@ static inline uint64_t register_read_val(RegisterInfo *reg)
     return 0; /* unreachable */
 }
 
+static inline uint64_t register_enabled_mask(int data_size, unsigned size)
+{
+    if (data_size < size) {
+        size = data_size;
+    }
+
+    return MAKE_64BIT_MASK(0, size * 8);
+}
+
 void register_write(RegisterInfo *reg, uint64_t val, uint64_t we,
                     const char *prefix, bool debug)
 {
@@ -192,11 +201,7 @@ void register_write_memory(void *opaque, hwaddr addr,
     }
 
     /* Generate appropriate write enable mask */
-    if (reg->data_size < size) {
-        we = MAKE_64BIT_MASK(0, reg->data_size * 8);
-    } else {
-        we = MAKE_64BIT_MASK(0, size * 8);
-    }
+    we = register_enabled_mask(reg->data_size, size);
 
     register_write(reg, value, we, reg_array->prefix,
                    reg_array->debug);
@@ -208,6 +213,7 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
     RegisterInfoArray *reg_array = opaque;
     RegisterInfo *reg = NULL;
     uint64_t read_val;
+    uint64_t re;
     int i;
 
     for (i = 0; i < reg_array->num_elements; i++) {
@@ -223,7 +229,10 @@ uint64_t register_read_memory(void *opaque, hwaddr addr,
         return 0;
     }
 
-    read_val = register_read(reg, size * 8, reg_array->prefix,
+    /* Generate appropriate read enable mask */
+    re = register_enabled_mask(reg->data_size, size);
+
+    read_val = register_read(reg, re, reg_array->prefix,
                              reg_array->debug);
 
     return extract64(read_val, 0, size * 8);
-- 
2.11.0


