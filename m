Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ugqgg-0004et-LK
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 02:13:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1Ugqga-0004aO-RM
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 02:13:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UgqgS-0006YL-Gr
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 02:13:36 -0400
Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233]:54096)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UgqgS-0006Xp-Ct
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 02:13:28 -0400
Received: by mail-ob0-f179.google.com with SMTP id wo10so4151133obc.38
	for <qemu-trivial@nongnu.org>; Sun, 26 May 2013 23:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=Uc/rEHk/jy4Q5KRYSQOiCuk9BkeN+X8E8gbM7PCmCKk=;
	b=cWxehW+GwRNjWgTTTfi969Jzq9shFK6COQv6QNahyb2IxGZaK+CYl6DC47AaPG9VIj
	Cc7505/2kXOktRl5Xq5NhBoXdsNdnJsImhFLCCMRPMaS8V+3X4FlIYWwiGrTeak4v4/I
	egB+6R45uUQArQ9iJOsshzL795H+hicoW0KRbGTJ/Z05oTiC2HptoJJVlX7Ljnd9IwMf
	/9j8MOvshN+vFZfgjgY24KtHyleL2Rh1CAuPFxNVWvw8rme3SlEkxY/BZ4GJce+KCuhz
	JdCsqIE1+cnMJzpFUAUKw/agQA2PRpFU0dVjrc6iiF5jAEu+qB2ruBnXaI8l9Stnqrm0
	l47A==
X-Received: by 10.60.94.113 with SMTP id db17mr9477826oeb.62.1369635205897;
	Sun, 26 May 2013 23:13:25 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPSA id
	eq4sm29119565obb.5.2013.05.26.23.13.22 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 26 May 2013 23:13:24 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 May 2013 16:13:15 +1000
Message-Id: <1369635195-28279-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkS5KSjKLWAdNOlm3PPVeW65xRr1WTwa8Ak1slSqybvTscjJ+zKYQssK+K7YVkiHuRoOVHO
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::233
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu: fix out of tree cross compile
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
X-List-Received-Date: Mon, 27 May 2013 06:13:41 -0000

QEMU uses headers from source directory, however the "asm" symlink was
created in the build directory what broke KVM stuff compilation.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 configure |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 5ae7e4a..9c3c5e5 100755
--- a/configure
+++ b/configure
@@ -4135,7 +4135,7 @@ if test "$linux" = "yes" ; then
   esac
     # For non-KVM architectures we will not have asm headers
     if [ -e "$source_path/linux-headers/asm-$linux_arch" ]; then
-      symlink "$source_path/linux-headers/asm-$linux_arch" linux-headers/asm
+      symlink "$source_path/linux-headers/asm-$linux_arch" $source_path/linux-headers/asm
     fi
 fi
 
-- 
1.7.10.4


