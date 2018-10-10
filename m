Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAIIr-0004Oo-9Y
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 13:29:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54718)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1gAH4S-0004ug-FI
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 12:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@163.com>) id 1gAH4Q-0007ir-JS
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 12:10:48 -0400
Received: from m12-13.163.com ([220.181.12.13]:48039)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@163.com>)
	id 1gAH4H-0007Ui-8W; Wed, 10 Oct 2018 12:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id; bh=1bBZuWLts8nDxUkTFA
	7h7iaEg/W7z8F7HYmbbOjQW4A=; b=PJG/l3+sjlshUybatQ8A8zzxVFTIlZyEKS
	oHMy/LqphM0p4adcUuXn8giViYc0urMTSW9NsC2sz1YHjV7dZZnLyQwfN94A60gK
	WEGvJJ63jUnjVqoeCHRUawzSu0VCdKAdfJcYxsxYbgTKn02p/fz2FLpaj52GSAAk
	2qEsCEIZk=
Received: from ubuntu.localdomain (unknown [183.159.200.5])
	by smtp9 (Coremail) with SMTP id DcCowABHP1tyJL5bmTH8MQ--.41238S2;
	Thu, 11 Oct 2018 00:10:28 +0800 (CST)
From: Li Qiang <liq3ea@163.com>
To: ehabkost@redhat.com,
	marcel.apfelbaum@gmail.com
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, Li Qiang <liq3ea@163.com>
Date: Wed, 10 Oct 2018 09:10:25 -0700
Message-Id: <20181010161025.34796-1-liq3ea@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: DcCowABHP1tyJL5bmTH8MQ--.41238S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFW3try5ZFy5XrW3Zr4xZwb_yoW3Gwb_Za
	1UAa1rWrW5GayrKw42yw4rAry8Jwn5AF1rAFWxKw4fu3W8Gw1vqFZ7KwnxXr17WrsrGry3
	Aa1xZF1YyFW7KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRifOz3UUUUU==
X-Originating-IP: [183.159.200.5]
X-CM-SenderInfo: 5oltjvrd6rljoofrz/xtbBZhTbbVaDyfXlSgAAsC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 220.181.12.13
X-Mailman-Approved-At: Wed, 10 Oct 2018 13:29:44 -0400
Subject: [Qemu-trivial] [PATCH] machine: fix a typo
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
X-List-Received-Date: Wed, 10 Oct 2018 16:10:49 -0000

Cc: qemu-trivial@nongnu.org
Signed-off-by: Li Qiang <liq3ea@163.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1987557833..da50ad6de7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -636,7 +636,7 @@ static void machine_class_init(ObjectClass *oc, void *data)
         machine_get_memory_encryption, machine_set_memory_encryption,
         &error_abort);
     object_class_property_set_description(oc, "memory-encryption",
-        "Set memory encyption object to use", &error_abort);
+        "Set memory encryption object to use", &error_abort);
 }
 
 static void machine_class_base_init(ObjectClass *oc, void *data)
-- 
2.17.1



