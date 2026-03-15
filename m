Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B256D58B17
	for <qemu-trivial@archiver.kernel.org>; Sun, 15 Mar 2026 12:39:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1w1kkf-0007IW-8s; Sun, 15 Mar 2026 08:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aadhyar.cs24@rvce.edu.in>)
 id 1w1kkd-0007Hg-9A
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 08:39:23 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <aadhyar.cs24@rvce.edu.in>)
 id 1w1kka-0000hh-UC
 for qemu-trivial@nongnu.org; Sun, 15 Mar 2026 08:39:22 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43b43f5990dso14347f8f.2
 for <qemu-trivial@nongnu.org>; Sun, 15 Mar 2026 05:39:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773578359; cv=none;
 d=google.com; s=arc-20240605;
 b=hb2x6rmXEHdBKA7OIFs9hOuOxCiOPbeu2PZgGgvjFkg/jtlL24KMixiq0v6tWGlWQB
 a7Rx8KfT4xwrtW2tGCVuuzrrVjq82vAa5I5w5nbFuBPZgI8WTwm2OYAimgZZw+vqAmy6
 XIFabEsHIhYWDP6zVoxeXyWSoEXq8lvyXLQOpA00JhX9l/5EpHkCYON7wNPzuo3jraga
 XcpSgKT0RQ2IT+m3VwXWpz4IV5ImuAkp8FjMKpn0MES2UEWdI4WRLeirPPMG/pAj9hDZ
 hIXhfIBdRe9o/K2zALQsA7uNuIIBo1im67zNKE5WdZ0HbGM6x/4aXa+xVMS3qVXuJKzG
 duZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=o6dVPY0fm5feSjniFIblEldNRrFM2DTaMlabxhT+BAs=;
 fh=OR05GPro/oiNX944GGt9yiD9JlV05XkdR6DZPaVRESs=;
 b=K+0EjAfPThkzYtbXs6RcYFzLo2w8xOz/C9UM06KPjGNICEV1LQ2EV8vzAGZqK4ADeL
 9lrDmmXOp1AQoqi7CVDRGSkFa+SQafcP51rdOZ8vE9I33yY7DisrIWSWtRHX+96G3yXd
 WM0khPIvqYg/DFMiNGjL5bEjmhyo0p3qe1ZOwyPK7eNxZCIp5KfThcmusBpCnJjEeBrp
 parU3XxVivi4Q7SkcB8dmVmmyreF55yBZiPAFIS6/OHmqoUrDddeBpHDgMDKs5P34gKC
 VC7EbC16djpmejIcBbgXnwSyR0+HQgE5U2ZH35zSBakAJA1OEen6XqBU4iwtz7/K88Rk
 I8/Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rvce-edu-in.20230601.gappssmtp.com; s=20230601; t=1773578359; x=1774183159;
 darn=nongnu.org; 
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=o6dVPY0fm5feSjniFIblEldNRrFM2DTaMlabxhT+BAs=;
 b=GpRH3l5I44oZo+7KzsleQ+jlUtEsofc0kaaXP9yFtgFpK8hgB/C9ku6giv1UVR3+Nh
 AAW+Uy68Mj30qSsPfOggVO2d36/H/GSgs7IVRyy3xnZX05pk7Ylc81en/rgxJeDlaWsu
 B4OYYNHsEhnjO1Dzb2l3STQklSSzqPut5frb4e4+cEmxJLKo3kv0NHoxs7JqQNzkNh9T
 GotBeul/sOsSg3tVJlXAKSO0dxRfDSBwFpoU7k1vsM9Dphl9NXnDLA1Cnw2px0WZcA6v
 sJibYLz+W361Vkpx24Vp5/StRhf4NYDNWaHQ5oMuXGbAHY3Xw44jGCi0hKpV97h5XDuE
 tQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773578359; x=1774183159;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o6dVPY0fm5feSjniFIblEldNRrFM2DTaMlabxhT+BAs=;
 b=cXxsCOytlh3KC1NLjhxWq9myU6DqH2iRBDpEaSfEcW/Bb01R7j//3gJRXze/z7J+lU
 15OwmjLkjw7XHXzSGMIXSTCsfsj0NNDtdO6ffb1YT4v2aAMoJMRAkB9HwTXnk5IQssOb
 EMDifDNxPBDDSSqIT2uM0HwScVwROV5YX6NEN+Yarw6JGqtV8tELBUdQLDR02dvddJna
 j6kqQYF+FLVhJPY3WFNVzfLp0XteNDQYOjH+PT/0s00S0t9KyiN9DS0EWeBCZrb/Uv9D
 lExqUhn2dD3Bzos/+jZjcmEzr+/VsAO2MDyPRxqB12LUJMvMl15ZMwY37zEhW+1V/c1J
 PsuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl166KK1lf5zIshcuK4aBLhacM9RJrBOcnZt+4XS/ZZPd+nBRNYZNnlvdrS1dDed9/5D759vXpGXoAqR0=@nongnu.org
