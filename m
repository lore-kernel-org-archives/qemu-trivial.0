Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rcLsj-0000jT-6d
	for mharc-qemu-trivial@gnu.org; Tue, 20 Feb 2024 03:53:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsh-0000h3-9A
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:39 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1rcLsd-0008HY-Ih
 for qemu-trivial@nongnu.org; Tue, 20 Feb 2024 03:53:38 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-564647bcdbfso2149353a12.2
 for <qemu-trivial@nongnu.org>; Tue, 20 Feb 2024 00:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708419213; x=1709024013; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ziY8Jw6EXE5hHrClCqTsAlncUS9FIpDkSwZM2WtkVaQ=;
 b=lUzLHf+T7784UUflbBgOF/O90in0Gw2hHEf9aGWjOnBmNJ7gt+jaTMQyiPVm106V3W
 lafzyeaasSeV4rqZplFKM2nO3V8ZwE6fG1NbgKMbUZplc56rWlQX+/EUePjRYCJwA/8z
 +40irqFoU33sYwsJs/0+heVErPqrrJhR0uouyqmIsBUdP+eIWQMHwtpuWJYLYkO26CLy
 ci7jQrrpIy2V68Nnma9bcJQFollNyMNtoQ1r29DWp373SEz/CH76BjHIWOwZ4IMJ00iV
 kkurkgIaQwOGL06NnOzmsf4ivdjgUtx0hI10G88SciSCH2DSnm5jNgixk2fQhdzRogkC
 rdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708419213; x=1709024013;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ziY8Jw6EXE5hHrClCqTsAlncUS9FIpDkSwZM2WtkVaQ=;
 b=F9WQHy3OXAiJn5e5oz6wy2RbBjOLzdgAuzHPy08JlpmJeBQOuKn1VomgxGkLP8wte3
 +TIv1s5NeeBp0QZU/JVyp1NUUHRN3TT0fTHZGLe6VpIWmDakMg1B6O4v7w0he3fG7F/H
 2MzHaxLEupCXuU2JJ64aXu9l7yPKrpP8yXbT0xZKimm023bbPon/JzyrSJ6WN1Hv1G2I
 C4Va3W88ZRf9+N6bomrvofOVQ8iBNq+6O5XL40xzymTahOwsa8m0QZ1hdYcPfqWSNieW
 wa4A5pGWPBs6ZSKURTefX91NQhOOlO/YKSJnlF6BJW3hgPqiRcPBHULIlw1f1ZVzzt+v
 hs8Q==
X-Gm-Message-State: AOJu0YyEIcEa7QydRUv/FLCSYHZRG7ZICTHixZoqafcZrZlbcZU1xPHx
 D1k1QK/Q5iLezWtbbGL+aaYXW0pd5sjvlQzrUgl/PLtYb6JeWqPNr8NeqvMF6lVLocEdNJw8hl+
 6egc=
X-Google-Smtp-Source: AGHT+IFs+obNRLn2DlVizb4uoIAG0u5rk3shlnPOJbhDry9L0AbiIOXWZE19Uyl74IlUIfaXFolvhg==
X-Received: by 2002:a17:906:57ca:b0:a3f:ce8:1234 with SMTP id
 u10-20020a17090657ca00b00a3f0ce81234mr404484ejr.68.1708419213706; 
 Tue, 20 Feb 2024 00:53:33 -0800 (PST)
Received: from localhost.localdomain (adsl-245.37.6.163.tellas.gr.
 [37.6.163.245]) by smtp.gmail.com with ESMTPSA id
 cu3-20020a170906ba8300b00a3d014fa12esm3747876ejd.196.2024.02.20.00.53.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 00:53:33 -0800 (PST)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-s390x@nongnu.org
Subject: [PATCH v1 20/21] s390x: correct typos
Date: Tue, 20 Feb 2024 10:52:27 +0200
Message-Id: <73c534c8b6cdd769ab4d0220f505da8ec7470983.1708419115.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
References: <cover.1708419115.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 20 Feb 2024 08:53:39 -0000

Correct typos automatically found with the `typos` tool
<https://crates.io/crates/typos>

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/s390x/cpu_features_def.h.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/cpu_features_def.h.inc b/target/s390x/cpu_features_def.h.inc
index e68da9b8ff..c53ac13352 100644
--- a/target/s390x/cpu_features_def.h.inc
+++ b/target/s390x/cpu_features_def.h.inc
@@ -142,7 +142,7 @@ DEF_FEAT(SIE_CEI, "cei", SCLP_CPU, 43, "SIE: Conditional-external-interception f
 
 /*
  * Features exposed via no feature bit (but e.g., instruction sensing)
- * -> the feature bit number is irrelavant
+ * -> the feature bit number is irrelevant
  */
 DEF_FEAT(DAT_ENH_2, "dateh2", MISC, 0, "DAT-enhancement facility 2")
 DEF_FEAT(CMM, "cmm", MISC, 0, "Collaborative-memory-management facility")
-- 
γαῖα πυρί μιχθήτω


