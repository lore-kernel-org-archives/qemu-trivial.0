Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbE1r-0005It-ME
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 18:46:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1o-0005G9-VW
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1o-0002RE-7J
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:41 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38889)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1h-0002MM-Sg; Fri, 28 Jul 2017 18:46:33 -0400
Received: by mail-qt0-x242.google.com with SMTP id p3so13992459qtg.5;
	Fri, 28 Jul 2017 15:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=F56OiZ17JV2m+7Be7t1sn8WERHyem0k++pPfTSAsGHU=;
	b=U/+68PNAt8CEQXb90i+eIGe9FrF/LQUpnoi3/sPWZk3NodF0gAWjeaPxTy8cwjIRql
	z4x6UACLqmzt+XOXDtNKQICgI908oOiPQS8ZP6HJy6tq2L77TQhj9u0W8pxKnNiOnoCa
	25vWaKjMFAFCjEMbzuEWHAzjgaa1689IxrChnm/KWKb7lmjMbeQWKRgSTgWaeAeMygnK
	NARsd0SlJ/Jeb4WG0Qp5wthGc86wxMTBS4uNrefTue+KOnrqrYpEZgbzU43GkJB7R6vn
	ziuVNY3xMmQEj8JwtGTThlksiL92m2XCJ55Pa53CkQuRCqSvTphZoG5bHdfvtG7u97Zl
	vz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=F56OiZ17JV2m+7Be7t1sn8WERHyem0k++pPfTSAsGHU=;
	b=NiUfYCpWub3i55ODzg9Wxo1eLItFHDH9l359ULF0COt6oTd+Jv2HzDEyeHY0kxBKrs
	xMXHGnwiPtFSeFZOubC1bGiv0ru7JjbeGuS0Zrc5qXajxUxc6/9RiVRg2uOcUBz0//Hm
	O7rTCsVV7vHJVqRUJNHJfSgNaUPa23vIVKIRGrlBsBqd2mQeb+FERx6gspvlzDnhWgsc
	b9BzUVue2l5jh+4oSuHi/aPoTYmDPG2nzT8+Kf93y3PlkB37+4X2afw9EpqHICSYtQGQ
	QxReQ4ISe3NUf2T1cbEHPBUd/JFpbPvU+va1S2yykrPL3X3hbTvzloygPxy4mVYk9ohF
	Liiw==
X-Gm-Message-State: AIVw111j/j1sAm6ixM+t63PRqM7WiUVFKlEDhYGTlV+ZLLFJsboM+zyq
	ggvGE7Binc813g==
X-Received: by 10.237.37.193 with SMTP id y1mr14104237qtc.181.1501281993410;
	Fri, 28 Jul 2017 15:46:33 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m129sm15831970qkc.2.2017.07.28.15.46.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 15:46:32 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 19:46:07 -0300
Message-Id: <20170728224608.3598-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728224608.3598-1-f4bug@amsat.org>
References: <20170728224608.3598-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v2 for 2.10 7/8] docs: fix broken paths to
 docs/specs/ivshmem-spec.txt
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
X-List-Received-Date: Fri, 28 Jul 2017 22:46:41 -0000

When this file was rewritten/renamed in fdee2025dd, a reference path was not
updated.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/specs/pci-ids.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/specs/pci-ids.txt b/docs/specs/pci-ids.txt
index 95adee07d6..bb99a0257e 100644
--- a/docs/specs/pci-ids.txt
+++ b/docs/specs/pci-ids.txt
@@ -40,7 +40,7 @@ maintained as part of the virtio specification.
 1af4:1100  Used as PCI Subsystem ID for existing hardware devices emulated
            by qemu.
 
-1af4:1110  ivshmem device (shared memory, docs/specs/ivshmem_device_spec.txt)
+1af4:1110  ivshmem device (shared memory, docs/specs/ivshmem-spec.txt)
 
 All other device IDs are reserved.
 
-- 
2.13.3


