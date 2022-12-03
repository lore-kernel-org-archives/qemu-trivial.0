Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p1SV8-0008Ct-B9
	for mharc-qemu-trivial@gnu.org; Sat, 03 Dec 2022 08:24:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p1SV6-0008CH-Ma
 for qemu-trivial@nongnu.org; Sat, 03 Dec 2022 08:24:16 -0500
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p1SUr-0003Cf-11
 for qemu-trivial@nongnu.org; Sat, 03 Dec 2022 08:24:16 -0500
Received: by mail-pf1-x42e.google.com with SMTP id 124so7394150pfy.0
 for <qemu-trivial@nongnu.org>; Sat, 03 Dec 2022 05:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eWuLz03qEswZ6o7BB0b7vQiY8TUfIuu199usv0agUCE=;
 b=WMokU7VfEiQme4pO16BqUEOcuNjOzfOu0I9PMDFn7157F5ZQloeaS+QKyPQ7vAFCvM
 BMihR3wvoZw3NpWymtIaThVWAna5MBPg8i0vxuVnC9CARDSA3kzHLZGC0EzpOQR5eCoe
 gKjKsL+UjElHSeDtY7E9pFyWEBXKKlCrXo+PpbZGgTX5340OjCxkL5KQrUFqCpVZC9VW
 MJqM7dXp55n9UKTQWOue7ofiEIrJci7Azj4XcJw8K8Yze1lCiFyW7TJf7voAX2O4XXRz
 estqraMG3qWJ3fOzFHGLOkR/L7moGWVJJi+TeVGXhG8VkH/gPtl/lkDGy3rM9c7ZUWwL
 kypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eWuLz03qEswZ6o7BB0b7vQiY8TUfIuu199usv0agUCE=;
 b=TJJLtzfm0h31fQUSv2ImXM3faALLOsh6JR7pAFJApYsU3VYa+tb53s2u2WYnxu7tje
 fbco42UkE5KC4dy4Lle3EFU2IMb+lf3chDx5GuMln26Dwrrgr7gK/elHjI7CcwTvOnUs
 mF3IaKanldtkHr61q68Ry8rWtHjd9MTXCP9AwVwNMIfIpZNV7/JzefMhNuabp8u50Sbm
 Vr7ENM7AuzT57udroalD9xOVjntzNaOwItVXmShEQyRa8U7ro2yf9mM/gZOlJHiltVC6
 FK/vxM/Tgytj1NXqxVUgX6hMglIMONOmJWXLgSccvK6RG3778SgMwT6epH34OMUVekZv
 dE2g==
X-Gm-Message-State: ANoB5pkRY4enrfDdx6MeTqrGjkVW3Q8GWf/DlGR1ds5xYuqs2XnSKPNB
 YMNervvevNv2fwJZ0RKplT/wcg==
X-Google-Smtp-Source: AA0mqf7gtZ/zOTn5NgjMHoMu0BiAqbkU5A7sxLHld4TGH4dNUF0nVQSMPluRNZ2zuB4AhDEci3v+wA==
X-Received: by 2002:a63:1626:0:b0:470:2c90:d89f with SMTP id
 w38-20020a631626000000b004702c90d89fmr52257075pgl.253.1670073838871; 
 Sat, 03 Dec 2022 05:23:58 -0800 (PST)
Received: from localhost.localdomain ([203.212.244.39])
 by smtp.googlemail.com with ESMTPSA id
 pc16-20020a17090b3b9000b00212cf2fe8c3sm10500276pjb.1.2022.12.03.05.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 05:23:58 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
To: Ani Sinha <ani@anisinha.ca>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] docs/acpi/bits: document BITS_DEBUG environment variable
Date: Sat,  3 Dec 2022 13:23:46 +0000
Message-Id: <20221203132346.34479-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42e;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sat, 03 Dec 2022 13:24:17 -0000

Debug specific actions can be enabled in bios bits acpi tests by passing
BITS_DEBUG in the environment variable while running the test. Document that.

CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 docs/devel/acpi-bits.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/docs/devel/acpi-bits.rst b/docs/devel/acpi-bits.rst
index 4a94c7d83d..9eb4b9e666 100644
--- a/docs/devel/acpi-bits.rst
+++ b/docs/devel/acpi-bits.rst
@@ -52,6 +52,9 @@ Under ``tests/avocado/`` as the root we have:
    for their tests. In order to enable debugging, you can set **V=1**
    environment variable. This enables verbose mode for the test and also dumps
    the entire log from bios bits and more information in case failure happens.
+   You can also set **BITS_DEBUG=1** to turn on debug mode. It will enable
+   verbose logs and also retain the temporary work directory the test used for
+   you to inspect and run the specific commands manually.
 
    In order to run this test, please perform the following steps from the QEMU
    build directory:
-- 
2.25.1


