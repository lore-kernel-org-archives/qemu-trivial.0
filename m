Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dc84d-00067A-25
	for mharc-qemu-trivial@gnu.org; Mon, 31 Jul 2017 06:37:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc84a-00063T-1g
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dc84Z-0006zt-3q
	for qemu-trivial@nongnu.org; Mon, 31 Jul 2017 06:37:16 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34401)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dc84U-0006vb-7q; Mon, 31 Jul 2017 06:37:10 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5AE9542ABD;
	Mon, 31 Jul 2017 13:37:09 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 346AEB8C;
	Mon, 31 Jul 2017 13:21:46 +0300 (MSK)
Received: (nullmailer pid 5581 invoked by uid 1000);
	Mon, 31 Jul 2017 10:21:45 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon, 31 Jul 2017 13:21:40 +0300
Message-Id: <b3125e73d45126ecf49bd73d3a92426102759cda.1501496350.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
References: <cover.1501496349.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 21/25] docs: fix broken paths to
 docs/devel/qapi-code-gen.txt
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Jul 2017 10:37:17 -0000

From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

With the move of some docs to docs/interop on ac06724a71,
a couple of references were not updated.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/devel/writing-qmp-commands.txt | 2 +-
 include/qapi/visitor.h              | 2 +-
 qapi/introspect.json                | 2 +-
 qapi/qapi-util.c                    | 2 +-
 scripts/qapi2texi.py                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp=
-commands.txt
index 69793e320e..4f5b24c0c4 100644
--- a/docs/devel/writing-qmp-commands.txt
+++ b/docs/devel/writing-qmp-commands.txt
@@ -7,7 +7,7 @@ This document doesn't discuss QMP protocol level details,=
 nor does it dive
 into the QAPI framework implementation.
=20
 For an in-depth introduction to the QAPI framework, please refer to
-docs/qapi-code-gen.txt. For documentation about the QMP protocol,
+docs/devel/qapi-code-gen.txt. For documentation about the QMP protocol,
 start with docs/interop/qmp-intro.txt.
=20
 =3D=3D Overview =3D=3D
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index fe9faf469f..0f3b8cb459 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -36,7 +36,7 @@
  * QemuOpts, and clone visitors have some implementation limitations;
  * see the documentation for each visitor for more details on what it
  * supports.  Also, see visitor-impl.h for the callback contracts
- * implemented by each visitor, and docs/qapi-code-gen.txt for more
+ * implemented by each visitor, and docs/devel/qapi-code-gen.txt for mor=
e
  * about the QAPI code generator.
  *
  * All of the visitors are created via:
diff --git a/qapi/introspect.json b/qapi/introspect.json
index 1dbaef56eb..cf77ff0669 100644
--- a/qapi/introspect.json
+++ b/qapi/introspect.json
@@ -226,7 +226,7 @@
 #
 # @members: the alternate type's members, in no particular order.
 #           The members' wire encoding is distinct, see
-#           docs/qapi-code-gen.txt section Alternate types.
+#           docs/devel/qapi-code-gen.txt section Alternate types.
 #
 # On the wire, this can be any of the members.
 #
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index e28dbd0ac3..46eda7d196 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -40,7 +40,7 @@ int qapi_enum_parse(const char * const lookup[], const =
char *buf,
  * It may be prefixed by __RFQDN_ (downstream extension), where RFQDN
  * may contain only letters, digits, hyphen and period.
  * The special exception for enumeration names is not implemented.
- * See docs/qapi-code-gen.txt for more on QAPI naming rules.
+ * See docs/devel/qapi-code-gen.txt for more on QAPI naming rules.
  * Keep this consistent with scripts/qapi.py!
  * If @complete, the parse fails unless it consumes @str completely.
  * Return its length on success, -1 on failure.
diff --git a/scripts/qapi2texi.py b/scripts/qapi2texi.py
index 9e015002ef..a317526e51 100755
--- a/scripts/qapi2texi.py
+++ b/scripts/qapi2texi.py
@@ -91,7 +91,7 @@ def texi_format(doc):
         # doesn't.
         #
         # Make sure to update section "Documentation markup" in
-        # docs/qapi-code-gen.txt when fixing this.
+        # docs/devel/qapi-code-gen.txt when fixing this.
         if line.startswith('| '):
             line =3D EXAMPLE_FMT(code=3Dline[2:])
         elif line.startswith('=3D '):
--=20
2.11.0


