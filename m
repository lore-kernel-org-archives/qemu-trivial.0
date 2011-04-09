Received: from mailman by lists.gnu.org with archive (Exim 4.43)
	id 1Q8uEn-0000og-Ma
	for mharc-qemu-trivial@gnu.org; Sun, 10 Apr 2011 08:59:33 -0400
Received: from [140.186.70.92] (port=37439 helo=eggs.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.43) id 1Q8NI8-0005Db-VK
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2011 21:48:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jljusten@gmail.com>) id 1Q8NI7-0007ff-E4
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2011 21:48:48 -0400
Received: from mail-pv0-f173.google.com ([74.125.83.173]:62213)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jljusten@gmail.com>) id 1Q8NI7-0007fb-2L
	for qemu-trivial@nongnu.org; Fri, 08 Apr 2011 21:48:47 -0400
Received: by pvg3 with SMTP id 3so1769539pvg.4
	for <qemu-trivial@nongnu.org>; Fri, 08 Apr 2011 18:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:x-google-sender-delegation
	:in-reply-to:references:date:x-google-sender-auth:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=/fPaIKiGzg7fmh+a9h6ojzhvu1YWeGZZuqfz1VRXnZI=;
	b=ghOtXjw0kCmrC1idkz3HE+3FsTMaNcLxspc/t/1FCkQKBGoR3gsckEveTupkmb3Evo
	X5e+Cv2OEKf8NXae95/6Yvb+1LuLVnuhTccoZISqqfCS/KK+NcBJLZTfjtBJkCLw16HA
	0FxE4ERqZqc0ENTr1nhcZhebGzzNCmJhYNFtU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:x-google-sender-delegation:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iqHmCC+wKevxfiqlxeDMrpjfzBRfPERA6/xiRaDJj5r/5NmtK5rEPvsB5+BNoDJLj1
	jU9ziNMBSAUCT6nz3deyzso+gXc7FrWljenVP2qfpTO3AeCmA/CY8wcNVkXxyHW92oti
	/KmuHFcHCp+TQMR/5dlVUaLH6nkjrdgS8aAGQ=
MIME-Version: 1.0
Received: by 10.142.202.18 with SMTP id z18mr2452686wff.438.1302313725952;
	Fri, 08 Apr 2011 18:48:45 -0700 (PDT)
Sender: aljusten@gmail.com
X-Google-Sender-Delegation: aljusten@gmail.com
Received: by 10.68.55.230 with HTTP; Fri, 8 Apr 2011 18:48:45 -0700 (PDT)
In-Reply-To: <BANLkTin1C=z=Y+fFMJvRgt5b4KzZ3vuY+g@mail.gmail.com>
References: <1301595926-29059-1-git-send-email-jordan.l.justen@intel.com>
	<BANLkTin1C=z=Y+fFMJvRgt5b4KzZ3vuY+g@mail.gmail.com>
Date: Fri, 8 Apr 2011 18:48:45 -0700
X-Google-Sender-Auth: qcThaskmggvd32TVKrEplpzuLG4
Message-ID: <BANLkTingKnR1nGTghJ-28bVE7V9Dd_-pdQ@mail.gmail.com>
From: Jordan Justen <jljusten@gmail.com>
To: qemu-trivial@nongnu.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.173
X-Mailman-Approved-At: Sun, 10 Apr 2011 08:59:32 -0400
Subject: [Qemu-trivial] Fwd: [Qemu-devel] [PATCH v3] hw/pc: Support system
 flash memory with -pflash parameter
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.5
Precedence: list
List-Id: qemu-trivial.nongnu.org
List-Unsubscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Apr 2011 01:48:50 -0000

Does this fall under the trivial patch category?

Thanks,

-Jordan

---------- Forwarded message ----------
From: Jordan Justen <jordan.l.justen@intel.com>
Date: Thu, Mar 31, 2011 at 11:25
Subject: [Qemu-devel] [PATCH v3] hw/pc: Support system flash memory
with -pflash parameter
To: qemu-devel@nongnu.org
Cc: Jordan Justen <jordan.l.justen@intel.com>


