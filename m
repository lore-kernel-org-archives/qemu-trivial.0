Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8qnY-00013E-1R
	for mharc-qemu-trivial@gnu.org; Mon, 02 Mar 2020 14:32:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56772)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <3OV9dXgYKDGYcYERdMKSSKPI.GSQUIQY-XVMZMEPRSRKRY.SVK@flex--yuanzi.bounces.google.com>)
 id 1j8qnV-00010G-2s
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 14:32:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <3OV9dXgYKDGYcYERdMKSSKPI.GSQUIQY-XVMZMEPRSRKRY.SVK@flex--yuanzi.bounces.google.com>)
 id 1j8qnU-0006cI-6N
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 14:32:13 -0500
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49]:56274)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <3OV9dXgYKDGYcYERdMKSSKPI.GSQUIQY-XVMZMEPRSRKRY.SVK@flex--yuanzi.bounces.google.com>)
 id 1j8qnU-0006bD-3G
 for qemu-trivial@nongnu.org; Mon, 02 Mar 2020 14:32:12 -0500
Received: by mail-qv1-xf49.google.com with SMTP id l7so473798qvt.22
 for <qemu-trivial@nongnu.org>; Mon, 02 Mar 2020 11:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=hlNAWP5jM40m2wMOQj0Q5tTaNJybDDFU+n7WZSCMPF0=;
 b=XZ/lyYIFFuX83TwZG+uZ9tvC4uGnPqlL01CdrpHS4N6O4aALUfN9ZHFuW0Zm0S2PPI
 ai7/OPdemhIcRujHYRNR3NnQRMah1uaNSjVZMRULTOVyfx9TVLX68dylCNDHtzcgikOt
 G8zA0m5K1qMb7tSr51jgfpHQzXSkC/Ln59TjoUUqld2G0sg/1kEfXpzAVnBOjEZZQPVk
 L4hIA4fPGeRdTl/ZtoU5v7dcQfq3y9y85vHFTWmH35fm8fxDI+z+JURXUMNa3qUCTii/
 AZzMquGn5q+R3DKbm72dyitVpJGZ2I7rZSvpKLvG+1/a1a6LK2Wh+t68VCmqAwH+XsMZ
 6BCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=hlNAWP5jM40m2wMOQj0Q5tTaNJybDDFU+n7WZSCMPF0=;
 b=k01fjoc0LsiFNWa5pF/xepjjdlxKeLZskK5gUpStex01STU13fv6piTyZVuyE+sqJG
 jVFiCKzKANz8+9MogLiLS/S8tJBxh3BGU7GJv8dKuISmunCskEsRWq6h6dee2d0TQjT3
 3EEKsECdZW/66jNhuG6P8DHAVZv5rwZKkFieCFHfSP6vN0FiBYx2HnXqLrz6VfNC5iH/
 mZesA28gPGxZM7VaHCYeXVZu8HKxRoEJa+U/6DI4urPyTtFeKKQEou2hJN7WSaejJMYL
 cvRRNdvyjDLuFPZ6/me0TwOLl0CDLEzNn3ThprlbnzceoeQMnMfwdpXDVkcq+xncHhPc
 l+gg==
X-Gm-Message-State: ANhLgQ0/GHuy0+Aqn4oC2mjMWwD/teDRGA/g0PR/i1D7aM2pZv4R1Qm9
 VhCBVbuWkjEQGk0CmlXWuqxIUFbRIG8=
X-Google-Smtp-Source: ADFU+vscas0Rfzg7id+RYhlB4QfVkcj26+NW8lyRQlGvmaXBqybMqwJhDCeKwGd/q8yHNhwwSIGq+pzLP8o=
X-Received: by 2002:a37:9b15:: with SMTP id d21mr781636qke.107.1583177529298; 
 Mon, 02 Mar 2020 11:32:09 -0800 (PST)
Date: Mon,  2 Mar 2020 11:31:53 -0800
Message-Id: <20200302193153.66415-1-yuanzi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH v2] linux-user: Add AT_EXECFN auxval
From: Lirong Yuan <yuanzi@google.com>
To: qemu-devel@nongnu.org, laurent@vivier.eu
Cc: qemu-trivial@nongnu.org, scw@google.com, jkz@google.com, 
 Lirong Yuan <yuanzi@google.com>, Riku Voipio <riku.voipio@iki.fi>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f49
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
X-List-Received-Date: Mon, 02 Mar 2020 19:32:14 -0000

This change adds the support for AT_EXECFN auxval.

Signed-off-by: Lirong Yuan <yuanzi@google.com>
---
Changelog since v1:
- remove implementation for AT_EXECFD auxval.

 linux-user/elfload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index db748c5877..8198be0446 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1573,7 +1573,7 @@ struct exec
                                  ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE-1))
 #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
 
-#define DLINFO_ITEMS 15
+#define DLINFO_ITEMS 16
 
 static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
 {
@@ -2037,6 +2037,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
     NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
     NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
+    NEW_AUX_ENT(AT_EXECFN, info->file_string);
 
 #ifdef ELF_HWCAP2
     NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
-- 
2.25.0.265.gbab2e86ba0-goog


