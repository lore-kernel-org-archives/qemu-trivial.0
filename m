Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wsunw-0004df-Fp
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jun 2014 10:07:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Wsunm-0004Rh-Gn
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 10:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Wsunf-00005W-1z
	for qemu-trivial@nongnu.org; Fri, 06 Jun 2014 10:07:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1WsunM-0008UF-8P; Fri, 06 Jun 2014 10:07:00 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s56E6wHK004388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 6 Jun 2014 10:06:59 -0400
Received: from playground.com (ovpn-112-41.ams2.redhat.com [10.36.112.41])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s56E6u4f031924; Fri, 6 Jun 2014 10:06:56 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Jun 2014 16:06:52 +0200
Message-Id: <1402063613-12400-1-git-send-email-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] vdi: remove double conversion
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
X-List-Received-Date: Fri, 06 Jun 2014 14:07:34 -0000

This should be a problem when running on big-endian machines.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
	It's time to clean up old branch, and I found this nice little
	patch from May 2012.

 block/vdi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/block/vdi.c b/block/vdi.c
index 119d3c7..993430e 100644
--- a/block/vdi.c
+++ b/block/vdi.c
@@ -237,7 +237,6 @@ static void vdi_header_to_le(VdiHeader *header)
     cpu_to_le32s(&header->block_extra);
     cpu_to_le32s(&header->blocks_in_image);
     cpu_to_le32s(&header->blocks_allocated);
-    cpu_to_le32s(&header->blocks_allocated);
     uuid_convert(header->uuid_image);
     uuid_convert(header->uuid_last_snap);
     uuid_convert(header->uuid_link);
-- 
1.8.3.1


