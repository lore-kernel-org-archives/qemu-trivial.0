Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmhIA-0000oE-54
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 10:51:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50559)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gmgGy-0002NF-9O
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 09:46:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gmgGu-0004vO-HR
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 09:46:26 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35647)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gmgGq-0004ow-R7; Thu, 24 Jan 2019 09:46:22 -0500
Received: by mail-pf1-x444.google.com with SMTP id z9so3100897pfi.2;
	Thu, 24 Jan 2019 06:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KISbn7rbKb5H0+9dkmewOio+NsvUcosfIrDHKIZJRTk=;
	b=R/SuVCjBOigHHCTidpnr6k0Pu3zUbK3xfuVxYFMuE9mCIfer6gTjr4gYK62cfxOOJY
	0133YrOFSjMR6QuoQ2tdOq7POSqLlK+7sqODQAAfeLUb+emyUvNpdLyRmw9DgaEq3YvB
	oY95C6dRJ88VuXHvcsnXIJBFGBlS+CtoaworGmFn0fDlWOKxvwZM9pdLrw74kd3TNNW9
	98ULtxSEHopuxjxmLT3HLRWVoNzHpQtwLCctCUUax9W5x/kK7IbrvkQ+OB5pzFU5N1gs
	2M5Qx06G6jcHky2froQN6QByLxZpYN2/bOff4Lze0O1IwwHXKmI+Ydq9aTthKzfqjrnJ
	MCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KISbn7rbKb5H0+9dkmewOio+NsvUcosfIrDHKIZJRTk=;
	b=o0/itdVeRFygvrm/X+ghbz6rrp8SgBB5CXgljISZjwZx3Uc9+Xfocs2YSqiqXOLlF7
	WZNiRR3oNd3CcNi3Sd/rdKxUE/fIOims78unkvMWEbwG9/3kcMWUqQZEue3V1C3QFn5t
	5EiWABIG3EKARMPtMPs45gzTP9OIm47PLlGL7O6cgHfkWdHkobrkhatRxhcec7pfNPDI
	Xl//rLnCIcepUz0P7py/aSQwtueWiYSGYTj/mTPbMkjEeqJlqreXsQ6rMb4mQcykk5Gc
	voJgbkqz2kdHYJ29LTepCoqY88VrgCr+jfDYACTdOb4kABq7dnxYpv8UTj7xtXVcXefK
	imTQ==
X-Gm-Message-State: AJcUukeBzseHKLuh54pM/l3uZJFLvrlkfJUekNPIiXHQnJBechqZA6yU
	oBQh/BnmEui1hh8WPGspmtPM8Bk9Qaw=
X-Google-Smtp-Source: ALg8bN5fOrd+20nb8alVYClg2ElO0dn/iYVHh1vqVIra5LxfBAUR7OtqwPBMmaXZcx9pDhsIv5ZPfw==
X-Received: by 2002:a62:3603:: with SMTP id d3mr6989240pfa.146.1548341176519; 
	Thu, 24 Jan 2019 06:46:16 -0800 (PST)
Received: from localhost.localdomain ([27.7.213.28])
	by smtp.gmail.com with ESMTPSA id
	y29sm40972826pga.59.2019.01.24.06.46.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Jan 2019 06:46:15 -0800 (PST)
From: kumar sourav <sourav.jb1988@gmail.com>
To: qemu-trivial@nongnu.org
Cc: jslaby@suse.cz,
	qemu-devel@nongnu.org,
	thuth@redhat.com
Date: Thu, 24 Jan 2019 20:16:06 +0530
Message-Id: <20190124144606.4352-1-sourav.jb1988@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
X-Mailman-Approved-At: Thu, 24 Jan 2019 10:51:44 -0500
Subject: [Qemu-trivial] [PATCH] hw: edu: set category of the edu device
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
X-List-Received-Date: Thu, 24 Jan 2019 14:46:29 -0000

Sets the category of edu device as DEVICE_CATEGORY_MISC.
Devices should be assigned to one of DEVICE_CATEGORY_XXXX.

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
---
 hw/misc/edu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/edu.c b/hw/misc/edu.c
index ceaf688bfb..91af452c9e 100644
--- a/hw/misc/edu.c
+++ b/hw/misc/edu.c
@@ -399,6 +399,7 @@ static void edu_instance_init(Object *obj)
 
 static void edu_class_init(ObjectClass *class, void *data)
 {
+    DeviceClass *dc = DEVICE_CLASS(class);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(class);
 
     k->realize = pci_edu_realize;
@@ -407,6 +408,7 @@ static void edu_class_init(ObjectClass *class, void *data)
     k->device_id = 0x11e8;
     k->revision = 0x10;
     k->class_id = PCI_CLASS_OTHERS;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
 }
 
 static void pci_edu_register_types(void)
-- 
2.17.1


