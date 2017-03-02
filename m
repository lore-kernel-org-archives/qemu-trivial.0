Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjPmo-0002ao-CR
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 07:24:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51483)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1cjPmm-0002ZE-1r
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 07:24:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berrange@redhat.com>) id 1cjPml-0006ij-Bo
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 07:24:44 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33970)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <berrange@redhat.com>)
	id 1cjPmg-0006eT-O6; Thu, 02 Mar 2017 07:24:38 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40B7261B86;
	Thu,  2 Mar 2017 12:24:38 +0000 (UTC)
Received: from t460.redhat.com (ovpn-117-78.ams2.redhat.com [10.36.117.78])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v22COWVh001326; Thu, 2 Mar 2017 07:24:33 -0500
From: "Daniel P. Berrange" <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-trivial@nongnu.org,
	"Daniel P. Berrange" <berrange@redhat.com>
Date: Thu,  2 Mar 2017 12:24:29 +0000
Message-Id: <20170302122429.7737-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 02 Mar 2017 12:24:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] qmp: allow setting properties to empty
 string in qmp-shell
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
X-List-Received-Date: Thu, 02 Mar 2017 12:24:45 -0000

The qmp-shell property parser currently rejects attempts to
set string properties to the empty string eg

  (QEMU) migrate-set-parameters  tls-hostname=
  Error while parsing command line: Expected a key=value pair, got 'tls-hostname='
command format: <command-name>  [arg-name1=arg1] ... [arg-nameN=argN]

This is caused by checking the wrong condition after splitting
the parameter on '='. The "partition" method will return "" for
the separator field, if the seperator was not present, so that
is the correct thing to check for malformed syntax.

Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
---
 scripts/qmp/qmp-shell | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index 0373b24..eccb88a 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -166,8 +166,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
 
     def __cli_expr(self, tokens, parent):
         for arg in tokens:
-            (key, _, val) = arg.partition('=')
-            if not val:
+            (key, sep, val) = arg.partition('=')
+            if sep != '=':
                 raise QMPShellError("Expected a key=value pair, got '%s'" % arg)
 
             value = self.__parse_value(val)
-- 
2.9.3


