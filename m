Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwdqU-0005Te-0f
	for mharc-qemu-trivial@gnu.org; Wed, 11 Nov 2015 17:26:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rprebello@gmail.com>) id 1ZwcVO-0000Eb-L7
	for qemu-trivial@nongnu.org; Wed, 11 Nov 2015 16:00:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rprebello@gmail.com>) id 1ZwcVN-0000kK-Nb
	for qemu-trivial@nongnu.org; Wed, 11 Nov 2015 16:00:34 -0500
Received: from mail-qg0-x22a.google.com ([2607:f8b0:400d:c04::22a]:34049)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rprebello@gmail.com>)
	id 1ZwcVH-0000jV-MF; Wed, 11 Nov 2015 16:00:27 -0500
Received: by qgeb1 with SMTP id b1so32885714qge.1;
	Wed, 11 Nov 2015 13:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=riB2cBRDLQjZjpAeA8kucLU0H4vtW6BRTTx3CMOn3tw=;
	b=uuzmv0/0nr3HqsJjY4Uy5F3LtD0onFlXEaJeBp3YemQl7P7NPhGexr0TEDsxvEUDUH
	E4DGTAHfNl3fKTZfrrUPsAuZoxIUfklFZjM6hDNl7Ki3hqyRHi9MJ5DS3ur9ekNqC7Sf
	gefnsDiYkqx91EVjmBIg2V0fyTrkkNv5SSrfPWK2mkXDq58DM1nHz8SiEVJi2REBqniq
	PgS3D9JHuxqkaDzYMYmwhG3dE0ejXdwaFomHSV5BAtHjtUPkzYcEFjQqvvShoTpbCbuC
	RERsz0qvRc5+ysXSBpAScvcTfruSSj24dI759XYzoKAlr4+Uy7I0r92qmRsrF3sMET/G
	MS7w==
X-Received: by 10.140.238.204 with SMTP id j195mr13411149qhc.53.1447275626935; 
	Wed, 11 Nov 2015 13:00:26 -0800 (PST)
Received: from PKL1114.parks.local (pkproxy.parks.com.br. [186.227.188.5])
	by smtp.gmail.com with ESMTPSA id
	k109sm3275547qgf.9.2015.11.11.13.00.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Nov 2015 13:00:26 -0800 (PST)
From: Rodrigo Rebello <rprebello@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Nov 2015 18:57:37 -0200
Message-Id: <1447275457-1415-1-git-send-email-rprebello@gmail.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c04::22a
X-Mailman-Approved-At: Wed, 11 Nov 2015 17:26:24 -0500
Cc: qemu-trivial@nongnu.org, Rodrigo Rebello <rprebello@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/1] configure: use appropriate code fragment
	for -fstack-protector checks
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
X-List-Received-Date: Wed, 11 Nov 2015 21:00:35 -0000

The check for stack-protector support consisted in compiling and linking
the test program below (output by function write_c_skeleton()) with the
compiler flag -fstack-protector-strong first and then with
-fstack-protector-all if the first one failed to work:

  int main(void) { return 0; }

This caused false positives when using certain toolchains in which the
compiler accepted -fstack-protector-strong but no support was provided
by the C library, since for this stack-protector variant the compiler
emits canary code only for functions that meet specific conditions
(local arrays, memory references to local variables, etc.) and the code
fragment under test included none of them (hence no stack protection
code generated, no link failure).

This fix changes the test program used for -fstack-protector checks to
include a function that meets conditions which cause the compiler to
generate canary code in all variants.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
---
 configure | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/configure b/configure
index 46fd8bd..c3d9592 100755
--- a/configure
+++ b/configure
@@ -1486,6 +1486,24 @@ for flag in $gcc_flags; do
 done
 
 if test "$stack_protector" != "no"; then
+  cat > $TMPC << EOF
+void foo(const char *c);
+
+void foo(const char *c)
+{
+    char arr[64], *p;
+    for (p = arr; *c; c++, p++) {
+        *p = *c;
+    }
+}
+
+int main(void)
+{
+    char c[] = "";
+    foo(c);
+    return 0;
+}
+EOF
   gcc_flags="-fstack-protector-strong -fstack-protector-all"
   sp_on=0
   for flag in $gcc_flags; do
-- 
2.1.4


