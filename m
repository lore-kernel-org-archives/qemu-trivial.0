Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jorRr-0005ja-0e
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 12:43:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorRp-0005fL-K3
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:29 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27057
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorRn-0006vB-BA
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593189805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XEuvMOyRqY2e7EBWzIG1Pe1q8IybZJxuzuk4WHyvnvg=;
 b=Hgav9VK99nTQspT66zmkVy/Ps0GzWBTxiK1Ri8RhVfLoHIJaBgkfZsYY3dVziS1FmXXo0O
 hm4GsYjwdJ9urX5MG8UF1iLB5jzfXKPOk5CAkOmLKTE9+DB89dtoCnqBLqbUJUrxMSyOXl
 BE7cvW8pdNqNYTGnIsHnUn7eCyKyLz8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-LH_W75RrOQa3P1-FWi0faw-1; Fri, 26 Jun 2020 12:43:23 -0400
X-MC-Unique: LH_W75RrOQa3P1-FWi0faw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52F8718585B2;
 Fri, 26 Jun 2020 16:43:22 +0000 (UTC)
Received: from turbo.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B9F8C5C1BB;
 Fri, 26 Jun 2020 16:43:19 +0000 (UTC)
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
Subject: [PATCH 01/10] modules: Provide macros making it easier to identify
 module exports
Date: Fri, 26 Jun 2020 18:42:58 +0200
Message-Id: <20200626164307.3327380-2-dinechin@redhat.com>
In-Reply-To: <20200626164307.3327380-1-dinechin@redhat.com>
References: <20200626164307.3327380-1-dinechin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=dinechin@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 03:23:21
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 26 Jun 2020 16:43:30 -0000

In order to facilitate the move of large chunks of functionality to
load modules, it is simpler to create a wrapper with the same name
that simply relays the implementation. For efficiency, this is
typically done using inline functions in the header for the
corresponding functionality. In that case, we rename the actual
implementation by appending _implementation to its name. This makes it
easier to select which function you want to put a breakpoint on.

Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 include/qemu/module.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/qemu/module.h b/include/qemu/module.h
index 011ae1ae76..1922a0293c 100644
--- a/include/qemu/module.h
+++ b/include/qemu/module.h
@@ -39,6 +39,30 @@ static void __attribute__((constructor)) do_qemu_init_ ## function(void)    \
 }
 #endif
 
+#ifdef CONFIG_MODULES
+/* Identify which functions are replaced by a callback stub */
+#ifdef MODULE_STUBS
+#define MODIFACE(Ret,Name,Args)                                         \
+    Ret (*Name)Args;                                                    \
+    extern Ret Name##_implementation Args
+#else /* !MODULE_STUBS */
+#define MODIFACE(Ret,Name,Args)                                         \
+    extern Ret (*Name)Args;                                             \
+    extern Ret Name##_implementation Args
+#endif /* MODULE_STUBS */
+
+#define MODIMPL(Ret,Name,Args)                                          \
+    static void __attribute__((constructor)) Name##_register(void)      \
+    {                                                                   \
+        Name = Name##_implementation;                                   \
+    }                                                                   \
+    Ret Name##_implementation Args
+#else /* !CONFIG_MODULES */
+/* When not using a module, such functions are called directly */
+#define MODIFACE(Ret,Name,Args)         Ret Name Args
+#define MODIMPL(Ret,Name,Args)          Ret Name Args
+#endif /* CONFIG_MODULES */
+
 typedef enum {
     MODULE_INIT_MIGRATION,
     MODULE_INIT_BLOCK,
-- 
2.26.2


