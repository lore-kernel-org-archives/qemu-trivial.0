Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ogpU0-0003ch-Ub
	for mharc-qemu-trivial@gnu.org; Fri, 07 Oct 2022 11:41:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogpTy-0003UW-Rg
 for qemu-trivial@nongnu.org; Fri, 07 Oct 2022 11:41:50 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45944)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sisshiki@isshiki-clinic.com>)
 id 1ogpTo-0000sC-S4
 for qemu-trivial@nongnu.org; Fri, 07 Oct 2022 11:41:50 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so5047886pjo.4
 for <qemu-trivial@nongnu.org>; Fri, 07 Oct 2022 08:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=isshiki-clinic-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=myO3ktHeJT6MCrgSHvLKUCdHXWktxN7tncXD07KwBmU=;
 b=ZVCB9kCTOQtpyK0zpD4ysqoq95hu/l1TWqJDZzx9RFwAnWDG1NTf5qHPSXzjx3PsC6
 LerGQ6fA9EesxMec8f4/4Gy0e7SDfI1CtLKQquDAx1XdN9aPrHUm5iawUV6caMvDZfV1
 CZeBi/fQIXYfbrBFKO5iEBJ7eGvRqKGLdohpY2trVexHL4HXzCyi4+Gf1n5nvtyBjJAw
 CjHOPvZFKGZkuPllB3sv8wB1xv9hn29oBCAUeeNW6phl1P+Ll3tOKWghRfYtqoatVfJe
 J3L2Xur8yy4IqpbLCgo6jfKzwe/5T8hOR4aSDOQA/rQZ1SqAAGYHmfwwzLfAGbqw76GW
 FUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=myO3ktHeJT6MCrgSHvLKUCdHXWktxN7tncXD07KwBmU=;
 b=MOiAw5ib397ldCPMjYT2JoTRWOc0S2gfrEwPdNhWRhPhvyVgNvTEqE02uoEM4Y+Q5W
 jV2CExXBd/U0BThfyEiW0m0aF9zr2hrJSZ4MuzmmNP/c4zhx6O7xV7B+zVed6mJGlUc8
 AFeneqB9MMSFZeVTYHZ5U7dB7PWjGfLa1in94IY3B0IggAF3xaPY3GyFsb+h0pmaLFjP
 sO/MvCtZqieZfJxFXUrkzGFSoTL4GIWu2J14DQBQa+nFzlTD6EemDAVlOLvYrKz0wXPc
 kYLdvnNzaP+DQ1XDcbq/EQIuNwfpqyHY/n9EoKwms/9zc7yhI/sD6oeh/KJMbFzYBM1j
 tcsg==
X-Gm-Message-State: ACrzQf3H052ltB6+aLOCDg9zMWuj2spyaJ+W04/aFQG8GPV6e2GpyTrD
 klCSQtFpbrcKRhqebsZiCv/qmw==
X-Google-Smtp-Source: AMsMyM7Q3gmqye+5MAd+eFw+NrKANIS8IS1sH6Y+4snsm3WbLvZLcBj0Lo64OgnU24viJf9+0f6tIA==
X-Received: by 2002:a17:902:d48e:b0:178:b5d:ab3 with SMTP id
 c14-20020a170902d48e00b001780b5d0ab3mr5660641plg.22.1665157298350; 
 Fri, 07 Oct 2022 08:41:38 -0700 (PDT)
Received: from DESKTOP-8TCEJFK.localdomain
 (215.134.178.217.shared.user.transix.jp. [217.178.134.215])
 by smtp.gmail.com with ESMTPSA id
 gm7-20020a17090b100700b0020669c8bd87sm1668482pjb.36.2022.10.07.08.41.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Oct 2022 08:41:37 -0700 (PDT)
From: Soichiro Isshiki <sisshiki@isshiki-clinic.com>
X-Google-Original-From: Soichiro Isshiki <sisshiki@mac.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Cc: sisshiki1969 <sisshiki@mac.com>
Subject: [PATCH v2] linux-user: mprotect() should returns 0 when len is 0.
Date: Sat,  8 Oct 2022 00:40:40 +0900
Message-Id: <20221007154039.10239-1-sisshiki@mac.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102b;
 envelope-from=sisshiki@isshiki-clinic.com; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_NONE=0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2022 15:41:51 -0000

From: sisshiki1969 <sisshiki@mac.com>

On Fri, Oct 7, 2022 at 9:38 AM Richard Henderson <richard.henderson@linaro.org> wrote:
| Although, sorta, this smells like a kernel bug.
| Why should mprotect(-4096, 0, 0) succeed while mprotect(-4096, 4096, 0) fails?

This may be kinda bug compatibility...

| But anyway, if we're going to fix len == 0 to match, we might as well fix all 3 test
| ordering bugs at the same time.

Yes, I agree, and made another patch.
A validation for wrap-around was added, I think it is neccesory.

A tiny test code was shown below.

```sh
> cat test.c
#include <sys/mman.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
  char *addr;
  int prot = PROT_READ | PROT_EXEC;
  int map = MAP_SHARED | MAP_ANONYMOUS;
  addr = mmap(NULL, 4096, prot, map, -1, 0);
  if (addr == 0) {
    perror("mmap");
    exit(EXIT_FAILURE);
  }
  
  void *addrs[] = { (void *)77, NULL, addr };
  for (int i = 0; i < 3; i++) {
    if (mprotect(addrs[i], 0, PROT_READ) == -1) {
      perror("mprotect");
    } else {
      printf("OK\n");
    }
  }

  // invalid prot
  if (mprotect(addr, 2048, PROT_READ | 0x20) == -1) {
    perror("mprotect");
  } else {
    printf("OK\n");
  }
}
> cc test.c -o test
> ./test
mprotect: Invalid argument
OK
OK
mprotect: Invalid argument
> qemu-x86_64 test          # current master
mprotect: Invalid argument
OK
mprotect: Cannot allocate memory
mprotect: Invalid argument
> build/qemu-x86_64 test    # after the patch applied
mprotect: Invalid argument
OK
OK
mprotect: Invalid argument
```

seems good.

Soichiro Isshiki

Signed-off-by: sisshiki1969 <sisshiki@mac.com>
---
 linux-user/mmap.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 28f3bc85ed..757709eeba 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -124,17 +124,20 @@ int target_mprotect(abi_ulong start, abi_ulong len, int target_prot)
     if ((start & ~TARGET_PAGE_MASK) != 0) {
         return -TARGET_EINVAL;
     }
-    page_flags = validate_prot_to_pageflags(&host_prot, target_prot);
-    if (!page_flags) {
-        return -TARGET_EINVAL;
+    if (len == 0) {
+        return 0;
     }
     len = TARGET_PAGE_ALIGN(len);
     end = start + len;
+    if (end <= start) {
+        return -TARGET_ENOMEM;
+    }
     if (!guest_range_valid_untagged(start, len)) {
         return -TARGET_ENOMEM;
     }
-    if (len == 0) {
-        return 0;
+    page_flags = validate_prot_to_pageflags(&host_prot, target_prot);
+    if (!page_flags) {
+        return -TARGET_EINVAL;
     }
 
     mmap_lock();
-- 
2.25.1


