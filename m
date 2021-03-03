Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHWX1-0005ll-UV
	for mharc-qemu-trivial@gnu.org; Wed, 03 Mar 2021 13:47:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWX0-0005iw-Uu
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:47:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWy-00084F-0X
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:47:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zv/BwC5POPyWjWYZMgFmMVd8R/Xa4KoRgVF20B1JO98=;
 b=e0c7LU0ixmdzB8Un9P38nkflPJRPT8KpznyxpL2YhZfNVu2pZkudqOQlGXDrsEBLHTqh4V
 YerB2NWvB7nymkjVw4ga7fuU1BIWRFahsOTcvrmEqRJtmVYDfZkpwLr4DaAXN4IoZdR9U2
 L6uk3w9jRhtGTg4I7Wbxalj0y7knLTU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-qQQloI-8NPmgKhYbUuWDrQ-1; Wed, 03 Mar 2021 13:47:23 -0500
X-MC-Unique: qQQloI-8NPmgKhYbUuWDrQ-1
Received: by mail-wr1-f69.google.com with SMTP id v1so2665158wru.7
 for <qemu-trivial@nongnu.org>; Wed, 03 Mar 2021 10:47:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zv/BwC5POPyWjWYZMgFmMVd8R/Xa4KoRgVF20B1JO98=;
 b=WaTH8sKohgIdNOYXk+2b9ggij2YaAzHz+IPr8TOQ1ZgqZDkzkX5tEX704i2T/HuUe8
 J+8gpJljDwYBYl1+vmVGrg+EoOPknDhTaY9cQaeUBAZ0sA6nJOxbBptbsLJdxw6FlZA1
 mOM38a7ut+7hAyErDArYPWnMJOf1fZztvC0JqbLXR4G4r8CchfUkH0Kwd/uCv7hZyVZr
 1gdw1mW1fPqOtY5b5weEmZbXY28vHeYHCMwtxArrOC4BCNJP5UWIVlcPJwoxDrPidq6q
 Hpryy2QD/DJDY7rNf9WZAM/ugIVLjChjc6Iel9uUW2s0E0YLK4A1ToEd9KeZ9W6FMgW8
 Y+SQ==
X-Gm-Message-State: AOAM532VNiabNRWHDQ25b15xO4vcKdeK/kbPKDUbJ7OrR+7PdffJK7N7
 zeBK1u6gGdAQS7qaXMsdFR7NfUGU6bheabwVDbBxCydMrw2Gg6mLEuIdK1UH6HroWVEPd+TZ/mW
 AaqKBFC5S722qfCK8/Q==
X-Received: by 2002:adf:a4d0:: with SMTP id h16mr130681wrb.52.1614797242492;
 Wed, 03 Mar 2021 10:47:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5JgQpBX92H6UGgShZ4/nvXSRy+FEwNApU2icyYpt9aUmnJnLP8p5aGqMj2y+myurUBLCLZA==
X-Received: by 2002:adf:a4d0:: with SMTP id h16mr130662wrb.52.1614797242368;
 Wed, 03 Mar 2021 10:47:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m11sm20480462wrz.40.2021.03.03.10.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:47:21 -0800 (PST)
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 5/5] tests/fp/fp-test: Replace the word 'blacklist'
Date: Wed,  3 Mar 2021 19:46:44 +0100
Message-Id: <20210303184644.1639691-6-philmd@redhat.com>
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
X-List-Received-Date: Wed, 03 Mar 2021 18:47:35 -0000

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Acked-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/fp/fp-test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/fp/fp-test.c b/tests/fp/fp-test.c
index 06ffebd6db1..5a4cad8c8b2 100644
--- a/tests/fp/fp-test.c
+++ b/tests/fp/fp-test.c
@@ -123,7 +123,7 @@ static void not_implemented(void)
     fprintf(stderr, "Not implemented.\n");
 }
 
-static bool blacklisted(unsigned op, int rmode)
+static bool is_allowed(unsigned op, int rmode)
 {
     /* odd has not been implemented for any 80-bit ops */
     if (rmode == softfloat_round_odd) {
@@ -161,10 +161,10 @@ static bool blacklisted(unsigned op, int rmode)
         case F32_TO_EXTF80:
         case F64_TO_EXTF80:
         case F128_TO_EXTF80:
-            return true;
+            return false;
         }
     }
-    return false;
+    return true;
 }
 
 static void do_testfloat(int op, int rmode, bool exact)
@@ -194,7 +194,7 @@ static void do_testfloat(int op, int rmode, bool exact)
     verCases_writeFunctionName(stderr);
     fputs("\n", stderr);
 
-    if (blacklisted(op, rmode)) {
+    if (!is_allowed(op, rmode)) {
         not_implemented();
         return;
     }
-- 
2.26.2


