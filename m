Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5GsM-0005JK-Vt
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2020 17:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52700)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <3jT1QXgYKDEI2yer3mksskpi.gsquiqy-xvmzmeprsrkry.svk@flex--yuanzi.bounces.google.com>)
 id 1j5Ev2-0002ee-DK
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 15:29:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <3jT1QXgYKDEI2yer3mksskpi.gsquiqy-xvmzmeprsrkry.svk@flex--yuanzi.bounces.google.com>)
 id 1j5Ev1-0001sw-Bj
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 15:29:04 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:33074)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <3jT1QXgYKDEI2yer3mksskpi.gsquiqy-xvmzmeprsrkry.svk@flex--yuanzi.bounces.google.com>)
 id 1j5Ev1-0001qE-3o
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 15:29:03 -0500
Received: by mail-pg1-x54a.google.com with SMTP id 37so1797345pgq.0
 for <qemu-trivial@nongnu.org>; Fri, 21 Feb 2020 12:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=vmCGU9QmZGdVmAO0sJELwZM+WuL2wGHuNd0ACEynasA=;
 b=tKADRVynkJZ6Nwr9JX4SPWXXm+gRY6eeDKHardg/N+ZHAJDyvZwK2DmcB17XfEeQ12
 N/wo7Fj6wKEHgfx/mCP2HjGQu+1CYbIeeWq/l9vKZSEm7JpT2EivSVKITB4o1ftZ9kXj
 gxwIzHjfPuc6xMuRacCab0M5dhk+nYdLSiXH8q46Q5gj/DDO4v+YlSWNSeEHFCUZ61q8
 aCg+sL1nPY8PnfsD6pz74y5bysx1dacir4EnV1VGa+aEcYieyv2mXyCOEXhEug2G/eCE
 PnHF2yigVDK2xBl1OR0AQkEnHafB83xQ2ssHzoMAelIzu2r7TT48IkEO9Dc1bnssgeJ+
 XvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=vmCGU9QmZGdVmAO0sJELwZM+WuL2wGHuNd0ACEynasA=;
 b=bewPDpiLIxAT8R7xTVFQz4oZPTEi3Cy9G+R0N815oQM/mWOLlBQRUDFDEYGFv/sU+B
 2CbqGMlwZpeFehWPa32NFkG4QxSe7+/qa8tdAwhuuOhoNJO+Sh4gHBRQiKGABc30xvjS
 Xi6v9Mi+SsztdLhVLLGBjSwlM+qVbFZKm+LwDfaWm8wCXlHQ0e8JJMUXQBimx1AnpHlC
 wZ6i6/JS5mQY099Y/wnUBEy8MXkq+ibSM14NaFupmCL5IPY4ThBbjJwRNURu3T4kXwob
 rfngIJWdClal+fXuvv3DTBJbGfuCjUFXH7CWnEWBaFHFpTOnvUK3m0IfhDPHx5P6fl+t
 syEg==
X-Gm-Message-State: APjAAAUksInpyc4fWJTgUfGYi6y0Bll3yqNVWMFiYHm5BMYXTfh+4lnz
 +G6+b1D2oKyjQ0eS+3q/VSh+Oo8PchA=
X-Google-Smtp-Source: APXvYqzjKiIZCAUDVef4jNgzi8UvFJRgtdkSwcXyEl699oJxpYvbxv8mTqf50+TkHnYIE9ejQVwd+y+RAh8=
X-Received: by 2002:a63:2842:: with SMTP id o63mr41124550pgo.317.1582316941485; 
 Fri, 21 Feb 2020 12:29:01 -0800 (PST)
Date: Fri, 21 Feb 2020 12:28:57 -0800
Message-Id: <20200221202857.126170-1-yuanzi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
Subject: [PATCH] linux-user: Add AT_EXECFN and AT_EXECFD auxval
From: Lirong Yuan <yuanzi@google.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: Lirong Yuan <yuanzi@google.com>, Riku Voipio <riku.voipio@iki.fi>, 
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::54a
X-Mailman-Approved-At: Fri, 21 Feb 2020 17:34:24 -0500
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
X-List-Received-Date: Fri, 21 Feb 2020 20:29:07 -0000

This change adds the support for AT_EXECFN and AT_EXECFD auxval.

Signed-off-by: Lirong Yuan <yuanzi@google.com>
---
 linux-user/elfload.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index f3080a1635..7e0f3042f1 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1568,7 +1568,7 @@ struct exec
                                  ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE-1))
 #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
 
-#define DLINFO_ITEMS 15
+#define DLINFO_ITEMS 17
 
 static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
 {
@@ -1888,11 +1888,14 @@ static abi_ulong loader_build_fdpic_loadmap(struct image_info *info, abi_ulong s
     return sp;
 }
 
-static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
+static abi_ulong create_elf_tables(struct linux_binprm *bprm,
                                    struct elfhdr *exec,
                                    struct image_info *info,
                                    struct image_info *interp_info)
 {
+    abi_ulong p = bprm->p;
+    int argc = bprm->argc;
+    int envc = bprm->envc;
     abi_ulong sp;
     abi_ulong u_argc, u_argv, u_envp, u_auxv;
     int size;
@@ -2032,6 +2035,8 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
     NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
     NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
+    NEW_AUX_ENT(AT_EXECFN, info->file_string);
+    NEW_AUX_ENT(AT_EXECFD, bprm->fd);
 
 #ifdef ELF_HWCAP2
     NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
@@ -2870,8 +2875,8 @@ int load_elf_binary(struct linux_binprm *bprm, struct image_info *info)
 #endif
     }
 
-    bprm->p = create_elf_tables(bprm->p, bprm->argc, bprm->envc, &elf_ex,
-                                info, (elf_interpreter ? &interp_info : NULL));
+    bprm->p = create_elf_tables(bprm, &elf_ex, info,
+                                (elf_interpreter ? &interp_info : NULL));
     info->start_stack = bprm->p;
 
     /* If we have an interpreter, set that as the program's entry point.
-- 
2.25.0.265.gbab2e86ba0-goog


