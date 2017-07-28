Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dau2m-0002ix-H3
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 21:26:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2i-0002gM-1o
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2h-0002D1-6D
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 21:26:16 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34752)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dau2d-0002AG-RJ; Thu, 27 Jul 2017 21:26:11 -0400
Received: by mail-qt0-x241.google.com with SMTP id i19so11485527qte.1;
	Thu, 27 Jul 2017 18:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=PtuE54iEPDNFkb/sdtRbH4BsXPhfhDJmmeGqGpUQAcU=;
	b=rgFA3tGd5k/kVheKPQ0jVCjW325f72rLfkWqYSN7/ZxOkcvr2aHzLlqx9GxDihS54A
	lHFEyh3Mnn3yr/YcRZiESSWnpIB5uIdOkz0Iz8gDjEGy35oVu84/vsO+bSj1jkkNwepk
	NyDB9IW1apiBo+bmrAqLyx3zR+Y3IU8TLhTCV87fwfOURzNSVGvC9qB/Sjj/MyuYnRPI
	2wc78b2sXVKlXSMJFcBvptRVq1pEgYbreWkGc5nIe1LSYGTrdnREpYieGpYz3xdfYLZg
	E/7i1/+exY1baT/L7RqSTxMyDRyHqTgStwHP4FffsUJj8lVITFTMwvanUq95gp3hDa5k
	EXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=PtuE54iEPDNFkb/sdtRbH4BsXPhfhDJmmeGqGpUQAcU=;
	b=NChHYTxTkyQDXosiy9UgJdNM44SNTeUMQCwQ7OahFCnIusRBgCl4zSlpM1wW0fYKDW
	lz/D9wyNWmzb1B2o1rxWlSrcT+7V7N/NTEJt0uRm7jHkyy7ooxdRLDrvLWdYrXU6XvAt
	7MtCSZSJV9Yk5E6lkwK+icF52Pybbz/x9MLMSfMMYWPFsGYQhhKw9G6son4GnPB+Io+Q
	2aHyVvwcd5TwRWKOozPQmRLc7Y0CfhyBO/R2OWO4MUXfYIaiWiaiLRnx6v+wa19vbpa5
	V9RJhBBlvGDshhw4FYbEIrQ7ao773WzcOIiuS60AFWvWfHJFvZ1VEIVU0jpi2M/IkeWx
	Rbvg==
X-Gm-Message-State: AIVw112Ljx0TBrxveDOq1CkEpfVrLKw6I5iH3kKhCO4WGjQXJQ3kQa75
	tXJsNZC70NLWRg==
X-Received: by 10.200.3.220 with SMTP id z28mr8772488qtg.35.1501205171450;
	Thu, 27 Jul 2017 18:26:11 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	o97sm15010202qte.56.2017.07.27.18.26.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 18:26:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 27 Jul 2017 22:25:41 -0300
Message-Id: <20170728012542.29975-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728012542.29975-1-f4bug@amsat.org>
References: <20170728012542.29975-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 7/8] docs: fix broken paths to
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
X-List-Received-Date: Fri, 28 Jul 2017 01:26:17 -0000

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


