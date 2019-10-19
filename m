Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLp8y-0003RL-CY
	for mharc-qemu-trivial@gnu.org; Sat, 19 Oct 2019 09:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60172)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ash@kambanaria.org>) id 1iLnUV-0006Vo-MZ
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 08:05:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ash@kambanaria.org>) id 1iLnUT-0002tI-N4
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 08:05:51 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:35679)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <ash@kambanaria.org>) id 1iLnUT-0002sQ-H0
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 08:05:49 -0400
Received: by mail-wr1-x42b.google.com with SMTP id l10so8470005wrb.2
 for <qemu-trivial@nongnu.org>; Sat, 19 Oct 2019 05:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kambanaria-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MrtvVJmSyqwqULqVndoYPRFrL2xWqsVES8uYOf+Y1Ys=;
 b=QcKSWnA8NKSaZdj2WYcoN5iFbSXIcqaOzJ5ZK/JB8K0NhZvjpDR6z5wZdwIG/2WKoF
 gRW4KSaDTZdyEixJddWih3uJ8pgbui3CI9HZjZTonm7m1fkCZ4r0xSgHFagY79OeoO3u
 z7L9IVIledlqI/lZ0Y0m9/zHSiBsv/nA5uTPkvBbKvyvW0+NQ5EN9VPUX6wmWFl2IsHZ
 qn+Dg8IGPGLJm56OSrRn9JvrOUsPPRc2jbNpkZco7rWtm6sYaynueJxr/sB4nUKWu8Xb
 +y9z2rSDJJo2gnSxTYmeRGs6IIXHGS7/8FqkFldnS+VxtLPUdI6yUxRjnE9AgjKn42Au
 JGXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MrtvVJmSyqwqULqVndoYPRFrL2xWqsVES8uYOf+Y1Ys=;
 b=jmHYlamgm7arUy1XWM+TDFOGyKpdXprPG1/urRjClFFQuhON/0ICCGWESmPxZCPtxg
 Sqgm17vyXnt/chA9nvi+SVQ0Uh7c8ScY1Y7S/BTDRj0A27eH9StyP4D/XeRufNRR9uRX
 DQj5y591VZ9RUfL9s/3niCy5l/AU86yOaiMlOY35LCmA+o93FOcN1c7ozaEfIPlgF9gK
 rDRNltCOxgCXZqi+3PdBSdG1l8jRRkkwKkBE7W2Sg2eTmYqScZ8xAfYFNikiQ9g1L+du
 Vn8SSPw31oXV3cu5nfuVK91p9ElIVkBeowDTjdTvpjnS2Inijo4mgUiIjV7J2Ob4n5+n
 0GLQ==
X-Gm-Message-State: APjAAAWbULDmZvdPkbiWOu4I/REfNZTzrXxiqQufGGz5K3AOWGTAqVnn
 ZKqxeWTcVsGymxPo1//xJXLiNQ==
X-Google-Smtp-Source: APXvYqz5/3KoMSNtMZjU1gAhnIQ5nVaCZBmd6J5l2JIRmaoOe0RS+NN5QktEJazcNMeGvWjrwgCTcQ==
X-Received: by 2002:a5d:4701:: with SMTP id y1mr12458849wrq.385.1571486748481; 
 Sat, 19 Oct 2019 05:05:48 -0700 (PDT)
Received: from ashopov-C02X544YJHD3.home (ip4da0f75a.direct-adsl.nl.
 [77.160.247.90])
 by smtp.gmail.com with ESMTPSA id z22sm9249550wmf.2.2019.10.19.05.05.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Oct 2019 05:05:47 -0700 (PDT)
From: Alexander Shopov <ash@kambanaria.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Amos Kong <akong@redhat.com>,
 Anthony Liguori <aliguori@us.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Dongsheng Song <songdongsheng@live.cn>, Eric Blake <eblake@redhat.com>,
 Fam Zheng <famz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Pino Toscano <ptoscano@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 Wei Huang <wehuang@redhat.com>, Alexander Shopov <ash@kambanaria.org>
Subject: [PATCH 1/1] Updated Bulgarian translation (19) - 4.1.0
Date: Sat, 19 Oct 2019 14:05:34 +0200
Message-Id: <20191019120534.27479-2-ash@kambanaria.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019120534.27479-1-ash@kambanaria.org>
References: <20191019120534.27479-1-ash@kambanaria.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::42b
X-Mailman-Approved-At: Sat, 19 Oct 2019 09:51:42 -0400
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
X-List-Received-Date: Sat, 19 Oct 2019 12:05:52 -0000

Signed-off-by: Alexander Shopov <ash@kambanaria.org>
---
 po/bg.po | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/po/bg.po b/po/bg.po
index 3d8c353372..98c57e5b22 100644
--- a/po/bg.po
+++ b/po/bg.po
@@ -1,14 +1,14 @@
 # Bulgarian translation of qemu po-file.
-# Copyright (C) 2016 Alexander Shopov <ash@kambanaria.org>
+# Copyright (C) 2016, 2019 Alexander Shopov <ash@kambanaria.org>
 # This file is distributed under the same license as the qemu package.
-# Alexander Shopov <ash@kambanaria.org>, 2016.
+# Alexander Shopov <ash@kambanaria.org>, 2016, 2019.
 #
 msgid ""
 msgstr ""
-"Project-Id-Version: QEMU 2.6.50\n"
+"Project-Id-Version: QEMU 4.1.0\n"
 "Report-Msgid-Bugs-To: qemu-devel@nongnu.org\n"
 "POT-Creation-Date: 2018-07-18 07:56+0200\n"
-"PO-Revision-Date: 2016-06-09 15:54+0300\n"
+"PO-Revision-Date: 2019-10-19 13:14+0200\n"
 "Last-Translator: Alexander Shopov <ash@kambanaria.org>\n"
 "Language-Team: Bulgarian <dict@ludost.net>\n"
 "Language: bg\n"
@@ -66,7 +66,7 @@ msgid "Detach Tab"
 msgstr "Към самостоятелен подпрозорец"
 
 msgid "Show Menubar"
-msgstr ""
+msgstr "Лента за менюто"
 
 msgid "_Machine"
 msgstr "_Машина"
-- 
2.23.0


