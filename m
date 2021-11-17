Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnI2T-00059F-Ue
	for mharc-qemu-trivial@gnu.org; Wed, 17 Nov 2021 05:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2T-00056W-3Z
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2R-0000gr-0y
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637144374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryPyAbJe4A6rnqW++2aZUw4Big4L9E5qEIrnZMpDzxk=;
 b=K6/lknNety/18TLw7G++ynII/XLbOL75BHIViLqomHe81yvS1S8baGM0mobmLcIhDPO/Fh
 fygWf2d6gXbHBqSbeFUtaChxh0l/xuDnBxyFDWjFqaEECaF9t02WHBQvplhwjcJdJVu4Sq
 VeyNDtNF/Vn+EcF5H8tYdR4v8D8wwDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-j54KAha6O7qlDkFXhq2LmQ-1; Wed, 17 Nov 2021 05:19:30 -0500
X-MC-Unique: j54KAha6O7qlDkFXhq2LmQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 478A48799ED;
 Wed, 17 Nov 2021 10:19:29 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A19D517CE1;
 Wed, 17 Nov 2021 10:19:28 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 6/6] gitlab-ci/cirrus: Increase timeout to 80 minutes
Date: Wed, 17 Nov 2021 11:19:21 +0100
Message-Id: <20211117101921.622242-7-thuth@redhat.com>
In-Reply-To: <20211117101921.622242-1-thuth@redhat.com>
References: <20211117101921.622242-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-List-Received-Date: Wed, 17 Nov 2021 10:19:37 -0000

The jobs on Cirrus-CI sometimes get delayed quite a bit, waiting to
be scheduled, so while the build test itself finishes within 60 minutes,
the total run time of the jobs can be longer due to this waiting time.
Thus let's increase the timeout on the gitlab side a little bit, so
that these jobs are not marked as failing just because of the delay.

Message-Id: <20211116163309.246602-1-thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/cirrus.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index cc2f2e8906..d273a9e713 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -14,6 +14,7 @@
   stage: build
   image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
   needs: []
+  timeout: 80m
   allow_failure: true
   script:
     - source .gitlab-ci.d/cirrus/$NAME.vars
-- 
2.27.0


