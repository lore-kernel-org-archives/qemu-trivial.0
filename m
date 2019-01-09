Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghDec-00036D-Q3
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 08:12:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDea-00032A-Df
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:12:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghDc1-0000Jy-U6
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 08:09:39 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:50849)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghDbp-00009U-MA; Wed, 09 Jan 2019 08:09:27 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MMY9X-1gxvVX3zIF-00JZPM; Wed, 09 Jan 2019 14:08:57 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Richard Henderson <rth@twiddle.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Anthony Green <green@moxielogic.com>, John Snow <jsnow@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Laszlo Ersek <lersek@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-ppc@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=83=C2=A9?= <philmd@redhat.com>,
	Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Date: Wed,  9 Jan 2019 14:08:39 +0100
Message-Id: <20190109130844.5172-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190109130844.5172-1-laurent@vivier.eu>
References: <20190109130844.5172-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:TlPVI3BIUb8Ige1p52gQshXzRcrKhFAqxm5g6Jzjpo1GaZKmzNT
	a+KXeVGl/LxIxk1AZytlrsy8+x2xGiXcaLxPKKoX+QDzIEjhcq8eW8eaMH1nA8+BhuHY2Zh
	eF1gSUvtF8IyNxXxlaHT4x4gMwR/98RgsNLHk8MQtl4V6a11BaT31hmnxcIq8Aqm3jTI1DO
	JMv7Wg/qRnzSYRm9Bq+nA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:X95vxnZKfO4=:37aqTx8m5ogS/dywdrwXQk
	Q+uF9Pxczi9dxtEzpvqaRaqTCFtlJNgMjMqv49N15bo4T3HibKZHZctW3meLVMyR9m9l6opnb
	/fPwnVs1cQOzXePtslsjvKJkX2QCr4wvzII+1UB0qtofeIMEwnX3Goa8/lNzHRQ2mKY6LmjOe
	0JMKh2nH4ZlHjgVVlEJT/B1lMGv2aST60GlKFqmXBMDp1qrr+JK1hEvqCnMw/CIvds2Fbw7Tg
	sYHt/ozSAIwOtsxkNsaXXlKmAmg1t4O740JSIWjthZ9Gt33o1NqjUN12dsRBVzkfdGunY++a5
	pfzFzu4T6T7JBuO9YmInBfH4hwq63aFhr1cOIjXs8MxcY4QprfWiRKG9xQw9CatM+imkQlxyz
	jaiCjzjc/O+b3FrNN16VceEh6Ohfvkoc6g37U+ZhseR5sao54qBHYsWxyLkwjfEzm5NAmTAoD
	vUZe+z/FB7dIo/qhsKvcNeUXtTLCf6F7rncb4rJeFTBKEpKPAM7e1abZj7bTGGHhjPngzNfXp
	RLW9bT8PboCxxaqQ1rHnH2ygAD7TElCCiTX4gOecHRiH+gpXvbPP6JXxfvSzKITbzYV+8cPvx
	MyV9YoolTmmLpQhCoBYDwBgnegSLcdl6AJEyq+ABgmvFkU6NJeyG+BQpZ3gXG13YXkIEkLc7f
	Owd2RVHnpF4JFjrpo/hEnwdiblKwO1PdKgs42aPjCiL0PiJhmnw8Y/7zNjv2RZV4Em4jbNKWZ
	J8ECdDHbF2Vflg/uTqCrEiT8J3vltrNXb+mEQhuG2OPrvbaF83ksvH/sHjU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: [Qemu-trivial] [PULL 1/6] typedefs: (Re-)sort entries alphabetically
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
X-List-Received-Date: Wed, 09 Jan 2019 13:12:17 -0000

From: Eric Blake <eblake@redhat.com>

Since the last time we sorted things (2988cbeaf), we've had a
few relapses that were inserted out of order.  Also, we had more
entries that were sorted case-insensitively than not, so let's
document that convention and stick to it.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20181115211752.1295571-2-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/qemu/typedefs.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index d59df20c4d..741935fe36 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -4,7 +4,7 @@
 /* A load of opaque types so that device init declarations don't have to
    pull in all the real definitions.  */
 
-/* Please keep this list in alphabetical order */
+/* Please keep this list in case-insensitive alphabetical order */
 typedef struct AdapterInfo AdapterInfo;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
@@ -40,6 +40,7 @@ typedef struct HCIInfo HCIInfo;
 typedef struct HVFX86EmulatorState HVFX86EmulatorState;
 typedef struct I2CBus I2CBus;
 typedef struct I2SCodec I2SCodec;
+typedef struct IOMMUMemoryRegion IOMMUMemoryRegion;
 typedef struct ISABus ISABus;
 typedef struct ISADevice ISADevice;
 typedef struct IsaDma IsaDma;
@@ -49,7 +50,6 @@ typedef struct MachineState MachineState;
 typedef struct MemoryListener MemoryListener;
 typedef struct MemoryMappingList MemoryMappingList;
 typedef struct MemoryRegion MemoryRegion;
-typedef struct IOMMUMemoryRegion IOMMUMemoryRegion;
 typedef struct MemoryRegionCache MemoryRegionCache;
 typedef struct MemoryRegionSection MemoryRegionSection;
 typedef struct MigrationIncomingState MigrationIncomingState;
@@ -84,6 +84,8 @@ typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
 typedef struct PropertyInfo PropertyInfo;
 typedef struct PS2State PS2State;
+typedef struct QBool QBool;
+typedef struct QDict QDict;
 typedef struct QEMUBH QEMUBH;
 typedef struct QemuConsole QemuConsole;
 typedef struct QemuDmaBuf QemuDmaBuf;
@@ -93,12 +95,10 @@ typedef struct QemuMutex QemuMutex;
 typedef struct QemuOpt QemuOpt;
 typedef struct QemuOpts QemuOpts;
 typedef struct QemuOptsList QemuOptsList;
-typedef struct QemuSpin QemuSpin;
 typedef struct QEMUSGList QEMUSGList;
+typedef struct QemuSpin QemuSpin;
 typedef struct QEMUTimer QEMUTimer;
 typedef struct QEMUTimerListGroup QEMUTimerListGroup;
-typedef struct QBool QBool;
-typedef struct QDict QDict;
 typedef struct QJSON QJSON;
 typedef struct QList QList;
 typedef struct QNull QNull;
-- 
2.20.1


