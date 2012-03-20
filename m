Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9mn2-0003Uk-Jo
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 20:19:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1S9mmz-0003N6-UF
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 20:19:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1S9mmr-00061v-3C
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 20:19:01 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:59324)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1S9mme-0005yd-Rd; Mon, 19 Mar 2012 20:18:40 -0400
Received: by obbwd20 with SMTP id wd20so1538061obb.4
	for <multiple recipients>; Mon, 19 Mar 2012 17:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=R2OF7wHD2+xD26VZpiy62r7zvTYiuaE5WO71RFgM0zA=;
	b=VIdHPHXQUd5uklicCHdmhsKsJ58t8BsvzQm4oB5LcrWg+MmF+2d/fSvQvvKlbjkecP
	3lX1JCkXzwbzDeUNq85dMEeI2HrIJIAU3BqDt/reny6ChbAlc60qLYn+Tv/Eykbmsu2p
	Z6XVQfQM5II2XW1dixLgbi5fbL5PBEZ1wduKnGNvLIAlmh0w/cM4ZwpYim393k1buMYG
	QSx9Gwvl9QO8lBVUidVTwlUWt+Gd/aZXSuYY7HFh9KJErHCjmz5A+5QSn9laM7WP4dnl
	Kr55o3f4PcSh1kzgZ1+9VQ4lpAVDof+x0K8pTV/kQIIjMvJGU6y6TP3Ps6qZUHyA8KLM
	8buw==
Received: by 10.182.134.97 with SMTP id pj1mr15723245obb.2.1332202718472;
	Mon, 19 Mar 2012 17:18:38 -0700 (PDT)
Received: from localhost.localdomain ([32.97.110.59])
	by mx.google.com with ESMTPS id g4sm11295540oeg.5.2012.03.19.17.18.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 17:18:37 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Date: Mon, 19 Mar 2012 19:18:26 -0500
Message-Id: <1332202706-25061-3-git-send-email-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1332202706-25061-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com
Subject: [Qemu-trivial] [PATCH 3/3] test: add test-qmp-commands to make check
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 20 Mar 2012 00:19:03 -0000

All the deps are here but the test was never added to the list of tests
for make check

Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 tests/Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/tests/Makefile b/tests/Makefile
index 354fdbb..94ea342 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -3,6 +3,7 @@ export SRC_PATH
 CHECKS = check-qdict check-qfloat check-qint check-qstring check-qlist
 CHECKS += check-qjson test-qmp-output-visitor test-qmp-input-visitor
 CHECKS += test-string-input-visitor test-string-output-visitor test-coroutine
+CHECKS += test-qmp-commands
 CHECKS += $(SRC_PATH)/tests/qemu-iotests-quick.sh
 
 check-qint.o check-qstring.o check-qdict.o check-qlist.o check-qfloat.o check-qjson.o test-coroutine.o: $(GENERATED_HEADERS)
-- 
1.7.4.1


