Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21270D58B21
	for <qemu-trivial@archiver.kernel.org>; Sun, 15 Mar 2026 12:50:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w1kur-0002sP-JZ; Sun, 15 Mar 2026 08:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raghavendraaadhya@gmail.com>)
 id 1w1kRF-0001lU-6N
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 08:19:22 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <raghavendraaadhya@gmail.com>)
 id 1w1kRB-0006BN-9Y
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 08:19:19 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-b6ce6d1d3dcso1503582a12.3
 for <qemu-trivial@nongnu.org>; Sun, 15 Mar 2026 05:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773577155; x=1774181955; darn=nongnu.org;
 h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y9Vy6jOLBhvYLJujIXKQzGrxbfbf45embMxzkpUumuc=;
 b=Cu1eLfwdJPIqwbZIZvQsRnwEDTnH1rv8+JxFf2HDtO5iwzkYjcwg3sQdHkAMytrcSJ
 Y1fp/rsXIPeLK5P8IS2rmTkd+RCGSLZsZv+MecH7W/2qmX9pQ3yLBOFJG5MAf6GwgQB2
 xWgJ0M+RI4pIqn68l0dAD9SM50uAFKSKmYfqZiQTwfXUTvcP7Okz+Smbv6noihsXLxbI
 kXHsWZkGTkgJ5a+q0g+Vm+kUwC/9CEAaP4bg82gM8kHCtBzFI42OReyFTNNtuuI0qoo8
 sGYK0LEg8jQHr+sBX4zebOgjPuOvUEq/iZq+MFsKKOjCpazcQKgFk/LUtwWpU8jwfTk5
 R9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773577155; x=1774181955;
 h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y9Vy6jOLBhvYLJujIXKQzGrxbfbf45embMxzkpUumuc=;
 b=GlFedxqcKOZ1IpeKJF/zKY+eEbhCPSwLzrqBexFl+LsNm2jayrBl+1uPKjy6VEzIw1
 /WpCMkDuFVbg+3JMhOSSOM68ks4CHCbIzjHKFmvPT5mv+3G4smXSXGAN4OWN/XP6vbqx
 IBxGz8DpoNd0ePRjmCQEIeuF8p1q5UT11ALLHSlT9ng3EauXPoiAZDyq9ejKdAgrqmvY
 m2Ap0keT8WwdtnMPZ7mrdg/CKyzeK8VN78X5gXR+9aQCpsfszPB3rGTwHNBZ71zdduEh
 GVWgIsuGdee+u1vyHeWSXkLZj+wplpgpbR7t+ZJdGNx7v3SpIqawpG951/JKDW+ao7j9
 BZEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY5AYW5WDTFVd/b0khZ3MFTye+13LwTbvYjfmIuddQCp9m0CFvAja+ZUZw4TP2ofaZe38DCcaJV15h6rI=@nongnu.org
X-Gm-Message-State: AOJu0YyG3+nTTugN1tJQsCJEa7xkUodyetSTjSOD9T90WlbQQlHM39bB
 XpZYtcD8V3YFyVDgdUcAC//CIBTCHQY+iq0rHTuiDgf7UxBqUUU1KJG9
X-Gm-Gg: ATEYQzzsacxy4kEofa2gfGW2JLvn6azQAJbZ96PRSZKQ4YzDH5aTwiOzZYiPvgeb2r6
 Ld1bt42X/EUeMJtedaWbUe1rPFBluD+oq7AwALL7bBJA+fGopmTczbNfbwRD7EdlEsZ3zqml1Cq
 AyE6oLN0almJmuwJvi8ShRMDc/Y/pJlCMz0VhagO3Ra3arwcFpdsUviUdPA7wGu4PtCyslNskN/
 RF9R7ohYPh+UEjI1wQM2vNq5+RFHztdi1GKP4cMmA/FLiXt3WJKO9xs7ks7TYPfPATcRD9FgjsK
 Rx3rssANQegkkJQ71V7RJuxhh562uEhQ8BW4AfvWPbZsy67GjKlQLpOaqdTrl6HKFePBZW7AQ5r
 crfrRzkc1/tN5DsMmEt78qglu5eqiwnNioHa+VoOWQUCqmNY63EeF5ITUEbaoqiL+XEjikd+EtY
 9Lzw1kx/+Ikjyg6cB4pqBVO2bc9MKJWOgZCAWbYdjfbSQ2WzrDqgCLrlFQMWDuUFGFmFWgjjdDG
 H8Q44em7djtx3pmnpX+o+qPtg==
X-Received: by 2002:a05:6a21:687:b0:398:aaac:a079 with SMTP id
 adf61e73a8af0-398ecd38582mr8862962637.45.1773577155193; 
 Sun, 15 Mar 2026 05:19:15 -0700 (PDT)
Received: from Obsi.localdomain ([49.43.240.32])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c73fc935ad4sm2323870a12.2.2026.03.15.05.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Mar 2026 05:19:14 -0700 (PDT)
Message-ID: <69b6a3c2.630a0220.b45bc.5ab2@mx.google.com>
From: Aadhya-R <raghavendraaadhya@gmail.com>
X-Google-Original-From: Aadhya-R <aadhyar.cs24@rvce.edu.in>
Date: Sun, 15 Mar 2026 12:16:49 +0000
Subject: [PATCH v1] disas/sparc: Fix integer overflow and convert to g_malloc
To: mark.cave-ayland@ilande.co.uk
Cc: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=raghavendraaadhya@gmail.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 15 Mar 2026 08:49:56 -0400
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

Change '1 << i' to '1ul << i' to prevent undefined behavior. Also replace standard C allocators with GLib functions to safely handle out-of-memory aborts. Resolves SVACE warning and GitLab issue #1798.

Signed-off-by: Aadhya-R <aadhyar.cs24@rvce.edu.in>
---
 disas/sparc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/disas/sparc.c b/disas/sparc.c
index e8f4dcba31..702409a118 100644
--- a/disas/sparc.c
+++ b/disas/sparc.c
@@ -2623,7 +2623,7 @@ build_hash_table (const sparc_opcode **opcode_table,
   memset (hash_table, 0, HASH_SIZE * sizeof (hash_table[0]));
   memset (hash_count, 0, HASH_SIZE * sizeof (hash_count[0]));
   free(hash_buf);
-  hash_buf = g_malloc(sizeof (* hash_buf) * num_opcodes);
+  hash_buf = g_malloc(sizeof(*hash_buf) * num_opcodes);
   for (i = num_opcodes - 1; i >= 0; --i)
     {
       int hash = HASH_INSN (opcode_table[i]->match);
@@ -2685,7 +2685,7 @@ print_insn_sparc (bfd_vma memaddr, disassemble_info *info)
 
       if (!opcodes_initialized)
         sorted_opcodes =
-          g_malloc(sparc_num_opcodes * sizeof (sparc_opcode *));
+          g_malloc(sparc_num_opcodes * sizeof(sparc_opcode *));
       /* Reset the sorted table so we can resort it.  */
       for (i = 0; i < sparc_num_opcodes; ++i)
         sorted_opcodes[i] = &sparc_opcodes[i];
-- 
2.43.0



