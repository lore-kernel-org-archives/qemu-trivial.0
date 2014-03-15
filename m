Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlLO-0002Yu-Gq
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 05:57:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52116)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLF-0002AG-2a
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLA-0004SM-5M
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:21 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:36171)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlKz-0004Q5-7J; Sat, 15 Mar 2014 05:57:05 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 31C3741D93;
	Sat, 15 Mar 2014 13:57:03 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 20F84662;
	Sat, 15 Mar 2014 13:57:03 +0400 (MSK)
Received: (nullmailer pid 20004 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:47 +0400
Message-Id: <1394877419-19949-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Laszlo Ersek <lersek@redhat.com>
Subject: [Qemu-trivial] [PULL 01/13] sasl: Avoid 'Could not find keytab
	file' in syslog
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
X-List-Received-Date: Sat, 15 Mar 2014 09:57:26 -0000

From: Laszlo Ersek <lersek@redhat.com>

The "keytab" specification in "qemu.sasl" only makes sense if "gssapi" is
selected in "mech_list". Even if the latter is not done (ie. "gssapi" is
not selected), the cyrus-sasl library tries to open the specified keytab
file, although nothing has a use for it outside the gssapi backend.

Since the default keytab file "/etc/qemu/krb5.tab" is usually absent, the
cyrus-sasl library emits a warning to syslog at startup, which tends to
annoy users (who didn't ask for gssapi in the first place).

Comment out the keytab specification per default.

"qemu-doc.texi" already correctly explains how to use "mech_list: gssapi"
together with "keytab:".

See also:
- upstream libvirt commit fe772f24,
- Red Hat Bugzilla <https://bugzilla.redhat.com/show_bug.cgi?id=1018434>.

Signed-off-by: Laszlo Ersek <lersek@redhat.com>
ACKed-By: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu.sasl |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qemu.sasl b/qemu.sasl
index 9dc8323..64fdef3 100644
--- a/qemu.sasl
+++ b/qemu.sasl
@@ -22,7 +22,9 @@ mech_list: digest-md5
 # Some older builds of MIT kerberos on Linux ignore this option &
 # instead need KRB5_KTNAME env var.
 # For modern Linux, and other OS, this should be sufficient
-keytab: /etc/qemu/krb5.tab
+#
+# There is no default value here, uncomment if you need this
+#keytab: /etc/qemu/krb5.tab
 
 # If using digest-md5 for username/passwds, then this is the file
 # containing the passwds. Use 'saslpasswd2 -a qemu [username]'
-- 
1.7.10.4


