Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fQaGP-00058A-K3
	for mharc-qemu-trivial@gnu.org; Wed, 06 Jun 2018 11:22:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39479)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGM-000552-DM
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGI-0003oF-CI
	for qemu-trivial@nongnu.org; Wed, 06 Jun 2018 11:22:14 -0400
Received: from mail-qt0-x22b.google.com ([2607:f8b0:400d:c0d::22b]:45747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fQaGD-0003kx-CA; Wed, 06 Jun 2018 11:22:05 -0400
Received: by mail-qt0-x22b.google.com with SMTP id i18-v6so6723440qtp.12;
	Wed, 06 Jun 2018 08:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PBPHJflrjvUs7uwdA0glxssq4vIhWRZ9fshBLhHKL8U=;
	b=Ids5+yVQxJ9j9W1/Mbbg9QTzoHusdYKF+UXttMnhs8HwZCF/ni8MMq3ke4kD0htWQf
	73bq1N+sRvRxq0OsqYYVhYqR4xbfex8TPTntsfzN+ni0y+TXrZ+q2ytLm3cdteit0A5j
	CZgvsjoGC1EIPje6w+xC+NCTUNdXbSjRmkDmlEFe1aW6DhQT/+2xdoK+e3YbxfhXTh88
	wZrNVPytDpklhmzS78/o2tgOsgcPJi/e6Yi9ZRgOMmL1MibHSd0mcXo1bC+okwSDjPvG
	vZivyIVMcDdkignpXUhd/9anibXMp0536NVdxEetEleuD85e8l9os+nOKD03y2c3bfGw
	BGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PBPHJflrjvUs7uwdA0glxssq4vIhWRZ9fshBLhHKL8U=;
	b=Z4ZT/SuOH6Eip6OLuzwsDqqrevdwTSILLGG52s1H6rvOnyd+rHAAEmkeqP+NJjQp5P
	HR5Kx1NtZU9fjgcntFPkKHzZn62TFGbEzRYdNeDdJAwQA1xG+8UWry/kSVh009nZ71nd
	HaTXE+6vmWYAySAP+BCa6doS/Xw2jwqDoH+6+cQ19Ct1uFNtEwH2NH3ftgi3GsQZFUHa
	pk7Tsj3N+q7SLqS3Y02DxBCkGbXZS75BIuaLeHQaMWIcMoiDVxpncdA1BWdjlr/lCpVY
	6NeVgwvSokPRtvpkTJNm2r6zcRiRZd8Ee9k61kkz00RlWjNHpk44h9dbR0L7ILEBnSyt
	pEmw==
X-Gm-Message-State: APt69E14Kbsro42AUoAgubUVZK1bLjQRAONAUB7hgsi8QReDfgwO2qHF
	4B08AvDjvLw7rEg7Th+NVIQ=
X-Google-Smtp-Source: ADUXVKL41AH2grh7tWfaZyj54Qo5c2oODe3ilvjYT2eBKgrxdGfI2wJs46R3/WSmm//OD44mtTZ13w==
X-Received: by 2002:aed:3ba3:: with SMTP id
	r32-v6mr3221548qte.362.1528298524910; 
	Wed, 06 Jun 2018 08:22:04 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	i8-v6sm38756255qtb.11.2018.06.06.08.22.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Jun 2018 08:22:04 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Clark <mjc@sifive.com>, Palmer Dabbelt <palmer@sifive.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed,  6 Jun 2018 12:21:27 -0300
Message-Id: <20180606152128.449-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180606152128.449-1-f4bug@amsat.org>
References: <20180606152128.449-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22b
Subject: [Qemu-trivial] [PATCH 10/11] RISC-V: Add trailing '\n' to
 qemu_log() calls
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
X-List-Received-Date: Wed, 06 Jun 2018 15:22:15 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/riscv/op_helper.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 3abf52453c..aec7558e1b 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -293,7 +293,8 @@ void csr_write_helper(CPURISCVState *env, target_ulong val_to_write,
         if ((val_to_write & 3) == 0) {
             env->stvec = val_to_write >> 2 << 2;
         } else {
-            qemu_log_mask(LOG_UNIMP, "CSR_STVEC: vectored traps not supported");
+            qemu_log_mask(LOG_UNIMP,
+                          "CSR_STVEC: vectored traps not supported\n");
         }
         break;
     case CSR_SCOUNTEREN:
@@ -320,7 +321,8 @@ void csr_write_helper(CPURISCVState *env, target_ulong val_to_write,
         if ((val_to_write & 3) == 0) {
             env->mtvec = val_to_write >> 2 << 2;
         } else {
-            qemu_log_mask(LOG_UNIMP, "CSR_MTVEC: vectored traps not supported");
+            qemu_log_mask(LOG_UNIMP,
+                          "CSR_MTVEC: vectored traps not supported\n");
         }
         break;
     case CSR_MCOUNTEREN:
-- 
2.17.1


