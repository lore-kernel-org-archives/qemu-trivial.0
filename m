Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tStfe-0001tw-7j
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jan 2025 03:01:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1tStfc-0001tI-Th
 for qemu-trivial@nongnu.org; Wed, 01 Jan 2025 03:01:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1tStfb-0002ff-HC
 for qemu-trivial@nongnu.org; Wed, 01 Jan 2025 03:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735718493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FnZjgfMp2hnZzssqi/eKxK96bf9FbqeXP5z6jyJrV9E=;
 b=LhG9rbv+M/Xxlzjc2B9JJwJjH5aA+wud8nBwFTBU2SiI4kBvEPWC0w6b7s38I7WmzwfHSu
 eTH9HMlcdbeiwXi5oGOqjEvOkTFcxv6bXPoeQZO7YIkd/twfG2OSdtqDhlvImRONqLZa2l
 Xe8xgXM3VyyKx0SBro/gwmP/td0YK2M=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-bWqDdlhlOyOJAb6LJPTw8w-1; Wed, 01 Jan 2025 03:01:32 -0500
X-MC-Unique: bWqDdlhlOyOJAb6LJPTw8w-1
X-Mimecast-MFC-AGG-ID: bWqDdlhlOyOJAb6LJPTw8w
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2eeeb5b7022so14669493a91.0
 for <qemu-trivial@nongnu.org>; Wed, 01 Jan 2025 00:01:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735718491; x=1736323291;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FnZjgfMp2hnZzssqi/eKxK96bf9FbqeXP5z6jyJrV9E=;
 b=g+ADDUXmSGOSrcxT58TN2MM5qvX8oLjHiLbQbTtH7d9MTD6YIwgjyqxjt7Y4q6U5nP
 TAxuGyIwiX8Moy7RiyjIPTWjcaJKcZk0tsHMhlZb9nWFeAObk6CWMcUmr/mHlcEo4xY1
 vZ1bvb2xZ4DaARWwpiOvk3Xm/N2YmPx8orsGyJtXQ1djW/xPwYbozeJjjd5Xpo89CorU
 M6uJJPqtSYPS4sbjV/2aRVuCLyyO1xiV3yV8Adu+cp8AbcqIoo+paIzdKOgHdROWH6BJ
 KO5bAcYf7Y6nx8XGLBP84RAacB11BFnZgIfJcJnUVYg5eE9aPPi80Qzo1QcBYNsN5Kzd
 jknw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPB7l2s2+KRmrksaVbUZZHVv8Ua0bsanTdx5d7R+w2xVFvXoS7cPFEeiTYxD619eYfw3milJ7GeCk4ax0=@nongnu.org
X-Gm-Message-State: AOJu0Yw3pQWnFM1tIVadgGlM1sjkdHyrezPnYLA8hdx6oDxojrw8RI0Q
 kjKc06+c/5iIOE+U5LsxS0YnsxOLcPBXN7g8RpvhKWsRTMeP11l3rca/JPw3ZCndtIcG0ri/i3S
 ryyPzY1DB+zwqZU5ukXX1FFjw2wRRc6Gj3Ll1rYfpYCP3Y7Ypf3N+4lE=
X-Gm-Gg: ASbGncuAWWjEOECy4fbPRk/RYVlPT73GZsIBXTpN+pclKxTKAxOvfwQcT1GiYqQvWU8
 ge179boJePU/gHu8mku4PP9PGLof9u7NwtpKjaeKkJ2jL1i3cr3cSKlroGJrE/d6GN5SpfMTUw8
 bh5HiZ1RcJivCKcNpGYrtXV/CYkPID1pIFXfwmm3HXTa3b0Rw6WyyRVcsD7ZwYPDet2X4f+/o/E
 ZZI9g1w/t3cI6M//1RzGc4MdBg3YuW4Ku9dQsUvyHvS4SGLgJDDQB8J/8XTEGIXO1T/433KebJc
 1Q==
X-Received: by 2002:a17:90a:dfcd:b0:2ee:964e:67ce with SMTP id
 98e67ed59e1d1-2f452dee953mr57154291a91.3.1735718491081; 
 Wed, 01 Jan 2025 00:01:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVQYOcO0capxlxAA3OcMq/8yY8q3+84XWEOmkIVC0alXpAxuvRiW8iZIJj0KESh9tlt9cBdA==
X-Received: by 2002:a17:90a:dfcd:b0:2ee:964e:67ce with SMTP id
 98e67ed59e1d1-2f452dee953mr57154261a91.3.1735718490644; 
 Wed, 01 Jan 2025 00:01:30 -0800 (PST)
Received: from localhost.localdomain ([115.96.136.4])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2f4477c852csm23730220a91.22.2025.01.01.00.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2025 00:01:29 -0800 (PST)
From: Ani Sinha <anisinha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] docs: update copyright date to the year 2025
Date: Wed,  1 Jan 2025 13:31:16 +0530
Message-ID: <20250101080116.1050336-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: r4uTahuw51Ns2ACQM6tUo_VcahPD3SMQsJuOt8CYdvQ_1735718491
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.188,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 01 Jan 2025 08:01:37 -0000

We are already in January 2025! Update copyright notices.

Cc: peter.maydell@linaro.org
Cc: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 docs/conf.py              | 2 +-
 include/qemu/help-texts.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index 164a8ee8b2..31bb9a3789 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -87,7 +87,7 @@
 
 # General information about the project.
 project = u'QEMU'
-copyright = u'2024, The QEMU Project Developers'
+copyright = u'2025, The QEMU Project Developers'
 author = u'The QEMU Project Developers'
 
 # The version info for the project you're documenting, acts as replacement for
diff --git a/include/qemu/help-texts.h b/include/qemu/help-texts.h
index 353ab2ad8b..bc8fab9169 100644
--- a/include/qemu/help-texts.h
+++ b/include/qemu/help-texts.h
@@ -2,7 +2,7 @@
 #define QEMU_HELP_TEXTS_H
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2024 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2025 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.45.2


