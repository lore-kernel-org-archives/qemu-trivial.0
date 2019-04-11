Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hEdp2-0000P1-8l
	for mharc-qemu-trivial@gnu.org; Thu, 11 Apr 2019 13:49:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hEdk4-0007dm-Dz
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 13:44:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hEdk3-0005wi-Ij
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 13:44:04 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:52170)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yury-kotov@yandex-team.ru>) id 1hEdk2-0005uM-U8
	for qemu-trivial@nongnu.org; Thu, 11 Apr 2019 13:44:03 -0400
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
	[IPv6:2a02:6b8:0:1a2d::301])
	by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id 406992E0B16
	for <qemu-trivial@nongnu.org>; Thu, 11 Apr 2019 20:43:58 +0300 (MSK)
Received: from smtpcorp1o.mail.yandex.net (smtpcorp1o.mail.yandex.net
	[2a02:6b8:0:1a2d::30])
	by mxbackcorp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTP id
	JpMEbKVlAU-hwe8Cmmo; Thu, 11 Apr 2019 20:43:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
	s=default; 
	t=1555004638; bh=EOHpD1DHD86hhEBRPqdnbm7fSwyffsp1RjDja5NEOGw=;
	h=Message-Id:Date:Subject:To:From;
	b=GTJiEjQ41Mk+gnzQ0F8q1NY+DxKKklwUp/fSOIuEpaXy9kuE2ptgTTvH86EagNuhe
	aYEUQHRcMWYOAjYXfq6QA7MAE9kU4iEzfqukYxNFPhWEv+VrJ3fzhC3p+EpubcmQKu
	Te//wKeY64JaxHfpVGwSSRq1zpejGeKY2yH0K3Ug=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
	dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red.dhcp.yndx.net (dynamic-red.dhcp.yndx.net
	[2a02:6b8:0:40c:3404:6cb5:5ab:ed68])
	by smtpcorp1o.mail.yandex.net (nwsmtp/Yandex) with ESMTPSA id
	GWnCX2KN0k-hwYSr6r7; Thu, 11 Apr 2019 20:43:58 +0300
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(Client certificate not present)
From: Yury Kotov <yury-kotov@yandex-team.ru>
To: qemu-trivial@nongnu.org
Date: Thu, 11 Apr 2019 20:43:45 +0300
Message-Id: <20190411174345.31579-1-yury-kotov@yandex-team.ru>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a02:6b8:0:1619::183
X-Mailman-Approved-At: Thu, 11 Apr 2019 13:49:11 -0400
Subject: [Qemu-trivial] [PATCH] kvm-all: Add/update fprintf's for
 kvm_*_ioeventfd_del
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
X-List-Received-Date: Thu, 11 Apr 2019 17:44:05 -0000

Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
---
 accel/kvm/kvm-all.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 241db496c3..41586daf4c 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -864,8 +864,8 @@ static void kvm_mem_ioeventfd_add(MemoryListener *lis=
tener,
                                data, true, int128_get64(section->size),
                                match_data);
     if (r < 0) {
-        fprintf(stderr, "%s: error adding ioeventfd: %s\n",
-                __func__, strerror(-r));
+        fprintf(stderr, "%s: error adding ioeventfd: %s (%d)\n",
+                __func__, strerror(-r), -r);
         abort();
     }
 }
@@ -882,6 +882,8 @@ static void kvm_mem_ioeventfd_del(MemoryListener *lis=
tener,
                                data, false, int128_get64(section->size),
                                match_data);
     if (r < 0) {
+        fprintf(stderr, "%s: error deleting ioeventfd: %s (%d)\n",
+                __func__, strerror(-r), -r);
         abort();
     }
 }
@@ -898,8 +900,8 @@ static void kvm_io_ioeventfd_add(MemoryListener *list=
ener,
                               data, true, int128_get64(section->size),
                               match_data);
     if (r < 0) {
-        fprintf(stderr, "%s: error adding ioeventfd: %s\n",
-                __func__, strerror(-r));
+        fprintf(stderr, "%s: error adding ioeventfd: %s (%d)\n",
+                __func__, strerror(-r), -r);
         abort();
     }
 }
@@ -917,6 +919,8 @@ static void kvm_io_ioeventfd_del(MemoryListener *list=
ener,
                               data, false, int128_get64(section->size),
                               match_data);
     if (r < 0) {
+        fprintf(stderr, "%s: error deleting ioeventfd: %s (%d)\n",
+                __func__, strerror(-r), -r);
         abort();
     }
 }
--=20
2.21.0


