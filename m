Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezNkY-0004PL-H0
	for mharc-qemu-trivial@gnu.org; Fri, 23 Mar 2018 10:32:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNkT-0004Ku-A2
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 10:32:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNkS-0003Kh-9A
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 10:32:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58270 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezNk1-00039z-Gx; Fri, 23 Mar 2018 10:32:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF4008151D49;
	Fri, 23 Mar 2018 14:32:24 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34F0F2023233;
	Fri, 23 Mar 2018 14:32:18 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Alberto Garcia <berto@igalia.com>, qemu-ppc@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 23 Mar 2018 15:31:59 +0100
Message-Id: <20180323143202.28879-3-lvivier@redhat.com>
In-Reply-To: <20180323143202.28879-1-lvivier@redhat.com>
References: <20180323143202.28879-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 14:32:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 14:32:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH v2 2/5] error: Strip trailing '\n' from error
 string arguments (again again)
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
X-List-Received-Date: Fri, 23 Mar 2018 14:32:55 -0000

Re-run Coccinelle script scripts/coccinelle/err-bad-newline.cocci,
and found new error_report() occurences with '\n'.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 target/i386/hvf/hvf.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 15870a4f36..c36753954b 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -86,25 +86,25 @@ static void assert_hvf_ok(hv_return_t ret)
 
     switch (ret) {
     case HV_ERROR:
-        error_report("Error: HV_ERROR\n");
+        error_report("Error: HV_ERROR");
         break;
     case HV_BUSY:
-        error_report("Error: HV_BUSY\n");
+        error_report("Error: HV_BUSY");
         break;
     case HV_BAD_ARGUMENT:
-        error_report("Error: HV_BAD_ARGUMENT\n");
+        error_report("Error: HV_BAD_ARGUMENT");
         break;
     case HV_NO_RESOURCES:
-        error_report("Error: HV_NO_RESOURCES\n");
+        error_report("Error: HV_NO_RESOURCES");
         break;
     case HV_NO_DEVICE:
-        error_report("Error: HV_NO_DEVICE\n");
+        error_report("Error: HV_NO_DEVICE");
         break;
     case HV_UNSUPPORTED:
-        error_report("Error: HV_UNSUPPORTED\n");
+        error_report("Error: HV_UNSUPPORTED");
         break;
     default:
-        error_report("Unknown Error\n");
+        error_report("Unknown Error");
     }
 
     abort();
@@ -191,7 +191,7 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     if (mem) {
         mem->size = 0;
         if (do_hvf_set_memory(mem)) {
-            error_report("Failed to reset overlapping slot\n");
+            error_report("Failed to reset overlapping slot");
             abort();
         }
     }
@@ -211,7 +211,7 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     }
 
     if (x == hvf_state->num_slots) {
-        error_report("No free slots\n");
+        error_report("No free slots");
         abort();
     }
 
@@ -221,7 +221,7 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     mem->region = area;
 
     if (do_hvf_set_memory(mem)) {
-        error_report("Error registering new memory slot\n");
+        error_report("Error registering new memory slot");
         abort();
     }
 }
@@ -884,7 +884,7 @@ int hvf_vcpu_exec(CPUState *cpu)
                 break;
             }
             default:
-                error_report("Unrecognized CR %d\n", cr);
+                error_report("Unrecognized CR %d", cr);
                 abort();
             }
             RIP(env) += ins_len;
@@ -930,7 +930,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             env->error_code = 0;
             break;
         default:
-            error_report("%llx: unhandled exit %llx\n", rip, exit_reason);
+            error_report("%llx: unhandled exit %llx", rip, exit_reason);
         }
     } while (ret == 0);
 
-- 
2.14.3


