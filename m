Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jorRy-00065V-M8
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 12:43:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorRx-00060q-19
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:37 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59682
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorRv-0006yK-BL
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593189814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=isO5jF/DekPZe6Mj8SRdMtRguAz69F1a7ZhvJaJnjcI=;
 b=Yml07Ii0IwvOta/NTptrhSxthJ1omtWz12AwoTsPOcIOi7qw4dbDEkyjrRRjN86m0QWRuK
 /LvzE4LFJCfw2cdC+NUd8eBBAuJ1z46OJ1BGLQeQNQDUS1PWDKvF6zDIP2bs8Rxye2ziSn
 ZF5IFJcnHLZre21Sm+WFbcKV5K1sXK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-DfNbjArCPDO1-JNYRSgGXA-1; Fri, 26 Jun 2020 12:43:29 -0400
X-MC-Unique: DfNbjArCPDO1-JNYRSgGXA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8987FEC1A4;
 Fri, 26 Jun 2020 16:43:28 +0000 (UTC)
Received: from turbo.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D257A5C1BB;
 Fri, 26 Jun 2020 16:43:25 +0000 (UTC)
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
Subject: [PATCH 03/10] spice: Make spice a module configuration
Date: Fri, 26 Jun 2020 18:43:00 +0200
Message-Id: <20200626164307.3327380-4-dinechin@redhat.com>
In-Reply-To: <20200626164307.3327380-1-dinechin@redhat.com>
References: <20200626164307.3327380-1-dinechin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 02:19:36
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
X-List-Received-Date: Fri, 26 Jun 2020 16:43:37 -0000

This commit changes the spice configuration 'm' by default, and moves
the spice components to obj-m variables. It is sufficient to build
without modules enable, but does not link correctly yet, since no
shims have been created for the missing functions yet.

Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 Makefile              | 1 +
 Makefile.objs         | 1 +
 chardev/Makefile.objs | 3 ++-
 configure             | 2 +-
 4 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index b29b0eeefa..ee674971a5 100644
--- a/Makefile
+++ b/Makefile
@@ -477,6 +477,7 @@ dummy := $(call unnest-vars,, \
                 common-obj-m \
                 trace-obj-y)
 
+
 include $(SRC_PATH)/tests/Makefile.include
 
 all: $(DOCS) $(if $(BUILD_DOCS),sphinxdocs) $(TOOLS) $(HELPERS-y) recurse-all modules $(vhost-user-json-y)
diff --git a/Makefile.objs b/Makefile.objs
index 98383972ee..e38768c8d5 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -70,6 +70,7 @@ common-obj-$(CONFIG_TPM) += tpm.o
 
 common-obj-y += backends/
 common-obj-y += chardev/
+common-obj-m += chardev/
 
 common-obj-$(CONFIG_SECCOMP) += qemu-seccomp.o
 qemu-seccomp.o-cflags := $(SECCOMP_CFLAGS)
diff --git a/chardev/Makefile.objs b/chardev/Makefile.objs
index d68e1347f9..fc9910d4f2 100644
--- a/chardev/Makefile.objs
+++ b/chardev/Makefile.objs
@@ -22,4 +22,5 @@ common-obj-$(CONFIG_BRLAPI) += baum.o
 baum.o-cflags := $(SDL_CFLAGS)
 baum.o-libs := $(BRLAPI_LIBS)
 
-common-obj-$(CONFIG_SPICE) += spice.o
+common-obj-$(CONFIG_SPICE) += spice.mo
+spice.mo-objs := spice.o
diff --git a/configure b/configure
index 130630b98f..2de1715800 100755
--- a/configure
+++ b/configure
@@ -7471,7 +7471,7 @@ if test "$posix_memalign" = "yes" ; then
 fi
 
 if test "$spice" = "yes" ; then
-  echo "CONFIG_SPICE=y" >> $config_host_mak
+  echo "CONFIG_SPICE=m" >> $config_host_mak
 fi
 
 if test "$smartcard" = "yes" ; then
-- 
2.26.2