X-Gm-Message-State: AOJu0YxMGGjwc/K6CDGrhLakOk7z8Zmg0mpKa6bqUYr21eDuqLZwDRHY
 qU+tVhiVJiKUrqyZDBwBpa2aNMn4NCvMmd2OJQnSk6Ugv+Z5dyn9n2pnslnFGQWm+pq3Vuk4rvP
 Hu5+Zu+ncUwDUKc8RXmu3nd/XcBbt8bsm+TL/sgSjsiYJnp7W0dcHy8W7Rg==
X-Gm-Gg: ATEYQzww+lv/yxZ0mlGfrbcQX14gJC+Lv0tKkjFDVyBdWQwAvZNLjpJQRIJHMAyHXK/
 OrtIhihPzaRICHXxFXRTIkzyu1ljCETf+HDLHH7UfaraZ9cQ/70VJaZkJCZzml2bhc/tGc73dog
 yCxf6OoHykxLwFLkO3Pa02/+pK9vq5JhFywKABsgCyGFG+qMJezT3ZzO7IgmMGUWK9cvvxPZK8U
 0ZwP64OH9SM4Geq8ocLuPZmhBz3XVMr5pFpyRH2+BW2c5iqlYU3zY/SXnQcr53xKLNuJ4eQ4v0u
 SnlMr2alkaXJFfT8LR4ofZEqeigmKowT4nvYcAKEEl/ejktbsikkm+9IoJAXbw0BOb+OHLNPZ2T
 9Wr3ByjZUgE9h5lKawigiJFMk2A==
X-Received: by 2002:a05:6000:2583:b0:439:c1ca:82be with SMTP id
 ffacd0b85a97d-43a04db18cfmr18236267f8f.28.1773578358639; Sun, 15 Mar 2026
 05:39:18 -0700 (PDT)
MIME-Version: 1.0
From: AADHYA R <aadhyar.cs24@rvce.edu.in>
Date: Sun, 15 Mar 2026 18:09:06 +0530
X-Gm-Features: AaiRm50bLnSJmL_Z9YhtuFVKJ7GuwtPnimNAUXwFMlMI0A_rTFLg85OTzmYkdpI
Message-ID: <CABHAK8PF1U9LKO-7uem36N1Zw+H73ECLDhfHHrciN+4RvYMV_w@mail.gmail.com>
Subject: [PATCH v2] disas/sparc: Fix integer overflow and convert to g_malloc
To: mark.cave-ayland@ilande.co.uk
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=aadhyar.cs24@rvce.edu.in; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

From 41436452357983a35d2280d04be3fad269928a72 Mon Sep 17 00:00:00 2001
From: Aadhya R <aadhyar.cs24@rvce.edu.in>
Date: Sun, 15 Mar 2026 12:27:39 +0000
Subject: [PATCH v2] disas/sparc: Fix integer overflow and convert to g_malloc
To: mark.cave-ayland@ilande.co.uk
Cc: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org

Replace standard C allocators with GLib functions to safely handle
out-of-memory aborts. Also change '1 << i' to '1ul << i' to prevent
undefined behavior when shifting into the sign bit. Resolves SVACE
warning and GitLab issue #1798.

Signed-off-by: Aadhya R <aadhyar.cs24@rvce.edu.in>
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

