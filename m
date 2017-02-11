Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ccOc8-0008UJ-93
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2017 22:44:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ccOc5-0008UA-Gd
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 22:44:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ccOc2-0001K0-DV
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2017 22:44:41 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33081)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ccOc2-0001Jq-9F; Fri, 10 Feb 2017 22:44:38 -0500
Received: by mail-qt0-x243.google.com with SMTP id n13so6753217qtc.0;
	Fri, 10 Feb 2017 19:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=O2P6l0yiJDHkQ2c0a+J1QUFS0ozUv4J4VxEBTPadCdE=;
	b=m2ula7z49d+1LhJt5MCb4QB/0pbw+lu9K4Ev0zRvGpqaFFCB63SYWsX1VZLUpPvGZg
	Udk/xHbWk0P8LFcCjs0TiulJSty+V6zw1JemOXYDFs3QU4GnTRnLRfI2PST1qjWj/d4J
	v0B4aPz1pXnPZKcO4ezTGKPfgkqMLKC1evjF2wLHzqnZA84XgGO+EK9J68sb8TpNguZU
	xiONqvH2W1HfHpt24VYXmJ0HJhDunpT7alFpmOBOiffHk/cxgf32l/KokM0+dy5boKxR
	C0gGad7Q5EWGGsitdsfTOrCZI+hiXorbrZvCyoYizklXFFF8P0Tk4CTKgzzb7zNAnGH3
	+YJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=O2P6l0yiJDHkQ2c0a+J1QUFS0ozUv4J4VxEBTPadCdE=;
	b=g1r2lQ2hZKuCyk/QxXsbrU81eKI6uW2Qe33t6MaQNGOUNuq2U16yHTPgn0KCgy69ge
	qQLyJgWTPWeTxNLHYkZGeRwxd1j+f5970JFb1jHDR3T2H98Lt15EVBDLGWGi5kIoFkri
	gnjhRnHQczEWsLelqW+YnoN0b8zymsskUNwGV3YHSyg9mSnezuX2dpHGnsV/h1yfSOuJ
	yvW9fZjpbNKMiyR9omvgqSh5OPxrNTcblAe9hY3LFu6E0ugRrp0h/f6h1J3OfJbTdU0X
	xni998f+AYRfiB/7g6Z4/DS+OVJ4DYz+sd9JuRw1weLzXB50oNoB96VGT9LOPILBOdiG
	ep9Q==
X-Gm-Message-State: AMke39lEEiHxdPTotYKjNhDEYAO3R9RZzxw5a5twKga3w//0Yn4brxIuMDBJTt+6GYIFPQ==
X-Received: by 10.200.46.36 with SMTP id r33mr12297066qta.92.1486784677492;
	Fri, 10 Feb 2017 19:44:37 -0800 (PST)
Received: from yoga.lan ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 43sm2999918qty.26.2017.02.10.19.44.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Feb 2017 19:44:36 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Date: Sat, 11 Feb 2017 00:43:32 -0300
Message-Id: <20170211034332.12498-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <CAKmqyKMYmNeOOogS4+yv14M2CWTbBNtBP0jnO0DQEuScSp8eYw@mail.gmail.com>
References: <CAKmqyKMYmNeOOogS4+yv14M2CWTbBNtBP0jnO0DQEuScSp8eYw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v2] register: fix incorrect read mask
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
X-List-Received-Date: Sat, 11 Feb 2017 03:44:42 -0000

The register_read() function expects a bitmask argument. To avoid duplicated
code, a new inlined function register_enabled_mask() is introduced.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
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


