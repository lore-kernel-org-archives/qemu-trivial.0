Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYSDy-00074a-MW
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 06:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDr-00072Z-Gd
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:33:17 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:21560
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDo-0007Xk-QH
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589279592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eW6bfQ4PBPfgnbJADVXdHyk1e9elM2KC/4eDs8BhUVc=;
 b=iPNW8SBr1DoK3kFXJD0y/+aDNr8YkLb1JkrTkzkhq2NaKEnupGetgry6jyiSwvbQNB9rpN
 HXE4gKVY0Nv9UsFI8P7PzEBDivX/zTtTQ6Z7NFHvtylExopDIgYMAQRHOsdamOZ5dzHoUw
 ojl8PBETz4b9WDAoshv6ZAhyCesp/kU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-F5pBgJfUMayXqJF1fve1eg-1; Tue, 12 May 2020 06:33:10 -0400
X-MC-Unique: F5pBgJfUMayXqJF1fve1eg-1
Received: by mail-wm1-f72.google.com with SMTP id j5so9765440wmi.4
 for <qemu-trivial@nongnu.org>; Tue, 12 May 2020 03:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eW6bfQ4PBPfgnbJADVXdHyk1e9elM2KC/4eDs8BhUVc=;
 b=TSXv3k1Uhq2pHGzWHDq1xCTV5FrYSEqVG+afzfYyZDT3u7vT5Wgcfk13t3PFXhg1Fg
 fB7EcRQPFFdbBcsMzG6c+E11tUIt+YhWOX3HOFdZ5CUXgFPW8+kW3CLLUP4YGV/m/89q
 ilDpTcopOHX/rZ/tgmFftBwp/Q6d14fxKvSIoX3b2cSFIg3zV0G1YiZlSo0kNOV5AO0Z
 OPE5aAYKWREqxXSde3zoYpQmaSTX5ZkCqrPki6V3GGE/g43IqflA6mLCN93wp9LV2P4Q
 w0Ssp8LfzHrZem/Nia86RHkj2vJ0k6BeHHw8i0vQf9/4cFfq/UP7pd6j7kfhF34yNEKj
 O+hA==
X-Gm-Message-State: AGi0Puba2ltS0VUigjsbLiXOmzO7ruHGu1hklMsZerKZO9i0jWE7Dv98
 f9AnriTbCVrOmAhw6fTA6mEvBRNzLMF8sqAl08lJKp4i3J4iUbvzSMP54ZGOXtnKO+zlPIZL4uW
 HLaDFgs5ARksqCQHZ6g==
X-Received: by 2002:a5d:526f:: with SMTP id l15mr23961460wrc.367.1589279589595; 
 Tue, 12 May 2020 03:33:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypKAy4y1dqGWaojxWwDczmxiyvjplmoiyIK4YplpgxZqaLOv7U32GRAJXJeKUMX6KRAwfFepYQ==
X-Received: by 2002:a5d:526f:: with SMTP id l15mr23961434wrc.367.1589279589392; 
 Tue, 12 May 2020 03:33:09 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id y3sm21421190wrt.87.2020.05.12.03.33.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 03:33:08 -0700 (PDT)
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
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v4 6/6] tests/migration/guestperf: Use Python 3 interpreter
Date: Tue, 12 May 2020 12:32:38 +0200
Message-Id: <20200512103238.7078-7-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200512103238.7078-1-philmd@redhat.com>
References: <20200512103238.7078-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 01:41:59
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
X-List-Received-Date: Tue, 12 May 2020 10:33:17 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/migration/guestperf-batch.py | 2 +-
 tests/migration/guestperf-plot.py  | 2 +-
 tests/migration/guestperf.py       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/migration/guestperf-batch.py b/tests/migration/guestperf-batch.py
index cb150ce804..f1e900908d 100755
--- a/tests/migration/guestperf-batch.py
+++ b/tests/migration/guestperf-batch.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 #
 # Migration test batch comparison invokation
 #
diff --git a/tests/migration/guestperf-plot.py b/tests/migration/guestperf-plot.py
index d70bb7a557..907151011a 100755
--- a/tests/migration/guestperf-plot.py
+++ b/tests/migration/guestperf-plot.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 #
 # Migration test graph plotting command
 #
diff --git a/tests/migration/guestperf.py b/tests/migration/guestperf.py
index 99b027e8ba..ba1c4bc4ca 100755
--- a/tests/migration/guestperf.py
+++ b/tests/migration/guestperf.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 #
 # Migration test direct invokation command
 #
-- 
2.21.3


