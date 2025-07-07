Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CA4EC8303C
	for <qemu-trivial@archiver.kernel.org>; Mon,  7 Jul 2025 15:21:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1uYneE-0006v5-NI; Mon, 07 Jul 2025 11:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYn9n-0002Oj-VM
 for qemu-trivial@nongnu.org; Mon, 07 Jul 2025 10:49:24 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYn9m-0006fN-6N
 for qemu-trivial@nongnu.org; Mon, 07 Jul 2025 10:49:23 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-453647147c6so30391745e9.2
 for <qemu-trivial@nongnu.org>; Mon, 07 Jul 2025 07:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751899759; x=1752504559; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Dd9xuKmUOLqFFJSSVk33+N9XqTung+GNu3r67W7FU5k=;
 b=bWwSMs1ckMyuNAMGLa/yocUcDMjpCr8ex0rC+bA/zytcJ8KvbvMAJNRjL1E7C10hOH
 2N5n8ewjvyADPZUfp2jMLeaW0K1Gbx7A85Nc6pdXW5cEctT5ODhuH/wzE2ukxuhGMPWR
 CmKtnx3MUSF6h379vCPu8VRl+PW4I7N+/B5/qmYeK7Om1IKZ3q1pj36xB+GbVTnYiqEm
 OG4gnX93gHYqbUm+zSY71vn+/0cCQuGk55nttvgg9kGT+fAo3luP/8AcuDooYV9sOfxO
 nyr5WgGfk32Zu8Uc041fW3LFF8HEp44DG5B424lhAYOv6ngeWVQczntN+jKNoWn9Cccr
 1Ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751899759; x=1752504559;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dd9xuKmUOLqFFJSSVk33+N9XqTung+GNu3r67W7FU5k=;
 b=K83Vb5v3VT+dfGIL+uf19//FESso6myFApbSmbCksixvBXi8Rqyn7/CNShQnUOiyzG
 ujJ0Pqtagrv2T2Rq0NHMtH6bvIZy37Bnq3Z0Hf5yC1rtKgZ6YnBnrilAoh4vHCgDnmJb
 CMWK6/ZopPQ061+70CTyei2FBbhbEMEv0/4jUkCnd8++QQAI6KtHX3g4Rwybl6g9gdZi
 cs+InOo6UvmXWSrQYUDm+WQgEd/+JTMmyEeShP9TMlUPhqkC/Z89zRa7XJeubnA8uRS1
 j08vUxXntPW4iMR/VSTLmwbSik55SFA0Yx+59BsPf55XVmu9pOSLDPlZZC+Rbh2ri2er
 fOYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWNy8eC6m/H0Z3Z39feJmC6q9pByJeLVrBlLGEclsuyyp9ojYzn8P3eYHFxC2kwuOayjjCHzp1kuYnMN8c=@nongnu.org
X-Gm-Message-State: AOJu0YxSAwF9f01si3Ho4CRf+40gYfz/c9vZbm++fhflbUykLUBR/tvi
 NwWbwb+wZzYj10D1rz9fFXKj6gVbhaz1hYgOJDellZKQiMurVJ2Mn3NvmemCTJ1O1V8=
X-Gm-Gg: ASbGncuOKTyqQAyBW1g2cNHSOennUaYgF43+JiEs4Hx0PgrVqkISElBLBxSiRGWotS+
 scD7Bi5D53PgT7sf/SPijQItpt60DrYVGUgPFCtUrGnwJGkoQv5iC1beg8Ox10krggWh0fWbm0Z
 qHgIJP1dmJOFMGD7Ytnb9srzenGhnkI+ICbG3dFyeSwIEe+6gqYoyFf3tsyjK6qciB2nqID2pKp
 GMCdUgZvecO2O/7otE2ZNbqygZEKL9dZknsxWDIqdi65B5v/mBsZ5TTBAP9Mt54+YvqHI7x92LS
 It2tMlacDqedMqFyx7uGnRroNuAP1HIhu9RRwhiEjoqSgGnExaLMA9yRDlhewAzrEwV/
X-Google-Smtp-Source: AGHT+IG/Y3IpctD2VxBtSTx2pzODDrXbdbTV8321+8wVesiYUYCHnDNYz0aLRM+pjv5YdloJQSUYWQ==
X-Received: by 2002:a05:600c:1c85:b0:43c:ec0a:ddfd with SMTP id
 5b1f17b1804b1-454bb7fa925mr75924085e9.6.1751899759210; 
 Mon, 07 Jul 2025 07:49:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b161e8dbsm115361395e9.5.2025.07.07.07.49.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 07:49:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH] docs/devel/tracing: Update trace.h creation rune to include
 SPDX
Date: Mon,  7 Jul 2025 15:49:17 +0100
Message-ID: <20250707144917.576573-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

checkpatch now checks that new files have an SPDX line. If you use the
shell rune in tracing.rst to create a trace.h wrapper header, this
triggers checkpatch to complain.

Although these files are tiny, it's worth having the SPDX line to
avoid having to add extra exception cases to checkpatch.

Update the rune to include creating an SPDX line.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
NB that checkpatch's SPDX test gets confused by this patch:
 ^* matches null string many times in regex; marked by <-- HERE in m/^* <-- HERE /'$/ at ./scripts/checkpatch.pl line 1389
---
 docs/devel/tracing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/devel/tracing.rst b/docs/devel/tracing.rst
index 043bed7fd0f..f4557ee20e4 100644
--- a/docs/devel/tracing.rst
+++ b/docs/devel/tracing.rst
@@ -76,7 +76,7 @@ The "io/trace.h" file must be created manually with an #include of the
 corresponding "trace/trace-<subdir>.h" file that will be generated in the
 builddir::
 
-  $ echo '#include "trace/trace-io.h"' >io/trace.h
+  $ (echo '/* SPDX-License-Identifier: GPL-2.0-or-later */' ; echo '#include "trace/trace-io.h"')  >io/trace.h
 
 While it is possible to include a trace.h file from outside a source file's own
 sub-directory, this is discouraged in general. It is strongly preferred that
-- 
2.43.0


