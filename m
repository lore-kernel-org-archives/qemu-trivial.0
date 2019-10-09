Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iIHwG-0007V6-AM
	for mharc-qemu-trivial@gnu.org; Wed, 09 Oct 2019 15:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iIHw8-0007Jk-94
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 15:47:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iIHw6-0003fp-Uv
 for qemu-trivial@nongnu.org; Wed, 09 Oct 2019 15:47:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59040)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>)
 id 1iIHw1-0003d0-2w; Wed, 09 Oct 2019 15:47:45 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 43BB518CB904;
 Wed,  9 Oct 2019 19:47:44 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-122-151.rdu2.redhat.com
 [10.10.122.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 124311001DC0;
 Wed,  9 Oct 2019 19:47:42 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v2 1/4] qemu-iotests: remove bash shebang from library files
Date: Wed,  9 Oct 2019 15:47:37 -0400
Message-Id: <20191009194740.8079-2-crosa@redhat.com>
In-Reply-To: <20191009194740.8079-1-crosa@redhat.com>
References: <20191009194740.8079-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Wed, 09 Oct 2019 19:47:44 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Wed, 09 Oct 2019 19:47:55 -0000

Due to not being able to find a reason to have shebangs on files that
are not executable.

While at it, add a mode hint to emacs, which would be clueless or
plain wrong about these containing shell code.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/qemu-iotests/common.config  | 2 +-
 tests/qemu-iotests/common.filter  | 2 +-
 tests/qemu-iotests/common.nbd     | 3 +--
 tests/qemu-iotests/common.pattern | 2 +-
 tests/qemu-iotests/common.qemu    | 2 +-
 tests/qemu-iotests/common.rc      | 2 +-
 tests/qemu-iotests/common.tls     | 2 +-
 7 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/common.config b/tests/qemu-iotests/common=
.config
index 9bd1a5a6fc..b85a6a6f96 100644
--- a/tests/qemu-iotests/common.config
+++ b/tests/qemu-iotests/common.config
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+# -*- emacs mode: sh -*-
 #
 # Copyright (C) 2009 Red Hat, Inc.
 # Copyright (c) 2000-2003,2006 Silicon Graphics, Inc.  All Rights Reserv=
ed.
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common=
.filter
index 9f418b4881..a0b52b0ac8 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+# -*- emacs mode: sh -*-
 #
 # Copyright (C) 2009 Red Hat, Inc.
 # Copyright (c) 2000-2001 Silicon Graphics, Inc.  All Rights Reserved.
diff --git a/tests/qemu-iotests/common.nbd b/tests/qemu-iotests/common.nb=
d
index 24b01b60aa..a98d05d404 100644
--- a/tests/qemu-iotests/common.nbd
+++ b/tests/qemu-iotests/common.nbd
@@ -1,5 +1,4 @@
-#!/usr/bin/env bash
-# -*- shell-script-mode -*-
+# -*- emacs mode: sh -*-
 #
 # Helpers for NBD server related config
 #
diff --git a/tests/qemu-iotests/common.pattern b/tests/qemu-iotests/commo=
n.pattern
index 4f5e5bcea0..4028b32c54 100644
--- a/tests/qemu-iotests/common.pattern
+++ b/tests/qemu-iotests/common.pattern
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+# -*- emacs mode: sh -*-
 #
 # Copyright (C) 2009 Red Hat, Inc.
 #
diff --git a/tests/qemu-iotests/common.qemu b/tests/qemu-iotests/common.q=
emu
index 8d2021a7eb..66569f6bdd 100644
--- a/tests/qemu-iotests/common.qemu
+++ b/tests/qemu-iotests/common.qemu
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+# -*- emacs mode: sh -*-
 #
 # This allows for launching of multiple QEMU instances, with independent
 # communication possible to each instance.
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index e45cdfa66b..aa4a7fcc11 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+# -*- emacs mode: sh -*-
 #
 # Copyright (C) 2009 Red Hat, Inc.
 # Copyright (c) 2000-2006 Silicon Graphics, Inc.  All Rights Reserved.
diff --git a/tests/qemu-iotests/common.tls b/tests/qemu-iotests/common.tl=
s
index 54c331d7a5..759a3d6d71 100644
--- a/tests/qemu-iotests/common.tls
+++ b/tests/qemu-iotests/common.tls
@@ -1,4 +1,4 @@
-#!/usr/bin/env bash
+# -*- emacs mode: sh -*-
 #
 # Helpers for TLS related config
 #
--=20
2.21.0


