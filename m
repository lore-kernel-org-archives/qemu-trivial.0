Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jY3nY-0003OL-D4
	for mharc-qemu-trivial@gnu.org; Mon, 11 May 2020 04:28:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3nW-0003MT-NJ
 for qemu-trivial@nongnu.org; Mon, 11 May 2020 04:28:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41227
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jY3nV-0005qx-KM
 for qemu-trivial@nongnu.org; Mon, 11 May 2020 04:28:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589185705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EdEkKifv9sBa/sBVzNieXwncHlzbzRmDxxk06hFaTkk=;
 b=ZErCd9RMkb3eo3rkYIiQiiN9DuBKmLKtSGjfqEnJJ6BhVpqUJpLbSvoA+B+W2XTj+V3TWc
 zDEeqbOd1uNkH4cyEbMQzs45OyMTcW2vP9NxKjDAgeeInhvGVM6KCcxkgO++9ZforrloHg
 Juz3hbBdd1pkaIxx5KrjttBqW2qh87Y=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-6Ls5vz4YOPybm4kTw_B4Ew-1; Mon, 11 May 2020 04:28:23 -0400
X-MC-Unique: 6Ls5vz4YOPybm4kTw_B4Ew-1
Received: by mail-wr1-f70.google.com with SMTP id 37so1649894wrc.4
 for <qemu-trivial@nongnu.org>; Mon, 11 May 2020 01:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EdEkKifv9sBa/sBVzNieXwncHlzbzRmDxxk06hFaTkk=;
 b=GGQYorHMjs8UYzR6OIWe5Y509TgPEOHmCVFQloHfhsBjEkrRyvJT9IAlyr4T+6jASp
 V0ic/HdUDBzUjUZT8q23GeQ6sw5k9pHgRLalMAZzDLDx17cigMwAetrKU9xwdPv/tFbT
 hzrnxvCGeNuhbDMCqNNI7dYxmUsMvChTif7ULsB/yG4FEHCQSL0HLzNY8p/uQ3zEoY8A
 EcH1hQz+J4lo56XVnjjsy47T8c77WEFBZekcPbBPWnNP9KQ2Ow1KmacZfVbcxRNxgk+S
 bl4UwF4D4aBviq31/oP5NX65pq1uS//jyyNguj2oRdAiQlX5yNgR+UlIPGJaD/zrWvM1
 CJeA==
X-Gm-Message-State: AGi0Pub10+87MO68CYQ41vzgR63vpsN6bzRZn2DM9LWFwO1Z3MyjhYCv
 FGbVxZW2c80FIdWpA1WzAqvG0/6W5S/WZTui8/M8uPas+Fvk9WSAhPKv6KbwAGKLjlrbvxEnXOF
 wphOi1BZfgZ6AHtVGMA==
X-Received: by 2002:a1c:9e51:: with SMTP id h78mr32303661wme.177.1589185698794; 
 Mon, 11 May 2020 01:28:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJAU1InPfKBnYFEIuqlGR3bbHZHjIaOPNt8tuAxZed7CU5KeOpacJszWuRXnEv0xoQJzsIS5Q==
X-Received: by 2002:a1c:9e51:: with SMTP id h78mr32303639wme.177.1589185698557; 
 Mon, 11 May 2020 01:28:18 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id 1sm26363072wmi.0.2020.05.11.01.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 01:28:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] scripts/tracetool: Update maintainer email address
Date: Mon, 11 May 2020 10:28:16 +0200
Message-Id: <20200511082816.696-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/11 02:55:57
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
X-List-Received-Date: Mon, 11 May 2020 08:28:26 -0000

There is an effort in progress to generate a QEMU Python
package. As I'm not sure this old email is still valid,
update it to not produce package with broken maintainer
email.

Patch created mechanically by running:

 $ sed -i 's,\(__email__ *= "\)stefanha@linux.vnet.ibm.com",\1stefanha@redhat.com",' \
         $(git grep -l 'email.*stefanha@linux.vnet.ibm.com')

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/tracetool.py                             | 2 +-
 scripts/tracetool/__init__.py                    | 2 +-
 scripts/tracetool/backend/__init__.py            | 2 +-
 scripts/tracetool/backend/dtrace.py              | 2 +-
 scripts/tracetool/backend/log.py                 | 2 +-
 scripts/tracetool/backend/simple.py              | 2 +-
 scripts/tracetool/backend/ust.py                 | 2 +-
 scripts/tracetool/format/__init__.py             | 2 +-
 scripts/tracetool/format/c.py                    | 2 +-
 scripts/tracetool/format/d.py                    | 2 +-
 scripts/tracetool/format/h.py                    | 2 +-
 scripts/tracetool/format/stap.py                 | 2 +-
 scripts/tracetool/format/tcg_h.py                | 2 +-
 scripts/tracetool/format/tcg_helper_c.py         | 2 +-
 scripts/tracetool/format/tcg_helper_h.py         | 2 +-
 scripts/tracetool/format/tcg_helper_wrapper_h.py | 2 +-
 scripts/tracetool/transform.py                   | 2 +-
 scripts/tracetool/vcpu.py                        | 2 +-
 18 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/scripts/tracetool.py b/scripts/tracetool.py
