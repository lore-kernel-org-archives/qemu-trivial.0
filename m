Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aWmpa-0000Hd-RU
	for mharc-qemu-trivial@gnu.org; Fri, 19 Feb 2016 10:18:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWmpX-0000CF-W5
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 10:18:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aWmpX-0004u0-6u
	for qemu-trivial@nongnu.org; Fri, 19 Feb 2016 10:18:51 -0500
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:33071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aWmpQ-0004qK-T7; Fri, 19 Feb 2016 10:18:45 -0500
Received: by mail-pf0-x241.google.com with SMTP id c10so3703602pfc.0;
	Fri, 19 Feb 2016 07:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=P4y4HZngNqKkXp4zL/hFYI5tApbLwjKObiDZvKNIdFw=;
	b=j3nY7mqtlknPoEtqTzOuNn5//a0J1PKsr6Juw5PGTn0j4gf5aaO3UcR6lO6RMh88jt
	nHzlSfj2qBbKvUMue5n9exKBinZrn4u1l3gw0o4w1IZXqLet94SWyKZl8ti/ito7FuoZ
	UHsLiCz42RYhY4xA+rj6HtNFNTkdWS++Fgg3bh5nIvsCn9UFeW0ChsYW/rZ67VPAMmz0
	bdtg2wTYKGfws8cEWDej28xJr5uX1n7gOpnBz6dFqbOYxV0n2IWqSZy7yUJKuCwgEUWX
	gz4zvrWx6sPhf8WR+aBjHUQwCLHtF7x2DqGCdfqxcwWQFYxKlQ5dK0QcLCT/jZpMyrwD
	hN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=P4y4HZngNqKkXp4zL/hFYI5tApbLwjKObiDZvKNIdFw=;
	b=kpXAkHQXAB4XnDAUFibxzScNhmND7CxpI6Gp4hq9tpRyu5XYqUAWPeEdKgA5wmOFPE
	FgBHdXfTLeish02J3tgJLEbCEiXJ6w+J7fyhXA8/i7sPnSqa7jogYbmvOmli6iX9gQ9i
	mCbIB+2jTLzQpIOvkxq76nma/DsBqqvW6PqqOTU7BNo/XV69S/KUxX2jkZD5qbo+yf4P
	tYmI4G3PAmgs/iOceJ76a8XQI79er/0BtQUQIlOUEtmJ41jLAuI/L24LjJ8yQ7g0EuIo
	stADmWhqwayX0TYXwAQaOG9Mvhf6gPHKageb9BysgnShXU5CYXXB/4fuD9UCohI/hCTL
	XoPg==
X-Gm-Message-State: AG10YOQYRqC+t2QvEjOoD69WL5KzBR34CGRmxtr7120RQlSFF4rOqyrS61UkBZavWOjBBw==
X-Received: by 10.98.72.24 with SMTP id v24mr18549341pfa.15.1455895123928;
	Fri, 19 Feb 2016 07:18:43 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	e20sm18609186pfd.4.2016.02.19.07.18.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Feb 2016 07:18:43 -0800 (PST)
From: Wei Yang <richard.weiyang@gmail.com>
To: 
Date: Fri, 19 Feb 2016 15:18:10 +0000
Message-Id: <1455895091-7589-2-git-send-email-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
References: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::241
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [Qemu-trivial] [PATCH 1/2] vfio/pci: use PCI_MSIX_FLAGS on
	retrieving the MSIX entries
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
X-List-Received-Date: Fri, 19 Feb 2016 15:18:53 -0000

Even PCI_CAP_FLAGS has the same value as PCI_MSIX_FLAGS, the later one is
the more proper on retrieving MSIX entries.

This patch uses PCI_MSIX_FLAGS to retrieve the MSIX entries.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
 hw/vfio/pci.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index e66c47f..321423b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -1210,7 +1210,7 @@ static int vfio_msix_early_setup(VFIOPCIDevice *vdev)
     }
 
     if (pread(fd, &ctrl, sizeof(ctrl),
-              vdev->config_offset + pos + PCI_CAP_FLAGS) != sizeof(ctrl)) {
+              vdev->config_offset + pos + PCI_MSIX_FLAGS) != sizeof(ctrl)) {
         return -errno;
     }
 
-- 
1.7.9.5


