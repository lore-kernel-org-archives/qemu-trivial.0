Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33534C5DF7D
	for <qemu-trivial@archiver.kernel.org>; Tue, 18 Aug 2026 13:52:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wwKEL-0001PC-Rr; Tue, 18 Aug 2026 09:51:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsubrianhsu@gmail.com>)
 id 1wwItH-0006Gr-Im
 for qemu-trivial@nongnu.org; Tue, 18 Aug 2026 08:26:03 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsubrianhsu@gmail.com>)
 id 1wwItF-0004XT-KL
 for qemu-trivial@nongnu.org; Tue, 18 Aug 2026 08:26:03 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-2cc7ef7ec27so56914915ad.1
 for <qemu-trivial@nongnu.org>; Tue, 18 Aug 2026 05:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787055960; x=1787660760; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=xPPzVus9SZEhqmyrbL21mtA0fNEg5Q9cNShGtr+qeYE=;
 b=BcG1uRLDKitXuhuiXingQNOYOpnlb0b6ZChgoZaL7ihAG1Wwk+AAHfGmbTEywlkFH6
 leBhNy02PUeSnKsmhZCEYHes9lFh4xDX+tZA/d7mQrh74Ff3IDtUQ4+H02wKzA5q3pwT
 gWgau7cKLPab+I/+T6ByMJBaHNuWpaoDpZxa49jgFpW+B7NmEPAhiIJqYhm3oRSbBoEp
 NqcGyuimsUopP2BM0LkLm7HYaesOBPb6MJ6GrNqDRlYoxCvaPKPlyUc+ijBlP5t6/xHB
 C6trzSqkZEHLtIY7XflNFikR5q1BzPCE1+X4bTXHZXor1tivjDY+Mi/DdVoPDriCOZbQ
 yl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787055960; x=1787660760;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=xPPzVus9SZEhqmyrbL21mtA0fNEg5Q9cNShGtr+qeYE=;
 b=EOxc3qe0Rwo2ObEtck56ASq6efVhYLxQZDE1rn0Mdgj1fqAliUsvU+6tu6toINGlyX
 Es8kPFoMYuIKlFMQ3QLc+dtcd+PEaqZRI82n99M9JZKXUXqF9NDkBXhIJ+K1wG/6yUvE
 sljZYfalyheXVL1EL+a+ny9+kEuV4CaDgMLt6QxUmKwW4qaErJy4s4Fty2JNH5u/XucA
 T47IBRRHQgHvIbk72FR3IVCLe4zz9bEwImxlxP9bbQgU+nmp/jY+D3ifW8SCn92V2DaZ
 OiSV1oZyn6uBxVDuiINhMJov0CnfAdGlhzlZuOL6QHHe1Y+UGIDcizfwEbTBJ7RwLprm
 N0Aw==
X-Gm-Message-State: AOJu0YzxdQg0BeRRNs5MewahLADSBjgx6EPNe2taugyIWYGhYUgFCEOF
 eR9eHryFo8uv9L19+uu1jlunM/jpw1g2E0wOwDWucfH2FSvjk6/B8SoN
X-Gm-Gg: AR+sD13zdZen+ptKOxjrgh6s83afgdg+S7HCQC80GjtynziY3kDVjeFW/iRI43ibEMU
 RLNAN/vVclnlaNmc/u11D8aCocEr49nY/UgUNVbe5jEhhVEgt2pFSxOw8YCyHZDWNS2bcnYhUaV
 54JNzI+ZyOk/65AlfnkLXFZYbrog7r9CJNbjMalm09SZv4es3rfReN0AH7fFCdeNt5oVXqGg0lI
 l1GIj1LyuF6vYfDfjr0v7wEyEju3bPGSOrelofInFXNFpcVzlBD64TPG/aYtKegKnB4zMMVQQEP
 xwrWHDW2F8pUuCiLI2JsBwI4ngRWVFG8SYQInBz34ZiTDz+ZVrB5+0+LBz8j3En//BKVDA05LNv
 52G1q7LXe5371NcV7Ud5XXrAJ8vw19SdqzZXPGngX4Fe6civwj+k1GzzGOtCbX3bMUKsJpOwcCF
 pZU41KROV6o8o2ZuA7foDksw0lZ3WLXtF7z7vkNbQ7LTNbgCOIEEDaBaCx/EAq6x/N3HEo8oY7H
 k5DPrIVbeEF6Q==
X-Received: by 2002:a17:902:ce05:b0:2cf:82e6:a5 with SMTP id
 d9443c01a7336-2d3b0c68338mr394414415ad.13.1787055959547; 
 Tue, 18 Aug 2026 05:25:59 -0700 (PDT)
Received: from brian-ThinkPad-T15-Gen-2i..
 ([2402:7500:5e8:72b9:108d:adf4:bbd3:73e6])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2d5c1e93ca0sm14087645ad.63.2026.08.18.05.25.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2026 05:25:59 -0700 (PDT)
