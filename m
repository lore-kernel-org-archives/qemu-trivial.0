Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYSDe-0006pw-Gu
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 06:33:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDc-0006m1-Qm
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:33:00 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56797
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDc-0007Us-3J
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:33:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589279579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWSfUmBy5G7w8s0mFzIrpHSBiQEAL75l96FocmDeH+w=;
 b=YsIDxvEe3AWBK2WlFuSKng+krDsEoVPxmAHqRDzqydew6ZgrGY+/JIalkZ2lCqXMRDPCxs
 nZ9B1ViPd//bGq6Evi0tFPSdIzdtEePrAjg2dDGtYdnyrINoKqEvvGwB7uQtH2nrQCgbPt
 /sLFuTcPF312Ae8yPOxBAzRZdXoe0ok=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-sRuV_RUGMiqNywbu9dqATw-1; Tue, 12 May 2020 06:32:55 -0400
X-MC-Unique: sRuV_RUGMiqNywbu9dqATw-1
Received: by mail-wm1-f69.google.com with SMTP id o26so5920764wmh.1
 for <qemu-trivial@nongnu.org>; Tue, 12 May 2020 03:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oWSfUmBy5G7w8s0mFzIrpHSBiQEAL75l96FocmDeH+w=;
 b=Syhksju/mVon/rFOp3MUsz6pU8Nsddzun8G6aTAd3uXWpjKpOMNUXaPepJQ7mb42ZT
 4ZCjZKKVowmdIq040s+k7greRlsz3C76oLid5qmKWhFLu40iTeBjRYCu0ddaujCHBeuC
 ziH8MJZM4uSm/X8AJpOE1B3LZWch1fJstuwNEVsJsq65l++PtOf9Sk57VRSXFa/7O3yE
 nfCM58tFL9twfzPImBPlxN9xEeKvkrCnTeUaPBgYH1R45a1FQq3HzUKDDNpivrKNT3ft
 Lf06Awr9zbsToDLKTX0OBUsTit73QBZ5ac0jqjAU0qbFqwLBMItczPLcbHR7M1XTpjiR
 hikQ==
X-Gm-Message-State: AGi0PuZYdTrnbHNz+jR3rt1s5DmK8e+JPepV/hUI/pSGA3KUFWNNQxcH
 y4uC9B2AEb9S1300Ibb89oe3mhsNndrB5e5UlaJ4+d/glDM3fLdmMyk4iCqNLX8UDGYFwcgl8dG
 gplaTK2/EyxReGz4Hhw==
X-Received: by 2002:a5d:560c:: with SMTP id l12mr23822069wrv.309.1589279574898; 
 Tue, 12 May 2020 03:32:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypIQhhMzrfHJzuqqGpCMtne83+qTrDIGPL9GtO3XV5eyvzYb43eEF0XvrPWMJEaysSiQNLomJg==
X-Received: by 2002:a5d:560c:: with SMTP id l12mr23822059wrv.309.1589279574750; 
 Tue, 12 May 2020 03:32:54 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id b18sm1112431wrn.82.2020.05.12.03.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 03:32:54 -0700 (PDT)
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
Subject: [PATCH v4 3/6] scripts/qmp: Use Python 3 interpreter
Date: Tue, 12 May 2020 12:32:35 +0200
Message-Id: <20200512103238.7078-4-philmd@redhat.com>
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
X-List-Received-Date: Tue, 12 May 2020 10:33:01 -0000

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 scripts/qmp/qom-get  | 2 +-
 scripts/qmp/qom-list | 2 +-
 scripts/qmp/qom-set  | 2 +-
 scripts/qmp/qom-tree | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/qmp/qom-get b/scripts/qmp/qom-get
index 007b4cd442..7c5ede91bb 100755
--- a/scripts/qmp/qom-get
+++ b/scripts/qmp/qom-get
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 ##
 # QEMU Object Model test tools
 #
diff --git a/scripts/qmp/qom-list b/scripts/qmp/qom-list
index 03bda3446b..bb68fd65d4 100755
--- a/scripts/qmp/qom-list
+++ b/scripts/qmp/qom-list
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 ##
 # QEMU Object Model test tools
 #
diff --git a/scripts/qmp/qom-set b/scripts/qmp/qom-set
index c37fe78b00..19881d85e9 100755
--- a/scripts/qmp/qom-set
+++ b/scripts/qmp/qom-set
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 ##
 # QEMU Object Model test tools
 #
diff --git a/scripts/qmp/qom-tree b/scripts/qmp/qom-tree
index 1c8acf61e7..fa91147a03 100755
--- a/scripts/qmp/qom-tree
+++ b/scripts/qmp/qom-tree
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 ##
 # QEMU Object Model test tools
 #
-- 
2.21.3


