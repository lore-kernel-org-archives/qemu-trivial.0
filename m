Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j00uM-0007j7-Gc
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 05:30:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49855)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j00uJ-0007h3-D3
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j00uI-000366-51
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:43 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39714
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j00uI-00035p-0f
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071441;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=enW1tPpcAJrZx2N0v/mMXAn+oNzX1mtVS1wdDBmvBu8=;
 b=OpfNygEDZsnwWyHcU75pIyIGs+dsr9wIhEUBnPp+DK3+3FUL+3KqccAkfrgCLHjILdHSM8
 I2d3yvc7p91Uao8pgNPHXsZciUywaPmv9Tuz1PuOClaB2693HOE9zFiwE+lydCXn4PPlEy
 ecg/HOp/XVEPp6qWYWMD4KDU3D782VU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-9RrxIEnBMXmLc-6v6W_Qhg-1; Fri, 07 Feb 2020 05:30:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 359AC1005F74;
 Fri,  7 Feb 2020 10:30:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05A3C87B1C;
 Fri,  7 Feb 2020 10:30:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH 3/3] MAINTAINERS: Cover qapi/trace.json in 'Tracing' section
Date: Fri,  7 Feb 2020 11:30:12 +0100
Message-Id: <20200207103012.27049-4-philmd@redhat.com>
In-Reply-To: <20200207103012.27049-1-philmd@redhat.com>
References: <20200207103012.27049-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 9RrxIEnBMXmLc-6v6W_Qhg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Fri, 07 Feb 2020 10:30:44 -0000

List this file in the proper section, so maintainers get
notified when it is modified.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e269e9092c..d3f8e2eb6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2205,6 +2205,7 @@ F: qemu-option-trace.texi
 F: scripts/tracetool.py
 F: scripts/tracetool/
 F: scripts/qemu-trace-stap*
+F: qapi/trace.json
 F: docs/interop/qemu-trace-stap.rst
 F: docs/devel/tracing.txt
 T: git https://github.com/stefanha/qemu.git tracing
--=20
2.21.1


