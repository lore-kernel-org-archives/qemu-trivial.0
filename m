Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sG0-0005D4-DD
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:40:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52774)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFu-00059U-EF
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFt-0002Pp-HP
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:39:54 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36034)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFr-0002Nb-Gg; Mon, 08 May 2017 19:39:51 -0400
Received: by mail-qt0-x244.google.com with SMTP id j13so11684788qta.3;
	Mon, 08 May 2017 16:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1UtqT0ARxyTu7d0or/sWLq91rbmObK4TmfEyPf9wiZU=;
	b=ClBp6msFzwg1UUHeq2DFpoa2dvrN9mrvoO51pePIODXdJoml1ORYRzHWocQymySncz
	f16f09P3uac4wfWAlL3QQaGtb3qiuSuKkakWWVfwOI1dog47L2nsGByq6R0pjzy4X4Rj
	noKozS+8U2YwlnUhQhm6TDO9S7q4MHNTX1lIMHnOvYNEW8NeyJREAEK6pvyc4Z3gHAEb
	OL4TS8q+ugfbVgbeD3ogTYvuRrDRCXWUiVFxQ3Vwd9PHjAsC8bSZ98szbIC5r4mLzIKm
	uZVkAnPaK7aDPUnvlE4RPh9GW5SHfpQ6V+zRjnb3NFGIMCzm7AJOj5ccNqH1q4xwh4e5
	mJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=1UtqT0ARxyTu7d0or/sWLq91rbmObK4TmfEyPf9wiZU=;
	b=QbGg+GaZMPzXOEpXwG28YyjzG1lJSSSGOp8TsQohlcEUs4rAvzifZfpvWtnoGac3Q9
	zeo8MHxxwtQiFV+1WjlvsrYLaTq87KPMx2zTrHG3+Rst4l9EwQghbNpA0mAdXI4Qbe00
	1qrXiGaoAdGHCNNRP0vUGIDGRR3QicAP3851ngZUv2EaeLuXZrsVtKCBmODdM20wjcSU
	zj87sIY+YzVd50oWibMsrBdFs2DWR4ObJ0KEfMZ5Z1G1azzCCEi2YwRWZskRCzaLc27E
	ulR4d77WfLNnGAcIX21nuWrjbltj6RhS6F1stpZeNyFLC/KqRzhGfMByCkCpm7rZCIw1
	CYJg==
X-Gm-Message-State: AN3rC/7uxqR95gZHswDyQm9IQRISFdoOvnuzY9T6yzs/eBB+6irjKM8x
	RojkVjM9A+vMPw==
X-Received: by 10.237.61.80 with SMTP id h16mr30280728qtf.103.1494286790983;
	Mon, 08 May 2017 16:39:50 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:16 -0300
Message-Id: <20170508233918.9043-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 09/11] target/sparc: fix DEBUG_MMU DPRINTF()
 arguments
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
X-List-Received-Date: Mon, 08 May 2017 23:39:55 -0000

invalid since 96df2bc99f9

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/sparc/ldst_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 57968d9143..aa83a49a88 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -1631,7 +1631,7 @@ void helper_st_asi(CPUSPARCState *env, target_ulong addr, target_ulong val,
 
             if (oldreg != env->immu.mmuregs[reg]) {
                 DPRINTF_MMU("immu change reg[%d]: 0x%016" PRIx64 " -> 0x%016"
-                            PRIx64 "\n", reg, oldreg, env->immuregs[reg]);
+                            PRIx64 "\n", reg, oldreg, env->immu.mmuregs[reg]);
             }
 #ifdef DEBUG_MMU
             dump_mmu(stdout, fprintf, env);
@@ -1715,7 +1715,7 @@ void helper_st_asi(CPUSPARCState *env, target_ulong addr, target_ulong val,
 
             if (oldreg != env->dmmu.mmuregs[reg]) {
                 DPRINTF_MMU("dmmu change reg[%d]: 0x%016" PRIx64 " -> 0x%016"
-                            PRIx64 "\n", reg, oldreg, env->dmmuregs[reg]);
+                            PRIx64 "\n", reg, oldreg, env->dmmu.mmuregs[reg]);
             }
 #ifdef DEBUG_MMU
             dump_mmu(stdout, fprintf, env);
-- 
2.11.0


