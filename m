Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lMwhB-0003cB-0F
	for mharc-qemu-trivial@gnu.org; Thu, 18 Mar 2021 13:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMwh8-0003bd-2G
 for qemu-trivial@nongnu.org; Thu, 18 Mar 2021 13:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1lMwh4-0006Kx-BQ
 for qemu-trivial@nongnu.org; Thu, 18 Mar 2021 13:44:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616089460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qTwI36Q6JbTwzyWHvJuVO2c36ymuAdbZ5HZ2XTNHxW4=;
 b=fTR6XvjMc0Bafv4lA5y/A1DRNV3PKGlsJL1eqgUAC2CLeoRuKEPn9rxWguQpMqUann3kAd
 BocMiXpqEKiiFOaqXyvZZNIXkgwB4nI+Z+rAtBlJlsidd/61ARSEV+GREOSOoT3igVPWmh
 TQd1SVVfbDEuOzY8RPl9AHjCKrsGNkU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-ecuC54hXMIu3MG3yluGwrA-1; Thu, 18 Mar 2021 13:44:17 -0400
X-MC-Unique: ecuC54hXMIu3MG3yluGwrA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA5B4881280;
 Thu, 18 Mar 2021 17:44:15 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-126.gru2.redhat.com
 [10.97.116.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DE4E60CD7;
 Thu, 18 Mar 2021 17:44:11 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, thuth@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com
Subject: [PATCH v2] docs/devel/testing.rst: Fix references to unit tests
Date: Thu, 18 Mar 2021 14:44:07 -0300
Message-Id: <20210318174407.2299930-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 18 Mar 2021 17:44:26 -0000

With the recent move of the unit tests to tests/unit directory some
instructions under the "Unit tests" section became imprecise, which
are fixed by this change.

Fixes: da668aa15b99 ("tests: Move unit tests into a separate directory")
Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
v1->v2:
 * Fixed typo on subject [jsnow]
 * Replaced Related-to with Fixes [jsnow]

 docs/devel/testing.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 1434a50cc4..1da4c4e4c4 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -34,17 +34,17 @@ If you are writing new code in QEMU, consider adding a unit test, especially
 for utility modules that are relatively stateless or have few dependencies. To
 add a new unit test:
 
-1. Create a new source file. For example, ``tests/foo-test.c``.
+1. Create a new source file. For example, ``tests/unit/foo-test.c``.
 
 2. Write the test. Normally you would include the header file which exports
    the module API, then verify the interface behaves as expected from your
    test. The test code should be organized with the glib testing framework.
    Copying and modifying an existing test is usually a good idea.
 
-3. Add the test to ``tests/meson.build``. The unit tests are listed in a
+3. Add the test to ``tests/unit/meson.build``. The unit tests are listed in a
    dictionary called ``tests``.  The values are any additional sources and
    dependencies to be linked with the test.  For a simple test whose source
-   is in ``tests/foo-test.c``, it is enough to add an entry like::
+   is in ``tests/unit/foo-test.c``, it is enough to add an entry like::
 
      {
        ...
-- 
2.29.2


