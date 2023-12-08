Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rBYxJ-0000WB-UD
	for mharc-qemu-trivial@gnu.org; Fri, 08 Dec 2023 06:23:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xun794@gmail.com>) id 1rBYxF-0000W0-Mf
 for qemu-trivial@nongnu.org; Fri, 08 Dec 2023 06:23:38 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xun794@gmail.com>) id 1rBYxE-0004Gf-0y
 for qemu-trivial@nongnu.org; Fri, 08 Dec 2023 06:23:37 -0500
Received: by mail-pf1-x444.google.com with SMTP id
 d2e1a72fcca58-6ceba6c4b8dso1164525b3a.1
 for <qemu-trivial@nongnu.org>; Fri, 08 Dec 2023 03:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702034609; x=1702639409; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ngRjKUqgr4ywvtmzRCL3isbRn4040f3HYtiH0MujBOQ=;
 b=eNi5JTVHzJ55NrBI9V6X/3I3+62DC6SHYfz5GlPwiQtP40vkDC5f/hxjqaj7nVwvJ+
 i9/za9AI0H5g7UoPCyYpmaPy6LIM74NFvfbi06HyX9x3kojoNN8y8vV9yvNQyVR/DWDc
 vnqEuLhWXPX0M0OTP6tMQCRKgcD2jvwqQcw1W9IjbbP9bv27+NgcIEQp7ab0BzKje2bD
 Ls7cll3ti5ixC6in9/zDNcJxUd4gDZC0ResiVRskbadSW5cAN3HMWGwXkiJ+KZCPEYiV
 D0YlIjTGSwOlZlmGsVql61cRIIq47v9LNZh8Em8h6bBdDXjt54UMws2cvzk+4HUwEhR3
 P4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702034609; x=1702639409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ngRjKUqgr4ywvtmzRCL3isbRn4040f3HYtiH0MujBOQ=;
 b=Lv48LDhqXbfE3VvCWLkBajq9SId0IvFsNTHsVRDUjQShY1fw2WCaGjVc0rXCsWgmJo
 J6IZIgfBJQJ45l+2ii1erypSgh/2RRX+6F4hkSKnmm9yceoT5S9fNnGMjB2JwwbwtNhS
 QRvXia5yGgbY2bXmZx05IQqkrV39hAiQGPJpq5AseURLGQrcmt4QbE5v9h4LPsL6l8Ry
 niVe82XBrsKzkidMbrJPMPiczZig2/XMCTQf9K3oKRMoLKJuJ9vwFA+54Yh3S4GD9G2e
 cjrEdjX18FH03MODUzXhbvnBldgSkuIPl1T5cZGD2PQaJGG5AmW5UvVO4RZJ4275jOoQ
 PiOQ==
X-Gm-Message-State: AOJu0YzooY+BXbMB3dYKABtqtwTeEMDjyxKWjPU56DIsUfDGus6waD9O
 bfELqErkgptUvU6IZzXt6Kr3xeSUwcHtWw==
X-Google-Smtp-Source: AGHT+IHt0oC6n8gGbh75uPPRXHAut1YVD4m9aYNuGMfjL63jbI1rO0jwUsB9LmGGjR+UZmOyXaGlxg==
X-Received: by 2002:a05:6a00:1f13:b0:6ce:7d15:9a6c with SMTP id
 be19-20020a056a001f1300b006ce7d159a6cmr4192546pfb.67.1702034609550; 
 Fri, 08 Dec 2023 03:23:29 -0800 (PST)
Received: from localhost ([2409:8a20:bc4:a9a0:40eb:1e14:5537:3084])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a056a00149500b006cedd9d49f9sm968318pfu.46.2023.12.08.03.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 03:23:29 -0800 (PST)
From: Yihuan Pan <xun794@gmail.com>
To: qemu-trivial@nongnu.org
Cc: Yihuan Pan <xun794@gmail.com>
Subject: [PATCH] qemu-options: Improve documentation for the fw_cfg option
Date: Fri,  8 Dec 2023 19:23:25 +0800
Message-ID: <20231208112325.64808-1-xun794@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=xun794@gmail.com; helo=mail-pf1-x444.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Fri, 08 Dec 2023 11:23:39 -0000

Enhance the documentation for the `fw_cfg` option in qemu-options.hx
to provide clearer instructions on handling filenames and strings.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1839
Signed-off-by: Yihuan Pan <xun794@gmail.com>
---
 qemu-options.hx | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/qemu-options.hx b/qemu-options.hx
index 42fd09e4de..a935aaae44 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4086,9 +4086,13 @@ DEF("fw_cfg", HAS_ARG, QEMU_OPTION_fwcfg,
 SRST
 ``-fw_cfg [name=]name,file=file``
     Add named fw\_cfg entry with contents from file file.
+    If the filename contains comma, you must double it (for instance,
+    "file=my,,file" to use file "my,file").
 
 ``-fw_cfg [name=]name,string=str``
     Add named fw\_cfg entry with contents from string str.
+    If the string contains comma, you must double it (for instance,
+    "string=my,,string" to use file "my,string").
 
     The terminating NUL character of the contents of str will not be
     included as part of the fw\_cfg item data. To insert contents with
-- 
2.43.0


