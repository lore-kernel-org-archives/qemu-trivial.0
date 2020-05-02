Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUmtd-00042A-JN
	for mharc-qemu-trivial@gnu.org; Sat, 02 May 2020 03:49:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johnnymarler@gmail.com>)
 id 1jUmtb-00041L-I6
 for qemu-trivial@nongnu.org; Sat, 02 May 2020 03:49:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <johnnymarler@gmail.com>) id 1jUmta-0006SE-SJ
 for qemu-trivial@nongnu.org; Sat, 02 May 2020 03:49:11 -0400
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042]:52504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <johnnymarler@gmail.com>)
 id 1jUmta-0006RI-GC
 for qemu-trivial@nongnu.org; Sat, 02 May 2020 03:49:10 -0400
Received: by mail-pj1-x1042.google.com with SMTP id a5so1002796pjh.2
 for <qemu-trivial@nongnu.org>; Sat, 02 May 2020 00:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7lNKdwLSpSFzgmgd8xsw/YrjcFp8u6IRnEMgxsLgJx8=;
 b=fFxkIuP2sEWRikyEfjdzx/pJqo39Yx5drILs+ijV2cYH+KZi1Uh6qLN4GjlfkL+G0+
 px0NdF3HOhirYHQHj8XS9VRjcyJ7nPhJ9/ThGwsmnh2mC+ENtH0DlmWjBklyXz0QBX3n
 rqV2Kte8tpn2hOuFdXwd57uOxCLKGJ2F+6gkpf9cIP49bcGxENBjwCxaTB8YsIS136wl
 3sRmPuZ9zJF1nPTIoP3EurYfLECeUvycTfOLoGmbVyWrflAPi43dNqcc9EBaAmvJbqe0
 Nqmh0FCAtaf/GEdNpjcT2JulNJEaVEAAcExMv7GGClh+Hee6AWnQZ5DpfdEWOhz7YLu4
 LqCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7lNKdwLSpSFzgmgd8xsw/YrjcFp8u6IRnEMgxsLgJx8=;
 b=Xlt7BZu3/mAUeUwmNzaeVPSIS/4rQA39SFI/fkMzBvgn0xxF0q0ABAEb+EBTp9SLQO
 3l1K+T/yXW3ivBHzxznVn9oCP4oMkg8q8+QJXtNdaN/brtYf8SLIdizYiMCnPP0aI1Iz
 Yzrt/X9cr32dW3DVqeFSQLfvh+1dB0pyK1Bd6f64sQk72XgHxKF5DjWMNXO//aPLUImD
 c/TIejAfU2dTflDFEnmXZpKKnPovojmJN9XjIvhIfLCmyT2vfNXMG3Ow5HdBmilB0hwD
 iGZr4TVb9+J2PylX+DQjxYRxu2MVycinpdJvCrc0iPL7UfidObFg9cBs7H6duQM7z8F1
 wpfA==
X-Gm-Message-State: AGi0PubErgfouJb7cNP8fDIkvoK1Vm2ud1tKpuEOKhkWDBUfXe5G1RDC
 uTmnz2Ed3WlEiJhfMsGHodC9BzXz0tJjqyOx
X-Google-Smtp-Source: APiQypK9JQvYr/bFkttoD6k4AGPS480CU1lNYkjvPKikIYRwb3oRq/ZXKNVdPh95gHN3PBFpIsEsHQ==
X-Received: by 2002:a17:902:b491:: with SMTP id
 y17mr4329196plr.9.1588405748715; 
 Sat, 02 May 2020 00:49:08 -0700 (PDT)
Received: from localhost.localdomain (96-19-96-19-192-232.cpe.sparklight.net.
 [96.19.192.232])
 by smtp.gmail.com with ESMTPSA id d12sm4021027pfq.36.2020.05.02.00.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 00:49:07 -0700 (PDT)
From: Jonathan Marler <johnnymarler@gmail.com>
To: qemu-trivial@nongnu.org
Cc: Jonathan Marler <johnnymarler@gmail.com>
Subject: [PATCH] linux-user/mmap.c: fix integer underflow in target_mremap
Date: Sat,  2 May 2020 01:49:01 -0600
Message-Id: <20200502074901.30784-1-johnnymarler@gmail.com>
X-Mailer: git-send-email 2.23.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1042;
 envelope-from=johnnymarler@gmail.com; helo=mail-pj1-x1042.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1042
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
X-List-Received-Date: Sat, 02 May 2020 07:49:12 -0000

Signed-off-by: Jonathan Marler <johnnymarler@gmail.com>
---
 linux-user/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index e378033797..caab62909e 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -708,7 +708,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         if (prot == 0) {
             host_addr = mremap(g2h(old_addr), old_size, new_size, flags);
             if (host_addr != MAP_FAILED && reserved_va && old_size > new_size) {
-                mmap_reserve(old_addr + old_size, new_size - old_size);
+                mmap_reserve(old_addr + old_size, old_size - new_size);
             }
         } else {
             errno = ENOMEM;
-- 
2.23.1


