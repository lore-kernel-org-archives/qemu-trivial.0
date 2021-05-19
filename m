Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ljKXR-0000bp-9d
	for mharc-qemu-trivial@gnu.org; Wed, 19 May 2021 07:38:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljKXM-0000WZ-DX
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 07:38:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ljKXJ-0007KA-AW
 for qemu-trivial@nongnu.org; Wed, 19 May 2021 07:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621424328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4tHC9cW4sOIgmwu3FfEV145O9OPG3CwI6wjHrKIzqtw=;
 b=Ddw9tr+WAoD7f6jbYuoXp36bxi85SDvthAHntai9Z8ir9vWn7R9RrVDpQVMiCy65XQRjtv
 eOjMApav6wS5oAfPBzMXen+fCD2kY4a/ySODtVBHGw4yeHf0Dj3PqtSnHddSHfKvA2Dhyp
 LrssxKoowMxRVreXSpng9ZofkU32gYo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-yLF4v8lxNCmaLjN6l4GGbw-1; Wed, 19 May 2021 07:38:44 -0400
X-MC-Unique: yLF4v8lxNCmaLjN6l4GGbw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E84188015C6;
 Wed, 19 May 2021 11:38:43 +0000 (UTC)
Received: from thuth.com (ovpn-112-85.ams2.redhat.com [10.36.112.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA20670137;
 Wed, 19 May 2021 11:38:42 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v2] configure: Avoid error messages about missing *-config-*.h
 files
Date: Wed, 19 May 2021 13:38:40 +0200
Message-Id: <20210519113840.298174-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 19 May 2021 11:38:52 -0000

When compiling with --disable-system there is a harmless yet still
annoying error message at the end of the "configure" step:

 sed: can't read *-config-devices.h: No such file or directory

When only building the tools or docs, without any emulator at all,
there is even an additional message about missing *-config-target.h
files.

Fix it by checking whether any of these files are available before
using them.

Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 v2: Use ":>" instead of "touch" as suggested by Philippe

 configure | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/configure b/configure
index 963e35b9a7..bf1c740494 100755
--- a/configure
+++ b/configure
@@ -6458,10 +6458,14 @@ fi
 
 # Create list of config switches that should be poisoned in common code...
 # but filter out CONFIG_TCG and CONFIG_USER_ONLY which are special.
-sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
-    -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
-    *-config-devices.h *-config-target.h | \
-    sort -u > config-poison.h
+target_configs_h=$(ls *-config-devices.h *-config-target.h 2>/dev/null)
+if test -n "$target_configs_h" ; then
+    sed -n -e '/CONFIG_TCG/d' -e '/CONFIG_USER_ONLY/d' \
+        -e '/^#define / { s///; s/ .*//; s/^/#pragma GCC poison /p; }' \
+        $target_configs_h | sort -u > config-poison.h
+else
+    :> config-poison.h
+fi
 
 # Save the configure command line for later reuse.
 cat <<EOD >config.status
-- 
2.27.0


