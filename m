Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1irh03-00075n-6n
	for mharc-qemu-trivial@gnu.org; Wed, 15 Jan 2020 06:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41576)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1irh00-0006xz-1e
 for qemu-trivial@nongnu.org; Wed, 15 Jan 2020 06:38:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1irgzv-0004Mw-H8
 for qemu-trivial@nongnu.org; Wed, 15 Jan 2020 06:38:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35334
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1irgzu-0004IG-3R
 for qemu-trivial@nongnu.org; Wed, 15 Jan 2020 06:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579088282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4P+bM/vZpE5lNkOKVhAXPHeZ4S2lSKTreH2z68EN97s=;
 b=ONAbzlduDRlMiGoq8hlfGQS67ndmku2JCF94hzGPDrqLwqcHRxrp2pbshMWpqli92Tz7W7
 oiP7HDchAWfSam62pawcQwMTYgFDgIBQz7/eFy+WobX6PA/v4iuzLaxBdM4TQTau+3SWct
 KYrz9/Ct9WYcRKhlPLDdkbaDmme5xiw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-KA-DoQh-Miiv-re6hlqBmg-1; Wed, 15 Jan 2020 06:37:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 273E864A97;
 Wed, 15 Jan 2020 11:37:58 +0000 (UTC)
Received: from thuth.com (ovpn-116-114.ams2.redhat.com [10.36.116.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7D4A811E7;
 Wed, 15 Jan 2020 11:37:51 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Philippe Mathieu-Daude <philmd@redhat.com>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] hw/input: Do not enable CONFIG_PCKBD by default
Date: Wed, 15 Jan 2020 12:37:48 +0100
Message-Id: <20200115113748.24757-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: KA-DoQh-Miiv-re6hlqBmg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
X-List-Received-Date: Wed, 15 Jan 2020 11:38:13 -0000

The i8042 device is part of the chipset of a machine, so it should
be selected by the machines or chipsets (e.g. SuperIO chipsets),
and not be enabled by default.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/input/Kconfig | 1 -
 hw/isa/Kconfig   | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/Kconfig b/hw/input/Kconfig
index 287f08887b..a2f25725be 100644
--- a/hw/input/Kconfig
+++ b/hw/input/Kconfig
@@ -7,7 +7,6 @@ config LM832X
=20
 config PCKBD
     bool
-    default y
     select PS2
     depends on ISA_BUS
=20
diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 8a38813cc1..c7f07854f7 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -16,6 +16,7 @@ config I82378
 config ISA_SUPERIO
     bool
     select ISA_BUS
+    select PCKBD
=20
 config PC87312
     bool
--=20
2.18.1


