Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mnI2N-0004q7-Pk
	for mharc-qemu-trivial@gnu.org; Wed, 17 Nov 2021 05:19:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2M-0004pv-GH
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mnI2J-0000fQ-9V
 for qemu-trivial@nongnu.org; Wed, 17 Nov 2021 05:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637144366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MI82iirgs5lf65+emV1RcmBKmM/xVLW/R0IgWWiHfck=;
 b=S7pPkc0Bl6oZsHRIal9xixRGY9c25YOCq14CdNibj3leg/CIBncN5DpFq7hgFKldhL300d
 bOuB7qqWIQ4n33mZlMju+6tGBev6jmKNtlZJH4m+oyl4fD5fMVGRilU0+o8Fn+vTKR4NN+
 y+CAtQzCU5Zq4qluAPK8V/7nzaVKIV0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-B8PpkcwrMn62-ApbT9Gi_A-1; Wed, 17 Nov 2021 05:19:24 -0500
X-MC-Unique: B8PpkcwrMn62-ApbT9Gi_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93504101F7A1;
 Wed, 17 Nov 2021 10:19:23 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EE1DF1816A;
 Wed, 17 Nov 2021 10:19:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-trivial@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 0/6] Misc patches for 6.2-rc2
Date: Wed, 17 Nov 2021 11:19:15 +0100
Message-Id: <20211117101921.622242-1-thuth@redhat.com>
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
X-List-Received-Date: Wed, 17 Nov 2021 10:19:30 -0000

 Hi Richard!
 
The following changes since commit 8d5fcb1990bc64b62c0bc12121fe510940be5664:

  Merge tag 'python-pull-request' of https://gitlab.com/jsnow/qemu into staging (2021-11-17 07:41:08 +0100)

are available in the Git repository at:

  https://gitlab.com/thuth/qemu.git tags/pull-request-2021-11-17

for you to fetch changes up to d06f3bf922679d89815fde9eac9264ba44e37954:

  gitlab-ci/cirrus: Increase timeout to 80 minutes (2021-11-17 10:20:38 +0100)

----------------------------------------------------------------
* Remove some unused #defines in s390x code
* rSTify some of the development process pages from the Wiki
* Revert a useless patch in the device-crash-test script
* Bump timeout of the Cirrus-CI jobs to 80 minutes

----------------------------------------------------------------
Kashyap Chamarthy (3):
      docs: rSTify the "TrivialPatches" wiki
      docs: rSTify the "SubmitAPullRequest" wiki
      docs: rSTify the "SubmitAPatch" wiki

Thomas Huth (3):
      target/s390x/cpu.h: Remove unused SIGP_MODE defines
      Revert "device-crash-test: Ignore errors about a bus not being available"
      gitlab-ci/cirrus: Increase timeout to 80 minutes

 .gitlab-ci.d/cirrus.yml                  |   1 +
 docs/devel/index.rst                     |   3 +
 docs/devel/submitting-a-patch.rst        | 456 +++++++++++++++++++++++++++++++
 docs/devel/submitting-a-pull-request.rst |  76 ++++++
 docs/devel/trivial-patches.rst           |  50 ++++
 scripts/device-crash-test                |   1 -
 target/s390x/cpu.h                       |   5 -
 7 files changed, 586 insertions(+), 6 deletions(-)
 create mode 100644 docs/devel/submitting-a-patch.rst
 create mode 100644 docs/devel/submitting-a-pull-request.rst
 create mode 100644 docs/devel/trivial-patches.rst


