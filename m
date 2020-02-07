Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j00uC-0007QN-3t
	for mharc-qemu-trivial@gnu.org; Fri, 07 Feb 2020 05:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49748)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j00u4-0007M6-B7
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j00u1-0002sJ-5x
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:26 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46174
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j00u0-0002rg-RP
 for qemu-trivial@nongnu.org; Fri, 07 Feb 2020 05:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581071423;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ic4xXqBQbyRLgMmefB9s4wGYWi05EpCfXBm9rxF4uDM=;
 b=f5gztkQYfV86grfKvBqyRxCPs0xKugw/+9pJvJoNZNcsob1TsRodl/ZjBIAr2FN494nvDc
 ZeXbOpeJvoZs/H5aP/MZPEmIE+5mEeMN2arYqStXPJ7rxW7lPyk2F3SF8bhKzELdjaPp/2
 LiQF+cCk4K/ZCOF7p5COoK9LV5F5/SM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-gw5B2b0tMoSOxRxGf6CdFw-1; Fri, 07 Feb 2020 05:30:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BD2B801E74;
 Fri,  7 Feb 2020 10:30:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0533A8E611;
 Fri,  7 Feb 2020 10:30:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Jason Wang <jasowang@redhat.com>
Subject: [PATCH 1/3] MAINTAINERS: Cover qapi/rocker.json in 'Rocker' section
Date: Fri,  7 Feb 2020 11:30:10 +0100
Message-Id: <20200207103012.27049-2-philmd@redhat.com>
In-Reply-To: <20200207103012.27049-1-philmd@redhat.com>
References: <20200207103012.27049-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: gw5B2b0tMoSOxRxGf6CdFw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Fri, 07 Feb 2020 10:30:30 -0000

List this file in the proper section, so maintainers get
notified when it is modified.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Jiri Pirko <jiri@resnulli.us>
Cc: Jason Wang <jasowang@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e72b5e5f69..903831e0a4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1680,6 +1680,7 @@ F: tests/qtest/vmxnet3-test.c
 Rocker
 M: Jiri Pirko <jiri@resnulli.us>
 S: Maintained
+F: qapi/rocker.json
 F: hw/net/rocker/
 F: tests/rocker/
 F: docs/specs/rocker.txt
--=20
2.21.1


