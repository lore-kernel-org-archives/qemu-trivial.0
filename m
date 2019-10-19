Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iLp8y-0003SH-S2
	for mharc-qemu-trivial@gnu.org; Sat, 19 Oct 2019 09:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35691)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lists@kambanaria.org>) id 1iLoGc-0000fc-5Q
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 08:55:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lists@kambanaria.org>) id 1iLoGb-0007sx-68
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 08:55:34 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40171)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <lists@kambanaria.org>)
 id 1iLoGa-0007pk-Dj
 for qemu-trivial@nongnu.org; Sat, 19 Oct 2019 08:55:32 -0400
Received: by mail-wr1-x434.google.com with SMTP id o28so8971339wro.7
 for <qemu-trivial@nongnu.org>; Sat, 19 Oct 2019 05:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kambanaria-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ygocjr+N9fo46tpDkGFVA7itYtRMHALl4g3G6c148DQ=;
 b=ZvqjedIHcB56PJcMSYFkeapr+lu9L9CX3sajVQK6cTnBcRnqxnH8Ve42xsQeDTIE7s
 aDudmfh4iyIP+tYth1QZxCHEFz7iHBNUdGFY2cmVkPO56aE/znneVVwfoVuJpkQFwOo4
 Tpf3apN6KqjxAsWxJ7y1iYTZv48gEiWenEX/fJNu/+DD3MXdcuPm8Y9U9De8OEj9yPc4
 jUTpQCCsvxcI9s8fQTv47D2+36ru/q2fpdKI/nI1OUV7kYERTe59y1oNlZeeZVpbVO1i
 9wi1Jh9wSEVloav7HpLSfL5A4waC6skDFPRAy62iFLwa3YlddOezK+9lMQ3wceWDSV4z
 Oahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ygocjr+N9fo46tpDkGFVA7itYtRMHALl4g3G6c148DQ=;
 b=EprtI13DjQn24/5faxc4WcDd1ohOjSxqrO+InOWBH9cqpR6Oh31oTFjkIxTF8QrBN7
 SeGTTryxbzuXqv0HWT+ATyAhterelFW+S3KaRszxIdJPe/coF/i6uudnWfgjuiJO7MnT
 JxHp3ZPrkcm66QWpwzw2N48MnA2kgCqoEkX47cykCzIZjR1TI3yxa4l5PCe0QbHqH8a7
 dhrcbcofPKDWeycG6406qyfe0O/y+Y5c+LsKJFNKfHEts5xoVsQk7vxf6QVxQDJmmZwg
 uQ3I6de54KI3ydERcIc4B3UGLsB5hVgOPTM5xqFi+L+d5Luj/c20CZCCHZfU8XXdVoFo
 qlHQ==
X-Gm-Message-State: APjAAAX0I3AuuOfRkShisvWzYEy7/sBQxwBYR4jBNEZUyt+vBgUetL3t
 lV3zX0EtyXoc3FpQa3zyJG1eFw==
X-Google-Smtp-Source: APXvYqyK0oDj5HLYBJekZTiTxHkLyZqGMm8nptqPyYbwIQmoJvuhLYzI10BCM2YYk5+cuyKlHKX+AQ==
X-Received: by 2002:adf:82d2:: with SMTP id 76mr8866901wrc.52.1571489731008;
 Sat, 19 Oct 2019 05:55:31 -0700 (PDT)
Received: from ashopov-C02X544YJHD3.home (ip4da0f75a.direct-adsl.nl.
 [77.160.247.90])
 by smtp.gmail.com with ESMTPSA id b22sm9285402wmj.36.2019.10.19.05.55.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Oct 2019 05:55:30 -0700 (PDT)
From: Alexander Shopov <lists@kambanaria.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Alexander Shopov <ash@kambanaria.org>
Subject: [PATCH 1/1] Updated Bulgarian translation (19) - 4.1.0
Date: Sat, 19 Oct 2019 14:55:20 +0200
Message-Id: <20191019125520.29056-2-lists@kambanaria.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191019125520.29056-1-lists@kambanaria.org>
References: <20191019125520.29056-1-lists@kambanaria.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::434
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
X-List-Received-Date: Sat, 19 Oct 2019 12:55:35 -0000

From: Alexander Shopov <ash@kambanaria.org>

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


