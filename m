Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSBSM-000609-U7
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jun 2018 21:17:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSH-0005w4-Ex
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSG-0003TB-Eg
	for qemu-trivial@nongnu.org; Sun, 10 Jun 2018 21:17:09 -0400
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:37918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fSBSD-0003Qa-7I; Sun, 10 Jun 2018 21:17:05 -0400
Received: by mail-qt0-x22c.google.com with SMTP id x34-v6so18852644qtk.5;
	Sun, 10 Jun 2018 18:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=DAm0KVW+bquvukwZTPf8szxRQqAt6KoNkZBAq9UiGRk=;
	b=d3p+sDws9qGdxwbjB5fLMNGOYol9I2FMMgIkt0eG4i6fXX/nJsRcaa0qEP6j9akHl4
	13KRtOb507G1CZhVSvLXIv8f/nhP91D2ooHHiJ42wF7j/CCKDaqgyL+EKzc/1WUsIy+K
	P8ktgYFmGMzsu8LqrJaWHrYPEv+ZAmRxM4yd2B8FJ6bayPeXu5F4ITfrBL6mf2hsWhbR
	LfEhuLjPMK3sZFx4z+z4jvfOE5dbEWg8NYK4js5tfOUTH9q0u0E8zukeao02+pfmnfC4
	KES9qYpfp+J1PXep7NW3bPgzpq7hbt22DvdkOg/lnOvs5ZneuS0Cslj4IhS1ZBeoUjea
	Sp/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=DAm0KVW+bquvukwZTPf8szxRQqAt6KoNkZBAq9UiGRk=;
	b=kYecX8M6XKdrM2jvlXA7zQvupZduPScVJO+ZWJIzjNrYiz5/nPiyuO5YQWymKybO+q
	Ec3Awf2UD3NFqTRq21j6KCum319QVIRcLm+X+JVdZykXPalTO+lbNb3zAs1jvgo5J2ZT
	KCBi/IyWIDxIUJrdt/XHkmILQdyRremp72ovOwjpW0ET5ykVWN/1mUjPbaMJ/1tGJyqJ
	TuMYhdDRHmUKN1nHu8X3FCUdzqI8cboI9EgZvuSiWEuiGgRYhiZY0WMOOTxaqXrYzQPb
	afzEh+nLFzOOtodDBpbxDH6bjFYaQfPe48wYKvrmSfiBx7vl8k1J4CBPGTAweqJtX9M7
	F/IA==
X-Gm-Message-State: APt69E1jUqTPxaqDF2n4yWJQbLV9dYdG9WEKzRUpltYjLTuP5ad7LqIf
	30qtEj1H1bHhMtk0GkDLW1Y=
X-Google-Smtp-Source: ADUXVKLeMyHTScyDcX3iOLafM/EN953biwHAgPtOu78itM9NOjPBWGpRud8iBLC9C6XGTBta58Gcww==
X-Received: by 2002:ac8:300e:: with SMTP id
	f14-v6mr13756939qte.89.1528679824776; 
	Sun, 10 Jun 2018 18:17:04 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	o5-v6sm28237223qtm.60.2018.06.10.18.17.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Jun 2018 18:17:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@mips.com>
Date: Sun, 10 Jun 2018 22:14:50 -0300
Message-Id: <20180611011501.10235-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180611011501.10235-1-f4bug@amsat.org>
References: <20180611011501.10235-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: [Qemu-trivial] [PATCH v4 29/40] hw/mips/r4k: Constify params_size
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
X-List-Received-Date: Mon, 11 Jun 2018 01:17:11 -0000

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
2.17.1


