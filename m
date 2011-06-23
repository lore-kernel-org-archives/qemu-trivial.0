Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZYGd-0002lQ-5h
	for mharc-qemu-trivial@gnu.org; Wed, 22 Jun 2011 20:59:35 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>) id 1QZYGZ-0002ko-J6
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2011 20:59:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>) id 1QZYGY-0001Ls-Jo
	for qemu-trivial@nongnu.org; Wed, 22 Jun 2011 20:59:31 -0400
Received: from mail-pv0-f173.google.com ([74.125.83.173]:57362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>)
	id 1QZYGW-0001LZ-9W; Wed, 22 Jun 2011 20:59:28 -0400
Received: by pvg3 with SMTP id 3so883373pvg.4
	for <multiple recipients>; Wed, 22 Jun 2011 17:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:date:message-id:subject:from:to:cc
	:content-type; bh=NQgsNUikqp0mjEdjDkwxE3nfiOgINI/1kIBU4mxBwe0=;
	b=g4/0t5UYDM6swQJk1aWWUSWghw03CzRJ8P7EdyB+hPZmfsBkyMgTnP+hLN7t8PLthD
	y23KBrFyUEzEeehElAPBAE/rdox2onOv0HTbO7Tyllw8n1jEqv8DWnvmcJwyNYfOmywj
	vdYYi8Fs17Qe7ksPBjGVXLJEHQeB7Oyqz53Pw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type;
	b=c19IFMHwKeeRoQJ06xOL7NwDodWSkoeCHSOgeO6uR6gi2o8HD0VyGohrN3aOz3kFj6
	kUjaFmUwOeMZzRWkw0aI6H/iavr/vwtW+bOmXUZ+lYC3I8TfmlmilX5m11YIp1flZ22z
	GB6zKUR0cbrv8ggOdpO3OuVf3r1+sbSifRSHk=
MIME-Version: 1.0
Received: by 10.68.7.4 with SMTP id f4mr815763pba.208.1308790766739; Wed, 22
	Jun 2011 17:59:26 -0700 (PDT)
Received: by 10.68.48.229 with HTTP; Wed, 22 Jun 2011 17:59:26 -0700 (PDT)
Date: Thu, 23 Jun 2011 10:59:26 +1000
Message-ID: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
From: Matthew Fernandez <matthew.fernandez@gmail.com>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.173
Cc: qemu-trivial@nongnu.org, paul@codesourcery.com
Subject: [Qemu-trivial] [PATCH trivial] Fix comment typos in hw/armv7m.c
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
X-List-Received-Date: Thu, 23 Jun 2011 00:59:33 -0000

Fix a couple of typos in comments.

Signed-off-by: Matthew Fernandez <matthew.fernandez@gmail.com>
----
This patch doesn't touch any code and should (hopefully) not be
controversial. There doesn't seem to be a maintainer for this file,
but changes are trivial.


diff --git a/hw/armv7m.c b/hw/armv7m.c
index 72d010a..83f3393 100644
--- a/hw/armv7m.c
+++ b/hw/armv7m.c
@@ -4,7 +4,7 @@
  * Copyright (c) 2006-2007 CodeSourcery.
  * Written by Paul Brook
  *
- * This code is licenced under the GPL.
+ * This code is licensed under the GPL.
  */

 #include "sysbus.h"
@@ -14,7 +14,7 @@

 /* Bitbanded IO.  Each word corresponds to a single bit.  */

-/* Get the byte address of the real memory for a bitband acess.  */
+/* Get the byte address of the real memory for a bitband access.  */
 static inline uint32_t bitband_addr(void * opaque, uint32_t addr)
 {
     uint32_t res;

