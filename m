Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mQs6M-0000n1-Id
	for mharc-qemu-trivial@gnu.org; Thu, 16 Sep 2021 10:10:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs6A-0000ap-Rg; Thu, 16 Sep 2021 10:10:47 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:57871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQs63-0005rK-5Y; Thu, 16 Sep 2021 10:10:46 -0400
Received: from quad ([82.142.27.6]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MMnru-1mAJ9J3WvE-00IjXR; Thu, 16
 Sep 2021 16:10:34 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 06/10] target/i386: spelling: occured=>occurred,
 mininum=>minimum
Date: Thu, 16 Sep 2021 16:10:22 +0200
Message-Id: <20210916141026.1174822-7-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210916141026.1174822-1-laurent@vivier.eu>
References: <20210916141026.1174822-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:q12Zwxsk4WKAO2JqcRHb4/GkOO6guq2y7RSOyzvkjkwwwEMYvcz
 Wjv28Y7OC8knmySCPX3xPARMU9yY5bKhEg9ToGuSmx5jXy8hAKo5UKLrtgXDOQbmQCWTvNQ
 9rbbGTKFI6rhLc1ocEtcQ3RJc5HyzRhsUR1I4SWymQlpQ6v23q/7fAjorC8QpTwQV39whPR
 wjYO8QUKRSEcjLAZigqJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8j424mu0bLI=:qxdyNdmkDKkdhQJqKHZKXG
 MZULPecokB3XT+nS4DpPTv5YBs71lN64uVNj78Evv71t9cU33AwOkwnxmgE7D6xnPF7AXVYss
 f9tNeFwPFq47Sr5czp55njyWLB4/ABw1VYn0GrZrSW1wBz6oaq81fc2TaGGhzSVBDSz0KCHHR
 R+pE8uQ0ir7kpGecWZ10G18zgLQgOWb8m03TUN7ZmMgAM+FlRcLcMUa++iQHlF6znhpKL2lAl
 /Ta21jM+EhCKem4kfmhPDnvXJbi9iZS742C61X2XCyqLkSompVB1puL9GbdlfLvTYONgfYj6d
 IYThtHBM3HZjLgPli53HZRJxZMOvT6RhXC7E6ojU20pAJNUbJtHHAnchK8TF+/uyzCtLYJjgp
 7zB66yG2Yje9+upZDAytqNpnZHaO+VFGZQoBMBqeatkAS22BkBC+4fCHJOsg8gxR/jkqsO545
 hZ2wBV7tK/nY5t6bcsUSBReWsxw4DdGAFfpQRpr02QTcWqRB5hAPoLQSmf9NxAjyn0497mwEb
 507mbWLEgHoH1Bpr2Sx7PPu8LeqHGcXElobIkcx3tjb6AXu+QB6V5F3PTEYUTl6+0SL4NMKOJ
 GWbInDOE+LHv9oNkkbJPD+NRw2qIPcwF+fyWwSPhJqwulXNOFsNqQEsePpbQLRssoXw7npMJO
 lLqG7QVDpnHe8JD0gGV9Y725qBCnp4mGvPK3YAGUdRQ/lgc39K1+10P0GAgdWdk2L3oZlNrjC
 KqKamiWdXYI8UwgT8EQ0+9ZjynpJTNHpiBdP0g==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 16 Sep 2021 14:10:49 -0000

From: Michael Tokarev <mjt@tls.msk.ru>

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Message-Id: <20210818141352.417716-1-mjt@msgid.tls.msk.ru>
[lv: add mininum=>minimum in subject]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 accel/kvm/kvm-all.c      | 2 +-
 target/i386/cpu-sysemu.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 0125c17edb8d..cace5ffe6442 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2469,7 +2469,7 @@ static int kvm_init(MachineState *ms)
             ret = kvm_vm_enable_cap(s, KVM_CAP_DIRTY_LOG_RING, 0, ring_bytes);
             if (ret) {
                 error_report("Enabling of KVM dirty ring failed: %s. "
-                             "Suggested mininum value is 1024.", strerror(-ret));
+                             "Suggested minimum value is 1024.", strerror(-ret));
                 goto err;
             }
 
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 1078e3d157f0..37b7c562f53c 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -335,7 +335,7 @@ void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
     GuestPanicInformation *panic_info;
 
     if (!cs->crash_occurred) {
-        error_setg(errp, "No crash occured");
+        error_setg(errp, "No crash occurred");
         return;
     }
 
-- 
2.31.1


