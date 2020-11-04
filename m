Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kaOUs-0003cf-6I
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2020 14:31:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kaOUq-0003a8-KE
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 14:31:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kaOUp-0008Rt-5V
 for qemu-trivial@nongnu.org; Wed, 04 Nov 2020 14:31:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604518262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=90caXRKGbBJKSi+u08Pj/8dqx+zmWzZSLLu3gdIMp+I=;
 b=D4qVyuIU43ydjugGpLyg4sXzSjoE+iwobKq9dyRObWceVPWzM1bXYhU58O0CDvK+Q2k0Vg
 ewq8Epa6JD16ass4vTQ0O1KUSfAXzWq75sjFM/bML57Tn1r+9GscTcUsTF5g9hixOyDHnS
 099kSXv1pYbxiHDzyC9XaaGJPaKu6os=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482--HWCQAkCODiy97hVFcRwYQ-1; Wed, 04 Nov 2020 14:30:35 -0500
X-MC-Unique: -HWCQAkCODiy97hVFcRwYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23AC1107AFA9;
 Wed,  4 Nov 2020 19:30:34 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-61.rdu2.redhat.com [10.10.113.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 874CD5C5DE;
 Wed,  4 Nov 2020 19:30:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 John Snow <jsnow@redhat.com>
Subject: [PATCH] README: Add Documentation blurb
Date: Wed,  4 Nov 2020 14:30:32 -0500
Message-Id: <20201104193032.1319248-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 04 Nov 2020 19:31:04 -0000

Add it in a prominent place: Right after figuring out what QEMU is,
users may wish to know how to use it more than they want to know how to
build their own version of it.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 README.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/README.rst b/README.rst
index 58b9f2dc15c4..758ea8fd2ff0 100644
--- a/README.rst
+++ b/README.rst
@@ -31,6 +31,17 @@ QEMU as a whole is released under the GNU General Public License,
 version 2. For full licensing details, consult the LICENSE file.
 
 
+Documentation
+=============
+
+Documentation can be found hosted online at
+`<https://www.qemu.org/documentation/>`_. The documentation for the
+current development version that is available at
+`<https://www.qemu.org/docs/master/>`_ is generated from the ``docs/``
+folder in the source tree, and is built by `Sphinx
+<https://www.sphinx-doc.org/en/master/>_`.
+
+
 Building
 ========
 
-- 
2.26.2


