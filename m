Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzMh9-0002RH-4I
	for mharc-qemu-trivial@gnu.org; Thu, 09 Aug 2012 02:58:11 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47304)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SzMh7-0002Qg-6n
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 02:58:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SzMh6-0007RK-Bs
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 02:58:09 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:38578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1SzMh6-0007R3-5u; Thu, 09 Aug 2012 02:58:08 -0400
Received: by pbbrp12 with SMTP id rp12so400463pbb.4
	for <multiple recipients>; Wed, 08 Aug 2012 23:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=CTUwUe/WY4FzGGrVyZBhwi1GX5CmXX3e6VpOFXhojS8=;
	b=FZhWUvh4ZqMbZeM1ZiU0ngblvJ6vHyO1KihUFmLAWE++pTfOuwJYgvQDVXuB2W6sD8
	ZZth8NgcVQSJ8t7RDylVVOC4MFZqswzu9qOnWsuyUZHfBlPSeERHOR+h+qtBzGO7RmCP
	L5z6k7h5G0cX2jV9phIJyoEbwfAAFx/IJuQwb2Rh7qCyLDR7NElmbQ59sq6konGjBT/m
	thrNlGeW7JSey6XlBJcFinc3gAk6zm/LrPVVlv8+b+2RizzeJaJaxXCf2qc5EalbwMgO
	H/XWc0aaooLuE9LDUo2FTFPnoniITv4E+AaXXyLdC3rVWpA7xJsdKyRJ6jORs6OSxiCD
	d8ow==
Received: by 10.68.219.135 with SMTP id po7mr1601245pbc.149.1344495486178;
	Wed, 08 Aug 2012 23:58:06 -0700 (PDT)
Received: from localhost.localdomain ([111.196.219.187])
	by mx.google.com with ESMTPS id pi7sm554252pbb.56.2012.08.08.23.57.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 23:58:04 -0700 (PDT)
From: riegamaths@gmail.com
To: qemu-trivial <qemu-trivial@nongnu.org>
Date: Thu,  9 Aug 2012 14:57:51 +0800
Message-Id: <1344495471-3957-1-git-send-email-riegamaths@gmail.com>
X-Mailer: git-send-email 1.7.8.6
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
	Dunrong Huang <riegamaths@gmail.com>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [RESEND PATCH] vl.c: Exit QEMU early if no machine
	is found
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
X-List-Received-Date: Thu, 09 Aug 2012 06:58:10 -0000

From: Dunrong Huang <riegamaths@gmail.com>

We check whether the variable machine is NULL or not before accessing
it. If machine is NULL, exit QEMU with an error, this can avoids a
segfault error.

Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
---
 vl.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/vl.c b/vl.c
index e71cb30..1596617 100644
--- a/vl.c
+++ b/vl.c
@@ -3204,6 +3204,11 @@ int main(int argc, char **argv, char **envp)
     }
     loc_set_none();
 
+    if (machine == NULL) {
+        fprintf(stderr, "No machine found.\n");
+        exit(1);
+    }
+
     if (machine->hw_version) {
         qemu_set_version(machine->hw_version);
     }
@@ -3246,11 +3251,6 @@ int main(int argc, char **argv, char **envp)
         data_dir = CONFIG_QEMU_DATADIR;
     }
 
-    if (machine == NULL) {
-        fprintf(stderr, "No machine found.\n");
-        exit(1);
-    }
-
     /*
      * Default to max_cpus = smp_cpus, in case the user doesn't
      * specify a max_cpus value.
-- 
1.7.8.6


