Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHWWd-0005IR-1n
	for mharc-qemu-trivial@gnu.org; Wed, 03 Mar 2021 13:47:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWa-0005Cz-To
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:47:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWZ-0007yn-2e
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NoCyAkDbqm7qqBRK5Dn5W3Vg1Q8erVg+5wGiFEk0raM=;
 b=I1btfJlG1yOgiRNmNbAt+dJN7uUBPBiz4hDZahVUmBotEBCuKfVxMCGTgTfo5UaLlw+bJF
 uBYiJ2/uxmQA8EWj1dCYRN7JWMh/klBay8Ivs4+FVMBrDYtWvy32uC6WYwPMsDuAsGbEsc
 qU5iHjHU92jqoFp3YSxGylEEJOG8tOM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-FzeXxKxtOGu-jZ92SaqY1Q-1; Wed, 03 Mar 2021 13:47:04 -0500
X-MC-Unique: FzeXxKxtOGu-jZ92SaqY1Q-1
Received: by mail-wr1-f70.google.com with SMTP id g2so6302028wrx.20
 for <qemu-trivial@nongnu.org>; Wed, 03 Mar 2021 10:47:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NoCyAkDbqm7qqBRK5Dn5W3Vg1Q8erVg+5wGiFEk0raM=;
 b=UEVMwUmKwZ8Ryw6uyWo2Cj3px7yc2bd8EnpkQ3io5uhukNKk/FxoFNzDpyXAKBqTOs
 i7ZujZwtT5DRhueZjbpTqffucsKL7iP6rH0obkZ3r9yGBOrA6LuAxI1b3kJfnPQcsVLa
 TcDi8ZC9kc9x1QWBzAlkPgBGqiGn3b0ThuUVKr0o66TXhPKjsu0+Ry329qbr20PcIReI
 5b+EhGM5Cx7utYxbLribJ5VMRerBtbpRG4fLRMzqTAACt5bnuCbNA1LEKMqAJFRXXnMi
 yZSU2keKIiwm+vsRV9dm1+np35j4VSi/lT9GRaM2dHSd+XJ5ppYga94easulaU51pS1q
 SYCw==
X-Gm-Message-State: AOAM5329wL5TYo2J0Irk7Is6Dbb1CxBmypXtDyOETI40ZT+k8uy8F4q7
 GyVWjTrgQPz1dZD0a1s7ZU0CTfz4Sfc7ilzhRVL7rY0HkTG+lbGUfcticsglrd2ZiJfC4XHWVZr
 Ru9d84zbwCf6RbhKMMw==
X-Received: by 2002:adf:f292:: with SMTP id k18mr29025381wro.335.1614797221655; 
 Wed, 03 Mar 2021 10:47:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXNoAkTi1EjnqkFTfdC9dxH+7fkHpU2XpEtaWryEqqFaJWWzS4eXv81bSvplkiukPBV5j0sA==
X-Received: by 2002:adf:f292:: with SMTP id k18mr29025362wro.335.1614797221547; 
 Wed, 03 Mar 2021 10:47:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id p17sm6248355wmq.47.2021.03.03.10.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:47:01 -0800 (PST)
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3 2/5] scripts/tracetool: Replace the word 'whitelist'
Date: Wed,  3 Mar 2021 19:46:41 +0100
Message-Id: <20210303184644.1639691-3-philmd@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 03 Mar 2021 18:47:09 -0000

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the words "whitelist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/tracetool/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 96b1cd69a52..5bc94d95cfc 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -100,7 +100,7 @@ def validate_type(name):
         if bit == "const":
             continue
         if bit not in ALLOWED_TYPES:
-            raise ValueError("Argument type '%s' is not in whitelist. "
+            raise ValueError("Argument type '%s' is not allowed. "
                              "Only standard C types and fixed size integer "
                              "types should be used. struct, union, and "
                              "other complex pointer types should be "
-- 
2.26.2


