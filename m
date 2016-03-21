Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ai4SS-00017d-TB
	for mharc-qemu-trivial@gnu.org; Mon, 21 Mar 2016 14:21:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41950)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ai4SQ-00013p-B1
	for qemu-trivial@nongnu.org; Mon, 21 Mar 2016 14:21:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ai4SL-0007oW-KL
	for qemu-trivial@nongnu.org; Mon, 21 Mar 2016 14:21:38 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:38553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1ai4SL-0007oQ-AM
	for qemu-trivial@nongnu.org; Mon, 21 Mar 2016 14:21:33 -0400
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 2290117F57D; Mon, 21 Mar 2016 19:21:28 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon, 21 Mar 2016 19:21:26 +0100
Message-Id: <1458584486-21405-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.221.198.45
Cc: Janosch Frank <frankja@linux.vnet.ibm.com>, Fam Zheng <famz@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] Fix typo in variable name (found and fixed
	by codespell)
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
X-List-Received-Date: Mon, 21 Mar 2016 18:21:39 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/dump-guest-memory.py | 64 ++++++++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/scripts/dump-guest-memory.py b/scripts/dump-guest-memory.py
index c0a2e99..eb24f78 100644
--- a/scripts/dump-guest-memory.py
+++ b/scripts/dump-guest-memory.py
@@ -53,44 +53,44 @@ class ELF(object):
         self.notes = []
         self.segments = []
         self.notes_size = 0
-        self.endianess = None
+        self.endianness = None
         self.elfclass = ELFCLASS64
 
         if arch == 'aarch64-le':
-            self.endianess = ELFDATA2LSB
+            self.endianness = ELFDATA2LSB
             self.elfclass = ELFCLASS64
-            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
+            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
             self.ehdr.e_machine = EM_AARCH
 
         elif arch == 'aarch64-be':
-            self.endianess = ELFDATA2MSB
-            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
+            self.endianness = ELFDATA2MSB
+            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
             self.ehdr.e_machine = EM_AARCH
 
         elif arch == 'X86_64':
-            self.endianess = ELFDATA2LSB
-            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
+            self.endianness = ELFDATA2LSB
+            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
             self.ehdr.e_machine = EM_X86_64
 
         elif arch == '386':
-            self.endianess = ELFDATA2LSB
+            self.endianness = ELFDATA2LSB
             self.elfclass = ELFCLASS32
-            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
+            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
             self.ehdr.e_machine = EM_386
 
         elif arch == 's390':
-            self.endianess = ELFDATA2MSB
-            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
+            self.endianness = ELFDATA2MSB
+            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
             self.ehdr.e_machine = EM_S390
 
         elif arch == 'ppc64-le':
-            self.endianess = ELFDATA2LSB
-            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
+            self.endianness = ELFDATA2LSB
+            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
             self.ehdr.e_machine = EM_PPC64
 
         elif arch == 'ppc64-be':
-            self.endianess = ELFDATA2MSB
-            self.ehdr = get_arch_ehdr(self.endianess, self.elfclass)
+            self.endianness = ELFDATA2MSB
+            self.ehdr = get_arch_ehdr(self.endianness, self.elfclass)
             self.ehdr.e_machine = EM_PPC64
 
         else:
@@ -104,7 +104,7 @@ class ELF(object):
     def add_note(self, n_name, n_desc, n_type):
         """Adds a note to the ELF."""
 
-        note = get_arch_note(self.endianess, len(n_name), len(n_desc))
+        note = get_arch_note(self.endianness, len(n_name), len(n_desc))
         note.n_namesz = len(n_name) + 1
         note.n_descsz = len(n_desc)
         note.n_name = n_name.encode()
@@ -123,7 +123,7 @@ class ELF(object):
     def add_segment(self, p_type, p_paddr, p_size):
         """Adds a segment to the elf."""
 
