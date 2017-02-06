Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cb7Ii-0007Bx-Kk
	for mharc-qemu-trivial@gnu.org; Tue, 07 Feb 2017 10:03:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1castE-0001EA-Hp
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 18:40:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1castD-0001VS-TA
	for qemu-trivial@nongnu.org; Mon, 06 Feb 2017 18:40:08 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33502)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1castB-0001SV-Ph; Mon, 06 Feb 2017 18:40:05 -0500
Received: by mail-qk0-x243.google.com with SMTP id 11so10898201qkl.0;
	Mon, 06 Feb 2017 15:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=oNwpzTmz9xj76Q9WhHHRpyOBSf0BPOFlIQQ+bgOmWt8=;
	b=Jiy7K1qD5rLu5XinmDQVgzT4KU+RzVeiyV7ef/c/jhV7V3KGO8eIXuOyKhiORyQz+Q
	68S/D7njDI2zbg4DoTZnvfVwMUATcw6aOdMQGx5Wr8/mxCygmLBKwciBAm/Yx9+jLbdq
	GAfuY+JIfv02+YIlBm52adcQlKGVyab5DDSLRyYh0kxred/ILuZrCzLN/1xle4DVi25O
	jYDz0pyZUrVzkitns8Es5VuXByKBgjNGgxIRGPOdmaECclSo/C+rzMU7/70ULnIduQbt
	6vpcfrFZ/qjz94S1TtwXYWhCP8x9WebJ1uL2OIlkj4zOEGtkQ8E81l23RYAeuerxEJ0f
	fVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=oNwpzTmz9xj76Q9WhHHRpyOBSf0BPOFlIQQ+bgOmWt8=;
	b=SKdBlewSx49pIuWyfdwdkEjElox5e/Dwddg3qHCuteGfyRN7KIsXQKf2/xlOaIn2Th
	VT/zuhSOo78Wt6Kn0UPbm7RcCZASVeY0L58x0MwXh7r4qYC60/MvkVHvehYDRxqho35E
	QAZt2Qq8VYotq92WpnUSjG89uLcdy4NYcBuD3rJhqHx8UQhP5u6RnM/bmB71GEG5A3vu
	kxZzM8tGhWXPk8CVDNhWQwiPdu4ijE5YmfIBCkpeQVGW/9crBvHbJYJ8hoDu/yU9u5Kt
	bJ4ptCpmh/5XkaCCBJ+l+MThF6NHrcBB1Ak6nvuXDcQLsW6Zf4d+PtdF8T6NhEiy8sXc
	D1Tg==
X-Gm-Message-State: AMke39mfQwYUDyB3euPJ/WBjq8y12O7HjaxZpSF6XzN8QpJpJWJwYjXW/g5s2VZHntmFOQ==
X-Received: by 10.55.114.132 with SMTP id n126mr11702139qkc.112.1486424405171; 
	Mon, 06 Feb 2017 15:40:05 -0800 (PST)
Received: from yoga.lan ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 37sm1817879qto.43.2017.02.06.15.40.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 15:40:04 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon,  6 Feb 2017 20:39:30 -0300
Message-Id: <20170206233931.14921-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170206233931.14921-1-f4bug@amsat.org>
References: <20170206233931.14921-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::243
X-Mailman-Approved-At: Tue, 07 Feb 2017 10:03:22 -0500
Subject: [Qemu-trivial] [PATCH 1/2] register: inline register_enabled_mask
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
X-List-Received-Date: Mon, 06 Feb 2017 23:40:09 -0000

This patch prepares for the fix of register_read() incorrect mask.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/register.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/core/register.c b/hw/core/register.c
index 4bfbc508de..12f4c1e62d 100644
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
-- 
2.11.0


