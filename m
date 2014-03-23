Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WRiHo-0004XG-RF
	for mharc-qemu-trivial@gnu.org; Sun, 23 Mar 2014 09:18:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33240)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReio-0002Kq-Nv
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReig-0003s1-AY
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:38 -0400
Received: from mail-pb0-x231.google.com ([2607:f8b0:400e:c01::231]:63169)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WReiL-0003ld-25; Sun, 23 Mar 2014 05:29:09 -0400
Received: by mail-pb0-f49.google.com with SMTP id jt11so4189294pbb.36
	for <multiple recipients>; Sun, 23 Mar 2014 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=IMp8Lw0zsNPInrs+TBmzgboqWZjnz7cUo8wicNpB6Oo=;
	b=XuNaw+UP8TlFK+h895QDmQ5rVKtbL05sRsNzMJY3mCd/IX9TORcsC3KzqXXHX2yPtm
	6vCwgpzFP0qpAK0Rq9j25bZ0tT6n10z21JWCOiRaJM2wUwfGms+T3w6iTvKV5WxQ1zDt
	6JwBKal0gEO+5kziMSt9k0LXvRoAEk3R4MMHZMsGGF90XiaWVfQ//dN25wHschhXZsH4
	vR+8MpzeR2aL9DzCltZdLN+XQ076zm5saOsQf9fHFK6K4gx/yms8g8c2sMhQtEqxC5bP
	pnf8ikcF/0dTAFSPGweGb32RlIL802nXP/409UZmvhBLJvoonqcH8BmLen/7ZlkyXtFt
	rviA==
X-Received: by 10.68.185.1 with SMTP id ey1mr65147223pbc.33.1395566948112;
	Sun, 23 Mar 2014 02:29:08 -0700 (PDT)
Received: from prasad-desktop ([117.195.29.155])
	by mx.google.com with ESMTPSA id
	kc9sm21097668pbc.25.2014.03.23.02.28.59 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Mar 2014 02:29:05 -0700 (PDT)
Received: by prasad-desktop (Postfix, from userid 1000)
	id 6871FA0054E; Sun, 23 Mar 2014 14:58:50 +0530 (IST)
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: prasadjoshi.linux@gmail.com
Date: Sun, 23 Mar 2014 14:58:39 +0530
Message-Id: <1395566923-5074-2-git-send-email-prasadjoshi.linux@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c01::231
X-Mailman-Approved-At: Sun, 23 Mar 2014 09:17:59 -0400
Cc: peter.maydell@linaro.org, stefanha@redhat.com, v.maffione@gmail.com,
	aik@ozlabs.ru, jan.kiszka@siemens.com, riku.voipio@iki.fi,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH 2/6] intc/openpic_kvm: fix MemListener delete
	regiion callback function
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 23 Mar 2014 09:29:47 -0000

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
---
 hw/intc/openpic_kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index 87fdb12..afa604d 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -200,7 +200,7 @@ static void kvm_openpic_realize(DeviceState *dev, Error **errp)
     qdev_init_gpio_in(dev, kvm_openpic_set_irq, OPENPIC_MAX_IRQ);
 
     opp->mem_listener.region_add = kvm_openpic_region_add;
-    opp->mem_listener.region_add = kvm_openpic_region_del;
+    opp->mem_listener.region_del = kvm_openpic_region_del;
     memory_listener_register(&opp->mem_listener, &address_space_memory);
 
     /* indicate pic capabilities */
-- 
1.8.1.2


