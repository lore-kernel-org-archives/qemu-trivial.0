Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iz1VQ-00085j-Ij
	for mharc-qemu-trivial@gnu.org; Tue, 04 Feb 2020 11:56:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46420)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1iz1VK-0007we-43
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2020 11:56:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1iz1VJ-0007Ye-63
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2020 11:56:50 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:43537
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1iz1VJ-0007YE-3C
 for qemu-trivial@nongnu.org; Tue, 04 Feb 2020 11:56:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580835408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fvuGOYSEUPH9fg7mO8L9rN+Jrg9eS4ABkoOSqwkjJMc=;
 b=EAtV/qL240k2eQrkhX2QRvCB/rkZFqYZtmV18YhVCj+z19v7c7LmxMUOdyE0ifJLRp1sr1
 4mxnid/AYQdMadZKpUARttGt9Jur4NZqXJ2p/rogbbFW8YycVEclwbwqospc3n+rpe3zk8
 vhHLmp7wbtoOdnJAnQFuy6GXRQ+L+yY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-Kf8vouuyOSSAeGUu1iVQxA-1; Tue, 04 Feb 2020 11:56:44 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1C07108442D;
 Tue,  4 Feb 2020 16:56:43 +0000 (UTC)
Received: from probe.redhat.com (ovpn-125-154.rdu2.redhat.com [10.10.125.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF20E5C1D4;
 Tue,  4 Feb 2020 16:56:39 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, armbru@redhat.com,
 John Snow <jsnow@redhat.com>
Subject: [PATCH] qemu-options: replace constant 1 with HAS_ARG
Date: Tue,  4 Feb 2020 11:56:38 -0500
Message-Id: <20200204165638.25051-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Kf8vouuyOSSAeGUu1iVQxA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
X-List-Received-Date: Tue, 04 Feb 2020 16:56:51 -0000

This is the only instance of a non-zero constant not using a symbolic
constant.
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 224a8e8712..ff3e806977 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1955,7 +1955,7 @@ STEXI
 Start in full screen.
 ETEXI
=20
-DEF("g", 1, QEMU_OPTION_g ,
+DEF("g", HAS_ARG, QEMU_OPTION_g ,
     "-g WxH[xDEPTH]  Set the initial graphical resolution and depth\n",
     QEMU_ARCH_PPC | QEMU_ARCH_SPARC | QEMU_ARCH_M68K)
 STEXI
--=20
2.21.0


