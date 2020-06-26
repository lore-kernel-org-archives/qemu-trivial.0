Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jorSK-0006VQ-Ov
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 12:44:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorSH-0006RG-RK
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56690
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dinechin@redhat.com>)
 id 1jorSF-00074b-5D
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 12:43:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593189834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TqgoKOgCXruRooTvbiddn1OM2i3remTJcN406x0BcnE=;
 b=QTpiS+bPEI6oHVqU5TfUNnkHadcnNEU+UCEFl195rsduAd6ynyZ7myeKGe3WrWKp4N/nsc
 nP294DSYDb4/Si4egE5Y8SJoiCsEP1GkjUKQj9VCQbwvmGvDmciREAWTm+oOkGXI9o5CQ5
 RxbA3UbjBTqr2NGPpJW8OfNMzwziGyQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-243-8ZD0XLe5M0axqkeEX4hX1g-1; Fri, 26 Jun 2020 12:43:50 -0400
X-MC-Unique: 8ZD0XLe5M0axqkeEX4hX1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48FE3800C60;
 Fri, 26 Jun 2020 16:43:49 +0000 (UTC)
Received: from turbo.com (ovpn-112-91.ams2.redhat.com [10.36.112.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD2975C1BB;
 Fri, 26 Jun 2020 16:43:46 +0000 (UTC)
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
Subject: [PATCH 07/10] qxl - FIXME: Build as module
Date: Fri, 26 Jun 2020 18:43:04 +0200
Message-Id: <20200626164307.3327380-8-dinechin@redhat.com>
In-Reply-To: <20200626164307.3327380-1-dinechin@redhat.com>
References: <20200626164307.3327380-1-dinechin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=dinechin@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:49:42
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
X-List-Received-Date: Fri, 26 Jun 2020 16:43:59 -0000

Forcibly build qxl as a module to see if we can load it

Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
---
 hw/display/Makefile.objs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/display/Makefile.objs b/hw/display/Makefile.objs
index 77a7d622bd..f51411619b 100644
--- a/hw/display/Makefile.objs
+++ b/hw/display/Makefile.objs
@@ -44,7 +44,8 @@ common-obj-$(CONFIG_ARTIST) += artist.o
 
 obj-$(CONFIG_VGA) += vga.o
 
-common-obj-$(CONFIG_QXL) += qxl.o qxl-logger.o qxl-render.o
+common-obj-$(CONFIG_QXL:y=m) += qxl.mo
+qxl.mo-objs := qxl.o qxl-logger.o qxl-render.o
 
 obj-$(CONFIG_VIRTIO_GPU) += virtio-gpu-base.o virtio-gpu.o virtio-gpu-3d.o
 obj-$(CONFIG_VHOST_USER_GPU) += vhost-user-gpu.o
-- 
2.26.2


