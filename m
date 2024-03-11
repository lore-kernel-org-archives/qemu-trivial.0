Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rjeO1-00058r-Ea
	for mharc-qemu-trivial@gnu.org; Mon, 11 Mar 2024 08:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rjeNy-00051c-Cd
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 08:04:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rjeNu-0005ID-Ta
 for qemu-trivial@nongnu.org; Mon, 11 Mar 2024 08:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710158642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=T2ijriOUscBduP8XMUrQHkASSXRp/fhKTcLofPcteR4=;
 b=Q94+CfH55/X4Z5LjRqUAx2BNi1SRBfahEKB6l6u2RHLB87SLnfszTdOgxL+XwhvDHE037+
 30ce8Lptn7RtGq0yOYUmi21TmC8sc4WtGVQZJ77LQOusuGgQ+5sDMMu0QwRieyzcTV0V/r
 tTvUdAivu4KeTVylCLpbvoZDYiorRAI=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-OjKl2uYHN-C-6jGQZuwj-Q-1; Mon, 11 Mar 2024 08:04:00 -0400
X-MC-Unique: OjKl2uYHN-C-6jGQZuwj-Q-1
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-5ce67a3f275so2062939a12.0
 for <qemu-trivial@nongnu.org>; Mon, 11 Mar 2024 05:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710158638; x=1710763438;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T2ijriOUscBduP8XMUrQHkASSXRp/fhKTcLofPcteR4=;
 b=VmmDedd4IaOJXi2v37fBh46i8QUOo97qXKJW//huQdLVr+YE8F3R16lUA2SUoGWjUj
 /lIcIrRwwPN36fVzaTomD/JPoJ6M0FsTn4P7T+Qb0AGreYLrCmz6wHd1Xxmfz4zw3gd5
 40I5NppSCEcv6scCVRhl3zNQH4ov4rx6xXECheC16pA+dKq9J8zNfI0e03uGNzxKVH5D
 BVqe07yRfgnaOMJFjO090XDYNGG8qHiZSVpQZXuvvf9kmvA5BpgEA7PxBWaNCYsGExTi
 Yu4vC+BWsxbOCiNJo51ZOm6VRTyyFI0fOaRS8rLM6GMUfvMypeRzOX1IF4FUHJvz65Zj
 TnZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVndjlyBmZwn4lVpmxbL7hTHoxZiZBFt8dtuSgxgOm7ua1RYE7YFnWiYXbE54P6aNYJeXO4v1NynAOEtGPx2cr0gZEKJqUr7Q==
X-Gm-Message-State: AOJu0YxKA+0baoVY7n7YHeL88ad8pY7u/1tywL0fwUw6XoNGbYi4jX3Y
 VcMsi2Au87yHdGdwcnnRekHkHgC8DAf1au0NiHmkv+rpT5AkEfi73cdHsqaBzAn9hCCQkdLPGVE
 LyclMhpJQZVyy4uBcSQ4pEkFeePImE3byHbUH07Wmyo7V7ArZnwLKO2KmG+VQ4VQ=
X-Received: by 2002:a05:6a20:8f0a:b0:1a1:6978:fd6f with SMTP id
 b10-20020a056a208f0a00b001a16978fd6fmr4036591pzk.5.1710158638506; 
 Mon, 11 Mar 2024 05:03:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5vHO//NowsbzBM2k7ZE97NHrDhttrlD6TvbMTL376G2ygrHB2t7wsHuHQL6cD62U3kYQt2g==
X-Received: by 2002:a05:6a20:8f0a:b0:1a1:6978:fd6f with SMTP id
 b10-20020a056a208f0a00b001a16978fd6fmr4036556pzk.5.1710158638099; 
 Mon, 11 Mar 2024 05:03:58 -0700 (PDT)
Received: from fc37-ani.redhat.com ([115.96.143.99])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a632107000000b005d8be4c125csm4040968pgh.80.2024.03.11.05.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Mar 2024 05:03:57 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] docs: update copyright date to the year 2024
Date: Mon, 11 Mar 2024 17:33:46 +0530
Message-Id: <20240311120346.9596-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.029,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 11 Mar 2024 12:04:06 -0000

We are already in the third month of 2024 but the copyright notices still refer
to 2023. Update the date to 2024 in documentation and help texts.

Cc: peter.maydell@linaro.org
Cc: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 docs/conf.py              | 2 +-
 include/qemu/help-texts.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index 1b2afa241c..aae0304ac6 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -88,7 +88,7 @@
 
 # General information about the project.
 project = u'QEMU'
-copyright = u'2023, The QEMU Project Developers'
+copyright = u'2024, The QEMU Project Developers'
 author = u'The QEMU Project Developers'
 
 # The version info for the project you're documenting, acts as replacement for
diff --git a/include/qemu/help-texts.h b/include/qemu/help-texts.h
index d0359f82e0..353ab2ad8b 100644
--- a/include/qemu/help-texts.h
+++ b/include/qemu/help-texts.h
@@ -2,7 +2,7 @@
 #define QEMU_HELP_TEXTS_H
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2023 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2024 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.39.2


