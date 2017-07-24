Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi6f-0000yo-CX
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:29:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6d-0000wY-65
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6c-0005cL-DU
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:29:23 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi6Z-0005aS-7Y; Mon, 24 Jul 2017 14:29:19 -0400
Received: by mail-qt0-x243.google.com with SMTP id 21so5057654qtx.2;
	Mon, 24 Jul 2017 11:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=X4wci52PlVRWn+r3Us2GufOK1yzkusmERLIOy1SLP6k=;
	b=pCiWssNExUqWC7NkEb29GpEpX9P2/363R3j2vLTlgbaUVJcYrDT8qCo9yPolann2m+
	z4zFpWOUC+yKMLh2/stLJmp2cMje37jXGlZMJJIrewOGv3XV1Xoby5txxceKKWjHieca
	S7GGROnQlmIrtFkXy32SKFHouMp3mH/YPsoTxDS/eOpy3PvLzJbRVNoB54xHoJ+YInLr
	8bghBfJZcq536P191/UU0F1rGddVyS9hmOlg4uPnxRlmtbjZC2JJIF8DjYQHejnqtXBl
	6wJ+rf3bPAYk/11XZ3bLGttgNFoj6FEWd1fsqO4XnBt7dszNgJwEU1tOpRHT/sK8zkk3
	Qh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=X4wci52PlVRWn+r3Us2GufOK1yzkusmERLIOy1SLP6k=;
	b=tS3BiCwdrwF3obr2PQdvYMvECCJ8X9gCgh/5IYlmmyOouXLhcAz6qh3Zc67VWXlGEL
	EVC/YZ6HFni5vJPD6kPxQNByDVDqTJDTi726IcHcvQNGqKax7VhyBPAgBJe4sU6Luhct
	o+uj4021Sy+rmHep2ZhKRsSlnECtfiD/lAvxUFk+aGr9f16ctJ8ek8oqOKVWRZVQwKDK
	1LEaYc1/jOsfwgwU2uLii9F1tBSYqa5LCs0NMYV3HgmGJhwHe9bmM08dJLf72i2EzJZx
	vTBrmfMO6ZUtGqRhnSUvIr1jlwIkwiAfKpOYEoSpKqNRXC9dXys7p2MeSjM5JTPQBKG8
	ibew==
X-Gm-Message-State: AIVw110Fm1Dy7YoqnGJGt9CGPHTdwNwXRABFTZ0Y/I9jTpJW0Dsc3XzG
	yPFmRHVSqqdl/w==
X-Received: by 10.200.54.210 with SMTP id b18mr23441061qtc.145.1500920958786; 
	Mon, 24 Jul 2017 11:29:18 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.29.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:29:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:40 -0300
Message-Id: <20170724182751.18261-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH for 2.10 24/35] linux-user/sh4: fix incorrect
 memory write
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
X-List-Received-Date: Mon, 24 Jul 2017 18:29:24 -0000

not hit since 2009! :)

linux-user/elfload.c:1102:20: warning: Out of bound memory access (access exceeds upper limit of memory block)
        (*regs[i]) = tswap32(env->gregs[i]);
        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 2a902f7806..79062882ba 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1099,7 +1099,7 @@ static inline void elf_core_copy_regs(target_elf_gregset_t *regs,
     int i;
 
     for (i = 0; i < 16; i++) {
-        (*regs[i]) = tswapreg(env->gregs[i]);
+        (*regs)[i] = tswapreg(env->gregs[i]);
     }
 
     (*regs)[TARGET_REG_PC] = tswapreg(env->pc);
-- 
2.13.3


