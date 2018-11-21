Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPZyI-0002Sr-DO
	for mharc-qemu-trivial@gnu.org; Wed, 21 Nov 2018 16:23:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <r.bolshakov@yadro.com>) id 1gPZG1-00052o-Cd
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2018 15:37:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <r.bolshakov@yadro.com>) id 1gPZG0-0005iD-LK
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2018 15:37:57 -0500
Received: from mta-01.yadro.com ([89.207.88.251]:50458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <r.bolshakov@yadro.com>)
	id 1gPZFw-0005ZI-DJ; Wed, 21 Nov 2018 15:37:52 -0500
Received: from localhost (unknown [127.0.0.1])
	by mta-01.yadro.com (Postfix) with ESMTP id ECBB24193A;
	Wed, 21 Nov 2018 20:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
	content-type:content-type:content-transfer-encoding:mime-version
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received:received; s=mta-01; t=1542832669; x=
	1544647070; bh=E7MWH8ooWsNBSSeRmzfsC/zow1g3xRPO3PQcgPpL5Pw=; b=C
	iV2llXeV5Xtw2KGZAAnW5YN3f+eBOnN2aF57Qg7a3F/+ipxww0BJyWtmqvfE1/EW
	zuMKCgoZAvFkUVmg8hEPttMyNUxnEwp1tCVDXbrC9ZXb5h97akUAP4nxdget3nzV
	9uULUexMuXiPjm92vuaqOrP7vfIFKOR6saPClhz20Y=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
	by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpYdkL1GJcDc; Wed, 21 Nov 2018 23:37:49 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
	[172.17.10.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mta-01.yadro.com (Postfix) with ESMTPS id 0F90941860;
	Wed, 21 Nov 2018 23:37:49 +0300 (MSK)
Received: from localhost (172.17.1.58) by T-EXCH-02.corp.yadro.com
	(172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32;
	Wed, 21 Nov 2018 23:37:48 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
CC: Roman Bolshakov <r.bolshakov@yadro.com>, <qemu-trivial@nongnu.org>
Date: Wed, 21 Nov 2018 23:37:21 +0300
Message-ID: <20181121203720.75916-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.17.1.58]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
	T-EXCH-02.corp.yadro.com (172.17.10.102)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 89.207.88.251
X-Mailman-Approved-At: Wed, 21 Nov 2018 16:23:41 -0500
Subject: [Qemu-trivial] [PATCH] roms: seabios: Rename CROSS_COMPILE to
 CROSS_PREFIX
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
X-List-Received-Date: Wed, 21 Nov 2018 20:37:58 -0000

SeaBIOS introduced CROSS_PREFIX in 2013 but it's not set in roms
Makefile.

With the change it's possible to cross-compile SeaBIOS on macOS,
if acpica/iasl is installed:
  cd roms
  export PATH=3D/path/to/cross/x86_64-unknown-linux-gnu/bin:$PATH
  make bios system=3Dunknown-linux-gnu

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---
 roms/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/roms/Makefile b/roms/Makefile
index f4141e1d96..a6043eff37 100644
--- a/roms/Makefile
+++ b/roms/Makefile
@@ -83,12 +83,12 @@ build-seabios-config-%: config.%
 	cp $< seabios/builds/$*/.config
 	$(MAKE) -C seabios \
 		EXTRAVERSION=3D$(SEABIOS_EXTRAVERSION) \
-		CROSS_COMPILE=3D$(x86_64_cross_prefix) \
+		CROSS_PREFIX=3D$(x86_64_cross_prefix) \
 		KCONFIG_CONFIG=3D$(CURDIR)/seabios/builds/$*/.config \
 		OUT=3D$(CURDIR)/seabios/builds/$*/ oldnoconfig
 	$(MAKE) -C seabios \
 		EXTRAVERSION=3D$(SEABIOS_EXTRAVERSION) \
-		CROSS_COMPILE=3D$(x86_64_cross_prefix) \
+		CROSS_PREFIX=3D$(x86_64_cross_prefix) \
 		KCONFIG_CONFIG=3D$(CURDIR)/seabios/builds/$*/.config \
 		OUT=3D$(CURDIR)/seabios/builds/$*/ all
=20
--=20
2.19.1


