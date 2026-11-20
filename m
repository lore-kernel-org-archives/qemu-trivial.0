Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB34F606A889
	for <qemu-trivial@archiver.kernel.org>; Fri, 20 Nov 2026 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ePGo0Thp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xUTFa-0008T0-RK; Fri, 20 Nov 2026 13:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xUTFX-0008Fx-87
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2026 13:22:16 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xUTFS-0000ti-KV
 for qemu-trivial@nongnu.org; Fri, 20 Nov 2026 13:22:13 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4bb6057b333so5258365e9.3
 for <qemu-trivial@nongnu.org>; Fri, 20 Nov 2026 10:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795198929; x=1795803729; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fnmqKdmm58bKwG+wkVcI14sV7PN4tzLg6CI/lKCm1QU=;
 b=ePGo0Thp/k8b+6r1ObiXUvq+NNDlGS8K3+uVdgWZ4xpXPxMy6xkgRy8icPVS8TB60l
 4iwMZ7jAQSjEnbynwEFHEJbD83I9PEY5tk/OKIUysC6mfLUuuLrbFsj1qZYcIlgwLy54
 VpAKumQArc44eEzU189wShYQjIGxb765LbOCKIdg2X1Lf/44O7MaoFhEAwk7UKzsmFR9
 6NiMef4vj7WhfDrrcuEVKB7tMxGDfAImbaV4aXsebukDf39guQ762x1yqXuoN+wx/h7J
 xqMhzfnBs2CiYgItMFNe+BPrTuZG2A3UAezV5BJ6MevPM9K/DJma4Jxm2vfh64CpxDTN
 dUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795198929; x=1795803729;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=fnmqKdmm58bKwG+wkVcI14sV7PN4tzLg6CI/lKCm1QU=;
 b=q/+ThlAsEYNLJ/va6avRcutqmlYTzBbz0fydVxgUguSKs0El6Xc29SIu9dM+gQ0q3o
 7RMpJP9loYirH14bQD6AXn4DlrMiiRFgACmeZCkdp7X7LYL6+ey5HjDVbRoKrMcOO3Iz
 cMQtDxqJwnUugUVpSChFOQ0cGe/vf3qygb1TBPph9YXGlLuZtziGah2M4mngU5zS0Aaa
 BAFrZMxPWiXveZLoTVcdEy3yy8kR4t0ncEqYO1SpWoLTPaMFntog5fyL1g7IHt9bexcN
 SIqdISt3i3HMci9Z8eHFvTwvRCkLcVshLvT0rIDKESaumjxbt4rxdWPTRTbOFjFz98Ur
 xv6A==
X-Forwarded-Encrypted: i=1;
 AL+hErEe+zOi5oeAiNkU2ipxGeZMUMq0PTVXOoYDkSmX/jRMhocMEQ9kdZFnH0owy3BxVBNKd31C/PCmoy4lQlQ=@nongnu.org
X-Gm-Message-State: APuU4Z8iFvrddit85kpb0rPTmTl3/Pw9wBOxpK0MNQOVElznDsqhgz5B
 65TyYENTbOORDv4tdB3MVjekxKRRlacWP76McpP0bcnTS/y6Y9bF4rkqGPOkEalk+qM=
X-Gm-Gg: AYBFou24FdOhlRbzgbDEYxalffveXCek0lofJlf21ytBwDACuwu3G0h040BV3kLTP4O
 XtjIJEfRG5SW4GylWBlQCpXgT+oK45Nnt1N6AEm5015CNH2EmT7DZbtIReFN9Y+sWkMYToarMmz
 YKpAIGaGoNCEALNTb/+ECkBWjxmrK2oIcI6gBeMTnnonZjc9LPAPNDoAzN3sZ3cI+6B6sIFdnBG
 mPAHjL9rybnbd+ajvprJmezm0ocPqmjcID9kA+1KUHiAXtFAv3VLwURc8+lTUG96iozrNvLANmb
 0jLImnWrh0HcoNpGbicGcP4qz4IQNa8TloZ/mDJR04MNKRKoRE1wHwI+iNtUEk9ydAfnoYOhdwo
 FWfQ+Jn8+zTZQpOLbIJ7YKz2aDXdPEi2qdzecEEt190t0UAWvZZoz0Em9eGqRxNG6C0sYkvHghd
 7/CzYu6ayxhU7tjTp5cvUxk6NpEemmqenTSnK0HRQ2eLeWe5Rijcwt2lqL+234mZtj/J8UaRPax
 XlyOrsXlbPU0KkI/dnJHsDuj11sxCsCWJKzCU0xJ4yX5wOrflHs3KS8jNYiiBMGwD6ovN1keHrS
 hJayaLvyw6cmwSIEjJWEYeqF1MF4
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id
 5b1f17b1804b1-4bb8880eecbmr96003535e9.12.1795198928812; 
 Fri, 20 Nov 2026 10:22:08 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67f204sm8144051f8f.21.2026.11.20.10.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 10:22:08 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id D139A5F7FE;
 Fri, 20 Nov 2026 18:22:06 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] MAINTAINERS: update Daniel's entries to be consistent
