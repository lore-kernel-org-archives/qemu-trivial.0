Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5W1L-00069J-3c
	for mharc-qemu-trivial@gnu.org; Tue, 11 Aug 2020 11:16:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k5W1J-00065K-4P
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:16:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34678
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k5W1G-0000be-UI
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:16:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597159013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PgFzM+n3IeTrfcF7OGV45qOrWhRc4BTzy+CQeBkHFKI=;
 b=H0aHOXO6JM5rCHcf7nDbEKEEAO3bGg/wgbb1IUdIBwNgiUxQxBuF9xIdpiMW1TIkyXalx2
 gVEBwp5n4cFTbTUi+/ugq4f7hbDiy2Gj9Et/CotV0FM6ToMRcjCAwDwzed0GykGaQShjbW
 4GgY2MeI5ml4cEik+XrCkCIro/UAXJs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-EuYG7cCEOcujgjSl1ImNiA-1; Tue, 11 Aug 2020 11:16:52 -0400
X-MC-Unique: EuYG7cCEOcujgjSl1ImNiA-1
Received: by mail-wm1-f72.google.com with SMTP id u14so791570wml.0
 for <qemu-trivial@nongnu.org>; Tue, 11 Aug 2020 08:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PgFzM+n3IeTrfcF7OGV45qOrWhRc4BTzy+CQeBkHFKI=;
 b=JuYDfX5FVSVZ60fSrW5JeZ2lxwiG9oHJNjdSdZDnWKodRq91YK/USxMr1onZF0iERK
 BKfCbKnX7cRS0w5eSy0Z9DBHDkGdnyX4AtqRPPddNKd6eIMbyQMuM/dFLXeTfJyZnJMi
 Ijyn30qiHw0tfcItkCU/9t6LItUraCpbpzSL7nVL0i/hZwkzfCTGOFg5beXt7Y7/fQiu
 j2V/uK+A099YwRGZDbp2ctLa0NLuwaC9gxtNJHkHsD0h6AHQSpIIiqEG7cJeJk9iNLv6
 pxYHhKey7g4PZCFjYa5B42PT8T35lQfmOZw2m8pF+SCjSVuvYFRisF3YuZlRdmZjdma1
 qmBw==
X-Gm-Message-State: AOAM533feThhXtGV63Nu5wAUh2lU14WnPG9oyO882qCXaiOVVTWD78Um
 mje6zW6qFJU8F3ybdbDAD86lTMvVSBhekTj4u0W8lcyYQPR9GIrMx8Ql/o9Gnd8iozlfBsGPr2Z
 2CQO18rddRjEcdt9p7g==
X-Received: by 2002:a5d:5710:: with SMTP id a16mr31772937wrv.217.1597159011004; 
 Tue, 11 Aug 2020 08:16:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrBrPflSWsXyTMDezcjP7eZSmQoFDsz+Ze+0rhREkyhpoElcaz1LEtuoet2K0svto0mHXGrw==
X-Received: by 2002:a5d:5710:: with SMTP id a16mr31772913wrv.217.1597159010774; 
 Tue, 11 Aug 2020 08:16:50 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id z207sm6247867wmc.2.2020.08.11.08.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 08:16:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 1/3] hw/i2c: Fix typo in description
Date: Tue, 11 Aug 2020 17:16:41 +0200
Message-Id: <20200811151643.21293-2-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200811151643.21293-1-philmd@redhat.com>
References: <20200811151643.21293-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 02:18:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Tue, 11 Aug 2020 15:16:57 -0000

Remove the second 'and' introduced in commit 73d5f22ecb
("hw/i2c: Document the I2C qdev helpers").

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/i2c/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/i2c/i2c.h b/include/hw/i2c/i2c.h
index a9c030a512..f57808851e 100644
--- a/include/hw/i2c/i2c.h
+++ b/include/hw/i2c/i2c.h
@@ -102,7 +102,7 @@ I2CSlave *i2c_slave_new(const char *name, uint8_t addr);
 I2CSlave *i2c_slave_create_simple(I2CBus *bus, const char *name, uint8_t addr);
 
 /**
- * Realize and and drop a reference an I2C slave device
+ * Realize and drop a reference an I2C slave device
  * @dev: I2C slave device to realize
  * @bus: I2C bus to put it on
  * @addr: I2C address of the slave on the bus
-- 
2.21.3


