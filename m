Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gReUB-00042t-8d
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 09:37:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1gReU9-00040R-3F
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 09:37:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1gReU7-000207-Bl
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 09:37:08 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:53908)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
	id 1gReTw-0001an-KC; Tue, 27 Nov 2018 09:36:56 -0500
Received: by mail-wm1-x32a.google.com with SMTP id y1so18762922wmi.3;
	Tue, 27 Nov 2018 06:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DU2jGJRSTJW7u+4M3qLdFBif5WGpl2dOy1NtYgCW/Yw=;
	b=WeUYCGgZJBWrRtOB5gTC0duFAXl+g/M4KhDmIQs//jzBX9m/UTOkhjkycfSe4gyuxc
	N5i8cX2QFEVwCusx95sxFvUD60uJwZjVJKWYjbUecf5C7wq1NEASVhgROjfn66GXI4+Q
	LSn5OlcW0g1F+oyT19cLEHWeGs0ZDfPMIq87PZZqf8vNwp8p+2gG0hcp9UPtZU601FA8
	l7ayHPMftlVsdcFFgeZolTKJJBfGgKFhQak1TJ00gaE05f3kP0jB43lgQsB6dPXdvJfo
	prlzoB6wJu6qNn8wJtIr+OUXh87aDjAqf7sGbNv4wduQZpe4Qnn4+QtTpLDK6iQig7se
	5G7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=DU2jGJRSTJW7u+4M3qLdFBif5WGpl2dOy1NtYgCW/Yw=;
	b=URihFbMtdE4Ldow/JD9s2Ze0aV8AcMi2iDy8A5DPyJJ1b5jk7UypySn3T+7tAiwjLo
	tFaptvG0oCRpqSGQgSGyh/XQuyZCI1SKiZyJrLLscuAOOh1XRCt+afSq9OIiQLs3PLhb
	F4nOAmVKjerxyQVLneu5P5OGnTGqfYDxfvtDqplFVJuBEvlovm+GAgimi1VTSWCyursq
	fMGC3ett5KN3S++RukJqhSUkgGckUzfW/LvZJHcdQcxUtqfgAJznyeQnJvG+wK3zeTAO
	VAtNrTKP0rYZdHfBCJZxTN2yiHNkMyAdHsgscwa3yOwfraerJHxSsj6r6cYhQmEdYHjP
	N3pQ==
X-Gm-Message-State: AGRZ1gL2TuQE5rpcEW36G/5t5DBa0IN1D6RobTXFvwvdHPIHz00mQFeq
	2TA1xRTQ0H9Jl4SwmRMUYoIaAZt0
X-Google-Smtp-Source: AJdET5d5CQrQx36nPdPdVGjLWD7Zfcpbutcv83PssoK/zWTEL2LEWRe6ObHPreGg+z2ZQIk2UQDdCw==
X-Received: by 2002:a1c:7911:: with SMTP id l17mr26196895wme.57.1543329415059; 
	Tue, 27 Nov 2018 06:36:55 -0800 (PST)
Received: from 640k.localdomain ([93.56.166.5])
	by smtp.gmail.com with ESMTPSA id
	n62sm2821869wmd.25.2018.11.27.06.36.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Nov 2018 06:36:53 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Li Qiang <liq3ea@gmail.com>,
	qemu-trivial@nongnu.org
Date: Tue, 27 Nov 2018 15:36:30 +0100
Message-Id: <1543329397-48407-9-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1543329397-48407-1-git-send-email-pbonzini@redhat.com>
References: <1543329397-48407-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::32a
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
X-List-Received-Date: Tue, 27 Nov 2018 14:37:10 -0000

From: Li Qiang <liq3ea@gmail.com>

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
Message-Id: <1542276385-7638-1-git-send-email-liq3ea@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 vl.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/vl.c b/vl.c
index 611d887..a5ae5f2 100644
--- a/vl.c
+++ b/vl.c
@@ -1523,9 +1523,6 @@ static int machine_help_func(QemuOpts *opts, MachineState *machine)
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



