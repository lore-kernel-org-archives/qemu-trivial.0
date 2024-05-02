Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s2XQv-0000Db-Bx
	for mharc-qemu-trivial@gnu.org; Thu, 02 May 2024 10:29:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2XQu-0000Cn-Ey
 for qemu-trivial@nongnu.org; Thu, 02 May 2024 10:29:12 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s2XQs-0001kW-IQ
 for qemu-trivial@nongnu.org; Thu, 02 May 2024 10:29:12 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2db6f5977e1so93650201fa.2
 for <qemu-trivial@nongnu.org>; Thu, 02 May 2024 07:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714660148; x=1715264948; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IzTYQxXA15CKrEh25p1hdM44GrHltJy7g46cuEmtUgk=;
 b=wWVrNXchnPLh1SRRR1TfzgoHSZweZGXwTNOrrFpiL7lVyoWGZG1Z7CXKP3hnhdG0b9
 xsREAXChX6J00raKaQtR3+nxs5ryrvdfMs1gf5Y8TDOG808xiACYxT6U3yVBjqE7+nW4
 ipNuHn444pO4CCaKyR961PK+Uq31fZRI/UbjoQnj5UQdsl6HtP6x4nwhGJk4Xt3dd8F6
 1As82PYifq6m+nZ9r9diUSu2NifxjfuLN/OUSW5xIm9caDc3Hk7ufMYcbU1O+3doH5GZ
 Q5j+p9wEKR4TmIW1axBloLHVyvsQsHXZelUxh06qHO+Uj4+IPXdx7JbiCAvVyQm9f3Sq
 guSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714660148; x=1715264948;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IzTYQxXA15CKrEh25p1hdM44GrHltJy7g46cuEmtUgk=;
 b=Q8926eCWNWPtjo5To1fCsh8rF3EJRt5Z4q0XIR6CrfDYPSciP7HduuCO4uCLIHszYL
 QWVHYkQ0OFkmOQmhVTri10FtoFgl6znGKa+ucuAE2T3v2HXsVGMjHKW0fa62v04uWRfy
 SbCXE5c2E12XpW8ZAviUlq4T8bs3E5bHYSX6Xa0hy/iqzXljNLT1Uq6Hn69mUa6h8tum
 ROogDSohWQFpV3hMbEfN54rBnIdHNGEXhsjDaFfrpgqqcvSqFT/O4ZO8mkA4KjVc3MIn
 HxUn/CzwAL+SLRXyWOMoqZ2AaMtzR5ICSkXiTe2lZKsklDgAA0MwIi8YuKWHXj0q4lbm
 OQkQ==
X-Gm-Message-State: AOJu0YxHO4NU6G4/a+kLe/Ru583Amd3e+sqQ/7Bp6pcxt/ARKbzvQHoA
 gA1Zf560iKzQgoLT8GPHnr0uPXeg+UsGUk6giUBD5vLsahLP6mMR1l35Byr1+k4=
X-Google-Smtp-Source: AGHT+IFFKORn4jgXgD8pRCbpwEkzVeXnoq8C2HdtiNv9UB1FFtWZ7OsrAhGRZ7I0t9oyD79RdeIiJg==
X-Received: by 2002:a2e:a167:0:b0:2df:b800:5bff with SMTP id
 u7-20020a2ea167000000b002dfb8005bffmr3603651ljl.7.1714660146338; 
 Thu, 02 May 2024 07:29:06 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v14-20020a05600c470e00b00417e8be070csm2112941wmo.9.2024.05.02.07.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 07:29:06 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH] ui/cocoa.m: Drop old macOS-10.12-and-earlier compat ifdefs
Date: Thu,  2 May 2024 15:29:04 +0100
Message-Id: <20240502142904.62644-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
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
X-List-Received-Date: Thu, 02 May 2024 14:29:12 -0000

We only support the most recent two versions of macOS (currently
macOS 13 Ventura and macOS 14 Sonoma), and our ui/cocoa.m code
already assumes at least macOS 12 Monterey or better, because it uses
NSScreen safeAreaInsets, which is 12.0-or-newer.

Remove the ifdefs that were providing backwards compatibility for
building on 10.12 and earlier versions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 ui/cocoa.m | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 25e0db9dd0b..981615a8b92 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -50,23 +50,10 @@
 #include <Carbon/Carbon.h>
 #include "hw/core/cpu.h"
 
-#ifndef MAC_OS_X_VERSION_10_13
-#define MAC_OS_X_VERSION_10_13 101300
-#endif
-
 #ifndef MAC_OS_VERSION_14_0
 #define MAC_OS_VERSION_14_0 140000
 #endif
 
-/* 10.14 deprecates NSOnState and NSOffState in favor of
- * NSControlStateValueOn/Off, which were introduced in 10.13.
- * Define for older versions
- */
-#if MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_13
-#define NSControlStateValueOn NSOnState
-#define NSControlStateValueOff NSOffState
-#endif
-
 //#define DEBUG
 
 #ifdef DEBUG
-- 
2.34.1


