Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQrF-0002CB-8m
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:44:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrB-00028Q-DA
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrA-000878-IS
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:44:33 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:46354)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQr8-00085s-Fc; Mon, 25 Jun 2018 08:44:30 -0400
Received: by mail-qt0-x236.google.com with SMTP id h5-v6so11723073qtm.13;
	Mon, 25 Jun 2018 05:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DpGDAANFeItaqjBmVNhj5xTyltU2NnM6H5rOAOaCg2Q=;
	b=hwdKyb/PxyPZ9LwwAiu+miH62Vg1ihHxIU/wswOrwgh5/0S6LT1yHqAMCcBSZQmzqP
	FPV7AZOcjEIXFDMIZRZux1LrZwJfpZLnwGXbskAySeGq6dWYzy7lBD/Cqv7OMx1rcgMO
	ywN4A6Xt0B+6AkBvNwrI69e3V4WuaHFXeV2fViFgwuBBpL/2Id6yqTsEas2Ue/q8VJ9e
	iS1XNpNS9npd8hz9cnV2XWsTv/Wr9bQjZ4bgYXW9ITz7+LVY/6GHi9jWRuNLuRb8lUrX
	aEvPGHzo8estXusy3cV+cv9awevn8PCDZ0jx5fhX3Kv+5lF5d77W4TetESgpXcSOvh2W
	XD+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DpGDAANFeItaqjBmVNhj5xTyltU2NnM6H5rOAOaCg2Q=;
	b=GQo7mDJ3PvnQfaMCasnJAuj7mqNVY6CYW+DRAVUdumfOOq8ee0/zMMWw1qyUsgk2Jp
	spBRwzox6sVT5sfcJJnwkF/I7dNEjG1qL8eiq7hzqnP8HS5aeVITpVClen+DWqqK8uGL
	pPZefdYoDWuJ4rUEkhJEA/ukOJM+WVmXajW5kB9zZwTx/0O6+fHefy74mPG9ALM/XLv6
	QRkxbIZUD8Samb/EtmthvJBCCqdLGuj9LuPCLDz0K/0+oW48zHJ74IPQyiIs9l6jHKpF
	/ZbTFOrYfNUvbpIxo+fhmcm7k/oTM4HzgGi+3oNCibKKVt9SFqiGS0riU2MZTYsSGzoa
	pLzw==
X-Gm-Message-State: APt69E2r0bh8mhwlbQ6sWF6HtGSEIuXiPihWQ0eL+VvJhHREGvxGakFh
	J6ytwKSy11PL2irTW8PNYDw=
X-Google-Smtp-Source: ADUXVKJ4ERL9VPn2LPBoAgZIP/SoKQMNwEsz9xrly9qU/ue6brSmD11WdqqrmttqgCTitYH4Nzh4OA==
X-Received: by 2002:ac8:2e83:: with SMTP id
	h3-v6mr10554938qta.365.1529930669986; 
	Mon, 25 Jun 2018 05:44:29 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.44.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:44:29 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@mips.com>
Date: Mon, 25 Jun 2018 09:42:21 -0300
Message-Id: <20180625124238.25339-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-trivial] [PATCH v5 29/46] hw/mips/r4k: Constify params_size
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
X-List-Received-Date: Mon, 25 Jun 2018 12:44:36 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/mips_r4k.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index e5cf8ed1a3..fc38b4bf99 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -79,8 +79,9 @@ typedef struct ResetData {
 
 static int64_t load_kernel(void)
 {
+    const size_t params_size = 264;
     int64_t entry, kernel_high;
-    long kernel_size, initrd_size, params_size;
+    long kernel_size, initrd_size;
     ram_addr_t initrd_offset;
     uint32_t *params_buf;
     int big_endian;
@@ -128,7 +129,6 @@ static int64_t load_kernel(void)
     }
 
     /* Store command line.  */
-    params_size = 264;
     params_buf = g_malloc(params_size);
 
     params_buf[0] = tswap32(ram_size);
@@ -143,7 +143,7 @@ static int64_t load_kernel(void)
     }
 
     rom_add_blob_fixed("params", params_buf, params_size,
-                       (16 << 20) - 264);
+                       (16 << 20) - params_size);
 
     g_free(params_buf);
     return entry;
-- 
2.18.0


