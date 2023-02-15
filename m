Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSJoB-0004Ak-Of
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2023 10:34:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJoA-00048j-B6
 for qemu-trivial@nongnu.org; Wed, 15 Feb 2023 10:34:58 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJo8-00087s-C0
 for qemu-trivial@nongnu.org; Wed, 15 Feb 2023 10:34:57 -0500
Received: by mail-wm1-x32e.google.com with SMTP id p5so1210613wmg.4
 for <qemu-trivial@nongnu.org>; Wed, 15 Feb 2023 07:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NKH73T8CoRDn773NUygCpVvIPtF8CVn6vI6nMM27j1I=;
 b=oWMZO8SDTBKsKLKV5arFKZkrAJOGtNpPBm7I7aWKb95hPiiIgSofZ2fkKU9tV1yKEk
 ezjXzyaIJvJZ7pt/cesNBdhWjhfCD6KYhuK3pUsvBFLzjuXN7TM3pj0Aj+NMo1rWX/D+
 HjCANU6Wo6wCGW/Kv//t8t8RmH8XJ2EJBasw66r5j5wcdU9lsvUIE3mQU9Vp7JQA2sI5
 +CUrsISj4deC6Zc/TrdvDLfz1UMTfaaVHV/WHx/zcqM5nvoBYV7XqNW0nYgniuMJfDdo
 OQ1fyZ5xzZ5uQqcPz6yGnEHfZanaWvSUEkKl05yMthFmyQCAbLDxwE1G6pJTej7KTPSv
 eo3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NKH73T8CoRDn773NUygCpVvIPtF8CVn6vI6nMM27j1I=;
 b=VZIadYfGcc6KhUTg9RixG12IEqCKvMYCep94DAelb+pCTrgztjWJUczY5D+KOR8xI4
 RM4c2lKPWangWJB6H3HMasrhN4tqTAlxnQyHdhskf+Z6L5JNp8gMyyRJX1tJ+wgiOmgY
 4pUzezQd95aTWXCEOoGFlZFKPNS8SXig8dwwa8GsLxAsPKnxQF+xK7vrft3SeeDEBR6n
 awy6Mro3yRAg2GbtPa6mqJGN1oeUQ7z6fEKi8WcNppQL+mHqHa8CmHeYD3Wvmbksc0O2
 mS6zarUQybgoZg/f/LTtfK7QqG+8xEgM1tKNMdLCK2Zj984DopfdKEUZZuqPn8pcM/gj
 hJdQ==
X-Gm-Message-State: AO0yUKWCgOFv1/PZ4B6q3U8GWYK48TyG0uDT/rFNbZYsnbtuz5ULa4KJ
 OspR9KiM0ttsnGaIHjcPdk8lmw==
X-Google-Smtp-Source: AK7set8VKr93YhBGymtNxoDV9uf+fr5u7KtD7OV4RU+JGE5FxHGGg56i8sDAFXLY5R0goR0ryEeC4g==
X-Received: by 2002:a05:600c:5024:b0:3df:fcbd:3159 with SMTP id
 n36-20020a05600c502400b003dffcbd3159mr2107593wmr.3.1676475294684; 
 Wed, 15 Feb 2023 07:34:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a1c770e000000b003dfdeb57027sm2282207wmi.38.2023.02.15.07.34.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 07:34:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] accel/xen: Remove dead code
Date: Wed, 15 Feb 2023 16:34:51 +0100
Message-Id: <20230215153451.30626-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 15 Feb 2023 15:34:58 -0000

Unused since introduction in commit 04b0de0ee8
("xen: factor out common functions").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/xen/xen-all.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index 69aa7d018b..c1b697a8bd 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -23,16 +23,6 @@
 #include "migration/global_state.h"
 #include "hw/boards.h"
 
-//#define DEBUG_XEN
-
-#ifdef DEBUG_XEN
-#define DPRINTF(fmt, ...) \
-    do { fprintf(stderr, "xen: " fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
 bool xen_allowed;
 
 xc_interface *xen_xc;
-- 
2.38.1