Date: Fri, 20 Nov 2026 18:22:00 +0000
Message-ID: <20261120182200.789086-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x329.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When testing my get_maintainers.py I was shocked to see:

  ➜  ./scripts/get_maintainer.py --list-absent-maintainers-since "2 years ago"
  Maintainer              Last Seen   Email(s)                        Subsystems
  ------------------------------------------------------------------------------
  ...
  Daniel P. Berrange      2024-06-10  berrange@redhat.com             QOM, QDev, Seccomp, Cryptography, Buffers, I/O Channels, User authorization, Sockets, File monitor, Functional testing framework, Build system architecture, Meson, GIT submodules

Which is of course incorrect but tripped up by the fact we have been
utf-8 clean for some time. There are some entries that are correct so
fix up the rest in solidarity with my fellow utf-8 using hackers ;-)

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e2bd501f18e..031183706a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3748,7 +3748,7 @@ T: git https://github.com/kostyanf14/qemu.git qga-win32
 
 QOM
 M: Paolo Bonzini <pbonzini@redhat.com>
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 S: Supported
 F: docs/devel/qom.rst
 F: include/qom/
@@ -3763,7 +3763,7 @@ F: tests/qtest/qom-test.c
 
 QDev
 M: Paolo Bonzini <pbonzini@redhat.com>
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 S: Supported
 F: docs/qdev-device-use.txt
 F: hw/core/qdev*
@@ -3996,14 +3996,14 @@ F: tests/qtest/dbus*
 F: scripts/xml-preprocess*
 
 Seccomp
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: system/qemu-seccomp.c
 F: include/system/seccomp.h
 F: tests/unit/test-seccomp.c
 
 Cryptography
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Maintained
 F: crypto/
 F: include/crypto/
@@ -4024,20 +4024,20 @@ F: include/qemu/coroutine*
 F: tests/unit/test-coroutine.c
 
 Buffers
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: util/buffer.c
 F: include/qemu/buffer.h
 
 I/O Channels
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Maintained
 F: io/
 F: include/io/
 F: tests/unit/test-io-*
 
 User authorization
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Maintained
 F: authz/
 F: qapi/authz.json
@@ -4045,14 +4045,14 @@ F: include/authz/
 F: tests/unit/test-authz-*
 
 Sockets
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Maintained
 F: include/qemu/sockets.h
 F: util/qemu-sockets.c
 F: qapi/sockets.json
 
 File monitor
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: util/filemonitor*.c
 F: include/qemu/filemonitor.h
@@ -4190,7 +4190,7 @@ F: docs/specs/fsi.rst
 F: tests/qtest/aspeed_fsi-test.c
 
 Firmware schema specifications
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 R: Kashyap Chamarthy <kchamart@redhat.com>
 S: Orphan
 F: docs/interop/firmware.json
@@ -4691,7 +4691,7 @@ F: tests/vm/freebsd
 Functional testing framework
 M: Thomas Huth <th.huth+qemu@posteo.eu>
 R: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: docs/devel/testing/functional.rst
 F: scripts/clean_functional_cache.py
@@ -4723,7 +4723,7 @@ F: .gitlab-ci.d/custom-runners/debian-13-ppc64le.yml
 Documentation
 -------------
 Build system architecture
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: docs/devel/build-system.rst
 
@@ -4753,7 +4753,7 @@ Build System
 Meson
 M: Paolo Bonzini <pbonzini@redhat.com>
 R: Marc-André Lureau <marcandre.lureau@redhat.com>
-R: Daniel P. Berrange <berrange@redhat.com>
+R: Daniel P. Berrangé <berrange@redhat.com>
 R: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
 S: Maintained
 F: meson.build
@@ -4785,7 +4785,7 @@ F: hw/*/Kconfig*
 F: target/*/Kconfig*
 
 GIT submodules
-M: Daniel P. Berrange <berrange@redhat.com>
+M: Daniel P. Berrangé <berrange@redhat.com>
 S: Odd Fixes
 F: scripts/git-submodule.sh
 
-- 
2.47.3


