Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WhGd5-0000YN-1M
	for mharc-qemu-trivial@gnu.org; Mon, 05 May 2014 07:00:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhGcx-0000Jf-Hf
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:00:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1WhGcr-0008Q0-7T
	for qemu-trivial@nongnu.org; Mon, 05 May 2014 07:00:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:10117)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1WhGcd-0008KD-5f; Mon, 05 May 2014 06:59:47 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s45AxjC3004811
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 5 May 2014 06:59:45 -0400
Received: from T430.nay.redhat.com (dhcp-14-247.nay.redhat.com [10.66.14.247])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id s45AxcUV009117; Mon, 5 May 2014 06:59:43 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 May 2014 18:59:50 +0800
Message-Id: <1399287591-6525-2-git-send-email-famz@redhat.com>
In-Reply-To: <1399287591-6525-1-git-send-email-famz@redhat.com>
References: <1399287591-6525-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 1/2] docs/memory.txt: Put one whitespace
	between sentences
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
X-List-Received-Date: Mon, 05 May 2014 11:00:14 -0000

In other words, whitespace changes only.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 docs/memory.txt | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index d344879..d5abc92 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -2,7 +2,7 @@ The memory API
 ==============
 
 The memory API models the memory and I/O buses and controllers of a QEMU
-machine.  It attempts to allow modelling of:
+machine. It attempts to allow modelling of:
 
  - ordinary RAM
  - memory-mapped I/O (MMIO)
@@ -15,7 +15,7 @@ The memory model provides support for
  - setting up coalesced memory for kvm
  - setting up ioeventfd regions for kvm
 
-Memory is modelled as an acyclic graph of MemoryRegion objects.  Sinks
+Memory is modelled as an acyclic graph of MemoryRegion objects. Sinks
 (leaves) are RAM and MMIO regions, while other nodes represent
 buses, memory controllers, and memory regions that have been rerouted.
 
@@ -36,20 +36,20 @@ MemoryRegion):
   each read or write causes a callback to be called on the host.
 
 - container: a container simply includes other memory regions, each at
-  a different offset.  Containers are useful for grouping several regions
-  into one unit.  For example, a PCI BAR may be composed of a RAM region
+  a different offset. Containers are useful for grouping several regions
+  into one unit. For example, a PCI BAR may be composed of a RAM region
   and an MMIO region.
 
-  A container's subregions are usually non-overlapping.  In some cases it is
+  A container's subregions are usually non-overlapping. In some cases it is
   useful to have overlapping regions; for example a memory controller that
   can overlay a subregion of RAM with MMIO or ROM, or a PCI controller
   that does not prevent card from claiming overlapping BARs.
 
-- alias: a subsection of another region.  Aliases allow a region to be
-  split apart into discontiguous regions.  Examples of uses are memory banks
+- alias: a subsection of another region. Aliases allow a region to be
+  split apart into discontiguous regions. Examples of uses are memory banks
   used when the guest address space is smaller than the amount of RAM
   addressed, or a memory controller that splits main memory to expose a "PCI
-  hole".  Aliases may point to any type of region, including other aliases,
+  hole". Aliases may point to any type of region, including other aliases,
   but an alias may not point back to itself, directly or indirectly.
 
 It is valid to add subregions to a region which is not a pure container
@@ -65,27 +65,27 @@ Subregions cannot be added to an alias region.
 Region names
 ------------
 
-Regions are assigned names by the constructor.  For most regions these are
+Regions are assigned names by the constructor. For most regions these are
 only used for debugging purposes, but RAM regions also use the name to identify
-live migration sections.  This means that RAM region names need to have ABI
+live migration sections. This means that RAM region names need to have ABI
 stability.
 
 Region lifecycle
 ----------------
 
 A region is created by one of the constructor functions (memory_region_init*())
-and destroyed by the destructor (memory_region_destroy()).  In between,
+and destroyed by the destructor (memory_region_destroy()). In between,
 a region can be added to an address space by using memory_region_add_subregion()
-and removed using memory_region_del_subregion().  Region attributes may be
+and removed using memory_region_del_subregion(). Region attributes may be
 changed at any point; they take effect once the region becomes exposed to the
 guest.
 
 Overlapping regions and priority
 --------------------------------
 Usually, regions may not overlap each other; a memory address decodes into
-exactly one target.  In some cases it is useful to allow regions to overlap,
+exactly one target. In some cases it is useful to allow regions to overlap,
 and sometimes to control which of an overlapping regions is visible to the
-guest.  This is done with memory_region_add_subregion_overlap(), which
+guest. This is done with memory_region_add_subregion_overlap(), which
 allows the region to overlap any other region in the same container, and
 specifies a priority that allows the core to decide which of two regions at
 the same address are visible (highest wins).
@@ -190,13 +190,13 @@ ram: ram@0x00000000-0xffffffff
 
 This is a (simplified) PC memory map. The 4GB RAM block is mapped into the
 system address space via two aliases: "lomem" is a 1:1 mapping of the first
-3.5GB; "himem" maps the last 0.5GB at address 4GB.  This leaves 0.5GB for the
+3.5GB; "himem" maps the last 0.5GB at address 4GB. This leaves 0.5GB for the
 so-called PCI hole, that allows a 32-bit PCI bus to exist in a system with
 4GB of memory.
 
 The memory controller diverts addresses in the range 640K-768K to the PCI
-address space.  This is modelled using the "vga-window" alias, mapped at a
-higher priority so it obscures the RAM at the same addresses.  The vga window
+address space. This is modelled using the "vga-window" alias, mapped at a
+higher priority so it obscures the RAM at the same addresses. The vga window
 can be removed by programming the memory controller; this is modelled by
 removing the alias and exposing the RAM underneath.
 
@@ -214,7 +214,7 @@ Attributes
 ----------
 
 Various region attributes (read-only, dirty logging, coalesced mmio, ioeventfd)
-can be changed during the region lifecycle.  They take effect once the region
+can be changed during the region lifecycle. They take effect once the region
 is made visible (which can be immediately, later, or never).
 
 MMIO Operations
@@ -227,12 +227,12 @@ various constraints can be supplied to control how these callbacks are called:
    (in bytes) which the device accepts; accesses outside this range will
    have device and bus specific behaviour (ignored, or machine check)
  - .valid.aligned specifies that the device only accepts naturally aligned
-   accesses.  Unaligned accesses invoke device and bus specific behaviour.
+   accesses. Unaligned accesses invoke device and bus specific behaviour.
  - .impl.min_access_size, .impl.max_access_size define the access sizes
    (in bytes) supported by the *implementation*; other access sizes will be
-   emulated using the ones available.  For example a 4-byte write will be
+   emulated using the ones available. For example a 4-byte write will be
    emulated using four 1-byte writes, if .impl.max_access_size = 1.
  - .impl.valid specifies that the *implementation* only supports unaligned
    accesses; unaligned accesses will be emulated by two aligned accesses.
  - .old_mmio can be used to ease porting from code using
-   cpu_register_io_memory().  It should not be used in new code.
+   cpu_register_io_memory(). It should not be used in new code.
-- 
1.9.2


