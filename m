Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jorSD-0006Om-4v
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 12:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorSA-0006MV-Ak
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:51 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43959
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorS8-00071z-6N
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593189826;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cHmWsD7TdMBnDkwEPK2MWxr1O4ADw/p/CSafcY/zKvM=;
 b=eRtV19vBGau8MZTivaCc1s2mCVBQ2ucgwxxaNXE9mJXY9Npjb6s8KRt4CdPQaqJJ1bTrqD
 QmFuWULrvEQEgtxY9jPOu+1Dp7Xu5ZwKbUQc5NK6HfU/h+h8qSCnSoYZfkZtcOCayoRjsM
 NhU67hLzFgk5s/mgcmu6C3G/m0WIHMY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-CY1vl2BQP-ybxKli0_eT7Q-1; Fri, 26 Jun 2020 12:43:44 -0400
X-MC-Unique: CY1vl2BQP-ybxKli0_eT7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5821EEC1B3;
 Fri, 26 Jun 2020 16:43:43 +0000 (UTC)
Received: from turbo.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4AAE5C1BB;
 Fri, 26 Jun 2020 16:43:40 +0000 (UTC)
From: Christophe de Dinechin <dinechin@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Richard Henderson <rth@twiddle.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH 05/10] build: Avoid build failure when building drivers as
 modules
Date: Fri, 26 Jun 2020 18:43:02 +0200
Message-Id: <20200626164307.3327380-6-dinechin@redhat.com>
In-Reply-To: <20200626164307.3327380-1-dinechin@redhat.com>
References: <20200626164307.3327380-1-dinechin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dinechin@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
X-List-Received-Date: Fri, 26 Jun 2020 16:43:51 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 Makefile.objs    | 1 +
 Makefile.target  | 7 +++++++
 hw/Makefile.objs | 1 +
 3 files changed, 9 insertions(+)

diff --git a/Makefile.objs b/Makefile.objs
index e38768c8d5..6703353493 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -86,6 +86,7 @@ endif # CONFIG_SOFTMMU
 # Target-independent parts used in system and user emulation
 common-obj-y += cpus-common.o
 common-obj-y += hw/
+common-obj-m += hw/
 common-obj-y += qom/
 common-obj-y += disas/
 
diff --git a/Makefile.target b/Makefile.target
index 8ed1eba95b..3f3b5ee058 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -179,6 +179,13 @@ endif # CONFIG_SOFTMMU
 dummy := $(call unnest-vars,,obj-y)
 all-obj-y := $(obj-y)
 
+#
+# common-obj-m has some crap here, probably as side effect from
+# filling obj-y.  Clear it.  Fixes suspicious dependency errors when
+# building devices as modules.
+#
+common-obj-m :=
+
 include $(SRC_PATH)/Makefile.objs
 dummy := $(call unnest-vars,.., \
                authz-obj-y \
diff --git a/hw/Makefile.objs b/hw/Makefile.objs
index 4cbe5e4e57..d6d387b74b 100644
--- a/hw/Makefile.objs
+++ b/hw/Makefile.objs
@@ -43,4 +43,5 @@ devices-dirs-y += smbios/
 endif
 
 common-obj-y += $(devices-dirs-y)
+common-obj-m := display/
 obj-y += $(devices-dirs-y)
-- 
2.26.2


