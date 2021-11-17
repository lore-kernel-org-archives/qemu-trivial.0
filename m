Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnP0L-0003qw-ID
	for mharc-qemu-trivial@gnu.org; Wed, 17 Nov 2021 12:45:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnP0E-0003oT-RX
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 12:45:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnP0C-0001sm-3W
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 12:45:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637171137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f37MSGK414Wbp3NDgsIaQJYzTojVO4QmSmz21ap/IRQ=;
 b=MgH577SCWIbV8iMna3dcTzeyVbWOIsd0UIBHQ4Dn2sCjw7D3i7A4SZTU/XXyGV8WXs63+K
 9qvN/SZHqNEs3DQdeGegxkDljCnH2iRFISYj7A2g61YdU3OEndsCetq7I8ekhpoVnRkIJR
 pBgDR71QUDO+uVtLytdbtkt6wDdvPK0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-Wx07M-_lNDe-OQhQU7KkwA-1; Wed, 17 Nov 2021 12:45:36 -0500
X-MC-Unique: Wx07M-_lNDe-OQhQU7KkwA-1
Received: by mail-wm1-f69.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso1421135wme.0
 for <qemu-trivial@nongnu.org>; Wed, 17 Nov 2021 09:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f37MSGK414Wbp3NDgsIaQJYzTojVO4QmSmz21ap/IRQ=;
 b=qPamOcOQHRe5aRsPs1q/ndFs3m7urI3OcmcwVd3SroMU1AKLyYUihAgNlhzc8KtpDk
 YEEGhRCLn0om2cvsvTLIDHWYAEBOuZYGVfp3vt44erP5MYll2c0SDeehbT7lfQSjgG0L
 daQshh3k7xG5wsycj/MRL4M5Ki9Ftzb7OYg8tX5l0kIsOo39R2Dj7xyilGtpemxhaurz
 upP7CKZtvEQWVim5glvDXJx/+s3MAnUPK46RFxKD5pNy4mDjBg9rGuNxh8pwQwXt/3sN
 ALvpPSpP655P1gfkNVLhdCXovM+LDl136EQwk6uhzGwjMNJgBR5BL54dZ2/SULiqL1YU
 YixA==
X-Gm-Message-State: AOAM53318Ga23qMVTqkxj6xuMwpteOEivfWjTjDRi2YvbG03tSNWDE+b
 ifZ/GUkwjN3LVT5qjbigoJrAcnWnav1SmByQwrHKJJzldo0erY5MwqpHqbM2DCrrQeRdPdQiwG4
 6HzDHP0IZFeqtAiq58g==
X-Received: by 2002:a5d:6707:: with SMTP id o7mr21988302wru.172.1637171135534; 
 Wed, 17 Nov 2021 09:45:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8jSP9keXvkPmwPAT+gJTNQyihBWcUgH4e0/M8rCDVn30KsECPXExJf2iYrt2lZmxktKIXlQ==
X-Received: by 2002:a5d:6707:: with SMTP id o7mr21988277wru.172.1637171135359; 
 Wed, 17 Nov 2021 09:45:35 -0800 (PST)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id z6sm638964wmp.1.2021.11.17.09.45.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Nov 2021 09:45:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] qemu-keymap: Add license in generated files
Date: Wed, 17 Nov 2021 18:45:33 +0100
Message-Id: <20211117174533.1900570-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 17 Nov 2021 17:45:48 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qemu-keymap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qemu-keymap.c b/qemu-keymap.c
index 536e8f2385d..4095b654a60 100644
--- a/qemu-keymap.c
+++ b/qemu-keymap.c
@@ -187,6 +187,7 @@ int main(int argc, char *argv[])
     }
 
     fprintf(outfile,
+            "# SPDX-License-Identifier: GPL-2.0-or-later\n"
             "#\n"
             "# generated by qemu-keymap\n"
             "#    model   : %s\n"
-- 
2.31.1


