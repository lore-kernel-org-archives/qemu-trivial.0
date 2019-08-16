Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1hyn8o-0003p1-VT
	for mharc-qemu-trivial@gnu.org; Fri, 16 Aug 2019 21:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50846)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <3lD1XXQMKDF0EFUBJJBG9.7JHL9HP-OMDQD5GIJIBIP.JMB@flex--jkz.bounces.google.com>)
 id 1hylk7-0000gb-Pg
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2019 19:34:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <3lD1XXQMKDF0EFUBJJBG9.7JHL9HP-OMDQD5GIJIBIP.JMB@flex--jkz.bounces.google.com>)
 id 1hylk6-0007lv-Me
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2019 19:34:47 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:53787)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <3lD1XXQMKDF0EFUBJJBG9.7JHL9HP-OMDQD5GIJIBIP.JMB@flex--jkz.bounces.google.com>)
 id 1hylk6-0007lA-JV
 for qemu-trivial@nongnu.org; Fri, 16 Aug 2019 19:34:46 -0400
Received: by mail-qk1-x749.google.com with SMTP id d11so6873181qkb.20
 for <qemu-trivial@nongnu.org>; Fri, 16 Aug 2019 16:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=uTlU7369N/T6XdZ9PunrkOBg1mbDdKBzc3XGRYISXOg=;
 b=GrFzEz1ENgRQDcegoCd7tCR5LLqQss2QHmRY9OzKraWUDo8hq+xl5VcrL0nqtnwgEV
 qmB39THVr6D2spFKdWio+9BICPS9En8U3xoSpS88wLhyf1ixBJc2Y5dY17EGZMdFq68q
 UqmZjFL9KTiqXNzSZhY+AaRZ4VV5GZqlBlQQFByaWmroh0+/elxuPCGRSKANucBJtxtv
 Lf76XslOxfmeM9EoPLQBHQFgORhcFwCh61W4sZqmSDbQId/A7NJhroHHU+HwJpa2q3kE
 FHXWZTKMwWCV1NT/TY4iiieRjG7pwGVhUjIditPMTOJcQFva7/JR52YYmz4MAibf0f7P
 KZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=uTlU7369N/T6XdZ9PunrkOBg1mbDdKBzc3XGRYISXOg=;
 b=McFHwigyKsWXo0lJB0vHE63lhMeMmId0v73UVRC+pf0l5aXytmF3yZbOy45C2BZniT
 k9G1Umzm8y2UzUcqT6vX56axbx1cJkMR6qamkJwWFbvfmvgXjv3f7wY+LblJKG9lwPxG
 ceUu1S70nk1y/k5okUPgMLIzRecBV1LmCG5jRiugxkMycXIgvvrcVtf4NO4LaZ5v/Q0c
 wlNWViJpUMdoIQDetfEZTE0pyZM8t7o1HAll9zpbaC/Msj4mpQVmdPpVC9BhupEsGDgq
 1yRbLaHUkGYEqvvuq0ByCgmx7SIT6KbJWEopSh7iCX3r/JYS++P41ot+8LBMKBp7yzn7
 9r1w==
X-Gm-Message-State: APjAAAV5Im9a91Fk3YvubD3jiqlTj90MjEoY+4ViilwXr63ouPPftPtI
 Fv94bfaHLJiKfXDorFvZMGfHgjQ=
X-Google-Smtp-Source: APXvYqzZ6dD3kv2dbCqUy+9iMJ84DBwcBv3SHW7vOHvkemwRNK35EXGoUaTV3V3GbGy7KgK/AQLSom0=
X-Received: by 2002:a37:a744:: with SMTP id q65mr4062074qke.151.1565998484831; 
 Fri, 16 Aug 2019 16:34:44 -0700 (PDT)
Date: Fri, 16 Aug 2019 16:34:22 -0700
Message-Id: <20190816233422.16715-1-jkz@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
From: Josh Kunz <jkz@google.com>
To: qemu-devel@nongnu.org
Cc: riku.voipio@iki.f, laurent@vivier.eu, qemu-trivial@nongnu.org, 
 Josh Kunz <jkz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::749
X-Mailman-Approved-At: Fri, 16 Aug 2019 21:04:21 -0400
Subject: [Qemu-trivial] [PATCH] linux-user: Support gdb 'qOffsets' query for
 ELF
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Aug 2019 23:34:50 -0000

This is needed to support debugging PIE ELF binaries running under QEMU
user mode. Currently, `code_offset` and `data_offset` remain unset for
all ELF binaries, so GDB is unable to correctly locate the position of
the binary's text and data.

The fields `code_offset`, and `data_offset` were originally added way
back in 2006 to support debugging of bFMT executables (978efd6aac6),
and support was just never added for ELF. Since non-PIE binaries are
loaded at exactly the address specified in the binary, GDB does not need
to relocate any symbols, so the buggy behavior is not normally observed.

Buglink: https://bugs.launchpad.net/qemu/+bug/1528239
Signed-off-by: Josh Kunz <jkz@google.com>
---
 linux-user/elfload.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 3365e192eb..ceac035208 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2380,6 +2380,8 @@ static void load_elf_image(const char *image_name, int image_fd,
     }
 
     info->load_bias = load_bias;
+    info->code_offset = load_bias;
+    info->data_offset = load_bias;
     info->load_addr = load_addr;
     info->entry = ehdr->e_entry + load_bias;
     info->start_code = -1;
-- 
2.23.0.rc1.153.gdeed80330f-goog


