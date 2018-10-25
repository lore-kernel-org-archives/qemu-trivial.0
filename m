Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFfog-0003rv-D1
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 09:36:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfod-0003pL-Us
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:36:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gFfod-0000pa-3c
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:36:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51152)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gFfmw-00081D-Ne; Thu, 25 Oct 2018 09:35:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A742C30832E9;
	Thu, 25 Oct 2018 13:35:01 +0000 (UTC)
Received: from localhost (unknown [10.33.36.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D940E5D6AA;
	Thu, 25 Oct 2018 13:34:56 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@suse.de>,
	Rob Herring <robh@kernel.org>, libvir-list@redhat.com,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>, Eric Blake <eblake@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Walle <michael@walle.cc>,
	Thomas Huth <thuth@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>, qemu-ppc@nongnu.org,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Li Qiang <liq3ea@163.com>,
	qemu-trivial@nongnu.org
Date: Thu, 25 Oct 2018 10:32:34 -0300
Message-Id: <20181025133301.16578-17-ehabkost@redhat.com>
In-Reply-To: <20181025133301.16578-1-ehabkost@redhat.com>
References: <20181025133301.16578-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 25 Oct 2018 13:35:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL v2 16/43] machine: fix a typo
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2018 13:36:49 -0000

From: Li Qiang <liq3ea@163.com>

Cc: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
Message-Id: <20181010161025.34796-1-liq3ea@163.com>
Reviewed-by: Stefano Garzarella <stefanogarzarella@gmail.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1987557833..da50ad6de7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -636,7 +636,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
         machine_get_memory_encryption, machine_set_memory_encryption,
         &error_abort);
     object_class_property_set_description(oc, "memory-encryption",
-        "Set memory encyption object to use", &error_abort);
+        "Set memory encryption object to use", &error_abort);
 }
 
 static void machine_class_base_init(ObjectClass *oc, void *data)
-- 
2.18.0.rc1.1.g3f1ff2140


