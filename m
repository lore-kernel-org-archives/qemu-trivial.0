Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRSjp-0000V2-H6
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 17:50:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aRSjo-0000Te-32
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 17:50:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>) id 1aRSjk-0001UP-My
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 17:50:56 -0500
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:35160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.weiyang@gmail.com>)
	id 1aRSjk-0001UJ-FV; Thu, 04 Feb 2016 17:50:52 -0500
Received: by mail-pa0-x234.google.com with SMTP id ho8so22767087pac.2;
	Thu, 04 Feb 2016 14:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Rh8HrFcbCoLGRAZwdRs22RgvoLUN4xlaPKgked2+8qs=;
	b=o3roZYzhHVx91R3897v3zDBZV7ioiSSge7xeslN9rV+1HPlhqm5hmH3et/abmPtlKu
	hqpUebNpiSFouk7rVtmhp6bds6rB/1Rz3IUscbDE6JOBd7blSdaGhhXGS1JijMtvO7xR
	RlIN66VmTPLLbrw8bUjrFEDQyKKCFZtf58+a/yMqYkZJ+ThXBdeN40uR9dqUQXPhBBbu
	bJg14DnmPawfVKqbqwDpIvKcxu7OnI5O2KwIP17ComfbMK4xgVXK1fAGBk5zTNYXalh1
	ZcVBHE+OVt++KO7EDDNS5A79kOJAIKeuhbQ8mM0uoTz1Kj+UcatNHBnZflX7KIxfYBoM
	ZwyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Rh8HrFcbCoLGRAZwdRs22RgvoLUN4xlaPKgked2+8qs=;
	b=M9WqAi0BU23c4P722jgJ/mMBu2V9Nu6hsRA+wMtItF0nZ1jLnj30oQVUe6R1UC1x0P
	2apxzHHBjcuMYEyjDw+lR3ddv9uR/TXXu1WglB458XAuJudIDYmzkHnz2v7KosrHuJoe
	frLhyik3EkpQWBto9Io5gpNsgLxlkQ/okFuJvL4QNARKFNN6bHpKjZcGGbfvc4rg9h1H
	3UqUgBcwy9ioZPyBjIhu0QejWQZm3C44aCQxgGebERFnsCfp7Jah1e05E9mTEk497/g0
	N/+qFNkXn08LbAjKDM1AXrg64uib7ANqS0glLHs7LydSTYs7EGUMt5CGljyv8w9AWd/1
	jXyw==
X-Gm-Message-State: AG10YOTXEnyq3AjsFwC+21z+AIhvdMyh6NztGva7a0kLkAzZuRW17cWtkSUCIN/hKGV7KQ==
X-Received: by 10.67.14.168 with SMTP id fh8mr14979504pad.11.1454626251203;
	Thu, 04 Feb 2016 14:50:51 -0800 (PST)
Received: from localhost ([45.32.44.20]) by smtp.gmail.com with ESMTPSA id
	p9sm19550565pfa.11.2016.02.04.14.50.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Feb 2016 14:50:50 -0800 (PST)
From: Wei Yang <richard.weiyang@gmail.com>
To: quintela@redhat.com,
	amit.shah@redhat.com
Date: Thu,  4 Feb 2016 22:50:30 +0000
Message-Id: <1454626230-16334-1-git-send-email-richard.weiyang@gmail.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::234
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [Qemu-trivial] [PATCH] migration: reorder code to make it symmetric
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
X-List-Received-Date: Thu, 04 Feb 2016 22:50:56 -0000

In qemu_savevm_state_complete_precopy(), it iterates on each device to add
a json object and transfer related status to destination, while the order
of the last two steps could be refined.

Current order:

    json_start_object()
    	save_section_header()
    	vmstate_save()
    json_end_object()
    	save_section_footer()

After the change:

    json_start_object()
    	save_section_header()
    	vmstate_save()
    	save_section_footer()
    json_end_object()

This patch reorder the code to to make it symmetric. No functional change.

Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
---
 migration/savevm.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index b9caf59..42bfab4 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1088,12 +1088,11 @@ void qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only)
         json_prop_int(vmdesc, "instance_id", se->instance_id);
 
         save_section_header(f, se, QEMU_VM_SECTION_FULL);
-
         vmstate_save(f, se, vmdesc);
-
-        json_end_object(vmdesc);
         trace_savevm_section_end(se->idstr, se->section_id, 0);
         save_section_footer(f, se);
+
+        json_end_object(vmdesc);
     }
 
     if (!in_postcopy) {
-- 
1.7.9.5


