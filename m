Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s24ol-0000QC-79
	for mharc-qemu-trivial@gnu.org; Wed, 01 May 2024 03:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1s24og-0000Pn-TB
 for qemu-trivial@nongnu.org; Wed, 01 May 2024 03:55:52 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1s24oe-0005Y4-AP
 for qemu-trivial@nongnu.org; Wed, 01 May 2024 03:55:50 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5d4d15ec7c5so5139043a12.1
 for <qemu-trivial@nongnu.org>; Wed, 01 May 2024 00:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1714550147; x=1715154947;
 darn=nongnu.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KGbPlSfAvDM/uzK/W9updmSoT79Wi4JkaJZn2a5TBmw=;
 b=wCOB2VZcrg07csgFaMxN/NFi3NoQgHK+cjDR9pBqU0YcUBfTH3sQyBUCDWG78PTTzD
 2B09PJvrhj0wQM+aRpwqwW2TF7i0YqPXygCsW2T7pG7lJDUPKCm9nXmlKMtVH84NpwH2
 0EiMEjSHgchEeINWnUWBZpNgftrFUTKYxMtQ6cyFp027YEl+rRvJ/RdM4p3KvBm61ZpT
 005FyzFdTEbrfAI7GMnryltXpByY0OZoRQO6V6eKOiEWo6k46pLhERLPDGc9b/KbZQJc
 dCy491+PGURz2O+TShKWtUib2k2lmMr7bb/1H6ZaZ0vWknglVjE7wUa/xIxBb/ZuKFr8
 PfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714550147; x=1715154947;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KGbPlSfAvDM/uzK/W9updmSoT79Wi4JkaJZn2a5TBmw=;
 b=wgri9hzuKNfu6oZhvCFEmT78oDlt/zJyMWLwUd3V2lWSLm0hfIY9KfHLSoRygTL+Yq
 c+Awgp025NaqEc4JSgpD/ekaguipol1xJt0f4SbDs4aYVhgs8aVca9m3c7JoA8XuKtXP
 lEueZPxcXyN8+hF4ZukDAPx3J2IKMAoTLQW/3yc6Xq+4aDGGZqmfV8XwrNH0AjGd+xgW
 QYHt/dnGHW8+wdxUJ0kZwknuE0jZ3lOfSXvWMHvgDbt/nOBTTUZHa08EwJY7myFseYky
 xnFyrzAMwRJ84xET05zclhfNB3th3e4YNaIxOpXRQ1TPpEJ4f+BjXGKuNS/7CpNuy+5s
 PsTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7clop/ZzYubw21LM+LcJSSKSAT16L5yFvvvVN+n+EKwvWPIy8hYrPC+CblBdE6wf+5fb1en4cD2+JWzSkMBZG26NiVMfyOQ==
X-Gm-Message-State: AOJu0YzCni0e19c25kASwHrPgrL211KOF+DNj8fPT+MEIhZ9IWPU7OtY
 tAjMtOlEmTUuJC8ZIj4oQ0uXNqGVQwLF3E+wLG4gzyfCfP9I+AkXpgeRtArAZZk=
X-Google-Smtp-Source: AGHT+IGRejFEz+VeOxUnVpEyT3h8lBbsSTbslIt2ts7WwKciphro39oC49YlnF+cM6qolhogYnyDyQ==
X-Received: by 2002:a05:6a20:4a99:b0:1a9:5963:e58b with SMTP id
 fn25-20020a056a204a9900b001a95963e58bmr2385652pzb.35.1714550146789; 
 Wed, 01 May 2024 00:55:46 -0700 (PDT)
Received: from localhost ([157.82.202.162])
 by smtp.gmail.com with UTF8SMTPSA id
 e4-20020aa79804000000b006ecc858b67fsm22961367pfl.175.2024.05.01.00.55.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 May 2024 00:55:46 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Wed, 01 May 2024 16:55:37 +0900
Subject: [PATCH] qemu-keymap: Free xkb allocations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240501-xkb-v1-1-f046d8e11a2b@daynix.com>
X-B4-Tracking: v=1; b=H4sIAHj1MWYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDUwND3YrsJF0jUwsTC+Pk5GTTFAsloMqCotS0zAqwKdGxtbUACFLsOFU
 AAAA=
To: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.14-dev-01a33
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 01 May 2024 07:55:52 -0000

This fixes LeakSanitizer complaints with xkbcommon 1.6.0.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 qemu-keymap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/qemu-keymap.c b/qemu-keymap.c
index 8c80f7a4ed65..7a9f38cf9863 100644
--- a/qemu-keymap.c
+++ b/qemu-keymap.c
@@ -237,6 +237,9 @@ int main(int argc, char *argv[])
     xkb_state_unref(state);
     state = NULL;
 
+    xkb_keymap_unref(map);
+    xkb_context_unref(ctx);
+
     /* add quirks */
     fprintf(outfile,
             "\n"

---
base-commit: c25df57ae8f9fe1c72eee2dab37d76d904ac382e
change-id: 20240501-xkb-258483ccc5d8

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


