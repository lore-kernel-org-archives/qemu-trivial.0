Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSQgc-0003I9-VE
	for mharc-qemu-trivial@gnu.org; Sun, 28 Oct 2012 07:05:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgW-000342-UF
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgV-0007yQ-NA
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:40 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:63527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TSQgS-0007pH-01; Sun, 28 Oct 2012 07:05:36 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2423304lbb.4
	for <multiple recipients>; Sun, 28 Oct 2012 04:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=81CStfk0nysbj9uEwz213T+DcMWWFlRHvBd7ytUJXko=;
	b=o3q4klMarKBOi8dsk+VaqyDVhC8YWL6nQw4MrMLYOAuJ6cj9NFYf+U/iw33PimMwnW
	GJeMnNNsMj+SHk48K5OnHqgxRfbJnTzV0DT06yM6oELJxqPfiGb4Cz4lwye3wxkiYMLA
	5P85JZEur9p9Rt3/0ePEh0+Oowo8eMXGEu1ieQFivjufOwLJ89Xd4cCTLlkK87y1p0D7
	yLO7WJ5Wkf0M9x8C/qwKoBvb3+raGypMTWlHPDOvnlZ8llSALuXDEULIgy4pqNflJgRj
	gghuWwy7cg+IKdbYhmOj5E4kKGpX3DdkzqjRsMTDLaHwKl0kYOpxdjvfJZsWBfKIPNwQ
	5Zog==
Received: by 10.112.46.7 with SMTP id r7mr10786458lbm.73.1351422335303;
	Sun, 28 Oct 2012 04:05:35 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id ft3sm2070067lbb.1.2012.10.28.04.05.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Oct 2012 04:05:34 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Oct 2012 11:04:49 +0000
Message-Id: <83c3d36b6b36a2d4c6f045c46023a091bc5156bf.1351422116.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com, qemu-ppc@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: [Qemu-trivial] [PATCH v2 4/6] ppc: add missing static
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
X-List-Received-Date: Sun, 28 Oct 2012 11:05:42 -0000

Add missing 'static' qualifiers.

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 hw/adb.c         |    8 ++++----
 hw/adb.h         |    4 ----
 hw/nvram.h       |   10 +---------
 hw/ppc.c         |   16 ++++++++--------
 target-ppc/cpu.h |    1 -
 5 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/hw/adb.c b/hw/adb.c
index aa15f55..3b547f0 100644
--- a/hw/adb.c
+++ b/hw/adb.c
@@ -108,10 +108,10 @@ int adb_poll(ADBBusState *s, uint8_t *obuf)
     return olen;
 }
 
