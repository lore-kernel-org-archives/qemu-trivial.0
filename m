Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jorSH-0006RZ-U4
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 12:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorSD-0006PP-Fg
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:53 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48158
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorSB-00073U-Qi
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593189831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nTFkrvJ14i6LRcPTyAk6w009kR/PIZnJ4nrd9yvqzqM=;
 b=Fu8RcazUxJ5vV565bty6Dy6+kdD7AR9Sfdz3Jh5zQb5ZueE2lJpmq9zqYscy1PiSxMR4jf
 BMpaO3aUqKsaoIQuUzhVzwNl5IyQyu7MphJabP6I/HcxjF5p6v3Qkte3PhoahvpD0axwrQ
 b3G44+AkQVIkxhiIUG3rcS4uxDTXceE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-6aFiivT4N56EiplDQ_qBjg-1; Fri, 26 Jun 2020 12:43:47 -0400
X-MC-Unique: 6aFiivT4N56EiplDQ_qBjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59B5A80400C;
 Fri, 26 Jun 2020 16:43:46 +0000 (UTC)
Received: from turbo.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A50AA5C1BB;
 Fri, 26 Jun 2020 16:43:43 +0000 (UTC)
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
Subject: [PATCH 06/10] trivial: Remove extra trailing whitespace
Date: Fri, 26 Jun 2020 18:43:03 +0200
Message-Id: <20200626164307.3327380-7-dinechin@redhat.com>
In-Reply-To: <20200626164307.3327380-1-dinechin@redhat.com>
References: <20200626164307.3327380-1-dinechin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dinechin@redhat.com
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
X-List-Received-Date: Fri, 26 Jun 2020 16:43:54 -0000

Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 hw/display/qxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index d5627119ec..28caf878cd 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -51,7 +51,7 @@
 #undef ALIGN
 #define ALIGN(a, b) (((a) + ((b) - 1)) & ~((b) - 1))
 
-#define PIXEL_SIZE 0.2936875 //1280x1024 is 14.8" x 11.9" 
+#define PIXEL_SIZE 0.2936875 //1280x1024 is 14.8" x 11.9"
 
 #define QXL_MODE(_x, _y, _b, _o)                  \
     {   .x_res = _x,                              \
-- 
2.26.2


