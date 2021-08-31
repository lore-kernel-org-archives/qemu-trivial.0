Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mL6uc-0002Eh-0r
	for mharc-qemu-trivial@gnu.org; Tue, 31 Aug 2021 12:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mL5hu-00030R-Iw
 for qemu-trivial@nongnu.org; Tue, 31 Aug 2021 11:29:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <willianr@redhat.com>)
 id 1mL5hs-0005zE-1f
 for qemu-trivial@nongnu.org; Tue, 31 Aug 2021 11:29:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630423786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E9jFbXQSuovHMITYPbFGTVXrJUaHto7IFIyGiQEx8GU=;
 b=h0cumiMCu0dKz89Yhe+UfIOWuit8zwaryhUIlqPOyuy915mSSm6tP+5QfolNqiGXHo9zvy
 MusfuoJqK8vzAVbW6c7N4AWPRnZWosn6aXaJZrGRivmzRStScjU0+/nXgv6nFcVVRDC0A2
 OICj0iSAmzK4KV9GO6XIFCsI0XQ6V38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-KJIsHMNHPYKYCWH_jvKzxA-1; Tue, 31 Aug 2021 11:29:45 -0400
X-MC-Unique: KJIsHMNHPYKYCWH_jvKzxA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3849800482;
 Tue, 31 Aug 2021 15:29:43 +0000 (UTC)
Received: from wrampazz.redhat.com (unknown [10.22.32.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2164B60CC9;
 Tue, 31 Aug 2021 15:29:40 +0000 (UTC)
From: Willian Rampazzo <willianr@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2 0/1] docs: add definitions of terms for CI/testing
Date: Tue, 31 Aug 2021 12:29:38 -0300
Message-Id: <20210831152939.97570-1-willianr@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=willianr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=willianr@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 31 Aug 2021 12:46:57 -0400
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
X-List-Received-Date: Tue, 31 Aug 2021 15:29:50 -0000

To understand the current state of QEMU CI/testing and have a base to=0D
discuss the plans for the future, it is important to define some usual=0D
terms. This patch defines the terms for "Automated tests", "Unit=0D
testing", "Functional testing", "System testing", "Flaky tests",=0D
"Gating", and "Continuous Integration".=0D
=0D
Signed-off-by: Willian Rampazzo <willianr@redhat.com>=0D
=0D
- Changes from v1:=0D
  - Add Philippe R-b=0D
  - Remove reference to Daniel's document split patch.=0D
=0D
Willian Rampazzo (1):=0D
  docs: add definitions of terms for CI/testing=0D
=0D
 docs/devel/ci-definitions.rst | 121 ++++++++++++++++++++++++++++++++++=0D
 docs/devel/ci.rst             |   1 +=0D
 2 files changed, 122 insertions(+)=0D
 create mode 100644 docs/devel/ci-definitions.rst=0D
=0D
--=20=0D
2.31.1=0D
=0D


