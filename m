Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qaynR-00069t-PV
	for mharc-qemu-trivial@gnu.org; Tue, 29 Aug 2023 09:30:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qaynI-00065s-B8
 for qemu-trivial@nongnu.org; Tue, 29 Aug 2023 09:30:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qayn9-0006Qr-Js
 for qemu-trivial@nongnu.org; Tue, 29 Aug 2023 09:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1693315796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=t+UNiG1pzhmqWKi+TqStlO9WP2hUb8T+M3xavbOGT2s=;
 b=DDfinJJH/EIRdmgI5Of+jWJZvQypqAtxCfBXKeDKeVueJIO2GieASlY9Ut5QGP1aZ925Iv
 N6wuRNqXNnHPipjoH2yoJtAl7D/CXNqn/xX3j95XbovPBfyV/WW/1ieUOb3xkpKwvJ+qDh
 /grtDyQCKt+fqUzCL3mVltMsheBrbDI=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-348-SX8VOkePMu6wm1BhbfkDWQ-1; Tue, 29 Aug 2023 09:29:52 -0400
X-MC-Unique: SX8VOkePMu6wm1BhbfkDWQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A7FC2815E20;
 Tue, 29 Aug 2023 13:29:52 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D56C40C6F4E;
 Tue, 29 Aug 2023 13:29:50 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH] qemu-options.hx: Rephrase the descriptions of the -hd* and
 -cdrom options
Date: Tue, 29 Aug 2023 15:29:48 +0200
Message-Id: <20230829132948.51053-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Aug 2023 13:30:16 -0000

The current description says that these options will create a device
on the IDE bus, which is only true on x86. So rephrase these sentences
a little bit to speak of "default bus" instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-options.hx | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 29b98c3d4c..a7ce5f0f7a 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1209,10 +1209,10 @@ SRST
 ERST
 
 DEF("hda", HAS_ARG, QEMU_OPTION_hda,
-    "-hda/-hdb file  use 'file' as IDE hard disk 0/1 image\n", QEMU_ARCH_ALL)
+    "-hda/-hdb file  use 'file' as hard disk 0/1 image\n", QEMU_ARCH_ALL)
 DEF("hdb", HAS_ARG, QEMU_OPTION_hdb, "", QEMU_ARCH_ALL)
 DEF("hdc", HAS_ARG, QEMU_OPTION_hdc,
-    "-hdc/-hdd file  use 'file' as IDE hard disk 2/3 image\n", QEMU_ARCH_ALL)
+    "-hdc/-hdd file  use 'file' as hard disk 2/3 image\n", QEMU_ARCH_ALL)
 DEF("hdd", HAS_ARG, QEMU_OPTION_hdd, "", QEMU_ARCH_ALL)
 SRST
 ``-hda file``
@@ -1222,18 +1222,22 @@ SRST
 ``-hdc file``
   \ 
 ``-hdd file``
-    Use file as hard disk 0, 1, 2 or 3 image (see the :ref:`disk images`
-    chapter in the System Emulation Users Guide).
+    Use file as hard disk 0, 1, 2 or 3 image on the default bus of the
+    emulated machine (this is for example the IDE bus on most x86 machines,
+    but it can also be SCSI, virtio or something else on other target
+    architectures). See al the :ref:`disk images` chapter in the System
+    Emulation Users Guide.
 ERST
 
 DEF("cdrom", HAS_ARG, QEMU_OPTION_cdrom,
-    "-cdrom file     use 'file' as IDE cdrom image (cdrom is ide1 master)\n",
+    "-cdrom file     use 'file' as CD-ROM image\n",
     QEMU_ARCH_ALL)
 SRST
 ``-cdrom file``
-    Use file as CD-ROM image (you cannot use ``-hdc`` and ``-cdrom`` at
-    the same time). You can use the host CD-ROM by using ``/dev/cdrom``
-    as filename.
+    Use file as CD-ROM image on the default bus of the emulated machine
+    (which is IDE1 master on x86, so you cannot use ``-hdc`` and ``-cdrom``
+    at the same time there). On systems that support it, you can use the
+    host CD-ROM by using ``/dev/cdrom`` as filename.
 ERST
 
 DEF("blockdev", HAS_ARG, QEMU_OPTION_blockdev,
-- 
2.39.3


