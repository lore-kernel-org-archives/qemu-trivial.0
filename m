Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 301A8C43458
	for <qemu-trivial@archiver.kernel.org>; Mon, 13 Jul 2026 11:46:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wjF7N-00046K-DG; Mon, 13 Jul 2026 07:46:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wjF7K-00045r-1P
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 07:46:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1wjF7I-0003oy-K0
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2026 07:46:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1783943187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=e4It8u2KpKs1trJIciaJQ4z1TShGKaqnv60R8EDCtCA=;
 b=dgNb1mTISKLSj30Q9uiNUIp15zYLzWikQ9WznwZqc1DoWTFKIk2V6pbRMr5JV/tnxRDANm
 7HVRRFEb9hpG2SMAAas3d1GUOtWlRLNTOo69UnJ3k5fg6qZoQ30PmD0qm+6PfMHMO/PF1u
 NxVIbMU7dq+xnuvV8rXbRW6snuhS2E8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-mx_5RYZnOZuqHZGinTNgcA-1; Mon, 13 Jul 2026 07:46:25 -0400
X-MC-Unique: mx_5RYZnOZuqHZGinTNgcA-1
X-Mimecast-MFC-AGG-ID: mx_5RYZnOZuqHZGinTNgcA_1783943185
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-4744b72f90bso1607093f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 13 Jul 2026 04:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783943184; x=1784547984;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e4It8u2KpKs1trJIciaJQ4z1TShGKaqnv60R8EDCtCA=;
 b=BqCv3BLLCi9yL2nTZdCqhZ+7l2Uh3bTphpmRjVuFUzX4SulRXFfPiIbXrv6SbHTqY2
 NidQInAQblAHo6qv30seNsSYS8xMURUxD6Cxgebckg0PhLAr1+uYFOrAiNAszjlC9To6
 ArKTe5LeUy2F8v9h8W1SPj7rvfZwhE6JPlIfhZ3sbliINke0Q23YeCV2Imck2popFjBk
 qqGqSOtaC0Hk1PHuCwJ/VzvPJG5pLKR5voq325GILXS2DbxWT4tOOOHsxR+CVa8dddKx
 DEAzzsR8x3KU7AQZrDLDzYu+RqvpeRy2/z8DyYcuKVc4JDWJvGwImgyJEkNXTRrEVs82
 2ndQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpvCnyNsHpXawPw0TQlf4sn/Qvf+ArRuhE+SwUeIc74lb9kLybLDF97xHUHy/7VNq6C21nKczc6ENMzrmQ=@nongnu.org
X-Gm-Message-State: AOJu0Yz5mVBCWDg4RwiF4cOaD0KhsejR/HXbVgSuqq8WoyrpRRBUIM9H
 BK0JO6BmVR4nj5mZYN9RzZfSd6J3UiOCQTahjFk5G/IgDlTy2KLIhu93IfWHEGTmVlJcgxISnHh
 KmOZvLoDgWmSi6RYps2tgbSP5Rh+anhjT/w7I4wah7JK1T1xYTGKmZTnPuf4=
X-Gm-Gg: AfdE7ck1sOKBNSGRorzMfv3mud9PJx9647ASM0t7+nhQrXRY8HXJGR1oK6IV5bjVtG1
 nXCNMaMMC23G9xJBv671WN+WA0fzBFkDJyyYUnzfJlGaMThOk0RSUyzSG+ct/u+nkfI9ahwq8Lb
 SgFAZyQ8USYsy4gC3CShnXsdpz90d8XTzo8oFEoV5hg1FyJkyTFBGwn2g2IR6TrmbixQ5Zhs6gJ
 z26fChhHIayWak/rW69Fy/NhaPS2DxqET2DFnYuYmbUFHdiXDejqJaFifKB/wd2SG/NIlLUpYkB
 dqLKJF2Ovm0LQQo7rgs+4opOlsmXuyqNqUCf6ye0UIB1bB72bhze0iDzETT+8hoQ7urK4blxyhc
 yp4tNm/antX+9m0ZRKhq8GiuYZ9CT1aOHQeyLefwRVZRmCKVhemPGjSA/xoeRfM+LQWJ972FdT7
 bsYnKG87RtVFeeouI=
X-Received: by 2002:a05:6000:2086:b0:47d:d812:e067 with SMTP id
 ffacd0b85a97d-47f2dcc5bfcmr9576227f8f.29.1783943184714; 
 Mon, 13 Jul 2026 04:46:24 -0700 (PDT)
X-Received: by 2002:a05:6000:2086:b0:47d:d812:e067 with SMTP id
 ffacd0b85a97d-47f2dcc5bfcmr9576194f8f.29.1783943184315; 
 Mon, 13 Jul 2026 04:46:24 -0700 (PDT)
Received: from [192.168.10.48] ([151.95.48.175])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f273195d9sm24938600f8f.3.2026.07.13.04.46.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2026 04:46:23 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-trivial@nongnu.org
Subject: [PATCH] json-parser: fix formatting of comment
Date: Mon, 13 Jul 2026 13:46:22 +0200
Message-ID: <20260713114622.1950506-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BGgct20esUqWARwMGvEXzhmQ5fD78CzT3-1riMm8M88_1783943185
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: permerror client-ip=170.10.129.124;
 envelope-from=pbonzini@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01, SPF_HELO_PASS=-0.001,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qobject/json-parser.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/qobject/json-parser.c b/qobject/json-parser.c
index 5935730c0c7..6b1b4762bda 100644
--- a/qobject/json-parser.c
+++ b/qobject/json-parser.c
@@ -29,9 +29,10 @@
  * object, an error, or NULL (if the object is incomplete and no error
  * happened) after every token.  Therefore it has an explicit
  * representation of its parser stack; each stack entry consists of a
- * parser state and a QObject: - a QList, for an array that is being
- * added to - a QDict, for a dictionary that is being added to - a
- * QString, for the key of the next pair that will be added to a QDict
+ * parser state and a QObject:
+ * - a QList, for an array that is being added to
+ * - a QDict, for a dictionary that is being added to
+ * - a QString, for the key of the next pair that will be added to a QDict
  *
  * The stack represents an arbitrary nesting of arrays and dictionaries
  * (whose next key has been parsed); it can also have a dictionary whose
-- 
2.54.0


