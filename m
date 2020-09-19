Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kJZxX-0004fN-Dh
	for mharc-qemu-trivial@gnu.org; Sat, 19 Sep 2020 06:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJZxV-0004dV-M4
 for qemu-trivial@nongnu.org; Sat, 19 Sep 2020 06:19:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kJZxT-0000ff-5q
 for qemu-trivial@nongnu.org; Sat, 19 Sep 2020 06:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600510745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=+Md5Irhv4c2iZU06JJcaZt1y+RwzktkmUpHzCqvaDV0=;
 b=KIYOjYEiukVhoxusUP6n4XRB+6EFeqVr0aZOF+rzoqEhjzyc3zCM5JMnYNYHdzsDm3ocqb
 PpIE7qik15JjyfQv8D61IfawUGQZ2Qh0yeUtfxc6+1fhjvXaQTEQhCQPqCqNeQ5DFaBqBs
 40wgUXOCdD8iNOZHADbc0JwMwo/b4Kw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-fJ-eW_9NMYSAhkndNyt9fQ-1; Sat, 19 Sep 2020 06:19:03 -0400
X-MC-Unique: fJ-eW_9NMYSAhkndNyt9fQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9E8CA85C733;
 Sat, 19 Sep 2020 10:19:02 +0000 (UTC)
Received: from thuth.com (ovpn-112-63.ams2.redhat.com [10.36.112.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C401A1002D63;
 Sat, 19 Sep 2020 10:19:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org
Subject: [PATCH] Add *.pyc back to the .gitignore file
Date: Sat, 19 Sep 2020 12:18:59 +0200
Message-Id: <20200919101859.28739-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/19 06:19:05
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 19 Sep 2020 10:19:09 -0000

Python still dumps its bytecode into the source directory, so
we should continue to ignore the *.pyc files.

Fixes: 0e72b7df4d ("Simplify the .gitignore file")
Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 5515f595e6..b32bca1315 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,5 +1,6 @@
 /GNUmakefile
 /build/
+*.pyc
 .sdk
 .stgit-*
 .git-submodule-status
-- 
2.18.2


