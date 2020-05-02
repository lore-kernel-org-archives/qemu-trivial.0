Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jUjGJ-0003WH-FD
	for mharc-qemu-trivial@gnu.org; Fri, 01 May 2020 23:56:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johnnymarler@gmail.com>)
 id 1jUjCn-00029p-Mi
 for qemu-trivial@nongnu.org; Fri, 01 May 2020 23:56:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <johnnymarler@gmail.com>) id 1jUjB2-0002bm-5M
 for qemu-trivial@nongnu.org; Fri, 01 May 2020 23:52:45 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:37737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <johnnymarler@gmail.com>)
 id 1jUjB1-0002bK-Me
 for qemu-trivial@nongnu.org; Fri, 01 May 2020 23:50:55 -0400
Received: by mail-pl1-x641.google.com with SMTP id a21so810372pls.4
 for <qemu-trivial@nongnu.org>; Fri, 01 May 2020 20:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dz+gbxdaWmQyAZeXjiBi7Ecu2ECehDjlt0/PgCoMzPI=;
 b=DbYp8aGkCDknsVLctySE25rAFAWJqJAz6gSurUQvJxn1FFGWudmJaL95cx4egPasS2
 VDYvGAOngnob0ZwQqQ0S/ECI2EcNUgFR2CKCBa3YCl0uXeUC2D2AfzAfx2GkwTAVO5GC
 qn9jyNvhMTjGCw1eclnP/wFsgBP0Z9MUlboB0VWrx535IVCD50ScHEH7scHxRGaXl4o2
 MAi3ejybVaJmdx/kMxdWqTc5uVyVKLzUREIc3Ok8v6Tvv6x9SaP07z8ebwmRq2+MUfPC
 FgjXE3CTP8pRX0p9wCS1CVzRdMJjOyei1oUZNR8yYgZYUo3dnKJ3ZiFBHowbQFN1hCVM
 oSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dz+gbxdaWmQyAZeXjiBi7Ecu2ECehDjlt0/PgCoMzPI=;
 b=AB+Xoy//zYa7WTVcVRzSOP3/ofKZDYDw3EWygLoGzgKKlIxX4NCil2T2GA0ioZxVzV
 TeD9ZCtxHs2VZZC8eVy/I3EQqqIm+E2Sms6bDxtvM94WH8wJAIy0ipXG48PR8OEl9q2/
 uQ1ftrrTInja9CzvPnvZr1WMSQXEVOE9hLwgbIVE98B8em0uajfon+h0hlh9hYuelp+m
 ziModRSoWF56kVgM4NiGb+nog6RFov7q2E7XswTAEzwuwALzLYMiRGrzjrqK4FNiLUNR
 jD9znw41K2zvEa+LCLGg0xsPf79qgiVwSFj7LF9i+idrUVNtm+k0e0vpfhjqowZ0iyvS
 HzHg==
X-Gm-Message-State: AGi0PubrLcpRU/6w0cpSQ66NZXGQ+8IL2A4fp8wqzm9mdSl3jVYE21h9
 +YjNEBSbMOQ4rLNM3LEZ38EbPCUYzpagtotU
X-Google-Smtp-Source: APiQypLwBP2zyueiAdVTAKmxaJkcXRUf4z+cI1iDxDzwkxmCF59emonSABeLwB2L2fJXpABvpXS8kA==
X-Received: by 2002:a17:90a:589:: with SMTP id
 i9mr3366083pji.156.1588391453124; 
 Fri, 01 May 2020 20:50:53 -0700 (PDT)
Received: from localhost.localdomain (96-19-96-19-192-232.cpe.sparklight.net.
 [96.19.192.232])
 by smtp.gmail.com with ESMTPSA id f2sm929986pju.32.2020.05.01.20.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 May 2020 20:50:52 -0700 (PDT)
From: Jonathan Marler <johnnymarler@gmail.com>
To: qemu-trivial@nongnu.org
Cc: Jonathan Marler <johnnymarler@gmail.com>
Subject: [PATCH] linux-user/mmap.c: fix integer underflow during mremap shrink
Date: Fri,  1 May 2020 21:50:48 -0600
Message-Id: <20200502035048.4720-1-johnnymarler@gmail.com>
X-Mailer: git-send-email 2.23.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=johnnymarler@gmail.com; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::641
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
X-List-Received-Date: Sat, 02 May 2020 03:56:22 -0000

Signed-off-by: Jonathan Marler <johnnymarler@gmail.com>
---
 linux-user/mmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index e378033797..da0fe4cc86 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -708,7 +708,8 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         if (prot == 0) {
             host_addr = mremap(g2h(old_addr), old_size, new_size, flags);
             if (host_addr != MAP_FAILED && reserved_va && old_size > new_size) {
-                mmap_reserve(old_addr + old_size, new_size - old_size);
+                if (new_size > old_size)
+                    mmap_reserve(old_addr + old_size, new_size - old_size);
             }
         } else {
             errno = ENOMEM;
-- 
2.23.1