From: Brian Hsu <hsubrianhsu@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Brian Hsu <hsubrianhsu@gmail.com>
Subject: [PATCH] po: Add Traditional Chinese (zh_TW) translation
Date: Tue, 18 Aug 2026 20:25:51 +0800
Message-ID: <20260818122552.661003-1-hsubrianhsu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=hsubrianhsu@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 18 Aug 2026 09:51:52 -0400
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

Hi, this is my first contribution to QEMU, and I'm still getting
familiar with the mailing-list workflow, so corrections are very
welcome.

I noticed the po/ directory has a Simplified Chinese translation but no
Traditional Chinese one. Traditional and Simplified Chinese look similar
but are not the same, and their user bases differ too. In Taiwan, almost
everyone (close to 100%) uses Traditional Chinese, so I adapted the
Simplified version into a Traditional one, partly as a contribution and
partly as practice (however trivial).

I also changed the Language field in zh_CN.po from "zh" to "zh_CN",
following the naming used in /etc/locale.gen, and used "zh_TW" for the
Traditional Chinese file.

Finally, since this addition is quite simple and the po/ directory does
not appear to have a dedicated maintainer, I've CC'd qemu-trivial.

Signed-off-by: Brian Hsu <hsubrianhsu@gmail.com>
---
 po/LINGUAS  |  1 +
 po/zh_CN.po |  2 +-
 po/zh_TW.po | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 76 insertions(+), 1 deletion(-)
 create mode 100644 po/zh_TW.po

diff --git a/po/LINGUAS b/po/LINGUAS
index 9b33a3659f..08163e8d5f 100644
--- a/po/LINGUAS
+++ b/po/LINGUAS
@@ -7,3 +7,4 @@ sv
 tr
 uk
 zh_CN
+zh_TW
diff --git a/po/zh_CN.po b/po/zh_CN.po
index 38de6a4f2a..5eb8cee3e3 100644
--- a/po/zh_CN.po
+++ b/po/zh_CN.po
@@ -10,7 +10,7 @@ msgstr ""
 "PO-Revision-Date: 2014-07-31 10:00+0800\n"
 "Last-Translator: Fam Zheng <famz@redhat.com>\n"
 "Language-Team: Chinese <zh@li.org>\n"
-"Language: zh\n"
+"Language: zh_CN\n"
 "MIME-Version: 1.0\n"
 "Content-Type: text/plain; charset=UTF-8\n"
 "Content-Transfer-Encoding: 8bit\n"
diff --git a/po/zh_TW.po b/po/zh_TW.po
new file mode 100644
index 0000000000..925c952134
--- /dev/null
+++ b/po/zh_TW.po
@@ -0,0 +1,74 @@
+# Traditional Chinese translation for QEMU.
+# This file is put in the public domain.
+#
+# Brian Hsu <hsubrianhsu@gmail.com>, 2026
+msgid ""
+msgstr ""
+"Project-Id-Version: QEMU 11.1.50\n"
+"Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
+"POT-Creation-Date: 2026-08-18 19:00+0800\n"
+"PO-Revision-Date: 2026-08-18 19:00+0800\n"
+"Last-Translator: Brian Hsu <hsubrianhsu@gmail.com>\n"
+"Language-Team: Traditional Chinese\n"
+"Language: zh_TW\n"
+"MIME-Version: 1.0\n"
+"Content-Type: text/plain; charset=UTF-8\n"
+"Content-Transfer-Encoding: 8bit\n"
+"Plural-Forms: nplurals=2; plural=n != 1;\n"
+
+msgid " - Press Ctrl+Alt+G to release grab"
+msgstr " - 按下 Ctrl+Alt+G 釋放輸入捕捉"
+
+msgid " [Paused]"
+msgstr " [已暫停]"
+
+msgid "_Pause"
+msgstr "暫停(_P)"
+
+msgid "_Reset"
+msgstr "重置(_R)"
+
+msgid "Power _Down"
+msgstr "關閉電源(_D)"
+
+msgid "_Quit"
+msgstr "結束(_Q)"
+
+msgid "_Fullscreen"
+msgstr "全螢幕(_F)"
+
+msgid "_Copy"
+msgstr "複製(_C)"
+
+msgid "Zoom _In"
+msgstr "放大(_I)"
+
+msgid "Zoom _Out"
+msgstr "縮小(_O)"
+
+msgid "Best _Fit"
+msgstr "最適大小(_F)"
+
+msgid "Zoom To _Fit"
+msgstr "縮放至適當大小(_F)"
+
+msgid "Grab On _Hover"
+msgstr "懸停時捕捉(_H)"
+
+msgid "_Grab Input"
+msgstr "捕捉輸入(_G)"
+
+msgid "Show _Tabs"
+msgstr "顯示分頁(_T)"
+
+msgid "Detach Tab"
+msgstr "分離分頁"
+
+msgid "Show Menubar"
+msgstr "選單列"
+
+msgid "_Machine"
+msgstr "虛擬機器(_M)"
+
+msgid "_View"
+msgstr "檢視(_V)"
-- 
2.43.0


