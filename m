Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j00uA-0007Ml-5p
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 05:30:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49766)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j00u4-0007MA-SJ
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j00u2-0002tR-Ul
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:33477
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j00u0-0002rP-N8
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P6tWVHrGgMZv6SnPnuEwsRA3WMoMRm5QggFAuD3aA2A=;
 b=WqP/N+cHLQ7BWCryILStORRfnuzmYKfhpBU3Js6UloEJKFUXRDbMTs3a/Bm3Zps7d8J0m0
 +pOqyj+6qOOJc32JP82aZjo2vSU7/ZMgooCHF+Lm4pU9G0diPkMAMR3TRH5StnrlvTkaZB
 fCjc0B28NiWc3u0Z2wTWKDF49W2/NQ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-c57z9swVMdO2cp_g7rfogA-1; Fri, 07 Feb 2020 05:30:19 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DC7514E0;
 Fri,  7 Feb 2020 10:30:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D60A8E611;
 Fri,  7 Feb 2020 10:30:14 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/3] MAINTAINERS: Cover orphean qapi/json files
Date: Fri,  7 Feb 2020 11:30:09 +0100
Message-Id: <20200207103012.27049-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: c57z9swVMdO2cp_g7rfogA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
X-List-Received-Date: Fri, 07 Feb 2020 10:30:30 -0000

Few orphean files noticed while looking at Peter series:
"Convert QAPI doc comments to generate rST instead of texinfo"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg677500.html

Philippe Mathieu-Daud=C3=A9 (3):
  MAINTAINERS: Cover qapi/rocker.json in 'Rocker' section
  MAINTAINERS: Cover qapi/block{-core}.json in 'Block layer core'
    section
  MAINTAINERS: Cover qapi/trace.json in 'Tracing' section

 MAINTAINERS | 4 ++++
 1 file changed, 4 insertions(+)

--=20
2.21.1