If -pflash is specified and -bios is specified then pflash will
be mapped just below the system rom using hw/pflash_cfi01.c.

If -pflash is specified on the command line, but -bios is
not specified, then 'bios.bin' will NOT be loaded, and
instead the -pflash flash image will be mapped just below
4GB in place of the normal rom image.

Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
---
=A0default-configs/i386-softmmu.mak =A0 | =A0 =A01 +
=A0default-configs/x86_64-softmmu.mak | =A0 =A01 +
=A0hw/pc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0161 =
+++++++++++++++++++++++++++---------
=A03 files changed, 125 insertions(+), 38 deletions(-)

diff --git a/default-configs/i386-softmmu.mak b/default-configs/i386-softmm=
u.mak
index 55589fa..8697cd4 100644
--- a/default-configs/i386-softmmu.mak
+++ b/default-configs/i386-softmmu.mak
@@ -21,3 +21,4 @@ CONFIG_PIIX_PCI=3Dy
=A0CONFIG_SOUND=3Dy
=A0CONFIG_HPET=3Dy
=A0CONFIG_APPLESMC=3Dy
+CONFIG_PFLASH_CFI01=3Dy
diff --git a/default-configs/x86_64-softmmu.mak
b/default-configs/x86_64-softmmu.mak
index 8895028..eca9284 100644
--- a/default-configs/x86_64-softmmu.mak
+++ b/default-configs/x86_64-softmmu.mak
@@ -21,3 +21,4 @@ CONFIG_PIIX_PCI=3Dy
=A0CONFIG_SOUND=3Dy
=A0CONFIG_HPET=3Dy
=A0CONFIG_APPLESMC=3Dy
+CONFIG_PFLASH_CFI01=3Dy
diff --git a/hw/pc.c b/hw/pc.c
index 6939c04..4812310 100644
--- a/hw/pc.c
+++ b/hw/pc.c
@@ -41,6 +41,7 @@
=A0#include "sysemu.h"
=A0#include "blockdev.h"
=A0#include "ui/qemu-spice.h"
+#include "flash.h"

=A0/* output Bochs bios info messages */
=A0//#define DEBUG_BIOS
@@ -957,6 +958,124 @@ void pc_cpus_init(const char *cpu_model)
=A0 =A0 }
=A0}

