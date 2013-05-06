Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UZOCn-0003WQ-L0
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2013 12:24:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UZOCk-0003TJ-HX
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:23:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UZOCj-0005Xi-BZ
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:23:58 -0400
Received: from mail-gg0-x235.google.com ([2607:f8b0:4002:c02::235]:55702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UZOCg-0005Vn-R5; Mon, 06 May 2013 12:23:54 -0400
Received: by mail-gg0-f181.google.com with SMTP id q1so659355ggm.26
	for <multiple recipients>; Mon, 06 May 2013 09:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=I7hFcKQgxHwf1OEUzxwCNgqY3p8rz8XZX7j8FjanCcY=;
	b=rZxbirZ5HjGHqcKYkVs5QjoK+WHrZs8IPm4b/6MHIhNwE37cq/9792lqIrYANh8J44
	nFmHcBZauK7XWI2QrJiAqm/SdpQEPBJ1ms6fFexBXxPdVPVQeyiw+/pj0rFzXuIQwrim
	FdGVrmSQT0Yyuz/DEJ5nu7ZsmqgkqyO5pOd3JpAMspCn/Fh4Q0g0T8ENDR2bJizc58Er
	gVlm/GuYQvr/EChi7mjWa0KAlmRqICno9/GCHsyRGx4mb4jD+vKYhdm2i1l2ozl144st
	T/zG4JjXlt9SFgmxDUcz/4E9PdsKZYPiEyjuO3GfoAoxoCa9QXORic7J2Yp+BrFDzb0O
	fcbw==
X-Received: by 10.236.139.75 with SMTP id b51mr18909612yhj.6.1367857434245;
	Mon, 06 May 2013 09:23:54 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-176-20.ip50.fastwebnet.it.
	[93.34.176.20]) by mx.google.com with ESMTPSA id
	v48sm48649859yhi.26.2013.05.06.09.23.51 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 06 May 2013 09:23:53 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  6 May 2013 18:23:38 +0200
Message-Id: <1367857418-14832-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4002:c02::235
Cc: qemu-trivial@nongnu.org, david@gibson.dropbear.id.au
Subject: [Qemu-trivial] [PATCH] docs: mention AddressSpaces in
	docs/memory.txt
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
X-List-Received-Date: Mon, 06 May 2013 16:24:00 -0000

Reported-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/memory.txt | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/docs/memory.txt b/docs/memory.txt
index 5bbee8e..feb9fe9 100644
--- a/docs/memory.txt
+++ b/docs/memory.txt
@@ -15,10 +15,13 @@ The memory model provides support for
  - setting up coalesced memory for kvm
  - setting up ioeventfd regions for kvm
 
-Memory is modelled as a tree (really acyclic graph) of MemoryRegion objects.
-The root of the tree is memory as seen from the CPU's viewpoint (the system
-bus).  Nodes in the tree represent other buses, memory controllers, and
-memory regions that have been rerouted.  Leaves are RAM and MMIO regions.
+Memory is modelled as an acyclic graph of MemoryRegion objects.  Sinks
+(leaves) are RAM and MMIO regions, while other nodes represent
+buses, memory controllers, and memory regions that have been rerouted.
+
+In addition to MemoryRegion objects, the memory API provides AddressSpace
+objects for every root and possibly for intermediate MemoryRegions too.
+These represent memory as seen from the CPU or a device's viewpoint.
 
 Types of regions
 ----------------
-- 
1.8.2


