Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dajLm-0003jb-6F
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 10:01:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVl-0004wh-N8
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1dahVk-0001sA-Vm
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 08:03:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42946)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1dahVh-0001nz-Lw; Thu, 27 Jul 2017 08:03:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EF7A322D81;
	Thu, 27 Jul 2017 12:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2EF7A322D81
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=crosa@redhat.com
Received: from localhost.localdomain.com (ovpn-125-5.rdu2.redhat.com
	[10.10.125.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7EB15D96D;
	Thu, 27 Jul 2017 12:03:13 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Cleber Rosa <crosa@redhat.com>
Date: Thu, 27 Jul 2017 08:02:10 -0400
Message-Id: <20170727120210.6943-6-crosa@redhat.com>
In-Reply-To: <20170727120210.6943-1-crosa@redhat.com>
References: <20170727120210.6943-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 27 Jul 2017 12:03:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Thu, 27 Jul 2017 10:01:09 -0400
Subject: [Qemu-trivial] [PATCH 5/5] docs: fix broken paths to docs/interop
 dir
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
X-List-Received-Date: Thu, 27 Jul 2017 12:03:26 -0000

With the move of some docs to docs/interop on d59157e, a couple of
references where not updated.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 docs/devel/writing-qmp-commands.txt | 2 +-
 qapi-schema.json                    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
index 1e63754..69793e3 100644
--- a/docs/devel/writing-qmp-commands.txt
+++ b/docs/devel/writing-qmp-commands.txt
@@ -8,7 +8,7 @@ into the QAPI framework implementation.
 
 For an in-depth introduction to the QAPI framework, please refer to
 docs/qapi-code-gen.txt. For documentation about the QMP protocol,
-start with docs/qmp-intro.txt.
+start with docs/interop/qmp-intro.txt.
 
 == Overview ==
 
diff --git a/qapi-schema.json b/qapi-schema.json
index 9c6c3e1..37f1e6e 100644
--- a/qapi-schema.json
+++ b/qapi-schema.json
@@ -23,7 +23,7 @@
 # | -> data issued by the Client
 # | <- Server data response
 #
-# Please, refer to the QMP specification (docs/qmp-spec.txt) for
+# Please, refer to the QMP specification (docs/interop/qmp-spec.txt) for
 # detailed information on the Server command and response formats.
 #
 # = Stability Considerations
-- 
2.9.4


