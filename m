Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cmTGD-00022o-Sf
	for mharc-qemu-trivial@gnu.org; Fri, 10 Mar 2017 17:43:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cmQnk-00088a-Jf
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 15:06:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1cmQnj-0002Rt-Ka
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 15:06:12 -0500
Received: from mail.kernel.org ([198.145.29.136]:32800)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1cmQng-0002QY-9G; Fri, 10 Mar 2017 15:06:08 -0500
Received: from mail.kernel.org (localhost [127.0.0.1])
	by mail.kernel.org (Postfix) with ESMTP id 8393F20595;
	Fri, 10 Mar 2017 20:06:06 +0000 (UTC)
Received: from localhost.localdomain (bzq-109-67-52-244.red.bezeqint.net
	[109.67.52.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D241D205AA;
	Fri, 10 Mar 2017 20:06:03 +0000 (UTC)
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Eduardo Habkost <ehabkost@redhat.com>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 10 Mar 2017 22:05:49 +0200
Message-Id: <20170310200550.13313-2-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170310200550.13313-1-krzk@kernel.org>
References: <20170310200550.13313-1-krzk@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 198.145.29.136
X-Mailman-Approved-At: Fri, 10 Mar 2017 17:43:44 -0500
Subject: [Qemu-trivial] [PATCH v2 1/2] qdev: Constify value passed to
 qdev_prop_set_macaddr
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
X-List-Received-Date: Fri, 10 Mar 2017 20:06:13 -0000

The 'value' argument is not modified so this can be made const for code
safeness.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 hw/core/qdev-properties.c    | 3 ++-
 include/hw/qdev-properties.h | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 6ab4265eb478..fa3617db2df1 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -1010,7 +1010,8 @@ void qdev_prop_set_string(DeviceState *dev, const char *name, const char *value)
     object_property_set_str(OBJECT(dev), value, name, &error_abort);
 }
 
-void qdev_prop_set_macaddr(DeviceState *dev, const char *name, uint8_t *value)
+void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
+                           const uint8_t *value)
 {
     char str[2 * 6 + 5 + 1];
     snprintf(str, sizeof(str), "%02x:%02x:%02x:%02x:%02x:%02x",
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 7ac315331aa0..1d69fa7a8f04 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -188,7 +188,8 @@ void qdev_prop_set_chr(DeviceState *dev, const char *name, Chardev *value);
 void qdev_prop_set_netdev(DeviceState *dev, const char *name, NetClientState *value);
 void qdev_prop_set_drive(DeviceState *dev, const char *name,
                          BlockBackend *value, Error **errp);
-void qdev_prop_set_macaddr(DeviceState *dev, const char *name, uint8_t *value);
+void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
+                           const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 /* FIXME: Remove opaque pointer properties.  */
 void qdev_prop_set_ptr(DeviceState *dev, const char *name, void *value);
-- 
2.9.3


