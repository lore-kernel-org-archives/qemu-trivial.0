Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dORjJ-000845-SV
	for mharc-qemu-trivial@gnu.org; Fri, 23 Jun 2017 12:46:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORjH-00081s-WE
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:46:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORjH-0002V6-9z
	for qemu-trivial@nongnu.org; Fri, 23 Jun 2017 12:46:44 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:34663)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dORjC-0002TG-SI; Fri, 23 Jun 2017 12:46:38 -0400
Received: by mail-qt0-x242.google.com with SMTP id w6so5940564qtg.1;
	Fri, 23 Jun 2017 09:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=jAVRxV2g6Z+TdnzrBVyyvRfbsU44tbvLdl7adBc7pa0=;
	b=eiDjJtgrlomisLXRDHWgqLwy6AQRV/yzmiXIGpkrzqynHjfcIe8mBPxgDwLbTGCgZ/
	0F7C++x7/ChaxjdgKlWU5ONQD4JN6qhfElgMLlsstRWUta0Wb04tNf86p6yjt/sOSQuy
	orqi55beh1mnvRt5f5xBW9Zz2ijBCMBjejmA98bqUc6sehKSt0W8qAWUsi0g3L5TXgJi
	eKi9YHDuH2XCb/VCD/4SU1H/2z71vJpdK3yndoycq5McqzDOEmagvVbk7EtTRKpXbkh+
	n5YdzaiHr2Nr+t4JIHAg8gHten5uvrKFF6rARfYDpbMAYPoImWDO6NQBFyMKqqngh+kt
	jnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=jAVRxV2g6Z+TdnzrBVyyvRfbsU44tbvLdl7adBc7pa0=;
	b=ivwC0to7j7B6+99dyKjPyVRHz2fYjoFP/8CPRIq4e0ZKTThJTxL4IYmG02pz/PHesV
	06ORIRjjXewbLUaGcFU+ea6DjxeFtFAwznyf4UcNNtBiX29SokyMWNTAz7UP39re25it
	cD5lGJ2a0We+WDWeEb4qmff0ZdTmjDVCrlX/jyKcptOQYwN6uiI00P6IJ2pqD+jpggh1
	OVUCcew2s1MdMrmkSVNsGiiD+k+L/if1hbQDgjviVlTMaSIR5TwMMDbLcW14SIaJtn3P
	jgi77M0VztFzD8YA4WDw/ef3hOs7agZrbDyovBD3bzgSn4WUcRCIn2Jxy9fdzFM6Prrw
	yIoA==
X-Gm-Message-State: AKS2vOyfCvlsJqsQhvC2lBj4nObOfE+3au4Ad2K4c63gxcUZVeuZY3HM
	Jn15G3HEHTflO6j+woIYeA==
X-Received: by 10.237.60.218 with SMTP id e26mr11591418qtf.106.1498236398140; 
	Fri, 23 Jun 2017 09:46:38 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id x7sm3690803qkx.45.2017.06.23.09.46.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Jun 2017 09:46:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri, 23 Jun 2017 13:45:56 -0300
Message-Id: <20170623164557.11636-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <20170623164557.11636-1-f4bug@amsat.org>
References: <20170623164557.11636-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 2/3] hw/core: fix missing return value in
 load_image_targphys_as()
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
X-List-Received-Date: Fri, 23 Jun 2017 16:46:44 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/loader.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 094f24627f..e137e772ae 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -150,7 +150,9 @@ int load_image_targphys_as(const char *filename,
         return -1;
     }
     if (size > 0) {
-        rom_add_file_fixed_as(filename, addr, -1, as);
+        if (rom_add_file_fixed_as(filename, addr, -1, as) < 0) {
+            return -1;
+        }
     }
     return size;
 }
-- 
2.13.1


