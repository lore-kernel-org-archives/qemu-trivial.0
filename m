Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYld-0005gA-BS
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlb-0005eM-C8
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYla-00085G-Mi
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:11 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38145)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlY-00083H-H2; Wed, 26 Jul 2017 22:43:08 -0400
Received: by mail-qt0-x242.google.com with SMTP id p3so8855130qtg.5;
	Wed, 26 Jul 2017 19:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QYrNc0og+Ap3aMUVWMvbd1oycWocdKKJPZpWUaXcKMw=;
	b=H1/s2N5lzqryTPnEzGPDKu/YnttiTCweqcwYiSAGyiEdFNkMFBXN1OxRN9Z9kWZF5J
	jk/ZbwosJDcBTNPJffmgR64C8wKHt/CG1WR8m4DuJSEqFk6FmUGJZjG3W4/y10PUqoXx
	9Vv75uPJu7tapAXiLb1Zw1DE5k1L5CVdNmHKTge7eYjZ773t/TL8mqxDno11KdJrM7AM
	bbjdVnSGvAGJclJ/sfctdhy58xcckLUtFeVtQOn1qcnzA68Ec9YORED89TRdWOvKJlDM
	L0VK7Lasc6WOpvFwtJFnpacgL9V/40McyIhOPWTfWTWIBJm5SvOZZlLnCPTZ/PchZ6uR
	xLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QYrNc0og+Ap3aMUVWMvbd1oycWocdKKJPZpWUaXcKMw=;
	b=r2lmko3kOIdrb6jU2ZfxVunm3t/TfOpbQerZwQM6QRLBX7dvV1w56+yOyybBeDedFe
	ilx8k455Zxnjbu/Xb3PpTNSeyO2U0pRheSFR+vm0nwb11YOj9Gx5jdVJQ/KPieIfCsqr
	NZJH49YcDDaccZsK8GKqSEttfnVoaoCj02ObOBEnF2b5DqttwyfO6s3JcwODWA2C/F0n
	nNyL+yYatvK4OLL2aO/ehZ9qkyeOPo+7E2nTjWqWqMSqzIE0i9Yt2EuHAUm7HNpbWm85
	ID2DzyKe7+NSppTsV3d35MmQjSK0uXA4Wv70OLqm2ipj4qzYc5BsWhdOlXzgkYJTSrSW
	/NkQ==
X-Gm-Message-State: AIVw1106Ik7YMj5lZa/C/a0bjbdviHHgmb8+j/MO1fP+IYqLl2NCbr2l
	zSkyzjKZnSkjKg==
X-Received: by 10.200.48.237 with SMTP id w42mr4372221qta.54.1501123387904;
	Wed, 26 Jul 2017 19:43:07 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:16 -0300
Message-Id: <20170727024224.22900-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH for 2.10 v2 11/20] linux-user/sh4: fix
 incorrect memory write
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:12 -0000

not hit since 2009! :)

linux-user/elfload.c:1102:20: warning: Out of bound memory access (access exceeds upper limit of memory block)
        (*regs[i]) = tswap32(env->gregs[i]);
        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
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


