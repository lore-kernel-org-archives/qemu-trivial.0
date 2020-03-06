Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jALop-0004G3-0W
	for mharc-qemu-trivial@gnu.org; Fri, 06 Mar 2020 17:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33233)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jALok-00049d-V2
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 17:51:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1jALoj-0004E5-O2
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 17:51:42 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33862
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1jALoj-0004Cp-LC
 for qemu-trivial@nongnu.org; Fri, 06 Mar 2020 17:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583535101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e9Z8L4MuIIza3Zlc0b2s5Hrm2167lOu8T2EMCiCnn+I=;
 b=UlDMo1e+3yWFsWTvUE2/VgWcfCIlY5ZcsL3YOGL/ED2eOrvRET9ofO72XLCXASAYdlqXNf
 OSSc+ETb3Hlz+qoi1Z6TUdo4UEQa4PSdU3CnKZu6W7vo3Kt/M0w3X1EbLdwk1Jer1JuSbS
 eSX44/arMQNd6kOFoi2i8cBmqym0ZQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-_uHssTzGM3GnaUV0TN1cEg-1; Fri, 06 Mar 2020 17:51:37 -0500
X-MC-Unique: _uHssTzGM3GnaUV0TN1cEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D8F81005510;
 Fri,  6 Mar 2020 22:51:34 +0000 (UTC)
Received: from blue.redhat.com (ovpn-117-177.phx2.redhat.com [10.3.117.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AB9860BE0;
 Fri,  6 Mar 2020 22:51:27 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, pkrempa@redhat.com, mreitz@redhat.com,
 libvir-list@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Liu Yuan <namei.unix@gmail.com>, Fam Zheng <fam@euphon.net>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 sheepdog@lists.wpkg.org (open list:Sheepdog),
 qemu-trivial@nongnu.org (open list:Trivial patches)
Subject: [PATCH v3 1/4] block: Add trivial backing_fmt support to qcow,
 sheepdog, vmdk
Date: Fri,  6 Mar 2020 16:51:18 -0600
Message-Id: <20200306225121.3199279-2-eblake@redhat.com>
In-Reply-To: <20200306225121.3199279-1-eblake@redhat.com>
References: <20200306225121.3199279-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
X-List-Received-Date: Fri, 06 Mar 2020 22:51:44 -0000

For qcow2 and qed, we want to encourage the use of -F always, as these
formats can suffer from data corruption or security holes if backing
format is probed.  But for other formats, the backing format cannot be
recorded.  Making the user decide on a per-format basis whether to
supply a backing format string is awkward, better is to just blindly
accept a backing format argument even if it is ignored by the
contraints of the format at hand.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/qcow.c     | 6 ++++++
 block/sheepdog.c | 6 ++++++
 block/vmdk.c     | 5 +++++
 3 files changed, 17 insertions(+)

diff --git a/block/qcow.c b/block/qcow.c
index fce89898681f..d05c3d526170 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -947,6 +947,7 @@ static int coroutine_fn qcow_co_create_opts(const char =
*filename,

     static const QDictRenames opt_renames[] =3D {
         { BLOCK_OPT_BACKING_FILE,       "backing-file" },
+        { BLOCK_OPT_BACKING_FMT,        "backing-fmt" },
         { BLOCK_OPT_ENCRYPT,            BLOCK_OPT_ENCRYPT_FORMAT },
         { NULL, NULL },
     };
@@ -1151,6 +1152,11 @@ static QemuOptsList qcow_create_opts =3D {
             .type =3D QEMU_OPT_STRING,
             .help =3D "File name of a base image"
         },
+        {
+            .name =3D BLOCK_OPT_BACKING_FMT,
+            .type =3D QEMU_OPT_STRING,
+            .help =3D "Ignored (use raw backing files with caution)",
+        },
         {
             .name =3D BLOCK_OPT_ENCRYPT,
             .type =3D QEMU_OPT_BOOL,
diff --git a/block/sheepdog.c b/block/sheepdog.c
index cfa84338a2d6..248dcf4dfa01 100644
--- a/block/sheepdog.c
+++ b/block/sheepdog.c
@@ -2187,6 +2187,7 @@ static int coroutine_fn sd_co_create_opts(const char =
*filename, QemuOpts *opts,
     /* Change legacy command line options into QMP ones */
     static const QDictRenames opt_renames[] =3D {
         { BLOCK_OPT_BACKING_FILE,       "backing-file" },
+        { BLOCK_OPT_BACKING_FMT,        "backing-fmt" },
         { BLOCK_OPT_OBJECT_SIZE,        "object-size" },
         { NULL, NULL },
     };
@@ -3189,6 +3190,11 @@ static QemuOptsList sd_create_opts =3D {
             .type =3D QEMU_OPT_STRING,
             .help =3D "File name of a base image"
         },
+        {
+            .name =3D BLOCK_OPT_BACKING_FMT,
+            .type =3D QEMU_OPT_STRING,
+            .help =3D "Ignored (use raw backing files with caution)",
+        },
         {
             .name =3D BLOCK_OPT_PREALLOC,
             .type =3D QEMU_OPT_STRING,
diff --git a/block/vmdk.c b/block/vmdk.c
index 20e909d99794..53f3d864f3fe 100644
--- a/block/vmdk.c
+++ b/block/vmdk.c
@@ -3005,6 +3005,11 @@ static QemuOptsList vmdk_create_opts =3D {
             .type =3D QEMU_OPT_STRING,
             .help =3D "File name of a base image"
         },
+        {
+            .name =3D BLOCK_OPT_BACKING_FMT,
+            .type =3D QEMU_OPT_STRING,
+            .help =3D "Ignored (base image must be vmdk format)",
+        },
         {
             .name =3D BLOCK_OPT_COMPAT6,
             .type =3D QEMU_OPT_BOOL,
--=20
2.25.1


