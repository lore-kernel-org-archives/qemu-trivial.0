Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iT2iG-0000Ti-Jr
	for mharc-qemu-trivial@gnu.org; Fri, 08 Nov 2019 06:46:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35722)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iT2iD-0000Qb-FH
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:45:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iT2iB-0005US-6f
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:45:56 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:20317
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iT2iB-0005U5-3M
 for qemu-trivial@nongnu.org; Fri, 08 Nov 2019 06:45:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1573213554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cYk861gpC556EgkJCnEz6rjQ4KpNOr1kPb/DgPho6tQ=;
 b=MMC/aduHQrcVwUsvmbgSpiJ/g469FRHkXNpp3xs2oFmPEMKH3OlvsETSgx3LsbOuMYFr/C
 h1J+Ej7GO87ep2DYbcNgtAbpIziTWDljyK99luJT0QFoagOSZUYYbHt4Yi3EtxpPdxb3sP
 DP5x1zr+nfZFo+NdrheYnu0P158VC/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-uFJ5HhKZPMGOmmm9K39daw-1; Fri, 08 Nov 2019 06:45:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 82CE0800A1A;
 Fri,  8 Nov 2019 11:45:50 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CE22D600C9;
 Fri,  8 Nov 2019 11:45:47 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Laszlo Ersek <lersek@redhat.com>
Cc: "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 2/2] configure: Check bzip2 is available
Date: Fri,  8 Nov 2019 12:45:31 +0100
Message-Id: <20191108114531.21518-3-philmd@redhat.com>
In-Reply-To: <20191108114531.21518-1-philmd@redhat.com>
References: <20191108114531.21518-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: uFJ5HhKZPMGOmmm9K39daw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 08 Nov 2019 11:45:58 -0000

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
v2: use better English (Daniel)
(Not taking Daniel Reviewed-by because logic changed)
---
 configure | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/configure b/configure
index 9b322284c3..2b419a8039 100755
--- a/configure
+++ b/configure
@@ -2147,6 +2147,7 @@ case " $target_list " in
   ;;
 esac
=20
+# Some firmware binaries are compressed with bzip2
 for target in $target_list; do
   case "$target" in
     arm-softmmu | aarch64-softmmu | i386-softmmu | x86_64-softmmu)
@@ -2154,6 +2155,9 @@ for target in $target_list; do
       ;;
   esac
 done
+if test "$edk2_blobs" =3D "yes" && ! has bzip2; then
+  error_exit "The bzip2 program is required for building QEMU"
+fi
=20
 feature_not_found() {
   feature=3D$1
--=20
2.21.0


