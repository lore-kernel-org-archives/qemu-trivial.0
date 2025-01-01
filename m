Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tSttv-0003h1-J3
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jan 2025 03:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1tSttu-0003gi-AJ
 for qemu-trivial@nongnu.org; Wed, 01 Jan 2025 03:16:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1tStts-0004Lj-Kf
 for qemu-trivial@nongnu.org; Wed, 01 Jan 2025 03:16:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735719378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M/DGQVvJ6pD8EPF6A3oGVPxri4BF+dfcHR3gxhYHa20=;
 b=ItzMexojjHrCVb9iALIff8+2XaKk1AJpP8ZDk9TD0pF4tj5zPquSmBH7YAS+KHfnWYg1tS
 +OF1FcWAxVHGIH/gzrA9lPRa5NJsa1u8EsCw8MRI2Y2eQ7xY/ETX1lf5oN0hqG3QjnHdbG
 OfQOAMjbpcRxrvnawfWRBWSJP5s+9bI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-250-cSlqQZCwMNKg-WHNxmXpYQ-1; Wed, 01 Jan 2025 03:16:16 -0500
X-MC-Unique: cSlqQZCwMNKg-WHNxmXpYQ-1
X-Mimecast-MFC-AGG-ID: cSlqQZCwMNKg-WHNxmXpYQ
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ef6ef9ba3fso14666098a91.2
 for <qemu-trivial@nongnu.org>; Wed, 01 Jan 2025 00:16:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735719375; x=1736324175;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=M/DGQVvJ6pD8EPF6A3oGVPxri4BF+dfcHR3gxhYHa20=;
 b=dbe7wi/NIpiR4WEP8YxMxsgA1lO74oBvXRp8AiKkHJjt8WE/cicDS5Etct8Fx/6Dd0
 oltd4DcmykcHqaUS/1N/TfqFddZ5pNuHgihMcX+B2iyeQAGMWdJn88pyvpStXbLkh32x
 T1SHxofOMZIJkN7MF9lJZ7YPWXeKTm9KR/LqbSbG6XdwIGIDxjzO2XhfVTgmtvu9RGDE
 xgP3pxCSTNTyaop3UBztM/9kNPCKnNxQm7caiLXzwJ/OBWmGvhDWJsR45csO4fLec2pW
 m9p1KFxZB4502s3ar9ICxzxU3X5dbb/k7BbitZpTebjMKxKtDSxONx9odWT4USJipEnk
 7D1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqd5DMjUa05FJWBROItEaXxuHzpPM8GVJQtgKITU8BUQCO5cQoCBnuv7MRF7jGRnp42AEm3v+C3WImIkw=@nongnu.org
X-Gm-Message-State: AOJu0YycnHhh/UX73r+Ex8e6fH+Yq7d2y4tqKLwiUkVAp3oa6qCwTXfx
 9k5y7RnpXGGiB0DUtHzOi6+TJgakUadv9alkVXG5wFgeyDnuSNvR3dgdDDQWhXaZdjy99kDkbti
 t80H22hl0A3bQ3UW6IBO0CF4QncXqJNtmb+LWdH5glG0DQNhmBimgYWo=
X-Gm-Gg: ASbGnct3fKK9JalYWDfv5x9MxbRL7XZZakRB7KR0uH4Js8vxHMND0ex9yeS+T2HGnvc
 +lHHBqSIotJAJKufSQMhsEANqlFTL4pyPRKRhIRcCjKdj4LnMC8IYqSNQKjB8w+iB7cKTKfe8xc
 NAmtWwdn0y7yauLI+qaUAU3HZwcLkO2+ZbwvAaMLcFRFw3Z2OupKQlyNl4RvyAhSUxrGpjQTNTE
 tV0tJQYylver5RxjYXjtdUzd4D4PyiKEZyo9IltqbOPVB68GDOiicJUq70mH1ndNvxuoPGNKPNA
 Eg==
X-Received: by 2002:a17:90b:2802:b0:2ee:8358:385 with SMTP id
 98e67ed59e1d1-2f452def795mr62334099a91.4.1735719375214; 
 Wed, 01 Jan 2025 00:16:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGF2/sz5tqb9cQQb4onPZRZfjAFk6O5RDLNTSf95ce/gijJmPoZyVDAON/A9UCan1Oflh4aSQ==
X-Received: by 2002:a17:90b:2802:b0:2ee:8358:385 with SMTP id
 98e67ed59e1d1-2f452def795mr62334084a91.4.1735719374961; 
 Wed, 01 Jan 2025 00:16:14 -0800 (PST)
Received: from localhost.localdomain ([115.96.136.4])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-219dc96313esm205447335ad.20.2025.01.01.00.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2025 00:16:14 -0800 (PST)
From: Ani Sinha <anisinha@redhat.com>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] qtest/fw-cfg: remove compiled out code
Date: Wed,  1 Jan 2025 13:45:55 +0530
Message-ID: <20250101081555.1050736-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g2iSsgz1ielllmHbBSJdp49o5uTeNDsz6GN1tnQ-U-U_1735719375
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.188,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 01 Jan 2025 08:16:22 -0000

Remove code that is already compiled out. This prevents confusion.

CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 tests/qtest/fw_cfg-test.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/qtest/fw_cfg-test.c b/tests/qtest/fw_cfg-test.c
index 5dc807ba23..e48b34afa5 100644
--- a/tests/qtest/fw_cfg-test.c
+++ b/tests/qtest/fw_cfg-test.c
@@ -243,12 +243,6 @@ int main(int argc, char **argv)
     qtest_add_func("fw_cfg/ram_size", test_fw_cfg_ram_size);
     qtest_add_func("fw_cfg/nographic", test_fw_cfg_nographic);
     qtest_add_func("fw_cfg/nb_cpus", test_fw_cfg_nb_cpus);
-#if 0
-    qtest_add_func("fw_cfg/machine_id", test_fw_cfg_machine_id);
-    qtest_add_func("fw_cfg/kernel", test_fw_cfg_kernel);
-    qtest_add_func("fw_cfg/initrd", test_fw_cfg_initrd);
-    qtest_add_func("fw_cfg/boot_device", test_fw_cfg_boot_device);
-#endif
     qtest_add_func("fw_cfg/max_cpus", test_fw_cfg_max_cpus);
     qtest_add_func("fw_cfg/numa", test_fw_cfg_numa);
     qtest_add_func("fw_cfg/boot_menu", test_fw_cfg_boot_menu);
-- 
2.45.2


