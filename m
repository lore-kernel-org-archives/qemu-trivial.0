Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4252EDEBF0
	for <qemu-trivial@archiver.kernel.org>; Tue,  3 Mar 2026 20:31:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vxWOg-0002Yu-J9; Tue, 03 Mar 2026 15:31:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1vxWOf-0002YJ-DC
 for qemu-trivial@nongnu.org; Tue, 03 Mar 2026 15:31:13 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1vxWOd-00012G-Ld
 for qemu-trivial@nongnu.org; Tue, 03 Mar 2026 15:31:13 -0500
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-4398f8e2837so5217571f8f.1
 for <qemu-trivial@nongnu.org>; Tue, 03 Mar 2026 12:31:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772569869; x=1773174669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j8aTa5czDI8pRrm/2ehkhaPWVF70SJBlwviP1OjMe1g=;
 b=oLMLWmpaQlHQshcdE1WuYD0oZIYD5MFG+a/Pmvpi/+XH+kg6YE0pBL9yP9zM7gCsvD
 Ek9ZZd/x6zgp0aUqoBe4Q1KnQJtnrVXyqwP7b9eJpKHUOWIFoQJq7FYgotDr65XvEbSg
 aXYZ2VqhoxhxJ+XjBtJylHzOVNEavsZ09C/jAsu+NBhvsNhBQn34+DcA1us8FANwZDhj
 sID9vaye5lMy+/+xazWODhBko1eqszATwEXboUwRjqveL3Ltfj3SV+NgeQGnKsWiV8at
 kL93kYdISzE7QqMoMh1iwqHgHPWtAUxBBwQJGNkO3faPwRP3rkB5nFAO5XnlYe1dcv96
 yzxg==
X-Gm-Message-State: AOJu0Yx9q6Pt7XTUIaGYd548kWy49JuZ36l2SiSfL/WW0+xzS3D+sZt1
 Zrgd2vaCD1JwuCCDFUzzskiZ+2FPjbcB+1imQYvregXGJthih0qdhqCtLSrsbg==
X-Gm-Gg: ATEYQzzcrK/PfGfS1KCaDk6Ae6ZnA0PHNtBeNDDGImmhorxic1QAPM7Kf9Npuk+ZLw8
 jev3xJavNcTRxyvUJqixWgdfZBL5BwEzmFZbYYclhzn9GuzRwWy+d6W7qiV9yabeCqGWlvxbr+M
 M2/kSb3r5B1SMiEWJ7T1JSSnuHTbeARMp0uO/2OuxCIMqJ6ibbnJmH+xSPAJx0L/nyRgyYmJJsS
 7brpAWC1+thwiMiwrP+xvqwrIYSemZdhf+bUmx0XDrrS/ynRP9Y+SImF2gTE6MKjlLClx4+uqHu
 RozKfteFY8aTEovP5rkOnau03xP/nSr88j9r/wvix5iCuavvKqKfrDkxP3/GSxBR+H9KXsPr29q
 sdS4TG+7bKQbGSnfFqqUAuXjoNh+anUK0WElM3kKhSbvmzkDc58GSUv4618YKQWCdsE6nzXNEbK
 sdwTm4pD9IRBOnXsN1qiSddDQxufMsVe8gyf0H9fdUQ+GNwENQ
X-Received: by 2002:a5d:5c89:0:b0:439:b81f:ad98 with SMTP id
 ffacd0b85a97d-439b81faf6cmr13261691f8f.47.1772569869303; 
 Tue, 03 Mar 2026 12:31:09 -0800 (PST)
Received: from tpx1 (ip-109-41-178-189.web.vodafone.de. [109.41.178.189])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439b503424fsm21237576f8f.22.2026.03.03.12.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 12:31:08 -0800 (PST)
From: Thomas Huth <huth@tuxfamily.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] MAINTAINERS: Replace @tuxfamily.org address
Date: Tue,  3 Mar 2026 21:30:44 +0100
Message-ID: <20260303203044.8403-1-huth@tuxfamily.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.221.47; envelope-from=th.huth@gmail.com;
 helo=mail-wr1-f47.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.322, RCVD_IN_VALIDITY_SAFE_BLOCKED=1.141,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Tuxfamily.org has had many outages in the recent years and will likely
go away in the near future:

 https://forum.tuxfamily.org/post/3381/#p3381

Thus replace my @tuxfamily.org address with another one that is more
reliable and hopefully will survive longer.

Signed-off-by: Thomas Huth <huth@tuxfamily.org>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6698e5ff69..b75f1e592f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1367,13 +1367,13 @@ F: gdb-xml/loongarch*.xml
 M68K Machines
 -------------
 an5206
-M: Thomas Huth <huth@tuxfamily.org>
+M: Thomas Huth <th.huth+qemu@posteo.eu>
 S: Odd Fixes
 F: hw/m68k/an5206.c
 F: hw/m68k/mcf5206.c
 
 mcf5208
-M: Thomas Huth <huth@tuxfamily.org>
+M: Thomas Huth <th.huth+qemu@posteo.eu>
 S: Odd Fixes
 F: hw/m68k/mcf5208.c
 F: hw/m68k/mcf_intc.c
@@ -1383,7 +1383,7 @@ F: include/hw/m68k/mcf*.h
 F: tests/functional/m68k/test_mcf5208evb.py
 
 NeXTcube
-M: Thomas Huth <huth@tuxfamily.org>
+M: Thomas Huth <th.huth+qemu@posteo.eu>
 S: Odd Fixes
 F: hw/m68k/next-*.c
 F: hw/display/next-fb.c
@@ -3098,7 +3098,7 @@ F: audio/paaudio.c
 
 SDL Audio backend
 M: Gerd Hoffmann <kraxel@redhat.com>
-R: Thomas Huth <huth@tuxfamily.org>
+R: Thomas Huth <th.huth+qemu@posteo.eu>
 S: Odd Fixes
 F: audio/sdlaudio.c
 
-- 
2.53.0


