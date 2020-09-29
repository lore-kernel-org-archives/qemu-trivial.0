Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNHkX-00019b-V0
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2020 11:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eafanasova@gmail.com>)
 id 1kNFve-0004Tb-SC; Tue, 29 Sep 2020 09:44:28 -0400
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143]:41742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eafanasova@gmail.com>)
 id 1kNFvd-00021p-6L; Tue, 29 Sep 2020 09:44:26 -0400
Received: by mail-lf1-x143.google.com with SMTP id y17so5559758lfa.8;
 Tue, 29 Sep 2020 06:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lw7q8JMfWE+xGRF9smlHcFZJ7vnKa3DVE40AlcveyFI=;
 b=K2oz8r07jEcqxoWWaqVC23k0qUlMysRIG+wlBHrvD2qL4H01Qj+ykPzTHOaBtHaXIu
 t8/U3N/OkHQd44tIzjvzKWDKqe+sJQYzew6cfQe4jdwKNIXHVtdVSHYOfQpxjq+m/o9w
 fiuwUbnMiQrNWSv1trm/P75FNWkBwlnqS2J8rPFUM+I6blYn8TeLz4b0vrd4A32k5hnk
 O0hmkAaEwbna0nNY5uG3dS3t7R0hnm2l8bTqCUGhOQBgQN08LuvxNynz8yP0REnh/zkA
 lVbexkQeoTeD16bxK22c+dlCVGk1ZDL08Vj9BZTBxwmeOcIGVlYxPSp/Mr4kHLVtW+w2
 zZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lw7q8JMfWE+xGRF9smlHcFZJ7vnKa3DVE40AlcveyFI=;
 b=bPdF+0FfvYOejUDdOaPaw8msRAWMhfX/3sML9c5BQGbedpYLIOhrkCjg0R41yb1ZxN
 sjTPqhX1RpH1FQxIbnicgfE/ELXMkUGgDwCZfQIzICvrda2F9+HQydFJV4NnjbgQ0p38
 MzP1f0w9l6vctkiiptvClrZlAVbCPp3XfbuQrg9ONw/0VZ50W1wsk+QkjHCZgvjWem//
 bkH6NHAWuvsCPmWyZN//Kh4rrptQSHMgP5BRPDc1v69RpXOpcuQGYukFA8HNlN0ANET9
 b+81yFCxSbSS5Nl2M2XnPcmUHciXabWJ43PVok5vW4GgUpIAXHfB6cLfsHIkmM1UBOFT
 mhyg==
X-Gm-Message-State: AOAM530c2zcQYe/r0/+vI9v7I2v3p39EbDrSRIFNcNCDMKIE0vP/znVF
 oQrHF0MNYzoO5lTUlG0Tyk8=
X-Google-Smtp-Source: ABdhPJw38pLLqWUOjQ/m/khKEQm2yNRLGw3Ijc813UDT3/YJNgmkqv4jZSjuDtF1+30A2HGPuzYR+g==
X-Received: by 2002:a19:6d5:: with SMTP id 204mr1336188lfg.109.1601387060653; 
 Tue, 29 Sep 2020 06:44:20 -0700 (PDT)
Received: from localhost.localdomain (37-145-186-126.broadband.corbina.ru.
 [37.145.186.126])
 by smtp.gmail.com with ESMTPSA id 144sm3226281lfj.35.2020.09.29.06.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 06:44:20 -0700 (PDT)
From: Elena Afanasova <eafanasova@gmail.com>
To: jsnow@redhat.com
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Elena Afanasova <eafanasova@gmail.com>
Subject: [PATCH] job: delete job_{lock,
 unlock} functions and replace them with lock guard
Date: Tue, 29 Sep 2020 06:42:14 -0700
Message-Id: <20200929134214.4103-1-eafanasova@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::143;
 envelope-from=eafanasova@gmail.com; helo=mail-lf1-x143.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Sep 2020 11:41:02 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Sep 2020 13:44:32 -0000

Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
---
 job.c | 46 +++++++++++++++++-----------------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/job.c b/job.c
index 8fecf38960..89ceb53434 100644
--- a/job.c
+++ b/job.c
@@ -79,16 +79,6 @@ struct JobTxn {
  * job_enter. */
 static QemuMutex job_mutex;
 
-static void job_lock(void)
-{
-    qemu_mutex_lock(&job_mutex);
-}
-
-static void job_unlock(void)
-{
-    qemu_mutex_unlock(&job_mutex);
-}
-
 static void __attribute__((__constructor__)) job_init(void)
 {
     qemu_mutex_init(&job_mutex);
@@ -437,21 +427,19 @@ void job_enter_cond(Job *job, bool(*fn)(Job *job))
         return;
     }
 
-    job_lock();
-    if (job->busy) {
-        job_unlock();
-        return;
-    }
+    WITH_QEMU_LOCK_GUARD(&job_mutex) {
+        if (job->busy) {
+            return;
+        }
 
-    if (fn && !fn(job)) {
-        job_unlock();
-        return;
-    }
+        if (fn && !fn(job)) {
+            return;
+        }
 
-    assert(!job->deferred_to_main_loop);
-    timer_del(&job->sleep_timer);
-    job->busy = true;
-    job_unlock();
+        assert(!job->deferred_to_main_loop);
+        timer_del(&job->sleep_timer);
+        job->busy = true;
+    }
     aio_co_enter(job->aio_context, job->co);
 }
 
@@ -468,13 +456,13 @@ void job_enter(Job *job)
  * called explicitly. */
 static void coroutine_fn job_do_yield(Job *job, uint64_t ns)
 {
-    job_lock();
-    if (ns != -1) {
-        timer_mod(&job->sleep_timer, ns);
+    WITH_QEMU_LOCK_GUARD(&job_mutex) {
+        if (ns != -1) {
+            timer_mod(&job->sleep_timer, ns);
+        }
+        job->busy = false;
+        job_event_idle(job);
     }
-    job->busy = false;
-    job_event_idle(job);
-    job_unlock();
     qemu_coroutine_yield();
 
     /* Set by job_enter_cond() before re-entering the coroutine.  */
-- 
2.25.1


