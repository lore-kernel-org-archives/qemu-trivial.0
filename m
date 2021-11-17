Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnI2R-0004z9-8c
	for mharc-qemu-trivial@gnu.org; Wed, 17 Nov 2021 05:19:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2P-0004sn-Fd
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2N-0000fy-NL
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637144371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dG4gurJXWXXm0b8RlxzNiq7AFHXScP5XHwU9lbwkx9s=;
 b=AznNctCG/wQ/ZWC1qCPVS9btbkmW5il5mRJg2UtfQYB8SiBIp7Kilvo1noIUUeX++Hw3Pt
 gp5efJXf9riJCfVeYi2tXqDai8QXRYKZAJO+ITBN0xcLAEjODqDqM0f9REDM/Tfl2Z2kju
 GUK79mqZhgsag/c3dMMXqawrc29briE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-496-A61ho8vlPsuAdy6V8NNdSg-1; Wed, 17 Nov 2021 05:19:29 -0500
X-MC-Unique: A61ho8vlPsuAdy6V8NNdSg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A8C98799EB;
 Wed, 17 Nov 2021 10:19:28 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B5014ADCD;
 Wed, 17 Nov 2021 10:19:27 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 5/6] Revert "device-crash-test: Ignore errors about a bus not
 being available"
Date: Wed, 17 Nov 2021 11:19:20 +0100
Message-Id: <20211117101921.622242-6-thuth@redhat.com>
In-Reply-To: <20211117101921.622242-1-thuth@redhat.com>
References: <20211117101921.622242-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 17 Nov 2021 10:19:33 -0000

This reverts commit ca89d15f8e42f2e5eac5bd200af38fdbfb32e875.

There is already an entry for this kind of messages earlier in the
ERROR_RULE_LIST - when I added this patch, I just got fooled by
the other errors that occur due to a race between QMP connection
and QEMU terminating early (which still spit out the 'No bus found'
messages in their backtrace), but these other problems have now
fortunately been tackled by John Snow, so we certainly don't need
this duplicated entry here anymore.

Message-Id: <20211112072220.108580-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 scripts/device-crash-test | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/device-crash-test b/scripts/device-crash-test
index 3db0ffe5b8..1c73dac93e 100755
--- a/scripts/device-crash-test
+++ b/scripts/device-crash-test
@@ -176,7 +176,6 @@ ERROR_RULE_LIST = [
     {'log':r"Multiple VT220 operator consoles are not supported"},
     {'log':r"core 0 already populated"},
     {'log':r"could not find stage1 bootloader"},
-    {'log':r"No '.*' bus found for device"},
 
     # other exitcode=1 failures not listed above will just generate INFO messages:
     {'exitcode':1, 'loglevel':logging.INFO},
-- 
2.27.0


