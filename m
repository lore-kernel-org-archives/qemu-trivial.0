Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aLV5c-0003ad-B5
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jan 2016 07:08:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aLV5X-0003Ts-BN
	for qemu-trivial@nongnu.org; Tue, 19 Jan 2016 07:08:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1aLV5S-00087v-Pa
	for qemu-trivial@nongnu.org; Tue, 19 Jan 2016 07:08:43 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:35837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1aLV5O-00086x-GH; Tue, 19 Jan 2016 07:08:34 -0500
Received: by mail-wm0-x22a.google.com with SMTP id r129so87361624wmr.0;
	Tue, 19 Jan 2016 04:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=x1rOyX03UmW/fn7rsDT5utUK7p5RSWpIraa9lc/AxyQ=;
	b=kzmpNL1e37BT3IvXCPVaD8LfYmOtQ5s0E72WnAnMbgzPLu5zcbmFbm4SPCwvgQPVYG
	dceUjZj3QETkjbrpkHGA5oTgEKyfY4VZPXuw2jpDEOdiVWE4yHJqLZrqSm1DTfhj33+F
	eOIpDmU0sXT7EHrefCxUBfY5OdlT9osHhfm/QnN/8A5NJNPpZ1GdiNipcBIdCUT1iYbn
	2zj5m58V2sKEu4JCJx/f621lQ0Jq1wcM1zMD3SA1LCx241HKkkPHJbfOP/aqdD1knHer
	zRQdvUGn6GY/afVVLKlNkB+4GNCVi/bp86yjG3PZUORgaOERNRJWqgxpC4Qc7VeyJSB5
	0JEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=x1rOyX03UmW/fn7rsDT5utUK7p5RSWpIraa9lc/AxyQ=;
	b=HyAF+Y7/S3SkQZb4TFg288yeEMs8l8k3/OiNoDVUi8BiFzG1j9eLETzoKcBOvYWVW1
	cA01MAE1v0tuNRPr8bQPqmeqGdL9s2HGrD4LKnaSrv3CXl/t/S2uvoRQ4VaFpH2V7CiA
	eqjvfITJb9zw0V4zimfGXxbOkdoGJ2f+UBQ4+wp5B3jxcu7PODAY0OMeP3o6Cp9mnOYF
	lhFi0eA1rPl8M0WydOhanLpkLIPKeMc+oOWSYHnVB/9hQBVD7FC+VlUwWict55D4DnT8
	wjbndIBOaQgH5k0yeRn9EBAunnIgldaqBUqdx8TJ1Qj5iRtz8IfVmNznhND+yOruWQKX
	uAuA==
X-Gm-Message-State: ALoCoQlaQTucFg4le05YR1egNJSJBs9FfwW/uypRyygZpP1IGs6ApNtbrBWqnFPCNeGoE/SPkxzz1OQeD2dtCkTdypb72k+/cA==
X-Received: by 10.194.110.106 with SMTP id hz10mr29717623wjb.135.1453205313818;
	Tue, 19 Jan 2016 04:08:33 -0800 (PST)
Received: from donizetti.lan (94-39-182-117.adsl-ull.clienti.tiscali.it.
	[94.39.182.117]) by smtp.gmail.com with ESMTPSA id
	d2sm28257282wjy.16.2016.01.19.04.08.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Jan 2016 04:08:33 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 19 Jan 2016 13:08:28 +0100
Message-Id: <1453205308-20476-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 2.5.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] cpu: cpu_save/cpu_load is no more
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
X-List-Received-Date: Tue, 19 Jan 2016 12:08:46 -0000

Everything has been converted to vmstate.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 exec.c                | 6 ------
 include/qemu-common.h | 6 ------
 2 files changed, 12 deletions(-)

diff --git a/exec.c b/exec.c
index 0d8ca3f..35705a1 100644
--- a/exec.c
+++ b/exec.c
@@ -628,12 +628,6 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu_index, &vmstate_cpu_common, cpu);
     }
-#if defined(CPU_SAVE_VERSION) && !defined(CONFIG_USER_ONLY)
-    register_savevm(NULL, "cpu", cpu_index, CPU_SAVE_VERSION,
-                    cpu_save, cpu_load, cpu->env_ptr);
-    assert(cc->vmsd == NULL);
-    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL);
-#endif
     if (cc->vmsd != NULL) {
         vmstate_register(NULL, cpu_index, cc->vmsd, cpu);
     }
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 22b010c..f557be7 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -330,12 +330,6 @@ bool tcg_enabled(void);
 
 void cpu_exec_init_all(void);
 
-/* CPU save/load.  */
-#ifdef CPU_SAVE_VERSION
-void cpu_save(QEMUFile *f, void *opaque);
-int cpu_load(QEMUFile *f, void *opaque, int version_id);
-#endif
-
 /* Unblock cpu */
 void qemu_cpu_kick_self(void);
 
-- 
2.5.0


