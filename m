Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1f8iDp-00068m-5X
	for mharc-qemu-trivial@gnu.org; Wed, 18 Apr 2018 04:13:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32898)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8iDm-00067u-BZ
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 04:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <olaf@aepfle.de>) id 1f8iDl-0005qV-AX
	for qemu-trivial@nongnu.org; Wed, 18 Apr 2018 04:13:42 -0400
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::5]:31097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <olaf@aepfle.de>)
	id 1f8iDk-0005p4-PR; Wed, 18 Apr 2018 04:13:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1524039218;
	s=strato-dkim-0002; d=aepfle.de;
	h=Content-Transfer-Encoding:Message-Id:Date:Subject:Cc:To:From:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=FUI3qzYc3aYlCcLQQ4pMmEicveIzMehhjdhF+85O+fg=;
	b=IXD/VmJjkLuRD+rqN7BJ2XdyQe84j0i87mbBUnI/tjjx9AJVR89a8YaF3iexzWwxn9
	3zhCQTye5doW7HWczI6XQ5WtXHX+iXVoXClcxe6IZDPMGhUy9b8eqP11BL2TCEEFKz9q
	hbfmsibGFrc8Try0NOWpT8yLGucnmOqrBz97Gaccg+N7rc3a2J5h5ssfZWPTmg6K2Hqq
	vlwAYC8CH47MCVxAoz9HERnmlgqrq0gAJI75hVOt0U9DdH5ldlSxUEha7HVZTUoL1Ib8
	kjLUfb6+y7NhVNiOPZkbwadtv25MuXArIyFrbm1w16eXQoZUxDve51NsAJK6gYJcajWT
	7ZRA==
X-RZG-AUTH: :P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAgc1+lb4Esstf6UEufFpy8L/NK2kKUAyDFSMDbcP
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 43.4 AUTH)
	with ESMTPSA id Q05f37u3I8DM4RC
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1
	with 521 ECDH bits, eq. 15360 bits RSA))
	(Client did not present a certificate);
	Wed, 18 Apr 2018 10:13:22 +0200 (CEST)
From: Olaf Hering <olaf@aepfle.de>
To: qemu-trivial@nongnu.org
Cc: Olaf Hering <olaf@aepfle.de>, BALATON Zoltan <balaton@eik.bme.hu>,
	David Gibson <david@gibson.dropbear.id.au>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Wed, 18 Apr 2018 10:13:10 +0200
Message-Id: <20180418081311.27803-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::5
Subject: [Qemu-trivial] [PATCH v1] roms/ipxe: use configured compiler for
 ipxe
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
X-List-Received-Date: Wed, 18 Apr 2018 08:13:44 -0000

configure allows to run a dedicated compiler binary, which is stored in
CC and HOST_CC variables, and overrides the default 'cc' command.

This command however is not used when building ipxe from source.
"make -C roms pxerom" invokes the buildsystem of ipxe.git, which has the
command "gcc" hardcoded. That binary may not be suitable to build ipxe.
Reuse the same compiler command that is used to build qemu by specifying
CC and HOST_CC as make commandline option to override the built-in
defaults of ipxe.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 roms/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/roms/Makefile b/roms/Makefile
index 02b69fbac8..982bf105a3 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -127,11 +127,13 @@ efi-rom-%: build-pxe-roms build-efi-roms
 
 build-pxe-roms:
 	$(MAKE) -C ipxe/src CONFIG=qemu \
+		CC=$(CC) HOST_CC=$(HOST_CC) \
 		CROSS_COMPILE=$(x86_64_cross_prefix) \
 		$(patsubst %,bin/%.rom,$(pxerom_targets))
 
 build-efi-roms: build-pxe-roms
 	$(MAKE) -C ipxe/src CONFIG=qemu \
+		CC=$(CC) HOST_CC=$(HOST_CC) \
 		CROSS_COMPILE=$(x86_64_cross_prefix) \
 		$(patsubst %,bin-i386-efi/%.efidrv,$(pxerom_targets)) \
 		$(patsubst %,bin-x86_64-efi/%.efidrv,$(pxerom_targets))

