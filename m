Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kV8Sv-0007Dh-Do
	for mharc-qemu-trivial@gnu.org; Wed, 21 Oct 2020 03:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kV8St-0007DT-Jn
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 03:23:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kV8Sr-000098-U8
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 03:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603264996;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type;
 bh=bMpN1ib5S7EpEYCsIAFiGVeSoDEeZVuGRBp8mwSulpk=;
 b=ZfPlq6bbzJKG+0rM6tCJkuHZ+ul5BpwJP5sREIP3ARSbd7SsCFExDTQujrFSZQPb47WOsj
 hTZsFTqkDgQ/GdGeq3vuCVRFV4svjSvVeXkmN3/oZMmsrCOZntBfW58JPWBA3U36hf5XKy
 lXvLmC4EHAz9lh6HIhYwWAd2XkG50jM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-6x4ruLTQPRO13qNuESnGHA-1; Wed, 21 Oct 2020 03:23:15 -0400
X-MC-Unique: 6x4ruLTQPRO13qNuESnGHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC09E186DD34;
 Wed, 21 Oct 2020 07:23:13 +0000 (UTC)
Received: from thuth.com (ovpn-112-165.ams2.redhat.com [10.36.112.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A12FA5576E;
 Wed, 21 Oct 2020 07:23:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org
Subject: [PATCH] tests/docker/dockerfiles/centos: Use SDL2 instead of SDL1
Date: Wed, 21 Oct 2020 09:23:08 +0200
Message-Id: <20201021072308.9224-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/21 02:16:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 21 Oct 2020 07:23:19 -0000

We do not support SDL1 in QEMU anymore. Use SDL2 instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/docker/dockerfiles/centos7.docker | 2 +-
 tests/docker/dockerfiles/centos8.docker | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dockerfiles/centos7.docker
index 8b273725ee..6f11af1989 100644
--- a/tests/docker/dockerfiles/centos7.docker
+++ b/tests/docker/dockerfiles/centos7.docker
@@ -31,7 +31,7 @@ ENV PACKAGES \
     perl-Test-Harness \
     pixman-devel \
     python3 \
-    SDL-devel \
+    SDL2-devel \
     spice-glib-devel \
     spice-server-devel \
     tar \
diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dockerfiles/centos8.docker
index 585dfad9be..f86931f955 100644
--- a/tests/docker/dockerfiles/centos8.docker
+++ b/tests/docker/dockerfiles/centos8.docker
@@ -2,7 +2,7 @@ FROM centos:8.1.1911
 
 RUN dnf -y update
 ENV PACKAGES \
-    SDL-devel \
+    SDL2-devel \
     bzip2 \
     bzip2-devel \
     dbus-daemon \
-- 
2.18.2


