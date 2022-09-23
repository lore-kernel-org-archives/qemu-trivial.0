Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1obebx-0002Jg-4c
	for mharc-qemu-trivial@gnu.org; Fri, 23 Sep 2022 05:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obebs-0002CN-E0
 for qemu-trivial@nongnu.org; Fri, 23 Sep 2022 05:04:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1obebp-0004o9-N5
 for qemu-trivial@nongnu.org; Fri, 23 Sep 2022 05:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663923873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=1gpuiKCs1ELi0jnftapN38Fc+t+M2ss2J/W/XR1Ol3g=;
 b=FoYTCVm2WsBnifm/DWgYxR63b9t9kxlKucrUiLdX0D9HfXcLeJGNaFo7vsy7f6X+WdwRVz
 7Ou4qCiuW2gQfY/n/WkxfA4HdBLHo2nXYiUdlzAEQMfOlIo8Rl/nJjOkn8auehebVfvxWD
 Bdz00WkTXqRKTOPU5wEwLMirHhWlTyA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-ccbGTkkqPaiuPwm1g4kUlQ-1; Fri, 23 Sep 2022 05:04:31 -0400
X-MC-Unique: ccbGTkkqPaiuPwm1g4kUlQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A35A3C1023D;
 Fri, 23 Sep 2022 09:04:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C50349BB60;
 Fri, 23 Sep 2022 09:04:30 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id DDA1921E6900; Fri, 23 Sep 2022 11:04:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: pavel.dovgaluk@ispras.ru, pbonzini@redhat.com, mtosatti@redhat.com,
 sunilmut@microsoft.com, qemu-trivial@nongnu.org
Subject: [PATCH] Drop superfluous conditionals around g_free()
Date: Fri, 23 Sep 2022 11:04:28 +0200
Message-Id: <20220923090428.93529-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Sep 2022 09:04:37 -0000

There is no need to guard g_free(P) with if (P): g_free(NULL) is safe.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 replay/replay.c             |  6 ++----
 target/i386/kvm/kvm.c       | 12 ++++--------
 target/i386/whpx/whpx-all.c | 14 ++++++--------
 3 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/replay/replay.c b/replay/replay.c
index 4c396bb376..9a0dc1cf44 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -366,10 +366,8 @@ void replay_finish(void)
         fclose(replay_file);
         replay_file = NULL;
     }
-    if (replay_filename) {
-        g_free(replay_filename);
-        replay_filename = NULL;
-    }
+    g_free(replay_filename);
+    replay_filename = NULL;
 
     g_free(replay_snapshot);
     replay_snapshot = NULL;
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index a1fd1f5379..9603bf265a 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -2176,15 +2176,11 @@ int kvm_arch_destroy_vcpu(CPUState *cs)
 
     g_free(env->xsave_buf);
 
-    if (cpu->kvm_msr_buf) {
-        g_free(cpu->kvm_msr_buf);
-        cpu->kvm_msr_buf = NULL;
-    }
+    g_free(cpu->kvm_msr_buf);
+    cpu->kvm_msr_buf = NULL;
 
-    if (env->nested_state) {
-        g_free(env->nested_state);
-        env->nested_state = NULL;
-    }
+    g_free(env->nested_state);
+    env->nested_state = NULL;
 
     qemu_del_vm_change_state_handler(cpu->vmsentry);
 
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index b22a3314b4..8e4969edeb 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1225,14 +1225,12 @@ static void whpx_translate_cpu_breakpoints(
         }
     }
 
-    if (breakpoints->breakpoints) {
-        /*
-         * Free the previous breakpoint list. This can be optimized by keeping
-         * it as shadow buffer for the next computation instead of freeing
-         * it immediately.
-         */
-        g_free(breakpoints->breakpoints);
-    }
+    /*
+     * Free the previous breakpoint list. This can be optimized by keeping
+     * it as shadow buffer for the next computation instead of freeing
+     * it immediately.
+     */
+    g_free(breakpoints->breakpoints);
 
     breakpoints->breakpoints = new_breakpoints;
 }
-- 
2.37.2


