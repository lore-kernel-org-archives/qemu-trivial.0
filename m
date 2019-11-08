Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT1VC-0001G3-Tq
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 05:28:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49337)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iT1V9-0001FD-JQ
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 05:28:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iT1V8-0004Ur-Le
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 05:28:23 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:35573
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iT1V7-0004UF-KV
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 05:28:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573208901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LuXOBqpoehuMmj9xNKBrxg6Q0fWKtvJkk9YW8IQisWI=;
 b=iPiFq5G/60fQftqPN2a6jJTW+BHi2jTq3AfAQuNHP2x9jw9B+3ceRx8KnqLdlM/i9XzI4L
 GeNkf21tEfoMuhutW2w1W49Nxy/g8xXDSGrIwYIqP4ViFyRqOC8RV/uEMqxawHcnTUoemo
 nDxeCWh0duoSKSN6wiWDMJ+A2gmfwsg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-L2O6izZnNoSbX2otIXfmwA-1; Fri, 08 Nov 2019 05:28:17 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8E991005500;
 Fri,  8 Nov 2019 10:28:16 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 610165C1BB;
 Fri,  8 Nov 2019 10:28:08 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>,
	qemu-devel@nongnu.org
Cc: "Daniel P . Berrange" <berrange@redhat.com>, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] configure: Check bzip2 is available
Date: Fri,  8 Nov 2019 11:28:05 +0100
Message-Id: <20191108102805.8258-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: L2O6izZnNoSbX2otIXfmwA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Fri, 08 Nov 2019 10:28:25 -0000

The bzip2 tool is not included in default installations.
On freshly installed systems, ./configure succeeds but 'make'
might fail later:

    BUNZIP2 pc-bios/edk2-i386-secure-code.fd.bz2
  /bin/sh: bzip2: command not found
  make: *** [Makefile:305: pc-bios/edk2-i386-secure-code.fd] Error 127
  make: *** Deleting file 'pc-bios/edk2-i386-secure-code.fd'
  make: *** Waiting for unfinished jobs....

Add a check in ./configure to warn the user if bzip2 is missing.

Fixes: 536d2173b2b
Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 configure | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/configure b/configure
index efe165edf9..9957e913e8 100755
--- a/configure
+++ b/configure
@@ -1851,6 +1851,13 @@ python_version=3D$($python -c 'import sys; print("%d=
.%d.%d" % (sys.version_info[0]
 # Suppress writing compiled files
 python=3D"$python -B"
=20
+# Some firmware binaries are compressed with bzip2
+if has bzip2; then
+  :
+else
+  error_exit "bzip2 program not found. Please install it"
+fi
+
 # Check that the C compiler works. Doing this here before testing
 # the host CPU ensures that we had a valid CC to autodetect the
 # $cpu var (and we should bail right here if that's not the case).
--=20
2.21.0


