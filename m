Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnI2R-0004yN-31
	for mharc-qemu-trivial@gnu.org; Wed, 17 Nov 2021 05:19:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2P-0004sQ-AB
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2M-0000fo-S8
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637144370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VgqeIWTceefWFRxiT7KRzOK27sVZ14roSLARk0mc8AE=;
 b=Ou7gow2lFC4Jky9MqsuZeOos+RDF+BrzRzHLJuiRxMivXgOYTsMZJX8pKSWBs9KOnJIoWW
 H8CuRH3XiWFfbEPJHXO5KBxGpjfCA3H6jYvMFyJETXVOqmzlP3ZH42Y6hZq+rW3PmtU9ZZ
 kdNyoXu/9urO/aP8pY2mpQTZFiaNOyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-0PfbhZeLO0mbGwkohR1n8A-1; Wed, 17 Nov 2021 05:19:26 -0500
X-MC-Unique: 0PfbhZeLO0mbGwkohR1n8A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E825101F7A3;
 Wed, 17 Nov 2021 10:19:25 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9958ADCD;
 Wed, 17 Nov 2021 10:19:24 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 2/6] docs: rSTify the "TrivialPatches" wiki
Date: Wed, 17 Nov 2021 11:19:17 +0100
Message-Id: <20211117101921.622242-3-thuth@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Kashyap Chamarthy <kchamart@redhat.com>

The original wiki is here[1].  I converted by copying the wiki source
into a .wiki file and convert to rST using `pandoc`:

        $ pandoc -f Mediawiki -t rst trivial-patches.wiki -o trivial-patches.rst

Update the active maintainer names (and drop Michael Tokarev's inactive
repo) to reflect current reality.

[1] https://wiki.qemu.org/Contribute/TrivialPatches

Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20211110144902.388183-2-kchamart@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/devel/index.rst           |  1 +
 docs/devel/trivial-patches.rst | 50 ++++++++++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 docs/devel/trivial-patches.rst

diff --git a/docs/devel/index.rst b/docs/devel/index.rst
index 7c25177c5d..dbde1c44e9 100644
--- a/docs/devel/index.rst
+++ b/docs/devel/index.rst
@@ -45,3 +45,4 @@ modifying QEMU's source code.
    vfio-migration
    qapi-code-gen
    writing-monitor-commands
+   trivial-patches
diff --git a/docs/devel/trivial-patches.rst b/docs/devel/trivial-patches.rst
new file mode 100644
index 0000000000..db3f2001da
--- /dev/null
+++ b/docs/devel/trivial-patches.rst
@@ -0,0 +1,50 @@
+Trivial Patches
+===============
+
+Overview
+--------
+
+Trivial patches that change just a few lines of code sometimes languish
+on the mailing list even though they require only a small amount of
+review. This is often the case for patches that do not fall under an
+actively maintained subsystem and therefore fall through the cracks.
+
+The trivial patches team take on the task of reviewing and building pull
+requests for patches that:
+
+- Do not fall under an actively maintained subsystem.
+- Are single patches or short series (max 2-4 patches).
+- Only touch a few lines of code.
+
+**You should hint that your patch is a candidate by CCing
+qemu-trivial@nongnu.org.**
+
+Repositories
+------------
+
+Since the trivial patch team rotates maintainership there is only one
+active repository at a time:
+
+- git://github.com/vivier/qemu.git trivial-patches - `browse <https://github.com/vivier/qemu/tree/trivial-patches>`__
+
+Workflow
+--------
+
+The trivial patches team rotates the duty of collecting trivial patches
+amongst its members. A team member's job is to:
+
+1. Identify trivial patches on the development mailing list.
+2. Review trivial patches, merge them into a git tree, and reply to state
+   that the patch is queued.
+3. Send pull requests to the development mailing list once a week.
+
+A single team member can be on duty as long as they like. The suggested
+time is 1 week before handing off to the next member.
+
+Team
+----
+
+If you would like to join the trivial patches team, contact Laurent
+Vivier. The current team includes:
+
+- `Laurent Vivier <mailto:laurent@vivier.eu>`__
-- 
2.27.0


