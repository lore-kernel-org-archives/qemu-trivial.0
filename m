Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkE7f-0005N9-0e
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 15:18:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gkE7c-0005Ky-JJ
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 15:18:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gkE7b-0004bd-TR
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 15:18:40 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51194)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gkE7X-00041g-Ri; Thu, 17 Jan 2019 15:18:36 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AA46C07F999;
	Thu, 17 Jan 2019 20:18:05 +0000 (UTC)
Received: from localhost (ovpn-116-78.gru2.redhat.com [10.97.116.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86C8B5C893;
	Thu, 17 Jan 2019 20:18:04 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>,
	qemu-trivial@nongnu.org
Date: Thu, 17 Jan 2019 18:17:42 -0200
Message-Id: <20190117201743.20470-9-ehabkost@redhat.com>
In-Reply-To: <20190117201743.20470-1-ehabkost@redhat.com>
References: <20190117201743.20470-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 17 Jan 2019 20:18:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 8/9] qemu.py: Fix error message when qemu dies
 from signal
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
X-List-Received-Date: Thu, 17 Jan 2019 20:18:41 -0000

From: Eric Blake <eblake@redhat.com>

When qemu dies from a signal, the python code gets a negative
value for exitcode; but signal numbers are positive.  Copy the
pattern used in qemu-iotests/iotests.py for reporting a positive
value.

CC: qemu-trivial@nongnu.org
Signed-off-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190111201330.14473-1-eblake@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 scripts/qemu.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemu.py b/scripts/qemu.py
index 6e3b0e6771..0a5e02eb56 100644
--- a/scripts/qemu.py
+++ b/scripts/qemu.py
@@ -351,7 +351,7 @@ class QEMUMachine(object):
                 command = ' '.join(self._qemu_full_args)
             else:
                 command = ''
-            LOG.warn(msg, exitcode, command)
+            LOG.warn(msg, -exitcode, command)
 
         self._launched = False
 
-- 
2.18.0.rc1.1.g3f1ff2140