index 264cc9eecc..31146242b7 100755
--- a/scripts/tracetool.py
+++ b/scripts/tracetool.py
@@ -10,7 +10,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 import sys
diff --git a/scripts/tracetool/__init__.py b/scripts/tracetool/__init__.py
index 13d29f1e42..3ccfa1e116 100644
--- a/scripts/tracetool/__init__.py
+++ b/scripts/tracetool/__init__.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 import re
diff --git a/scripts/tracetool/backend/__init__.py b/scripts/tracetool/backend/__init__.py
index 54cab2c4de..7bfcc86cc5 100644
--- a/scripts/tracetool/backend/__init__.py
+++ b/scripts/tracetool/backend/__init__.py
@@ -50,7 +50,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 import os
diff --git a/scripts/tracetool/backend/dtrace.py b/scripts/tracetool/backend/dtrace.py
index 638990db79..5711892ba0 100644
--- a/scripts/tracetool/backend/dtrace.py
+++ b/scripts/tracetool/backend/dtrace.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/backend/log.py b/scripts/tracetool/backend/log.py
index 23b274c0fd..877222bbe9 100644
--- a/scripts/tracetool/backend/log.py
+++ b/scripts/tracetool/backend/log.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/backend/simple.py b/scripts/tracetool/backend/simple.py
index b650c262b5..a74d61fcd6 100644
--- a/scripts/tracetool/backend/simple.py
+++ b/scripts/tracetool/backend/simple.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/backend/ust.py b/scripts/tracetool/backend/ust.py
index a772a3b53b..6c0a5f8d68 100644
--- a/scripts/tracetool/backend/ust.py
+++ b/scripts/tracetool/backend/ust.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/format/__init__.py b/scripts/tracetool/format/__init__.py
index aba2f7a441..2dc46f3dd9 100644
--- a/scripts/tracetool/format/__init__.py
+++ b/scripts/tracetool/format/__init__.py
@@ -32,7 +32,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 import os
diff --git a/scripts/tracetool/format/c.py b/scripts/tracetool/format/c.py
index 78af8aff72..23d82ea861 100644
--- a/scripts/tracetool/format/c.py
+++ b/scripts/tracetool/format/c.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/format/d.py b/scripts/tracetool/format/d.py
index d3980b914b..0afb5f3f47 100644
--- a/scripts/tracetool/format/d.py
+++ b/scripts/tracetool/format/d.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/format/h.py b/scripts/tracetool/format/h.py
index 83e1a2f355..e94f0be7da 100644
--- a/scripts/tracetool/format/h.py
+++ b/scripts/tracetool/format/h.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/format/stap.py b/scripts/tracetool/format/stap.py
index 8fc808f2ef..a218b0445c 100644
--- a/scripts/tracetool/format/stap.py
+++ b/scripts/tracetool/format/stap.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/format/tcg_h.py b/scripts/tracetool/format/tcg_h.py
index 0180e3d76c..33cf6a31b3 100644
--- a/scripts/tracetool/format/tcg_h.py
+++ b/scripts/tracetool/format/tcg_h.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out, Arguments
diff --git a/scripts/tracetool/format/tcg_helper_c.py b/scripts/tracetool/format/tcg_helper_c.py
index 6527b69afd..2db6317f3c 100644
--- a/scripts/tracetool/format/tcg_helper_c.py
+++ b/scripts/tracetool/format/tcg_helper_c.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import Arguments, out
diff --git a/scripts/tracetool/format/tcg_helper_h.py b/scripts/tracetool/format/tcg_helper_h.py
index 98ebe52f18..08554fbc85 100644
--- a/scripts/tracetool/format/tcg_helper_h.py
+++ b/scripts/tracetool/format/tcg_helper_h.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/format/tcg_helper_wrapper_h.py b/scripts/tracetool/format/tcg_helper_wrapper_h.py
index 6adeab74df..0c5a9797d1 100644
--- a/scripts/tracetool/format/tcg_helper_wrapper_h.py
+++ b/scripts/tracetool/format/tcg_helper_wrapper_h.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import out
diff --git a/scripts/tracetool/transform.py b/scripts/tracetool/transform.py
index 8fd4dcf20d..ea8b27799d 100644
--- a/scripts/tracetool/transform.py
+++ b/scripts/tracetool/transform.py
@@ -9,7 +9,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 def _transform_type(type_, trans):
diff --git a/scripts/tracetool/vcpu.py b/scripts/tracetool/vcpu.py
index 0b104e4f15..b54e4f4e7a 100644
--- a/scripts/tracetool/vcpu.py
+++ b/scripts/tracetool/vcpu.py
@@ -10,7 +10,7 @@
 __license__    = "GPL version 2 or (at your option) any later version"
 
 __maintainer__ = "Stefan Hajnoczi"
-__email__      = "stefanha@linux.vnet.ibm.com"
+__email__      = "stefanha@redhat.com"
 
 
 from tracetool import Arguments, try_import
-- 
2.21.3


