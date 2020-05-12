Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYSDw-00074J-W9
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 06:33:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDn-000721-EF
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:33:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45725
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDk-0007X9-4D
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589279587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ds4l+7fZ3gMORFydzgGtrLwAaPpZWtJvEPP6Ecz3QgY=;
 b=R6TlvJWcujM+79/FFFj8EWoTJXpSs3ZBNsHpuvhwK8nOr9Rr4aGGmgeiW7uEuhyACTL8MF
 FchymfnVkQRLWI0KIH6HlhLbqQxjatbi0EYbMUedBq11pKY2VO+d5/jPoeE+NAFaWfP8zX
 ZvDXle84C4PBuv2vQ7++A4pvS6r0baI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-95xbgFWBNkeU_BOEUI_vhQ-1; Tue, 12 May 2020 06:33:05 -0400
X-MC-Unique: 95xbgFWBNkeU_BOEUI_vhQ-1
Received: by mail-wr1-f69.google.com with SMTP id 30so6720093wrq.15
 for <qemu-trivial@nongnu.org>; Tue, 12 May 2020 03:33:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ds4l+7fZ3gMORFydzgGtrLwAaPpZWtJvEPP6Ecz3QgY=;
 b=Ax53zrndL08Z0FhVwy8a3iWkyWn2RiP/y8WZOJSKp6hiN/4bOAsamyHq4jYnDIyb/0
 bLBVITOyO/6pbttMfU76maEdtRbtr0pyMM0JVTPaJm0e7Vtn1xJ8Z8a4boaxB9W9vdd5
 to2i7fJy+XQ4JyKRPzN+hZop1NGnoRC+9n/jQb/0r8SpB43OqnHMM7T1QoTrZHSyuifV
 6w4nXTcG1sDPH4Wp81a819Y9FGy1E/+WYr2xFJ4RxWreJZnMp0LhK2jlOB6f8jUrIkEt
 u8dl70UHUuFEXSbkScTdW+ukVnaHQmFF40cLVFszFnwk8Q8u9Kk4qGT2btSWDLvGuI+G
 dI+A==
X-Gm-Message-State: AGi0PubNMTnA4Qoz82O9FHkqNJghH4hCNvjASdkqKC86PWHl4SgWh8Bb
 0uEquOW7Su3Z4Kip/dMINTO+MzaYt5ndQjl4KoUjXh8W36268Xt4SjgiHPq8Vgij2gJtmCLihPn
 uqSbp2Tzxjrm7HjjcGw==
X-Received: by 2002:a1c:e4c1:: with SMTP id b184mr20242346wmh.4.1589279584721; 
 Tue, 12 May 2020 03:33:04 -0700 (PDT)
X-Google-Smtp-Source: APiQypI/laT2LsXrPFPVBKvEk7pWPnx7ibaLAWboB7OwBuZFbrY2ibbD5F30XX0MAqw3dY3xhmeCtA==
X-Received: by 2002:a1c:e4c1:: with SMTP id b184mr20242317wmh.4.1589279584461; 
 Tue, 12 May 2020 03:33:04 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id w15sm21193073wrl.73.2020.05.12.03.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 03:33:03 -0700 (PDT)
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
Subject: [PATCH v4 5/6] scripts/modules/module_block: Use Python 3 interpreter
 & add pseudo-main
Date: Tue, 12 May 2020 12:32:37 +0200
Message-Id: <20200512103238.7078-6-philmd@redhat.com>
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
X-List-Received-Date: Tue, 12 May 2020 10:33:17 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/modules/module_block.py | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/scripts/modules/module_block.py b/scripts/modules/module_block.py
index f23191fac1..2e7021b952 100644
--- a/scripts/modules/module_block.py
+++ b/scripts/modules/module_block.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 #
 # Module information generator
 #
@@ -10,7 +10,6 @@
 # This work is licensed under the terms of the GNU GPL, version 2.
 # See the COPYING file in the top-level directory.
 
-import sys
 import os
 
 def get_string_struct(line):
@@ -80,19 +79,21 @@ def print_bottom(fheader):
 #endif
 ''')
 
-# First argument: output file
-# All other arguments: modules source files (.c)
-output_file = sys.argv[1]
-with open(output_file, 'w') as fheader:
-    print_top(fheader)
+if __name__ == '__main__':
+    import sys
+    # First argument: output file
+    # All other arguments: modules source files (.c)
+    output_file = sys.argv[1]
+    with open(output_file, 'w') as fheader:
+        print_top(fheader)
 
-    for filename in sys.argv[2:]:
-        if os.path.isfile(filename):
-            process_file(fheader, filename)
-        else:
-            print("File " + filename + " does not exist.", file=sys.stderr)
-            sys.exit(1)
+        for filename in sys.argv[2:]:
+            if os.path.isfile(filename):
+                process_file(fheader, filename)
+            else:
+                print("File " + filename + " does not exist.", file=sys.stderr)
+                sys.exit(1)
 
-    print_bottom(fheader)
+        print_bottom(fheader)
 
-sys.exit(0)
+    sys.exit(0)
-- 
2.21.3


