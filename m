Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ0ma-0000gu-QV
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:25:08 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33129)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mY-0000Yx-Gu
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mX-0003f8-Nj
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:06 -0400
Received: from mail-qw0-f45.google.com ([209.85.216.45]:45883)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QQ0mW-0003aF-Dw; Fri, 27 May 2011 13:25:04 -0400
Received: by mail-qw0-f45.google.com with SMTP id 8so1166413qwj.4
	for <multiple recipients>; Fri, 27 May 2011 10:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FLvy0UDy1qTP7Iwiztq1rCjRKVGIkgbHrHeaIyiITtg=;
	b=F0GCzooXl7i6zEax03RcHNmiBWVZKUD3/wuDD1YEtj+tvfVEDDkANADor7QFJz7RnN
	eCj6pK53bgsMBnqyfkB27YSCA8Ul9zX7u3D/rEL1HcOavL0IRnunkzGlDGPFTqPuIaBv
	8/ZK5Za1LzKB5mvOAuqFy9Az1MNrQRqWSDXIo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=g9RaCCHi4AubDDLRyGSC5HgkrREdZqc2w9/q8C6ycsoR39IJu8Nr5PaHQpnYYDJ9JU
	XacncJDRtbJkjv1ZJ2IHt4miwxIyjMhWb10I3iBsYDk6ERfAjUDJS4bp1BduePPnJkda
	zUhgjlVx1HE3qMSdPp2GjMHuIV8UcFolvxclg=
Received: by 10.224.213.133 with SMTP id gw5mr1826728qab.187.1306517104124;
	Fri, 27 May 2011 10:25:04 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id e28sm1198569qck.30.2011.05.27.10.25.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 10:25:03 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 May 2011 13:22:26 -0400
Message-Id: <1306516951-31105-2-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
In-Reply-To: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/6] Fix incorrect check for fdatasync() in
	configure
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
X-List-Received-Date: Fri, 27 May 2011 17:25:07 -0000

For some reason, darwin provides a symbol for fdatasync(), but
doesn't officially support it.

The manpage for fdatasync on Linux states the following:

"On POSIX  systems  on  which fdatasync() is available,
_POSIX_SYNCHRONIZED_IO is defined in <unistd.h> to a value greater than 0."

In fact, unistd.h defines this value to "-1", at least on OSX 10.6.7.

Add this check to the configure file.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 configure |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index a318d37..b21ef75 100755
--- a/configure
+++ b/configure
@@ -2477,7 +2477,13 @@ fi
 fdatasync=no
 cat > $TMPC << EOF
 #include <unistd.h>
-int main(void) { return fdatasync(0); }
+int main(void) {
+#if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
+return fdatasync(0);
+#else
+#abort Not supported
+#endif
+}
 EOF
 if compile_prog "" "" ; then
     fdatasync=yes
-- 
1.7.5