-        phdr = get_arch_phdr(self.endianess, self.elfclass)
+        phdr = get_arch_phdr(self.endianness, self.elfclass)
         phdr.p_type = p_type
         phdr.p_paddr = p_paddr
         phdr.p_filesz = p_size
@@ -155,10 +155,10 @@ class ELF(object):
             elf_file.write(note)
 
 
-def get_arch_note(endianess, len_name, len_desc):
-    """Returns a Note class with the specified endianess."""
+def get_arch_note(endianness, len_name, len_desc):
+    """Returns a Note class with the specified endianness."""
 
-    if endianess == ELFDATA2LSB:
+    if endianness == ELFDATA2LSB:
         superclass = ctypes.LittleEndianStructure
     else:
         superclass = ctypes.BigEndianStructure
@@ -190,20 +190,20 @@ class Ident(ctypes.Structure):
                 ('ei_abiversion', ctypes.c_ubyte),
                 ('ei_pad', ctypes.c_ubyte * 7)]
 
-    def __init__(self, endianess, elfclass):
+    def __init__(self, endianness, elfclass):
         self.ei_mag0 = 0x7F
         self.ei_mag1 = ord('E')
         self.ei_mag2 = ord('L')
         self.ei_mag3 = ord('F')
         self.ei_class = elfclass
-        self.ei_data = endianess
+        self.ei_data = endianness
         self.ei_version = EV_CURRENT
 
 
-def get_arch_ehdr(endianess, elfclass):
-    """Returns a EHDR64 class with the specified endianess."""
+def get_arch_ehdr(endianness, elfclass):
+    """Returns a EHDR64 class with the specified endianness."""
 
-    if endianess == ELFDATA2LSB:
+    if endianness == ELFDATA2LSB:
         superclass = ctypes.LittleEndianStructure
     else:
         superclass = ctypes.BigEndianStructure
@@ -228,12 +228,12 @@ def get_arch_ehdr(endianess, elfclass):
 
         def __init__(self):
             super(superclass, self).__init__()
-            self.e_ident = Ident(endianess, elfclass)
+            self.e_ident = Ident(endianness, elfclass)
             self.e_type = ET_CORE
             self.e_version = EV_CURRENT
             self.e_ehsize = ctypes.sizeof(self)
             self.e_phoff = ctypes.sizeof(self)
-            self.e_phentsize = ctypes.sizeof(get_arch_phdr(endianess, elfclass))
+            self.e_phentsize = ctypes.sizeof(get_arch_phdr(endianness, elfclass))
             self.e_phnum = 0
 
 
@@ -257,12 +257,12 @@ def get_arch_ehdr(endianess, elfclass):
 
         def __init__(self):
             super(superclass, self).__init__()
-            self.e_ident = Ident(endianess, elfclass)
+            self.e_ident = Ident(endianness, elfclass)
             self.e_type = ET_CORE
             self.e_version = EV_CURRENT
             self.e_ehsize = ctypes.sizeof(self)
             self.e_phoff = ctypes.sizeof(self)
-            self.e_phentsize = ctypes.sizeof(get_arch_phdr(endianess, elfclass))
+            self.e_phentsize = ctypes.sizeof(get_arch_phdr(endianness, elfclass))
             self.e_phnum = 0
 
     # End get_arch_ehdr
@@ -272,10 +272,10 @@ def get_arch_ehdr(endianess, elfclass):
         return EHDR32()
 
 
-def get_arch_phdr(endianess, elfclass):
-    """Returns a 32 or 64 bit PHDR class with the specified endianess."""
+def get_arch_phdr(endianness, elfclass):
+    """Returns a 32 or 64 bit PHDR class with the specified endianness."""
 
-    if endianess == ELFDATA2LSB:
+    if endianness == ELFDATA2LSB:
         superclass = ctypes.LittleEndianStructure
     else:
         superclass = ctypes.BigEndianStructure
-- 
2.7.0


