Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOTHB-0003vy-Uf
	for mharc-qemu-trivial@gnu.org; Fri, 14 Mar 2014 10:39:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WOTH4-0003hR-NG
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 10:39:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WOTGy-0007KE-P0
	for qemu-trivial@nongnu.org; Fri, 14 Mar 2014 10:39:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1WOTGy-0007K0-Hi; Fri, 14 Mar 2014 10:39:44 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2EEdh5j002822
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 14 Mar 2014 10:39:43 -0400
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s2EEdcFZ018741; Fri, 14 Mar 2014 10:39:41 -0400
From: Laszlo Ersek <lersek@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>, Cole Robinson <crobinso@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 14 Mar 2014 15:39:36 +0100
Message-Id: <1394807976-9469-2-git-send-email-lersek@redhat.com>
In-Reply-To: <1394807976-9469-1-git-send-email-lersek@redhat.com>
References: <1394807976-9469-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [trivial PATCH 2.0 1/1] sasl: Avoid 'Could not find
	keytab file' in syslog
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
X-List-Received-Date: Fri, 14 Mar 2014 14:39:56 -0000

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
---
 qemu.sasl | 4 +++-
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
1.8.3.1


