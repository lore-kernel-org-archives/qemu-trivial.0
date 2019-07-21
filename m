Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hpGMq-0003OV-47
	for mharc-qemu-trivial@gnu.org; Sun, 21 Jul 2019 14:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34807)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mlevitsk@redhat.com>) id 1hpGMm-0003AZ-BF
 for qemu-trivial@nongnu.org; Sun, 21 Jul 2019 14:15:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1hpGMl-0001Wz-3z
 for qemu-trivial@nongnu.org; Sun, 21 Jul 2019 14:15:24 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54938)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1hpGMg-0001Si-K3; Sun, 21 Jul 2019 14:15:18 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DC779307D88C;
 Sun, 21 Jul 2019 18:15:17 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.70])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAF8A1017E3F;
 Sun, 21 Jul 2019 18:15:15 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Cc: Max Reitz <mreitz@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>
Date: Sun, 21 Jul 2019 21:15:08 +0300
Message-Id: <20190721181508.28608-3-mlevitsk@redhat.com>
In-Reply-To: <20190721181508.28608-1-mlevitsk@redhat.com>
References: <20190721181508.28608-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Sun, 21 Jul 2019 18:15:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/2] qemu-img: better error message when
 opening a backing file fails
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
X-List-Received-Date: Sun, 21 Jul 2019 18:15:27 -0000

Currently we print message like that:

"
new_file.qcow2 : error message
"

However the error could have come from opening the backing file (e.g when it missing encryption keys),
thus try to clarify this by using this format:

"
qemu-img: error creating new_file.qcow2: base_file.qcow2: error message
Could not open backing image to determine size.
"


Test used:

qemu-img create -f qcow2 \
        --object secret,id=sec0,data=hunter9 \
        --object secret,id=sec1,data=my_new_secret_password \
        -b 'json:{ "encrypt.key-secret": "sec1", "driver": "qcow2", "file": { "driver": "file", "filename": "base.qcow2" }}' \
        -o encrypt.format=luks,encrypt.key-secret=sec1 \
        sn.qcow2


Error message before:

qemu-img: sn.qcow2: Invalid password, cannot unlock any keyslot
Could not open backing image to determine size.


Error message after:

qemu-img: error creating sn.qcow2: \
	json:{ "encrypt.key-secret": "sec1", "driver": "qcow2", "file": { "driver": "file", "filename": "base.qcow2" }}: \
	Invalid password, cannot unlock any keyslot
Could not open backing image to determine size.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 block.c    | 1 +
 qemu-img.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 29e931e217..5eb47b2199 100644
--- a/block.c
+++ b/block.c
@@ -5790,6 +5790,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
                             "This may become an error in future versions.\n");
             local_err = NULL;
         } else if (!bs) {
+            error_prepend(&local_err, "%s: ", backing_file);
             /* Couldn't open bs, do not have size */
             error_append_hint(&local_err,
                               "Could not open backing image to determine size.\n");
diff --git a/qemu-img.c b/qemu-img.c
index 79983772de..134bf2fbe0 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -545,7 +545,7 @@ static int img_create(int argc, char **argv)
     bdrv_img_create(filename, fmt, base_filename, base_fmt,
                     options, img_size, flags, quiet, &local_err);
     if (local_err) {
-        error_reportf_err(local_err, "%s: ", filename);
+        error_reportf_err(local_err, "error creating %s: ", filename);
         goto fail;
     }
 
-- 
2.17.2


