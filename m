Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E377D58B29
	for <qemu-trivial@archiver.kernel.org>; Sun, 15 Mar 2026 13:02:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w1l6w-0007Us-VK; Sun, 15 Mar 2026 09:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghavendraaadhya@gmail.com>)
 id 1w1l6v-0007Tm-6s
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 09:02:25 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghavendraaadhya@gmail.com>)
 id 1w1l6t-0003cI-RZ
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 09:02:24 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-2aecefc7503so14171305ad.1
 for <qemu-trivial@nongnu.org>; Sun, 15 Mar 2026 06:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773579742; x=1774184542; darn=nongnu.org;
 h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PdSPR7hqha0wb7CmVz7FBXG5/GvZXten7QiEjVaZIBI=;
 b=Gf7TaXqey1B450dcLtZ5OJoJjHpUHcrc03yI+saw/3S0w6aXa64gCTiYKDOz3SuYI3
 2lh9oLo6THWsMt39AKei2aufA8FjQMUz8PjF01+RRVY4ebSR/f9qrJwOctw4+1eo3QXB
 3I0Db8qavEBo/Nfwt8Nvu8BVEEQbpWplAzymuWpKGnTyEXBTc5j/D/n+ejINZCoiPPk9
 To4R4bLuxLSCH8wEeJ3yJOQRqXx9ZQlxAV2QIy5nYN8PJvnwKGEFYZsPA6KjReXH3BH8
 a48itxvUOcZmNcb6xCRXhHqCnJ/t0CaMih6WTi2MAZRj5ko1vJ98xrC9rapvzVurBPJ6
 9XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773579742; x=1774184542;
 h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PdSPR7hqha0wb7CmVz7FBXG5/GvZXten7QiEjVaZIBI=;
 b=AIXUUiin10MGHHqFA42tov+OY0S72igvaIm0489pPiGYWxAsKFkBGfPq3JNLOPXcpf
 1ussCUkST9V+oGFrWzUtSDlYg/yGl0wvRBWwTf2BHLBUfvzFNgeLcnLmlum+hXvSXPsQ
 dkQ6q/DfzftcZ/d16Hi3FCGDeJnAc5Zd5HwCqriZ1V+qcouSHpCUs/tAZaw2PoHZzM9m
 JZ4dqQGXk9ZYylJdKvT+Anmb4lRGortb062y4bGzhHukrZJ3oPjX09lHeT04xm9QhaAM
 QQIFgwWxQA7yvTCWqWONTrpdQO4rUGL7CYHJml0AinejiUlUWjeWosn3GKAsUveeWND8
 dDcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlND2TDKcEh4maYhlC7NEVoNcALAB0q0waBCg8P9iTZEPBDl1eecxdw6vcggvAsbEJ5Gy/urnmo59MFzE=@nongnu.org
X-Gm-Message-State: AOJu0YyhkyffPqkJC2DQaBqx/AtiqqktEpty/fJdzKChd58fBTleqImC
 /R8+4AOwdTZ2cPldzlrOEwZK8YweOXc0ORjgofbb2Ft4ZBWD16dXkeUt
X-Gm-Gg: ATEYQzzAX4xwPXFcfMqdHTmdhry0CgPt98nKzzztogUK0Y5CLaa6EyqrqHGLmEX+SUY
 zxi1erLapkA2oult5bWFN72jdAq5ncN4BMb/8yYOUUnmiOkJzugZ25rSQ1p+Su/MTs8nTaub5OK
 x6UF++m5m99CB2pz8miejj0wsyW38J4K8FNtrT1UcRdCVL1+gLbJs4G/efvYmwyJsFZECVwdRIe
 RB5wXZbiHOc4EmSBq+1yU2LVSyqreYWnrStrsz/0PORTQ7i95yeFbXnB6xQQmIS0q0ExFSkeKvJ
 gxyWBPNEK8efc9kfuM3ejXI2RFzWA4oFZhitqe4tnShlJZdDDp+LMBKmUwp6g0/jJ6LFoquBhR9
 Hyn6Bg8kP121FvNIE9dOmI4oCBbFbVFiiwaxVlz9Nd8Vxd5DaELM/6HiaHw/NkWEafe/Gh726NY
 oYBDd7C44W8Qy5Vw4c/Lj6qvUQqKzd+8el9zVW6slT7LT2JKPzIuE/dObNRDQZSDJIcTT5DV9r9
 tth4H5fzxjxMzCk4fAs9b3Kjg==
X-Received: by 2002:a17:902:f645:b0:2b0:4d7d:fbc8 with SMTP id
 d9443c01a7336-2b04d7e0424mr26248195ad.0.1773579742244; 
 Sun, 15 Mar 2026 06:02:22 -0700 (PDT)
Received: from Obsi.localdomain ([49.43.240.32])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aece56c2c4sm97450845ad.2.2026.03.15.06.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2026 06:02:21 -0700 (PDT)
Message-ID: <69b6addd.170a0220.2bbc48.65e4@mx.google.com>
From: Aadhya R <raghavendraaadhya@gmail.com>
Date: Sun, 15 Mar 2026 12:59:49 +0000
Subject: [PATCH v3 2/2] disas/sparc: Convert malloc/free to g_malloc/g_free
To: mark.cave-ayland@ilande.co.uk
Cc: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=raghavendraaadhya@gmail.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Replace standard C memory allocators with GLib functions to safely handle out-of-memory aborts. Resolves GitLab issue #1798.

Signed-off-by: Aadhya R <raghavendraaadhya@gmail.com>
---
 disas/sparc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/disas/sparc.c b/disas/sparc.c
index 40c1164554..702409a118 100644
--- a/disas/sparc.c
+++ b/disas/sparc.c
@@ -2623,7 +2623,7 @@ build_hash_table (const sparc_opcode **opcode_table,
   memset (hash_table, 0, HASH_SIZE * sizeof (hash_table[0]));
   memset (hash_count, 0, HASH_SIZE * sizeof (hash_count[0]));
   free(hash_buf);
-  hash_buf = malloc (sizeof (* hash_buf) * num_opcodes);
+  hash_buf = g_malloc(sizeof(*hash_buf) * num_opcodes);
   for (i = num_opcodes - 1; i >= 0; --i)
     {
       int hash = HASH_INSN (opcode_table[i]->match);
@@ -2685,7 +2685,7 @@ print_insn_sparc (bfd_vma memaddr, disassemble_info *info)
 
       if (!opcodes_initialized)
         sorted_opcodes =
-          malloc (sparc_num_opcodes * sizeof (sparc_opcode *));
+          g_malloc(sparc_num_opcodes * sizeof(sparc_opcode *));
       /* Reset the sorted table so we can resort it.  */
       for (i = 0; i < sparc_num_opcodes; ++i)
         sorted_opcodes[i] = &sparc_opcodes[i];
-- 
2.43.0



