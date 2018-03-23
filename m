Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezNkn-0004aJ-Oe
	for mharc-qemu-trivial@gnu.org; Fri, 23 Mar 2018 10:33:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36614)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNki-0004Vp-OX
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 10:33:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNkc-0003Pt-RV
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 10:33:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50668 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezNkF-0003F4-5f; Fri, 23 Mar 2018 10:32:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AAF2EB70F;
	Fri, 23 Mar 2018 14:32:38 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A12012023233;
	Fri, 23 Mar 2018 14:32:32 +0000 (UTC)
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
Date: Fri, 23 Mar 2018 15:32:01 +0100
Message-Id: <20180323143202.28879-5-lvivier@redhat.com>
In-Reply-To: <20180323143202.28879-1-lvivier@redhat.com>
References: <20180323143202.28879-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:38 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH v2 4/5] qdict: remove useless cast
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
X-List-Received-Date: Fri, 23 Mar 2018 14:33:12 -0000

Re-run Coccinelle script scripts/coccinelle/qobject.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 block/nvme.c | 11 +++++------
 monitor.c    |  2 +-
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index 8bca57aae6..c4f3a7bc94 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -695,12 +695,11 @@ static void nvme_parse_filename(const char *filename, QDict *options,
         unsigned long ns;
         const char *slash = strchr(tmp, '/');
         if (!slash) {
-            qdict_put(options, NVME_BLOCK_OPT_DEVICE,
-                      qstring_from_str(tmp));
+            qdict_put_str(options, NVME_BLOCK_OPT_DEVICE, tmp);
             return;
         }
         device = g_strndup(tmp, slash - tmp);
-        qdict_put(options, NVME_BLOCK_OPT_DEVICE, qstring_from_str(device));
+        qdict_put_str(options, NVME_BLOCK_OPT_DEVICE, device);
         g_free(device);
         namespace = slash + 1;
         if (*namespace && qemu_strtoul(namespace, NULL, 10, &ns)) {
@@ -708,8 +707,8 @@ static void nvme_parse_filename(const char *filename, QDict *options,
                        namespace);
             return;
         }
-        qdict_put(options, NVME_BLOCK_OPT_NAMESPACE,
-                  qstring_from_str(*namespace ? namespace : "1"));
+        qdict_put_str(options, NVME_BLOCK_OPT_NAMESPACE,
+                      *namespace ? namespace : "1");
     }
 }
 
@@ -1082,7 +1081,7 @@ static void nvme_refresh_filename(BlockDriverState *bs, QDict *opts)
                  bs->drv->format_name);
     }
 
-    qdict_put(opts, "driver", qstring_from_str(bs->drv->format_name));
+    qdict_put_str(opts, "driver", bs->drv->format_name);
     bs->full_open_options = opts;
 }
 
diff --git a/monitor.c b/monitor.c
index 6ccd2fc089..6e7667d82f 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4316,7 +4316,7 @@ static QObject *get_qmp_greeting(Monitor *mon)
             /* Monitors that are not using IOThread won't support OOB */
             continue;
         }
-        qlist_append(cap_list, qstring_from_str(QMPCapability_str(cap)));
+        qlist_append_str(cap_list, QMPCapability_str(cap));
     }
 
     return qobject_from_jsonf("{'QMP': {'version': %p, 'capabilities': %p}}",
-- 
2.14.3