+static void pc_isa_bios_init(ram_addr_t ram_offset, int ram_size)
+{
+ =A0 =A0int isa_bios_size;
+
+ =A0 =A0/* map the last 128KB of the BIOS in ISA space */
+ =A0 =A0isa_bios_size =3D ram_size;
+ =A0 =A0if (isa_bios_size > (128 * 1024)) {
+ =A0 =A0 =A0 =A0isa_bios_size =3D 128 * 1024;
+ =A0 =A0}
+ =A0 =A0ram_offset =3D ram_offset + ram_size - isa_bios_size;
+ =A0 =A0cpu_register_physical_memory(0x100000 - isa_bios_size,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 isa_bios_=
size,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ram_offse=
t | IO_MEM_ROM);
+}
+
+static int pc_system_rom_init(void)
+{
+ =A0 =A0int ret;
+ =A0 =A0int bios_size;
+ =A0 =A0ram_addr_t bios_offset;
+ =A0 =A0char *filename;
+
+ =A0 =A0/* BIOS load */
+ =A0 =A0if (bios_name =3D=3D NULL) {
+ =A0 =A0 =A0 =A0bios_name =3D BIOS_FILENAME;
+ =A0 =A0}
+ =A0 =A0filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+ =A0 =A0if (filename) {
+ =A0 =A0 =A0 =A0bios_size =3D get_image_size(filename);
+ =A0 =A0} else {
+ =A0 =A0 =A0 =A0bios_size =3D -1;
+ =A0 =A0}
+
+ =A0 =A0if (bios_size <=3D 0 || (bios_size % 65536) !=3D 0) {
+ =A0 =A0 =A0 =A0ret =3D -1;
+ =A0 =A0} else {
+ =A0 =A0 =A0 =A0bios_offset =3D qemu_ram_alloc(NULL, "pc.bios", bios_size)=
;
+ =A0 =A0 =A0 =A0ret =3D rom_add_file_fixed(bios_name, (uint32_t)(-bios_siz=
e), -1);
+ =A0 =A0}
+
+ =A0 =A0if (ret !=3D 0) {
+ =A0 =A0 =A0 =A0fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bio=
s_name);
+ =A0 =A0 =A0 =A0exit(1);
+ =A0 =A0}
+
+ =A0 =A0if (filename) {
+ =A0 =A0 =A0 =A0qemu_free(filename);
+ =A0 =A0}
+
+ =A0 =A0pc_isa_bios_init(bios_offset, bios_size);
+
+ =A0 =A0/* map all the bios at the top of memory */
+ =A0 =A0cpu_register_physical_memory((uint32_t)(-bios_size),
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bios_size=
, bios_offset | IO_MEM_ROM);
+
+ =A0 =A0return bios_size;
+}
+
+static void pc_system_flash_init(DriveInfo *pflash_drv, int rom_size)
+{
+ =A0 =A0BlockDriverState *bdrv;
+ =A0 =A0int64_t size;
+ =A0 =A0target_phys_addr_t phys_addr;
+ =A0 =A0ram_addr_t addr;
+ =A0 =A0int sector_bits, sector_size;
+
+ =A0 =A0bdrv =3D NULL;
+
+ =A0 =A0bdrv =3D pflash_drv->bdrv;
+ =A0 =A0size =3D bdrv_getlength(pflash_drv->bdrv);
+ =A0 =A0sector_bits =3D 12;
+ =A0 =A0sector_size =3D 1 << sector_bits;
+
+ =A0 =A0if ((size % sector_size) !=3D 0) {
+ =A0 =A0 =A0 =A0fprintf(stderr,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"qemu: -pflash size must be a multiple of =
0x%x\n",
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sector_size);
+ =A0 =A0 =A0 =A0exit(1);
+ =A0 =A0}
+
+ =A0 =A0phys_addr =3D 0x100000000ULL - rom_size - size;
+ =A0 =A0addr =3D qemu_ram_alloc(NULL, "system.flash", size);
+ =A0 =A0DPRINTF("flash addr: 0x%lx\n", (int64_t)phys_addr);
+ =A0 =A0pflash_cfi01_register(phys_addr, addr, bdrv,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sector_size, size >> s=
ector_bits,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A04, 0x0000, 0x0000, 0x0=
000, 0x0000, 0);
+
+ =A0 =A0if (rom_size =3D=3D 0) {
+ =A0 =A0 =A0 =A0pc_isa_bios_init(addr, size);
+ =A0 =A0}
+}
+
+static void pc_system_firmware_init(void)
+{
+ =A0 =A0int flash_present, rom_present;
+ =A0 =A0int rom_size;
+ =A0 =A0DriveInfo *pflash_drv;
+
+ =A0 =A0pflash_drv =3D drive_get(IF_PFLASH, 0, 0);
+ =A0 =A0flash_present =3D (pflash_drv !=3D NULL);
+
+ =A0 =A0/* Load rom if -bios is used or if -pflash is not used */
+ =A0 =A0rom_present =3D ((bios_name !=3D NULL) || !flash_present);
+
+ =A0 =A0/* If rom is present, then it is mapped just below 4GB */
+ =A0 =A0if (rom_present) {
+ =A0 =A0 =A0 =A0rom_size =3D pc_system_rom_init();
+ =A0 =A0} else {
+ =A0 =A0 =A0 =A0rom_size =3D 0;
+ =A0 =A0}
+
+ =A0 =A0/* If flash is present, then it is mapped just below the rom, or
+ =A0 =A0 * just below 4GB when rom is not present. */
+ =A0 =A0if (flash_present) {
+ =A0 =A0 =A0 =A0pc_system_flash_init(pflash_drv, rom_size);
+ =A0 =A0}
+}
+
=A0void pc_memory_init(ram_addr_t ram_size,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *kernel_filename,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const char *kernel_cmdline,
@@ -964,11 +1083,9 @@ void pc_memory_init(ram_addr_t ram_size,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ram_addr_t *below_4g_mem_size_p,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ram_addr_t *above_4g_mem_size_p)
=A0{
- =A0 =A0char *filename;
- =A0 =A0int ret, linux_boot, i;
- =A0 =A0ram_addr_t ram_addr, bios_offset, option_rom_offset;
+ =A0 =A0int linux_boot, i;
+ =A0 =A0ram_addr_t ram_addr, option_rom_offset;
=A0 =A0 ram_addr_t below_4g_mem_size, above_4g_mem_size =3D 0;
- =A0 =A0int bios_size, isa_bios_size;
=A0 =A0 void *fw_cfg;

=A0 =A0 if (ram_size >=3D 0xe0000000 ) {
@@ -994,44 +1111,12 @@ void pc_memory_init(ram_addr_t ram_size,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
ram_addr + below_4g_mem_size);
=A0 =A0 }

- =A0 =A0/* BIOS load */
- =A0 =A0if (bios_name =3D=3D NULL)
- =A0 =A0 =A0 =A0bios_name =3D BIOS_FILENAME;
- =A0 =A0filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
- =A0 =A0if (filename) {
- =A0 =A0 =A0 =A0bios_size =3D get_image_size(filename);
- =A0 =A0} else {
- =A0 =A0 =A0 =A0bios_size =3D -1;
- =A0 =A0}
- =A0 =A0if (bios_size <=3D 0 ||
- =A0 =A0 =A0 =A0(bios_size % 65536) !=3D 0) {
- =A0 =A0 =A0 =A0goto bios_error;
- =A0 =A0}
- =A0 =A0bios_offset =3D qemu_ram_alloc(NULL, "pc.bios", bios_size);
- =A0 =A0ret =3D rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
- =A0 =A0if (ret !=3D 0) {
- =A0 =A0bios_error:
- =A0 =A0 =A0 =A0fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bio=
s_name);
- =A0 =A0 =A0 =A0exit(1);
- =A0 =A0}
- =A0 =A0if (filename) {
- =A0 =A0 =A0 =A0qemu_free(filename);
- =A0 =A0}
- =A0 =A0/* map the last 128KB of the BIOS in ISA space */
- =A0 =A0isa_bios_size =3D bios_size;
- =A0 =A0if (isa_bios_size > (128 * 1024))
- =A0 =A0 =A0 =A0isa_bios_size =3D 128 * 1024;
- =A0 =A0cpu_register_physical_memory(0x100000 - isa_bios_size,
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 isa_bios_=
size,
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (bios_off=
set + bios_size -
isa_bios_size) | IO_MEM_ROM);
+ =A0 =A0/* Initialize ROM or flash ranges for PC firmware */
+ =A0 =A0pc_system_firmware_init();

=A0 =A0 option_rom_offset =3D qemu_ram_alloc(NULL, "pc.rom", PC_ROM_SIZE);
=A0 =A0 cpu_register_physical_memory(PC_ROM_MIN_VGA, PC_ROM_SIZE,
option_rom_offset);

- =A0 =A0/* map all the bios at the top of memory */
- =A0 =A0cpu_register_physical_memory((uint32_t)(-bios_size),
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bios_size=
, bios_offset | IO_MEM_ROM);
-
=A0 =A0 fw_cfg =3D bochs_bios_init();
=A0 =A0 rom_set_fw(fw_cfg);

--
1.7.1

