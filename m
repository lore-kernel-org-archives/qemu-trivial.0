Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mcl2w-0001CN-EH
	for mharc-qemu-trivial@gnu.org; Tue, 19 Oct 2021 05:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2r-00017Z-0M
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 05:04:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1mcl2p-0007ge-Au
 for qemu-trivial@nongnu.org; Tue, 19 Oct 2021 05:04:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634634264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JX4we9rVGSwSP4Q6Da9FYxWUAFu6VceQ1S4FfWRjNLY=;
 b=QIDPTRaNHOqCVnuGzdIBSToR+zSbI7nZXBz9sJ92nA7/flPXrOmEugYEWmOU1oixVy1CwU
 IbCGBSw1HQCc9BkfJdlCt6tHYVb9NUYswWxfEywd28jz2BaJyJ6SG9a6IWVWWxIZGatMg9
 jAIXV75ELNXyOucoarERciNrlj0Qxco=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-93k5-areNm2qKQzvjl8BeA-1; Tue, 19 Oct 2021 05:04:21 -0400
X-MC-Unique: 93k5-areNm2qKQzvjl8BeA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D5AC18125C4;
 Tue, 19 Oct 2021 09:04:20 +0000 (UTC)
Received: from paraplu.home (unknown [10.39.194.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8841E7092E;
 Tue, 19 Oct 2021 09:04:17 +0000 (UTC)
From: Kashyap Chamarthy <kchamart@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Kashyap Chamarthy <kchamart@redhat.com>
Subject: [PATCH v2 6/6] docs/devel: Update the rST index file
Date: Tue, 19 Oct 2021 11:03:44 +0200
Message-Id: <20211019090344.3054300-7-kchamart@redhat.com>
In-Reply-To: <20211019090344.3054300-1-kchamart@redhat.com>
References: <20211019090344.3054300-1-kchamart@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 19 Oct 2021 09:04:29 -0000

Add the entries for contributing-related rSTified wiki docs.

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
---
 docs/devel/index.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index f95df10b3e..f7bec644f3 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -45,3 +45,8 @@ modifying QEMU's source code.
    vfio-migration
    qapi-code-gen
    writing-qmp-commands
+   trivial-patches
+   spell-check
+   key-signing-party
+   submitting-a-pull-request
+   submitting-a-patch
-- 
2.31.1


