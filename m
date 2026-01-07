Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8194ECF6BE4
	for <qemu-trivial@archiver.kernel.org>; Wed,  7 Jan 2026 04:53:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vdLXq-0007T4-9d; Tue, 06 Jan 2026 23:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1vdLXo-0007Oi-Ek
 for qemu-trivial@nongnu.org; Tue, 06 Jan 2026 23:53:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1vdLXm-0005xX-UC
 for qemu-trivial@nongnu.org; Tue, 06 Jan 2026 23:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767761594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=m7DSRDbx8t8gfx3UTTV0pJFl8M7eZT/f6aNA9bhLPMM=;
 b=IlfFj6kqTomTwjnYHE2Tg8o15AY4OXLx8YMrer0Xo1DGzCx6s6yzy539DZmap04esHzsXH
 KMp5pyJqRb2A79IH7oiZcLtYvvY4fVr1j067+NXbTAt9IF87YwW9CrjvkVBV4NsxxkxTg1
 klxGwujXAJuE3LQDa2fvP2diYyKhas0=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-0z1erkl3Oxulu9-qMtbhug-1; Tue, 06 Jan 2026 23:53:12 -0500
X-MC-Unique: 0z1erkl3Oxulu9-qMtbhug-1
X-Mimecast-MFC-AGG-ID: 0z1erkl3Oxulu9-qMtbhug_1767761591
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2a090819ed1so12796475ad.2
 for <qemu-trivial@nongnu.org>; Tue, 06 Jan 2026 20:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767761591; x=1768366391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m7DSRDbx8t8gfx3UTTV0pJFl8M7eZT/f6aNA9bhLPMM=;
 b=u1yQcMi7zlRhuOCfzmQ3HtKq1MpfuK1eSZb+KQkRFbZou6AF57gPRZXNXSmBJDoE37
 MYyaEdLmlf5K48/n5VhqRDgTKMSfq7klJG2Jnj259hyM+m5HSba0xuriC+MIDlPVo4GO
 w00G6r205P/zT4HJJ/x3S6mo0S0G2ai3YlFM3ZDj5Etk+MUrdzhlT15zCRr/YNDXEJK9
 eMIm/3fI8kSwLgLmlt0vW7Y6umYMLJOvok+cWXu8U7qbnBoxPzbqJK7+0SUCYx6MVPu8
 /85jNRX9B2eNB1+BtrBw6VpmnJbQPBiCIWBCEatZFnQyfFSWmSyPSHQHmqgo2nQw5tJa
 rYEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd65RaQlLdsSax3j6eXsN6YOPqIj+MowPbxPMkf6Ib/aYQx7aGP1Cl8byTxS5y7N06p4ZB0NOn7lutzmU=@nongnu.org
X-Gm-Message-State: AOJu0YyY9yiU8KAFx7WYBvKzdLENulEZ3HyDK2RVn6QtIJrUU26VsFBr
 ++gdwZ3F9QINqHuFa09GSR0mNgEVZLTuehcaXh82aSAXhBaE85rd4/K/+DXSxTaiuuXN7J8vwY3
 tOPBDsnSQvErD9NYQ+7PCHevpXmqWhux/L+DycEs13hLLxADaSEU0nP9LRQc=
X-Gm-Gg: AY/fxX5qf7b2JfnRUnXUSr/iyV5w/8EmmItjD/j6q2pCrVvCpE5Y+87iGIswqVLeA4X
 u9R++QDWjf9kVsC18l99HrApoMireohG+rWIhHub/MKyVvJtG2VrvzPQDwuu4ww78Omld4JO7u4
 lTOKB5OzpnG3j2QFAd5kIkmuOfK/8K37/ZcJW9A6SILGYQTmSWFjvW+r6Rmg5x1ZZby0cRaA7lU
 RMrIDkKbs8qPlekYT1opRNJSOeSv4+73SmS9RC3xLFWKUfmRALblEaul9dDDlfvb3W4RYrakM1N
 qHVGMpFVzqXUGrZUwtSDZ3xe1AVdg/BARXWmiyG2QktZtOn+exjF9IDqEwekmxVd25x8yZanMqH
 YZsG9HRwwJecigNxfuOCCIrPCebWfFsiJNqdfFjrCtg==
X-Received: by 2002:a17:903:3c2f:b0:2a0:afeb:fbb6 with SMTP id
 d9443c01a7336-2a3ee4379abmr10317055ad.8.1767761591476; 
 Tue, 06 Jan 2026 20:53:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaFpQcKFirsRK86M0ce/AlMKntPTUAw8+fC+bu1Y4SZC/IgWsXO031Smj35JJRBkoJvceDaQ==
X-Received: by 2002:a17:903:3c2f:b0:2a0:afeb:fbb6 with SMTP id
 d9443c01a7336-2a3ee4379abmr10316955ad.8.1767761591079; 
 Tue, 06 Jan 2026 20:53:11 -0800 (PST)
Received: from rhel9-box.lan ([122.163.3.101])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-2a3e3cc7856sm36963325ad.68.2026.01.06.20.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 20:53:10 -0800 (PST)
From: Ani Sinha <anisinha@redhat.com>
To: John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] docs: update copyright year to 2026
Date: Wed,  7 Jan 2026 10:22:50 +0530
Message-ID: <20260107045250.34420-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jUmeQnDCOZuYycviTU5B_Iw7qS45GtgN5nczI4cIeOQ_1767761591
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

We are already in 2026. Update docs to update copyright info to year 2026.

Cc: peter.maydell@linaro.org
Cc: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 docs/conf.py              | 2 +-
 include/qemu/help-texts.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/conf.py b/docs/conf.py
index bc4e9622dc..f835904ba1 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -92,7 +92,7 @@
 
 # General information about the project.
 project = u'QEMU'
-copyright = u'2025, The QEMU Project Developers'
+copyright = u'2026, The QEMU Project Developers'
 author = u'The QEMU Project Developers'
 
 # The version info for the project you're documenting, acts as replacement for
diff --git a/include/qemu/help-texts.h b/include/qemu/help-texts.h
index bc8fab9169..a9ccec7b38 100644
--- a/include/qemu/help-texts.h
+++ b/include/qemu/help-texts.h
@@ -2,7 +2,7 @@
 #define QEMU_HELP_TEXTS_H
 
 /* Copyright string for -version arguments, About dialogs, etc */
-#define QEMU_COPYRIGHT "Copyright (c) 2003-2025 " \
+#define QEMU_COPYRIGHT "Copyright (c) 2003-2026 " \
     "Fabrice Bellard and the QEMU Project developers"
 
 /* Bug reporting information for --help arguments, About dialogs, etc */
-- 
2.42.0


