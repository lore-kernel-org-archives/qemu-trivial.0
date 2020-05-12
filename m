Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYSDZ-0006fE-Qr
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 06:32:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDY-0006cb-9d
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:32:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:28657
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDX-0007U9-JM
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589279574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOtCARhB88XtH+7DaaroGpTjVIhIb43b3LSLjds5GUw=;
 b=Yo//IhWBKmo1r33Vw5uzuKWrPl/1mNhT8LzAKJsW2l+mPd3P/F0vCAgbSwGEU3C8VjMFbd
 yGurvtBGy9xrbV5XCVYmCiHGJ8iF/naww7fEWjX0chPvdnsv5Pr1W+faoLQ3im2voExCv2
 gE07zvCXRqr40qMVCYVxlTz7P+9PcK4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-am910ql6OfqdbFY59Lrguw-1; Tue, 12 May 2020 06:32:51 -0400
X-MC-Unique: am910ql6OfqdbFY59Lrguw-1
Received: by mail-wr1-f70.google.com with SMTP id h12so6731841wrr.19
 for <qemu-trivial@nongnu.org>; Tue, 12 May 2020 03:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zOtCARhB88XtH+7DaaroGpTjVIhIb43b3LSLjds5GUw=;
 b=YXBG1PHhQ1XeyTAZ9FIF4s6WiVbJXtBhCDYbBZ+xH8ZNAyC1H8gcNGyy6YpQB4rhWc
 KezhXttAPEdSrGs9jhh3p85Dd9TUg62J7NGwoJoLL2qkTh2+iUAAveQMGmvo8qNx327t
 4G3W+z42XUQNY3HQmAr3F/NAGIh185WPBzzDqZh4A/tlgZfCaoG5HOTCS+pJlC8q1swS
 CxoEoRv8rd4pygCmmiOrqqPFfQKM5rKAb+28WCr87p3xnNU4VKtRWRw4x1sKnB/Rx25q
 oxkvRZDr+MOPuCWgWY4wvlu44Dl66Pt4LeEmlDksr8iMsUK45IT8p74ScC8a1VNo6CiK
 ltjg==
X-Gm-Message-State: AGi0PubVpVel5OYbvuXsn/SOpIVJ4eB/gi/BsfylbwZO1zeOh0O7Fx2x
 eve3dM7VoFZ6mpbLxAWXFBsn08GLb2Dx6JRpoxJjjlfovJTefVrf04aEBNSZ7u56ix/lZ5P6WLG
 RTuP2FEXq4bOPMAbuYg==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr12858082wrp.427.1589279570204; 
 Tue, 12 May 2020 03:32:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypIp4cKlTsev0nh13QNGo5ccEqxoYf5orH801v8Ck5Kq9gfAUjGI6X3+2CENt1I9LXed1D7kpQ==
X-Received: by 2002:adf:f3cc:: with SMTP id g12mr12858058wrp.427.1589279570025; 
 Tue, 12 May 2020 03:32:50 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id u74sm31235914wmu.13.2020.05.12.03.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 03:32:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 2/6] scripts/qemu-gdb: Use Python 3 interpreter
Date: Tue, 12 May 2020 12:32:34 +0200
Message-Id: <20200512103238.7078-3-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200512103238.7078-1-philmd@redhat.com>
References: <20200512103238.7078-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:20:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 12 May 2020 10:32:56 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/qemu-gdb.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qemu-gdb.py b/scripts/qemu-gdb.py
index f2a305c42e..e0bfa7b5a4 100644
--- a/scripts/qemu-gdb.py
+++ b/scripts/qemu-gdb.py
@@ -1,5 +1,5 @@
-#!/usr/bin/python
-
+#!/usr/bin/env python3
+#
 # GDB debugging support
 #
 # Copyright 2012 Red Hat, Inc. and/or its affiliates
-- 
2.21.3


