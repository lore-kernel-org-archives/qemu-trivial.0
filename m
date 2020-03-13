Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jCYBc-0001eU-Ib
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2020 20:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59501)
 by lists.gnu.org with esmtp (Exim 4.90_1) (envelope-from
 <3odNqXgYKDOwmiObnWUccUZS.QcaeSai-hfWjWOZbcbUbi.cfU@flex--yuanzi.bounces.google.com>)
 id 1jCYBZ-0001df-Ad
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2020 20:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from
 <3odNqXgYKDOwmiObnWUccUZS.QcaeSai-hfWjWOZbcbUbi.cfU@flex--yuanzi.bounces.google.com>)
 id 1jCYBY-00081d-6Q
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2020 20:28:21 -0400
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549]:34646)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from
 <3odNqXgYKDOwmiObnWUccUZS.QcaeSai-hfWjWOZbcbUbi.cfU@flex--yuanzi.bounces.google.com>)
 id 1jCYBX-0007xr-VB
 for qemu-trivial@nongnu.org; Thu, 12 Mar 2020 20:28:20 -0400
Received: by mail-pg1-x549.google.com with SMTP id 12so4727339pgv.1
 for <qemu-trivial@nongnu.org>; Thu, 12 Mar 2020 17:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=HLlltgn1uX/7LTT+bcZ1C498BDTTGodBolAGUUxrAg4=;
 b=cGWLpxs8gLQx4MQrlcG4VBaB/2frTdxEZG9g3QdFKUkpnRC0E61JGiVNn1wAygmlav
 KsQOe+uzJUdSLm1Sp/P6nHUIOMr4IbKxFJpys0esYaDEr0C3U3T0EKWnwMDze+71H/yQ
 jLFPKsZNfrMRNrakSGQP+xMMABz6BZBcZ/dg2/6nj97Nv9hH3ZP/CU0AQ30tDLPdAeSQ
 m4a+14OwlSXRWJ7qfYReJDwVLfI74SfEgiChuj+vIRMQ7dBY8mLhsBlNaD9M9g5hb2cK
 ot4tzIMFTwZ30kEV7DcbP797JId7idJa2xOuMwzrLJJg1IQ15dIsPr9dy011dW9kCVZk
 +QOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=HLlltgn1uX/7LTT+bcZ1C498BDTTGodBolAGUUxrAg4=;
 b=d+jre1DmKqUEc8yo3AfkwVJ5AYS/XzUkQAsfQbvl9gHrQwewygGxx+u39As147kXxb
 nne2SGb50bV/87FHh9KYYgbP4kxYOm66VFg2C8GdVRu4CiJJRH97sDbNP8eI16ibv1e2
 GSDNVv6yMShezRICn5Ep94XEu+JNlSqzRsxFCo9EfMR22GYVmXNPWKIxVsr+UgtJRHbn
 zffBQ3daA5+Lgvn6kGizbFY9ude7/1pVS8uXzqEG2w9tlHA/4zSwcAUHuQTb8yXwAs89
 oANgypSG+gH4PtEdNIN8BOVWGmqJqXM7wKzxg+52Znnz4VxvSuHGjDfNxrxjB4XFWUzX
 aNMQ==
X-Gm-Message-State: ANhLgQ2ol60zTCRGDGArEuKNNQ/QuBBsrpk2642C+6TU0s59gUcvElHV
 0spS+kEaQHAcs63c6u6n154zTbLmHHM=
X-Google-Smtp-Source: ADFU+vuHqjJySVEYskXnQYpFjO00Au+r2Eyt7MsmUXUcRGIeMKDbOjjEoZ/6ASRSWzSbusDz+1sA0R8pnMg=
X-Received: by 2002:a17:90a:9416:: with SMTP id
 r22mr7120100pjo.2.1584059297961; 
 Thu, 12 Mar 2020 17:28:17 -0700 (PDT)
Date: Thu, 12 Mar 2020 17:28:13 -0700
Message-Id: <20200313002813.3857-1-yuanzi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
Subject: [PATCH] linux-user: Update TASK_UNMAPPED_BASE for aarch64
From: Lirong Yuan <yuanzi@google.com>
To: qemu-devel@nongnu.org, laurent@vivier.eu
Cc: qemu-trivial@nongnu.org, riku.voipio@iki.fi, scw@google.com, 
 jkz@google.com, Lirong Yuan <yuanzi@google.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::549
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
X-List-Received-Date: Fri, 13 Mar 2020 00:28:22 -0000

This change updates TASK_UNMAPPED_BASE (the base address for guest programs) for aarch64. It is needed to allow qemu to work with Thread Sanitizer (TSan), which has specific boundary definitions for memory mappings on different platforms:
https://github.com/llvm/llvm-project/blob/master/compiler-rt/lib/tsan/rtl/tsan_platform.h

Signed-off-by: Lirong Yuan <yuanzi@google.com>
---
 linux-user/mmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 8685f02e7e..e378033797 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -184,7 +184,11 @@ static int mmap_frag(abi_ulong real_start,
 }
 
 #if HOST_LONG_BITS == 64 && TARGET_ABI_BITS == 64
+#ifdef TARGET_AARCH64
+# define TASK_UNMAPPED_BASE  0x5500000000
+#else
 # define TASK_UNMAPPED_BASE  (1ul << 38)
+#endif
 #else
 # define TASK_UNMAPPED_BASE  0x40000000
 #endif
-- 
2.25.1.481.gfbce0eb801-goog


