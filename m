Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgFxm-0007YF-1O
	for mharc-qemu-trivial@gnu.org; Wed, 05 Dec 2012 09:28:38 -0500
Received: from eggs.gnu.org ([208.118.235.92]:53360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TgFxb-00077D-Im
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 09:28:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1TgFxW-0003ie-Jm
	for qemu-trivial@nongnu.org; Wed, 05 Dec 2012 09:28:27 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1TgFxJ-0003gp-E3; Wed, 05 Dec 2012 09:28:09 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB5ES7fN008330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 5 Dec 2012 09:28:07 -0500
Received: from blackfin.pond.sub.org (ovpn-116-18.ams2.redhat.com
	[10.36.116.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qB5ES6Pk003366; Wed, 5 Dec 2012 09:28:06 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A8D52200A0; Wed,  5 Dec 2012 15:28:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1353694338-13162-1-git-send-email-armbru@redhat.com>
	<1353694338-13162-2-git-send-email-armbru@redhat.com>
	<20121203130553.GG6048@stefanha-thinkpad.redhat.com>
Date: Wed, 05 Dec 2012 15:28:05 +0100
In-Reply-To: <20121203130553.GG6048@stefanha-thinkpad.redhat.com> (Stefan
	Hajnoczi's message of "Mon, 3 Dec 2012 14:05:53 +0100")
Message-ID: <87a9tsh8ui.fsf_-_@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, jordan.l.justen@intel.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH v2 1/2] pc_sysfw: Check for qemu_find_file()
	failure
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
X-List-Received-Date: Wed, 05 Dec 2012 14:28:37 -0000

pc_fw_add_pflash_drv() ignores qemu_find_file() failure, and happily
creates a drive without a medium.

When pc_system_flash_init() asks for its size, bdrv_getlength() fails
with -ENOMEDIUM, which isn't checked either.  It fails relatively
cleanly only because -ENOMEDIUM isn't a multiple of 4096:

    $ qemu-system-x86_64 -S -vnc :0 -bios nonexistant
    qemu: PC system firmware (pflash) must be a multiple of 0x1000
    [Exit 1 ]

Fix by handling the qemu_find_file() failure.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
v2: Don't report errno, because that can produce misleading error
messages.  For instance, when "seabios/out/bios.bin" is unreadable, we
fall back to $data_dir/seabios/out/bios.bin, which doesn't exist, and
then report "seabios/out/bios.bin: No such file or directory".  No other
caller reports errno.

 hw/pc_sysfw.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/pc_sysfw.c b/hw/pc_sysfw.c
index 9d7c5f4..a161e7b 100644
--- a/hw/pc_sysfw.c
+++ b/hw/pc_sysfw.c
@@ -84,6 +84,10 @@ static void pc_fw_add_pflash_drv(void)
         bios_name = BIOS_FILENAME;
     }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (!filename) {
+        error_report("Can't open BIOS image %s", bios_name);
+        exit(1);
+    }
 
     opts = drive_add(IF_PFLASH, -1, filename, "readonly=on");
 
-- 
1.7.11.7


