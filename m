Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f7rJ2-0004N3-7X
	for mharc-qemu-trivial@gnu.org; Sun, 15 Apr 2018 19:43:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rJ0-0004KY-2K
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIz-00009C-9x
	for qemu-trivial@nongnu.org; Sun, 15 Apr 2018 19:43:34 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38590)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1f7rIz-00008a-5I; Sun, 15 Apr 2018 19:43:33 -0400
Received: by mail-qt0-x241.google.com with SMTP id z23so13561766qti.5;
	Sun, 15 Apr 2018 16:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QhY06qKl3znwZvKZLIq0uZmF4mSh89y+JxRVcxXXcaE=;
	b=YXxTTGn4oT+46bXPEUs3q5N50FR3rfrwXAYetRWagYJxB+nctE194tcyRwOEcZ8OnQ
	8HlD7wOCY+iKLKhGZJhsthRMENBCFm9gMsSAYEhWKwlDT1bu0xzWhzQkwq5uzkBbEXdF
	0hxp3Y1RqjRaZe1r04EJnGsZNO/ITAyb/NUj0BFHX/TGnLCHETBLIYvvZStRdrCOJ+sv
	o1c0GBT94nSVghtW6a+oJq0oSFI6tjF52RqPy6nhgHj4XjDvXJSjKBhMpSq8xbxOL3CY
	F/t84BfA4S6TSAJr7+W/iME91/OS/d3D8Uhr9UIzDlwTFpoJ++AIIHpaMUz/LPxzZvKr
	K+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QhY06qKl3znwZvKZLIq0uZmF4mSh89y+JxRVcxXXcaE=;
	b=MQxW1PWs6f7u+S/aXPin5fHLWc/jAvEl+wvCR1Nl9qOj1SwqjCJEOja1u2oVu7JLoS
	rkzp5Ev2le7ozBM/+bMWqSLcm7cpiAygkowoLAkJFN2Y0LANfIZi+wgkEpMpwhc9GjxS
	fZXNNdbzG+3EsINjlzqnh0RHFwRXIK0Usv7xQs+WzMxSOng3i/t+ZZc1vZUjmUt9oIK7
	4T4TNz73Z3Qr5/VzswDxSf+sQsJe28E8eWqKYYzVsCN0kpdtHxkUuCeq12Sws0KTUV0z
	UumvBgZjLH5PwQvLhjUVRzmZI2jMyde+gN9Gj2wS1kQt3xmBvrjtCVPhOE75A310hg+v
	TL9A==
X-Gm-Message-State: ALQs6tBRsKn437kGI0zJ+FhxqJFfxKAfI4en3e/j+NyZNY4LS1VuAglf
	LCHn9X1VtjGwrdttVbLDwHunGBk1
X-Google-Smtp-Source: AIpwx49nXR+d6X8ksrs8nXY9GdjxtDeofEyJvJ4+Xju0V591gyDsXqOWYGmtOGotb9cf3doN6CDCAQ==
X-Received: by 10.200.47.180 with SMTP id l49mr465993qta.195.1523835812542;
	Sun, 15 Apr 2018 16:43:32 -0700 (PDT)
Received: from x1.local ([138.117.48.212])
	by smtp.gmail.com with ESMTPSA id d1sm1081394qtk.57.2018.04.15.16.43.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Apr 2018 16:43:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@mips.com>
Date: Sun, 15 Apr 2018 20:42:31 -0300
Message-Id: <20180415234307.28132-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180415234307.28132-1-f4bug@amsat.org>
References: <20180415234307.28132-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 05/41] hw/mips/r4k: Constify params_size
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
X-List-Received-Date: Sun, 15 Apr 2018 23:43:35 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/mips/mips_r4k.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index aeadc4a340..c26a44da06 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -80,8 +80,9 @@ typedef struct ResetData {
 
 static int64_t load_kernel(void)
 {
+    const size_t params_size = 264;
     int64_t entry, kernel_high;
-    long kernel_size, initrd_size, params_size;
+    long kernel_size, initrd_size;
     ram_addr_t initrd_offset;
     uint32_t *params_buf;
     int big_endian;
@@ -129,7 +130,6 @@ static int64_t load_kernel(void)
     }
 
     /* Store command line.  */
-    params_size = 264;
     params_buf = g_malloc(params_size);
 
     params_buf[0] = tswap32(ram_size);
@@ -144,7 +144,7 @@ static int64_t load_kernel(void)
     }
 
     rom_add_blob_fixed("params", params_buf, params_size,
-                       (16 << 20) - 264);
+                       (16 << 20) - params_size);
 
     g_free(params_buf);
     return entry;
-- 
2.17.0


