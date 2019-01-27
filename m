Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gnhGw-0001fn-Tn
	for mharc-qemu-trivial@gnu.org; Sun, 27 Jan 2019 05:02:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33484)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gnhGu-0001f2-2h
	for qemu-trivial@nongnu.org; Sun, 27 Jan 2019 05:02:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sourav.jb1988@gmail.com>) id 1gnhGs-00066W-0W
	for qemu-trivial@nongnu.org; Sun, 27 Jan 2019 05:02:35 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41511)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sourav.jb1988@gmail.com>)
	id 1gnhGq-00063q-08; Sun, 27 Jan 2019 05:02:32 -0500
Received: by mail-pg1-x544.google.com with SMTP id m1so5976286pgq.8;
	Sun, 27 Jan 2019 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=3CEFLPSIPYWSg1u0OV1QBfqA6CNhrO/9xE3Ac6vHyNk=;
	b=E1J0YY7wsrSfrOnV4kBoUvui9s6qEHXTf0UPVSndPI5iKAFH8d/U3V5fW5p38LFG0g
	JTRBiv4O1HDTHEptdBnAlRxtdGcFe2GitLqP7E6ySiWHQQpQ/wTgHEa3u8rdmTVEZ2gc
	lOsJUptzMj7I5Ew+Jz2/Yvid1tERcV5o4EKIjaNBe6PUZ3c7K5rLxqNZGXS5NJO6tbsN
	3Ob8lYD3zMoeFuZphoZK9fpMpKaIDZsag8xnZj6TQPzFn6khG0b0VXepgVIfU5hOMBIm
	qceTU8aIqoiVcnYwc63EtIN7yzIsDqjfchUfGH+3Pq1yW/eWQ7Nr1/2lcjdLS1bsZaup
	JDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=3CEFLPSIPYWSg1u0OV1QBfqA6CNhrO/9xE3Ac6vHyNk=;
	b=qdrfriT8zUUj4kY8xfSD5vj0U0zRNOhN7M1czIE0XuPNoyreeTlX7kLpnERuCx4Znm
	bUEoIN6AroKfNur6EJmv6+/8GHFfIvSAfG+m2HC956OQeK3JKXVeoRLICFG79OWfMHGZ
	kZc5dGZR28Y0BzaaT4UxZsrFfgB0PhH5hwGljmlphdvdnBj0NfmN/eaysnFHM5MGDy4b
	zy7LMgEyh9X8zmH2TwN8aRZ2/5+rxzNVy1YdP+L/Y0X0mHEhV3jnu4Vh0L1GM7reC6pa
	NIZjAUGd3ZAFBfwjUe38yM6oDK8AsdLJCHj1UhazG/E6hDLlp/kKSL3XpIwsgZodOIEG
	haCQ==
X-Gm-Message-State: AJcUukfStpgiLS0MNLnUVezcD1/ro0/tjeARR9EnGvNaN9Kq+/o6OQ5K
	YLNnEeT4lBLPPDU41/nCqKz68IH7
X-Google-Smtp-Source: ALg8bN47G1buUJD5ltw2DsB+7gNfI+gjHG3vOw8JSDtLvT2ll6GBasQoSVgiYTsFmv2UM6is6onZWg==
X-Received: by 2002:a62:4e83:: with SMTP id
	c125mr17993400pfb.101.1548583346834; 
	Sun, 27 Jan 2019 02:02:26 -0800 (PST)
Received: from localhost.localdomain ([27.7.213.28])
	by smtp.gmail.com with ESMTPSA id
	f62sm50086255pgc.67.2019.01.27.02.02.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Jan 2019 02:02:26 -0800 (PST)
From: kumar sourav <sourav.jb1988@gmail.com>
To: qemu-trivial@nongnu.org
Cc: david@gibson.dropbear.id.au,
	qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 27 Jan 2019 15:32:15 +0530
Message-Id: <20190127100215.12584-1-sourav.jb1988@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: [Qemu-trivial] [PATCH] hw/input/adb.c: set device category of adb
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
X-List-Received-Date: Sun, 27 Jan 2019 10:02:36 -0000

Sets the category of adb as DEVICE_CATEGORY_INPUT
Devices should be assigned to one of DEVICE_CATEGORY_XXXX

Signed-off-by: kumar sourav <sourav.jb1988@gmail.com>
---
 hw/input/adb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index bbb40aeef1..6ca7c5641c 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -126,6 +126,7 @@ static void adb_device_class_init(ObjectClass *oc, void *data)
     dc->realize = adb_device_realizefn;
     dc->props = adb_device_properties;
     dc->bus_type = TYPE_ADB_BUS;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
 }
 
 static const TypeInfo adb_device_type_info = {
-- 
2.17.1


