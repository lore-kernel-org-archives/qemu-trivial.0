Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZwsV2-0000Da-DX
	for mharc-qemu-trivial@gnu.org; Thu, 12 Nov 2015 09:05:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rprebello@gmail.com>) id 1ZwsUu-0008Rg-PH
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 09:05:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rprebello@gmail.com>) id 1ZwsUp-0000AG-40
	for qemu-trivial@nongnu.org; Thu, 12 Nov 2015 09:05:08 -0500
Received: from mail-qk0-x233.google.com ([2607:f8b0:400d:c09::233]:34468)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rprebello@gmail.com>)
	id 1ZwsUg-00008y-QG; Thu, 12 Nov 2015 09:04:54 -0500
Received: by qkfo3 with SMTP id o3so23310111qkf.1;
	Thu, 12 Nov 2015 06:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=pyspA/GU2P7bdzFChQEai05JMQe7CEJfPMs2SXg63l4=;
	b=rKP/iJ9qGnMHyh5a5UKhEDwml/WZCnEOcRr4gW76iKyyCzbVcAkA6BpUqkAgOiJdAH
	OuL+HIQMGcAdH1I8TF1P3r72Oh70ZSIcpCYFMfB44+hoajQjSf6OI7IbKWszF1hZD4Go
	P292PbzYZpRDAMz36E01TdM3k9LVONR/Kqeym9axb1DHsLAD9CfUez6XzDWZ+q0m9HKY
	koOWKlKt+XCywcOJL+urLT2Kb7IJw5kyo3SthY4DJ8UmP514u1FJnRVD1+9sz6NUGqBY
	elsR0bZh4JkMGahonE0cQHR/kS9Sw8xJBE1JsbW01j/sHHA84OZdbEO9ohW9NtNjkmM1
	3a4g==
X-Received: by 10.55.207.3 with SMTP id e3mr16055057qkj.32.1447337094267;
	Thu, 12 Nov 2015 06:04:54 -0800 (PST)
Received: from PKL1114.parks.local (pkproxy.parks.com.br. [186.227.188.5])
	by smtp.gmail.com with ESMTPSA id
	a205sm4096873qkb.20.2015.11.12.06.04.52
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Nov 2015 06:04:53 -0800 (PST)
From: Rodrigo Rebello <rprebello@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 12 Nov 2015 12:04:28 -0200
Message-Id: <1447337068-2448-1-git-send-email-rprebello@gmail.com>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c09::233
Cc: qemu-trivial@nongnu.org, Rodrigo Rebello <rprebello@gmail.com>,
	armbru@redhat.com
Subject: [Qemu-trivial] [PATCH v2 1/1] configure: use appropriate code
	fragment for -fstack-protector checks
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
X-List-Received-Date: Thu, 12 Nov 2015 14:05:14 -0000

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
Changes v1 -> v2:
  - Use a simpler test code that works.
---
 configure | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/configure b/configure
index 46fd8bd..d93c744 100755
--- a/configure
+++ b/configure
@@ -1486,6 +1486,16 @@ for flag in $gcc_flags; do
 done
 
 if test "$stack_protector" != "no"; then
+  cat > $TMPC << EOF
+int main(int argc, char *argv[])
+{
+    char arr[64], *p = arr, *c = argv[0];
+    while (*c) {
+        *p++ = *c++;
+    }
+    return 0;
+}
+EOF
   gcc_flags="-fstack-protector-strong -fstack-protector-all"
   sp_on=0
   for flag in $gcc_flags; do
-- 
2.1.4


