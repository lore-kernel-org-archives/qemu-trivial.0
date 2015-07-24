Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZIhWB-0004XS-3o
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jul 2015 14:16:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ZIhW7-0004Pb-K2
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 14:16:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ZIhW6-0001ic-96
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 14:16:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1ZIhW0-0001fG-W4; Fri, 24 Jul 2015 14:16:13 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id C6A0737C82B;
	Fri, 24 Jul 2015 18:16:11 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com ([10.10.116.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6OIG8dg020543; Fri, 24 Jul 2015 14:16:09 -0400
From: Laszlo Ersek <lersek@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 Jul 2015 20:15:59 +0200
Message-Id: <1437761762-19798-1-git-send-email-lersek@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Andreas Faerber <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH for-2.4-rc3 0/3] a tiny bit late SMM fixups
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
X-List-Received-Date: Fri, 24 Jul 2015 18:16:21 -0000

So, I just happened to resume my SMM-for-OVMF work today, with
v2.4.0-rc2-2-g12e21eb, and I suddenly realized that these patches never
made upstream. The first two are trivial and I kinda "insist" on them
:), the last one (from Paolo) doesn't seem that trivial (to me at
least), and I don't strictly need it for my work just yet. I'll let you
guys decide.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Andreas Faerber <afaerber@suse.de>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-trivial@nongnu.org

Thanks
Laszlo

Laszlo Ersek (2):
  hw/acpi/ich9: clear smi_en on reset
  hw/acpi/ich9: clean up stale comment about KVM not supporting SMM

Paolo Bonzini (1):
  target-i386: wake up processors that receive an SMI

 hw/acpi/ich9.c    | 4 ++--
 target-i386/cpu.c | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
1.8.3.1


