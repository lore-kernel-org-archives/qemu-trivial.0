Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRMkb-0008C2-7C
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 14:40:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1gRMkZ-00089V-BR
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 14:40:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1gRMkY-0004o1-Hz
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 14:40:55 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34735)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1gRMkT-0004eb-6e; Mon, 26 Nov 2018 14:40:49 -0500
Received: by mail-wr1-x436.google.com with SMTP id j2so20256721wrw.1;
	Mon, 26 Nov 2018 11:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wdzcsvrGT6FmOg86kmYPFgaKb+SRUGdMflhKAb/tGeQ=;
	b=m1p8C750xax+UztEgrolBUxEDBl8cFOFam0a53og6+1hFgVaVre3MEErF34W7Zf9zc
	bK8ZUQNsvoPhwV0vYY/6IvzCwWcTAyJi/d3cWpUZ+nM5iKOmxkDK+GWN7OYpNDuHpiuv
	0Xox2WZ+JEk46EjvCPBovdzf4X1YvJpCWae0Q0Wgfv0saMXHNQFWDkkzkpimtuBPxtPg
	2RkozR7Ex4vQswElQ5nC74P7Y+tZlFC8KWCttUUgCVey11SfP7VcLg112zQgpkmVGlZ2
	BzHtX2lBxY1de3WcDQ0mSw2Uh7Cdlheit4faRKNzblMMIL34HI2jVt+Bx1eS551mE/1w
	l6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=wdzcsvrGT6FmOg86kmYPFgaKb+SRUGdMflhKAb/tGeQ=;
	b=RvNF/tQHMTSkld8hl4iM8Ix48LG2i8O9vXlLIZsw0cCXlMJrvHEzU6xIsJHzHG8YS0
	le37gQcJLTdBdCJetMAeTXQRS0aMPLnYXxOWf+aA6kYXE9zcu9d7LIbnBjQwBlS7/tAD
	VXRY+rb/9hFZrU5eBVg+XURG54E1oHVt9YsjrOwSABK+CwpWURLJF/8dUG1z+GfR6D/w
	W90/fnkewPNjXxHkPmUPSBu75tf77LaOXbQhvKFRR8YshFKhqImhWwpDR4SV2CnUh5+I
	pMBsVG4R72fYiSYdNQ/NAPmZ18/JzUK1XxlytscWGYqv2/95uFhLmu8AX3YnH8tD2vlc
	NtQw==
X-Gm-Message-State: AA+aEWbvCDJOu8hbjMGAn+cQEfLoc4ki5b+prFwx59jazOjhRc2qWF3w
	iT8O56bVfnY9n+DwT+gPVJDY0XQ6
X-Google-Smtp-Source: AFSGD/WYbfI+E37+VfC3TaozLyHkbPuzwryQKGI9GPwAZFoIgTJ2VmRw9zMxEJiwiuWChTYL+KL5xA==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr25543563wru.45.1543261247747; 
	Mon, 26 Nov 2018 11:40:47 -0800 (PST)
Received: from 640k.lan ([93.56.166.5]) by smtp.gmail.com with ESMTPSA id
	s139sm2412468wmd.3.2018.11.26.11.40.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 11:40:47 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Li Qiang <liq3ea@gmail.com>,
	qemu-trivial@nongnu.org
Date: Mon, 26 Nov 2018 20:40:28 +0100
Message-Id: <1543261235-2834-9-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543261235-2834-1-git-send-email-pbonzini@redhat.com>
References: <1543261235-2834-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::436
Subject: [Qemu-trivial] [PULL 08/15] vl.c: remove outdated comment
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
X-List-Received-Date: Mon, 26 Nov 2018 19:40:56 -0000

From: Li Qiang <liq3ea@gmail.com>

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <1542276385-7638-1-git-send-email-liq3ea@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/vl.c b/vl.c
index 32ab6e6..a4430ac 100644
--- a/vl.c
+++ b/vl.c
@@ -1522,9 +1522,6 @@ static int machine_help_func(QemuOpts *opts, MachineState *machine)
     return 1;
 }
 
-/***********************************************************/
-/* main execution loop */
-
 struct vm_change_state_entry {
     VMChangeStateHandler *cb;
     void *opaque;
-- 
1.8.3.1



