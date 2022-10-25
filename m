Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1onTgc-0005pT-2B
	for mharc-qemu-trivial@gnu.org; Tue, 25 Oct 2022 19:50:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgb-0005mr-AC
 for qemu-trivial@nongnu.org; Tue, 25 Oct 2022 19:50:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1onTgZ-0003AT-Ll
 for qemu-trivial@nongnu.org; Tue, 25 Oct 2022 19:50:21 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bu30so23702143wrb.8
 for <qemu-trivial@nongnu.org>; Tue, 25 Oct 2022 16:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0yTaGsZHNPUu3CilHrQm5jTyitcs79CW2tWvEcIMGsg=;
 b=TfJZ24W04kprBgQyLV6Cc471bE0Nfmfg9QUn2RftxA+QlS4u5WEhadL2SOuRZItHYg
 e6YI316l5hvIrZM/1TdvBL6pQzXHsMwN9967EKpDoqnOKuO4NtWdu/JnjHcN4hMIbcnj
 YlHt2yO7EJYxqeheQLUv+2+a5N6vpC+hjYk023lWaTrISVKMxZFjVfsw64kD0ToSRzzL
 w+52zhebgN2HUH7Q1X2hIV9ARWMATjeknmsNuAxR0m4IMqrDKZ5dXOaZWxKjsEAGthAH
 WUdGnSVyib1eLi19VfB0xjWsZTlx9c2m0dNBVJuoOh2Zvx59UyJmU4bzz2swfrYSyvtf
 EZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0yTaGsZHNPUu3CilHrQm5jTyitcs79CW2tWvEcIMGsg=;
 b=2dUXsx8PEnYnmvIvQqd3ARln/dh3gNzB1fK+5vEbwdgb/ESETjWBmw7JqUn2/WgSv0
 QjxnX9KxB3fYz9TELfW8XLsrTKHnK+/JAGyc7hI3j9NZacCM75kzoFCC8RuiZP0VuXaC
 iD4/N25VzuEV6rt2FTacJXtjWH8RPMTiGzQTmA45Q0JHwy2VS5mFuwpXiEaGFtS38jPi
 mE3NIm1XJJXTvonc6oAz9q+s9zDDVtMzCxcLVX11jUqNpny+GAQ4znlLjaWb9gNquZlh
 t0iPFtW+o8eNB9FWTvbrEdUkQ1gQ87aBUw2ifCiIzjLyPp1MhtR52IzTTGFppFZqSUP9
 LK5w==
X-Gm-Message-State: ACrzQf1sb/HVtKIDTM8nfmZ8oxNmqVltI+i+YEyhzVJPcX5cGR1/Z3ro
 NAmtMefd+Y9/r3dTIypN04fgyQ==
X-Google-Smtp-Source: AMsMyM4vV2rmsdjHh8PUQi1oLatS5r43BtHhNL/xESvEEK4vNDPcYSV7CR+nYuAOdY5C76/4n1dQ9A==
X-Received: by 2002:adf:cc92:0:b0:236:77f0:ef5f with SMTP id
 p18-20020adfcc92000000b0023677f0ef5fmr7221110wrj.198.1666741818381; 
 Tue, 25 Oct 2022 16:50:18 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a1c740f000000b003c6fb525b4csm268551wmc.38.2022.10.25.16.50.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 25 Oct 2022 16:50:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Cornelia Huck <cohuck@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] target/s390x: Rename insn-data/format.def ->
 insn-data/format.h.inc
Date: Wed, 26 Oct 2022 01:50:05 +0200
Message-Id: <20221025235006.7215-3-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221025235006.7215-1-philmd@linaro.org>
References: <20221025235006.7215-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Tue, 25 Oct 2022 23:50:21 -0000

We use the .h.inc extension to include C headers. To be consistent
with the rest of the codebase, rename the C headers using the .def
extension.

IDE/tools using our .editorconfig / .gitattributes will leverage
this consistency.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/s390x/tcg/{insn-data.def => insn-data.h.inc}    |  2 +-
 .../s390x/tcg/{insn-format.def => insn-format.h.inc}   |  0
 target/s390x/tcg/translate.c                           | 10 +++++-----
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename target/s390x/tcg/{insn-data.def => insn-data.h.inc} (99%)
 rename target/s390x/tcg/{insn-format.def => insn-format.h.inc} (100%)

diff --git a/target/s390x/tcg/insn-data.def b/target/s390x/tcg/insn-data.h.inc
similarity index 99%
rename from target/s390x/tcg/insn-data.def
rename to target/s390x/tcg/insn-data.h.inc
index 6382ceabfc..7e952bdfc8 100644
--- a/target/s390x/tcg/insn-data.def
+++ b/target/s390x/tcg/insn-data.h.inc
@@ -8,7 +8,7 @@
  *
  *  OPC  = (op << 8) | op2 where op is the major, op2 the minor opcode
  *  NAME = name of the opcode, used internally
- *  FMT  = format of the opcode (defined in insn-format.def)
+ *  FMT  = format of the opcode (defined in insn-format.h.inc)
  *  FAC  = facility the opcode is available in (defined in DisasFacility)
  *  I1   = func in1_xx fills o->in1
  *  I2   = func in2_xx fills o->in2
diff --git a/target/s390x/tcg/insn-format.def b/target/s390x/tcg/insn-format.h.inc
similarity index 100%
rename from target/s390x/tcg/insn-format.def
rename to target/s390x/tcg/insn-format.h.inc
diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 1d2dddab1c..f378e1a633 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1011,7 +1011,7 @@ static void free_compare(DisasCompare *c)
 #define F6(N, X1, X2, X3, X4, X5, X6) F0(N)
 
 typedef enum {
-#include "insn-format.def"
+#include "insn-format.h.inc"
 } DisasFormat;
 
 #undef F0
@@ -1076,7 +1076,7 @@ typedef struct DisasFormatInfo {
 #define F6(N, X1, X2, X3, X4, X5, X6)       { { X1, X2, X3, X4, X5, X6 } },
 
 static const DisasFormatInfo format_info[] = {
-#include "insn-format.def"
+#include "insn-format.h.inc"
 };
 
 #undef F0
@@ -6143,7 +6143,7 @@ static void in2_insn(DisasContext *s, DisasOps *o)
 #define E(OPC, NM, FT, FC, I1, I2, P, W, OP, CC, D, FL) insn_ ## NM,
 
 enum DisasInsnEnum {
-#include "insn-data.def"
+#include "insn-data.h.inc"
 };
 
 #undef E
@@ -6223,7 +6223,7 @@ enum DisasInsnEnum {
 #define FAC_MIE3        S390_FEAT_MISC_INSTRUCTION_EXT3 /* miscellaneous-instruction-extensions facility 3 */
 
 static const DisasInsn insn_info[] = {
-#include "insn-data.def"
+#include "insn-data.h.inc"
 };
 
 #undef E
@@ -6233,7 +6233,7 @@ static const DisasInsn insn_info[] = {
 static const DisasInsn *lookup_opc(uint16_t opc)
 {
     switch (opc) {
-#include "insn-data.def"
+#include "insn-data.h.inc"
     default:
         return NULL;
     }
-- 
2.37.3


