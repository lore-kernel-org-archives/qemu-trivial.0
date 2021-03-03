Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHWWZ-000599-J6
	for mharc-qemu-trivial@gnu.org; Wed, 03 Mar 2021 13:47:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWY-000571-Do
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:47:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWW-0007xd-NV
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:47:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0ygJSAUu3nItqoE7XwzNiQqtuF4qShdTNiOm3t1xDK4=;
 b=I8mcYGnLbp7EmRFRLrHuVPwgQr6DOgRSSeEz4poZ1JFeZk63a+M53koSDDDmWicCEmu8y4
 +QQymgLP3TedqyCO0CSiPpCmt8QD1OZqvkaD1BzdLiV/wHrMqs33vC4YjKXjJ36daOkIY0
 ZtHVlku9r4StPU3sqTJiU0xrdvz3jP0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-xA9gb4N_Pm6nli5SeUIJAw-1; Wed, 03 Mar 2021 13:46:57 -0500
X-MC-Unique: xA9gb4N_Pm6nli5SeUIJAw-1
Received: by mail-wr1-f70.google.com with SMTP id i5so11603051wrp.8
 for <qemu-trivial@nongnu.org>; Wed, 03 Mar 2021 10:46:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ygJSAUu3nItqoE7XwzNiQqtuF4qShdTNiOm3t1xDK4=;
 b=XF56xd1mnIbLmNpnSpDgw1e/3kHfbzCh2YZ1NhC15z0kvxKjJ9CyS4RSLuvu1Zcs3q
 BfdpISmloyE5hO/orgqf5+Fpwzqa37d/J8nOV7QZDpSXiWaNYq/DoxrEis4xKCwE1j7F
 m3w5GoJOwZlIko1vhSBsbTVp/Bct1lYAJbZ5Oovy42YKhSHFNfDecF46y+fYNdsjFzUf
 qLRPCT2WOeL4HoyFC20m1T1qT0bFgDMizJwRn8I7JZaov9YxK6ySyinIr1mpzk+ZlKRH
 f//UB/KpCbqPw4Bqgr4+XQcTgxou0zcTVJfVUoghZtpLOW5LzbmlezJemTH3t1Ku4cnA
 Aa1A==
X-Gm-Message-State: AOAM530c19sGD+RKUVT9V8uhinjheo7zv85ieKkJ8+FT0xho1n9Gxotz
 38sUitvvPYXPHqB7JHcOEyekb9h+IyQU/39EG/ssFB6Tl51NV/8HtCFwPOSlYH491Q3y3uvvw9F
 ATotTMJEXF3z9WEcJ5w==
X-Received: by 2002:a1c:2e58:: with SMTP id u85mr317008wmu.71.1614797216478;
 Wed, 03 Mar 2021 10:46:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyfHSzIWGLrgw5CwL8PqoywVG313c7fQf3yvNocBzZ2Tfq9ubtsxolSUUrI7Mp7vTD1awYHlA==
X-Received: by 2002:a1c:2e58:: with SMTP id u85mr316991wmu.71.1614797216348;
 Wed, 03 Mar 2021 10:46:56 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x6sm5938379wmj.32.2021.03.03.10.46.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:46:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 1/5] ui: Replace the word 'whitelist'
Date: Wed,  3 Mar 2021 19:46:40 +0100
Message-Id: <20210303184644.1639691-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303184644.1639691-1-philmd@redhat.com>
References: <20210303184644.1639691-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Mar 2021 18:47:06 -0000

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/console.c       | 2 +-
 ui/vnc-auth-sasl.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/ui/console.c b/ui/console.c
index c5d11bc7017..5a8311ced20 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1708,7 +1708,7 @@ bool dpy_gfx_check_format(QemuConsole *con,
                 return false;
             }
         } else {
-            /* default is to whitelist native 32 bpp only */
+            /* default is to allow native 32 bpp only */
             if (format != qemu_default_pixman_format(32, true)) {
                 return false;
             }
diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index f67111a3662..df7dc08e9fc 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -288,7 +288,7 @@ static int protocol_client_auth_sasl_step(VncState *vs, uint8_t *data, size_t le
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check the username access control list */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
@@ -409,7 +409,7 @@ static int protocol_client_auth_sasl_start(VncState *vs, uint8_t *data, size_t l
             goto authreject;
         }
 
-        /* Check username whitelist ACL */
+        /* Check the username access control list */
         if (vnc_auth_sasl_check_access(vs) < 0) {
             goto authreject;
         }
-- 
2.26.2


