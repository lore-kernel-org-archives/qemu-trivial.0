Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jRiKZ-0002JP-91
	for mharc-qemu-trivial@gnu.org; Thu, 23 Apr 2020 16:20:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRiKX-0002GN-H2
 for qemu-trivial@nongnu.org; Thu, 23 Apr 2020 16:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jRiKW-0001Zb-Mg
 for qemu-trivial@nongnu.org; Thu, 23 Apr 2020 16:20:17 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:46451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jRiKW-0001V6-0l
 for qemu-trivial@nongnu.org; Thu, 23 Apr 2020 16:20:16 -0400
Received: by mail-wr1-x441.google.com with SMTP id f13so8129164wrm.13
 for <qemu-trivial@nongnu.org>; Thu, 23 Apr 2020 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzNcoSaHAxnC2uxrv5wEs3MnYadshJL173MPoerjSJs=;
 b=ZxCVaVATqzDtxHkVpAKLax76QNbBsWfQpnKnJWtP+DLiZEBDJ7CgaLxI/kgGWewESr
 LJQjrBkLRqiYQkWkf+4Jc5IBiM8mMJuaNUZJXJlyZUDacgULXT83Jnkrl2Nzq/NhvjWR
 i3A648MXV2kO4aT6YxcwNGKQFi2Ouv86uOaPKO6losOWBiGK+x3s0pIlgIQldUM3GL+h
 iZDIYlynL7Yx0BYItyJW8Y0/nVXO0pkw8U7fCX0vdqL59lx2sQbm3q/UuzyoU7mPyWUX
 RC1kwZmhqLXo43zLfQwUb0xBkYkNXzcWzUsdkMEeXA2YBlWN35hllZvP4AgtwTOgYmRa
 CmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uzNcoSaHAxnC2uxrv5wEs3MnYadshJL173MPoerjSJs=;
 b=tCFo/qqGJ9l/Z7aC9jw7XTsGpLCJMPwPiTZhqvrpAsqObwOTd4MYIxdqDW9eSG6IrI
 Gzy9baxLAujvtt8glVMnY55lpJgYd2sGU1jtM7QeegFgVVlq5w+BamN6lWqdRh3qy/+C
 B2Ds7eGh0htB2AbTMvtVO1+z0RsAgNlJU0XbbvnwW8iw/xAo19gLvSMqWaEW4bUO8PMw
 aTCaub3kfeyUKmEiCQRTZj/gfLJ8UXlzk1ISoKW2p1S+gQdKCtzgXxZ81J7p0r10An1D
 nmVBfc9zhmjGJ9yj+pItOfbDMjOysBhV6HBZaNkCRzqE30+c0I7d3L2CkrMNA3qIQB0V
 Wf9Q==
X-Gm-Message-State: AGi0PuaU1U7yeFU8Fzgt5WMVnQC3sFybLsad112zVEz/Hj5dcuju0oPa
 V0omShTTzn9DRvAZjNxuQ6U4Kw==
X-Google-Smtp-Source: APiQypKZMh/f0iwH4Fxvz1muefMi8nuA1G6xiow7VLVE5+E9mVK8rDQfWDzAWUPK1yy1KWUhowNVMg==
X-Received: by 2002:a5d:6b86:: with SMTP id n6mr6697619wrx.113.1587673213824; 
 Thu, 23 Apr 2020 13:20:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id u127sm5149308wme.8.2020.04.23.13.20.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 13:20:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Randy Yates <yates@ieee.org>
Subject: [PATCH] elf_ops: Don't try to g_mapped_file_unref(NULL)
Date: Thu, 23 Apr 2020 21:20:11 +0100
Message-Id: <20200423202011.32686-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::441
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
X-List-Received-Date: Thu, 23 Apr 2020 20:20:18 -0000

Calling g_mapped_file_unref() on a NULL pointer is not valid, and
glib will assert if you try it.

$ qemu-system-arm -M virt -display none -device loader,file=/tmp/bad.elf
qemu-system-arm: -device loader,file=/tmp/bad.elf: GLib: g_mapped_file_unref: assertion 'file != NULL' failed

(One way to produce an ELF file that fails like this is to copy just
the first 16 bytes of a valid ELF file; this is sufficient to fool
the code in load_elf_ram_sym() into thinking it's an ELF file and
calling load_elf32() or load_elf64().)

The failure-exit path in load_elf can be reached from various points
in execution, and for some of those we haven't yet called
g_mapped_file_new_from_fd().  Add a condition to the unref call so we
only call it if we successfully created the GMappedFile to start with.

This will fix the assertion; for the specific case of the generic
loader it will then fall back from "guess this is an ELF file" to
"maybe it's a uImage or a hex file" and eventually to "just load as
a raw data file".

Reported-by: Randy Yates <yates@ieee.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/elf_ops.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index e0bb47bb678..398a4a2c85b 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -606,7 +606,9 @@ static int glue(load_elf, SZ)(const char *name, int fd,
         *highaddr = (uint64_t)(elf_sword)high;
     ret = total_size;
  fail:
-    g_mapped_file_unref(mapped_file);
+    if (mapped_file) {
+        g_mapped_file_unref(mapped_file);
+    }
     g_free(phdr);
     return ret;
 }
-- 
2.20.1


