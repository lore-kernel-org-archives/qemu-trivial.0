Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSh1l-0004nG-PV
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2020 09:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kSh1k-0004lL-J6
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 09:41:12 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:30009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kSh1i-0007IX-TX
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 09:41:12 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-266-_5R7XbkgMGCrytbn6CfN-A-1; Wed, 14 Oct 2020 09:40:59 -0400
X-MC-Unique: _5R7XbkgMGCrytbn6CfN-A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA6BC18C5203;
 Wed, 14 Oct 2020 13:40:58 +0000 (UTC)
Received: from bahia.lan (ovpn-112-78.ams2.redhat.com [10.36.112.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 172B810013C1;
 Wed, 14 Oct 2020 13:40:57 +0000 (UTC)
Subject: [PATCH] cpus: Drop declaration of cpu_remove()
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 14 Oct 2020 15:40:57 +0200
Message-ID: <160268285707.1107461.15035929822602623985.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 09:41:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 14 Oct 2020 13:41:12 -0000

cpu_remove() got superseded by cpu_remove_sync() in commit dbadee4ff4a0,
but its prototype wasn't removed. We could possibly keep the shorter
cpu_remove() naming but it seems better to highligth that this blocks
until the CPU thread is joined.

Fixes: dbadee4ff4a0 ("cpus: join thread when removing a vCPU")
Cc: pbonzini@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/core/cpu.h |    8 --------
 1 file changed, 8 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 4879f2502659..ace443e88297 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -924,14 +924,6 @@ void cpu_exit(CPUState *cpu);
 void cpu_resume(CPUState *cpu);
=20
 /**
- * cpu_remove:
- * @cpu: The CPU to remove.
- *
- * Requests the CPU to be removed.
- */
-void cpu_remove(CPUState *cpu);
-
- /**
  * cpu_remove_sync:
  * @cpu: The CPU to remove.
  *