-ADBDevice *adb_register_device(ADBBusState *s, int devaddr,
-                               ADBDeviceRequest *devreq,
-                               ADBDeviceReset *devreset,
-                               void *opaque)
+static ADBDevice *adb_register_device(ADBBusState *s, int devaddr,
+                                      ADBDeviceRequest *devreq,
+                                      ADBDeviceReset *devreset,
+                                      void *opaque)
 {
     ADBDevice *d;
     if (s->nb_devices >= MAX_ADB_DEVICES)
diff --git a/hw/adb.h b/hw/adb.h
index b2a591c..5b27da2 100644
--- a/hw/adb.h
+++ b/hw/adb.h
@@ -56,10 +56,6 @@ int adb_request(ADBBusState *s, uint8_t *buf_out,
                 const uint8_t *buf, int len);
 int adb_poll(ADBBusState *s, uint8_t *buf_out);
 
-ADBDevice *adb_register_device(ADBBusState *s, int devaddr,
-                               ADBDeviceRequest *devreq,
-                               ADBDeviceReset *devreset,
-                               void *opaque);
 void adb_kbd_init(ADBBusState *bus);
 void adb_mouse_init(ADBBusState *bus);
 
diff --git a/hw/nvram.h b/hw/nvram.h
index a4a1db4..72363ce 100644
--- a/hw/nvram.h
+++ b/hw/nvram.h
@@ -10,17 +10,9 @@ typedef struct nvram_t {
     nvram_write_t write_fn;
 } nvram_t;
 
-void NVRAM_set_byte (nvram_t *nvram, uint32_t addr, uint8_t value);
-uint8_t NVRAM_get_byte (nvram_t *nvram, uint32_t addr);
-void NVRAM_set_word (nvram_t *nvram, uint32_t addr, uint16_t value);
-uint16_t NVRAM_get_word (nvram_t *nvram, uint32_t addr);
-void NVRAM_set_lword (nvram_t *nvram, uint32_t addr, uint32_t value);
 uint32_t NVRAM_get_lword (nvram_t *nvram, uint32_t addr);
-void NVRAM_set_string (nvram_t *nvram, uint32_t addr,
-                       const char *str, uint32_t max);
 int NVRAM_get_string (nvram_t *nvram, uint8_t *dst, uint16_t addr, int max);
-void NVRAM_set_crc (nvram_t *nvram, uint32_t addr,
-                    uint32_t start, uint32_t count);
+
 int PPC_NVRAM_set_params (nvram_t *nvram, uint16_t NVRAM_size,
                           const char *arch,
                           uint32_t RAM_size, int boot_device,
diff --git a/hw/ppc.c b/hw/ppc.c
index 98546de..e4a0a3e 100644
--- a/hw/ppc.c
+++ b/hw/ppc.c
@@ -721,7 +721,7 @@ static void cpu_ppc_hdecr_cb (void *opaque)
     _cpu_ppc_store_hdecr(opaque, 0x00000000, 0xFFFFFFFF, 1);
 }
 
-void cpu_ppc_store_purr (CPUPPCState *env, uint64_t value)
+static void cpu_ppc_store_purr(CPUPPCState *env, uint64_t value)
 {
     ppc_tb_t *tb_env = env->tb_env;
 
@@ -1152,23 +1152,23 @@ static inline void nvram_write (nvram_t *nvram, uint32_t addr, uint32_t val)
     (*nvram->write_fn)(nvram->opaque, addr, val);
 }
 
-void NVRAM_set_byte (nvram_t *nvram, uint32_t addr, uint8_t value)
+static void NVRAM_set_byte(nvram_t *nvram, uint32_t addr, uint8_t value)
 {
     nvram_write(nvram, addr, value);
 }
 
-uint8_t NVRAM_get_byte (nvram_t *nvram, uint32_t addr)
+static uint8_t NVRAM_get_byte(nvram_t *nvram, uint32_t addr)
 {
     return nvram_read(nvram, addr);
 }
 
-void NVRAM_set_word (nvram_t *nvram, uint32_t addr, uint16_t value)
+static void NVRAM_set_word(nvram_t *nvram, uint32_t addr, uint16_t value)
 {
     nvram_write(nvram, addr, value >> 8);
     nvram_write(nvram, addr + 1, value & 0xFF);
 }
 
-uint16_t NVRAM_get_word (nvram_t *nvram, uint32_t addr)
+static uint16_t NVRAM_get_word(nvram_t *nvram, uint32_t addr)
 {
     uint16_t tmp;
 
@@ -1178,7 +1178,7 @@ uint16_t NVRAM_get_word (nvram_t *nvram, uint32_t addr)
     return tmp;
 }
 
-void NVRAM_set_lword (nvram_t *nvram, uint32_t addr, uint32_t value)
+static void NVRAM_set_lword(nvram_t *nvram, uint32_t addr, uint32_t value)
 {
     nvram_write(nvram, addr, value >> 24);
     nvram_write(nvram, addr + 1, (value >> 16) & 0xFF);
@@ -1198,8 +1198,8 @@ uint32_t NVRAM_get_lword (nvram_t *nvram, uint32_t addr)
     return tmp;
 }
 
-void NVRAM_set_string (nvram_t *nvram, uint32_t addr,
-                       const char *str, uint32_t max)
+static void NVRAM_set_string(nvram_t *nvram, uint32_t addr, const char *str,
+                             uint32_t max)
 {
     int i;
 
diff --git a/target-ppc/cpu.h b/target-ppc/cpu.h
index 3f114c9..b34a1ff 100644
--- a/target-ppc/cpu.h
+++ b/target-ppc/cpu.h
@@ -1178,7 +1178,6 @@ void cpu_ppc_store_decr (CPUPPCState *env, uint32_t value);
 uint32_t cpu_ppc_load_hdecr (CPUPPCState *env);
 void cpu_ppc_store_hdecr (CPUPPCState *env, uint32_t value);
 uint64_t cpu_ppc_load_purr (CPUPPCState *env);
-void cpu_ppc_store_purr (CPUPPCState *env, uint64_t value);
 uint32_t cpu_ppc601_load_rtcl (CPUPPCState *env);
 uint32_t cpu_ppc601_load_rtcu (CPUPPCState *env);
 #if !defined(CONFIG_USER_ONLY)
-- 
1.7.2.5


