Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e07G0-0002Gx-MS
	for mharc-qemu-trivial@gnu.org; Thu, 05 Oct 2017 10:36:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e07Fx-0002Fw-Md
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 10:36:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e07Fs-0001ps-6c
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 10:36:09 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:56226)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>) id 1e07Fs-0001pK-1j
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 10:36:04 -0400
Received: by mail-qt0-x242.google.com with SMTP id x54so25683411qth.12
	for <qemu-trivial@nongnu.org>; Thu, 05 Oct 2017 07:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=lw8C0cJmHSoiJfKrDwubs4Y8Gd7FDmMabH1sWGCC9Ns=;
	b=MQ13GOSS7cbv1+J8T1gFAetKStEboVPXzHzUjOES48J9VGX0hCf/G25DwU4MbgZ4X1
	EtF0aTYYDxP64jWOfbVUJEow+tuXZmZwkHXLkGhrZlRfyxUfYNkq+8I52XPwoiDSm9oB
	e+B9mmi1Sh68yByscLo3pTbH0xuusCslNNpNVPLwjEeiDh2y6uSUCkTXjCSyWTeDVW3F
	MoDorkY9hKVvsUolneqRr1mOGdcA1Uhp2J/bJW6NlVq5hSOk/M4bIKn+yufIyr522p98
	7gJjAvJZ48j5e5wFXrEFIOWChlGQ7O/Rq2/Oomm4HLUTpnTrCNoCwcFdKC9L1kV3DvjK
	RbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=lw8C0cJmHSoiJfKrDwubs4Y8Gd7FDmMabH1sWGCC9Ns=;
	b=Ek5bjsPfCtpVH3h24mXfoqUfntorT2bw8NQFFaSJuTdEoNU0+CjYTY43sS8mMQ3r8v
	22QQgHRHv+601qMhqLecHV6AG5Z8jOMoAkkzvEiR3nqkkFobEyR1x0CFOls7YKqb1dDr
	n4+xK90lOczy5bY6fnTIgR2w3An/2trGOq41uY6jVejvhw4+MNPf8prfvm4Z41LMATZf
	0kCxRK4bP7sWAdPOk5VPTuqeNB8+rkU7qaYUA+Deb5hQ1XPEBxJCe2TE6GmdWU4t/BQZ
	Rn6rdtsSHy5mxsNbP5bFHgYYGu2JBoNXhOJgIsWcRRaUFRBQifxw+0f/MWC6QBPWPbYs
	smdA==
X-Gm-Message-State: AMCzsaXjqDc7YykqiiwZJOF3nUYZetRUZd7SxGfi+i2GG996aLRHsgNy
	MxDnmlCMOTuuhNYKJkfzWh4ZrA==
X-Google-Smtp-Source: AOwi7QCbwLfpxDpuBnRR1No/0pJ3hIAHQoyxyDMiazXSYVnDGrqNVX4xKrB0KjO3YCe2cwCvd3OCoA==
X-Received: by 10.237.57.135 with SMTP id m7mr23753578qte.4.1507214163033;
	Thu, 05 Oct 2017 07:36:03 -0700 (PDT)
Received: from localhost.localdomain ([168.181.48.170])
	by smtp.googlemail.com with ESMTPSA id
	x124sm11611975qka.85.2017.10.05.07.36.00
	for <qemu-trivial@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 07:36:01 -0700 (PDT)
From: Marco A L Barbosa <malbarbo@gmail.com>
To: qemu-trivial@nongnu.org
Date: Thu,  5 Oct 2017 11:35:53 -0300
Message-Id: <20171005143553.23784-1-malbarbo@gmail.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH] linux-user: Add AT_SECURE auxval
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
X-List-Received-Date: Thu, 05 Oct 2017 14:36:11 -0000

This is necessary to run android ndk applications. Without this patch, the
following error is generated:

FATAL: kernel did not supply AT_SECURE

Should AT_SECURE from host be considered or is the ids comparisons enough?

Signed-off-by: Marco A L Barbosa <malbarbo@gmail.com>
---
 linux-user/elfload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 79062882ba..177ce30e89 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1354,7 +1354,7 @@ struct exec
                                  ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE-1))
 #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
 
-#define DLINFO_ITEMS 14
+#define DLINFO_ITEMS 15
 
 static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
 {
@@ -1782,6 +1782,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);
     NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
     NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
+    NEW_AUX_ENT(AT_SECURE, (abi_ulong) (getuid() != geteuid() || getgid() != getegid()));
 
 #ifdef ELF_HWCAP2
     NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
-- 
2.11.0


