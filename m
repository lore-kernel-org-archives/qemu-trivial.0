Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098EFCCF9E0
	for <qemu-trivial@archiver.kernel.org>; Mon, 27 Oct 2025 15:04:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vDOm1-0007WZ-Uw; Mon, 27 Oct 2025 11:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDOlx-0007Vp-5T
 for qemu-trivial@nongnu.org; Mon, 27 Oct 2025 11:04:37 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDOls-0002hP-T1
 for qemu-trivial@nongnu.org; Mon, 27 Oct 2025 11:04:36 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47109187c32so25623385e9.2
 for <qemu-trivial@nongnu.org>; Mon, 27 Oct 2025 08:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761577463; x=1762182263; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aD2sMtX6YVLwVzBVDv2pc4h1OiBzvGxiRIpUw8HWTDA=;
 b=bcZFVGZB8AYnEq7B8xgF8Fxy3afMZudlD5UF5cXADkOTWDK/ZWRPBch4IIxKK+8TEh
 aeDuIK5bAnujwGTqAYf4wiAfqcs+NsM010JaL+lF+X87ygnRsUOZXekPfu1J69QcVtkI
 bojIX+YM5D5rMEYqKWRKpXk/yyNMAJl55gTunojJvMqUvhAd1RR99ywQTf8A/LGyMt91
 +r5u2xHuLVmOzchKDfg80AjaY/kj9ErdvVbvwcq2zaeM9mFzvOcdqsTTkBEqGwqKn1Fg
 rTTNk+aJgXriL1qMs25jMmINimgDSEqGvwbXP/uJ47TBsLiIO+x6I1EvQoMc/z4mqd0W
 0dYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761577463; x=1762182263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aD2sMtX6YVLwVzBVDv2pc4h1OiBzvGxiRIpUw8HWTDA=;
 b=R+f026sr/9ln/9lWRbeBWzl/sx1MbCpumlCflqOSdYJaYbrGrQfuPGPSQlVuoVSvK5
 6Z1bEOsicuwyvSQJNY40h0uUfHog/ww+UkaDc5E3burae10SPLVMucwr9P4yEF3O0cxf
 wrf6JV4Qfx2cS32IWFaPKNQNz75rbguy2BYraZNnFzYY5OtGu84QCCHvWBtQAZnuykNG
 t6ICqAQ6UbXHb90uskXNKjhy4VhJ2ocJgxlOSAjl04+muYAyO2SLlSTO2Rh1BMSNREUo
 o9Jpml+3YumoCIOuf07d5hmP39xLtoN4lUPUiAjMEBmrbhQEjHe7of+nNXZR/buGU/uF
 mdnw==
X-Gm-Message-State: AOJu0Yy0Ad3xEDedu+Uppu1h5AyGziI8gIS+9isZR2PqCkEZulBJgk++
 XNWca7PYE/FSgKQ3+e3kC+N+/AUr9Me5ZT7BgDJzTXOqE8NbLPiqdu0IfFfltfny8hU=
X-Gm-Gg: ASbGncuL8pQZdbqK9h5QmiDfIgifRW8VD226nx0qO3Ny+K6AKf3DUU/DfQ9aTVrrroY
 I7Y2Ecz8elowdAAmvzsdxiUYw8LUZW2R6hRfpTJCv1Q544KAvrQooeOLOyzt79FtJ+ppgwNzdpU
 pLdiPM8tVYEINokJlJj30hJcPya6hICM8DFbZ7pOzYBPsVQEDmYxrS/PzLKR7fJBvmKvZBFxKMl
 v0LgGHHTvVyLl9frW2oNaMlxdN4ZQr/M2tZRv4BhD6bocuk2gUY4o2czHeD61lXlVI+fRJNYg9z
 obQEBCO6eRAmBwpsVJY39O2QHvqD8h0ydlxN5pasKTzdRT1vPznrjKPs12u0hVYRB6KgR+pNPZM
 QvRmAym4a9DL/l9Hy6wZVjEU0cF7ULYTQyLIP7BYXIimThsuZVhYWvo1Q4/Z/gR8VRR/0WEnRQm
 NH15YDJw==
X-Google-Smtp-Source: AGHT+IGctE/iEVGkezHrClG9/ap3mI1hSyHynqCScnHoyOi1s9wMMOq7sIJVhFx9Q2VCqxQVbzU4zw==
X-Received: by 2002:a05:600c:3f08:b0:470:ffd1:782d with SMTP id
 5b1f17b1804b1-47117876a19mr318439035e9.6.1761577463570; 
 Mon, 27 Oct 2025 08:04:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dcff7569sm71653245e9.1.2025.10.27.08.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 08:04:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH] docs/system/sriov.rst: Fix typo in title
Date: Mon, 27 Oct 2025 15:04:20 +0000
Message-ID: <20251027150420.2762687-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

Fix a typo in the title of the sriov.rst document.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/sriov.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/system/sriov.rst b/docs/system/sriov.rst
index d12178f3c31..b19e787339b 100644
--- a/docs/system/sriov.rst
+++ b/docs/system/sriov.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0-or-later
 
-Compsable SR-IOV device
-=======================
+Composable SR-IOV device
+========================
 
 SR-IOV (Single Root I/O Virtualization) is an optional extended capability of a
 PCI Express device. It allows a single physical function (PF) to appear as
-- 
2.43.0


