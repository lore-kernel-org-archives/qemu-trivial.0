Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ezNkL-0004GI-Fe
	for mharc-qemu-trivial@gnu.org; Fri, 23 Mar 2018 10:32:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36445)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNkI-0004Dv-D7
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 10:32:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNkH-0003GW-Fn
	for qemu-trivial@nongnu.org; Fri, 23 Mar 2018 10:32:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50626 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezNju-00035l-C5; Fri, 23 Mar 2018 10:32:18 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D12269BA46;
	Fri, 23 Mar 2018 14:32:17 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B7482023233;
	Fri, 23 Mar 2018 14:32:11 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@suse.de>, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Alberto Garcia <berto@igalia.com>, qemu-ppc@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, qemu-arm@nongnu.org,
	Yongbok Kim <yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 23 Mar 2018 15:31:58 +0100
Message-Id: <20180323143202.28879-2-lvivier@redhat.com>
In-Reply-To: <20180323143202.28879-1-lvivier@redhat.com>
References: <20180323143202.28879-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Fri, 23 Mar 2018 14:32:17 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH v2 1/5] make: improve check for stale
 generated files in source dir
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2018 14:32:43 -0000

From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

When doing a build with builddir !=3D srcdir, if any generated files are
accidentally present in srcdir from a previous build, these can cause
unexpected failures.

Currently there is a rule that checks for existance of config-host.mak,
but there have been cases where config-host.mak is absent, while other
generated files still exist.

Update the check to look at every file listed in $(GENERATED_FILES). To
do this we must move the check further down after $(GENERATED_FILES) has
been populated.

Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 Makefile | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 727ef118f3..d588a13687 100644
--- a/Makefile
+++ b/Makefile
@@ -52,16 +52,6 @@ endif
=20
 .git-submodule-status: git-submodule-update config-host.mak
=20
-# Check that we're not trying to do an out-of-tree build from
-# a tree that's been used for an in-tree build.
-ifneq ($(realpath $(SRC_PATH)),$(realpath .))
-ifneq ($(wildcard $(SRC_PATH)/config-host.mak),)
-$(error This is an out of tree build but your source tree ($(SRC_PATH)) =
\
-seems to have been used for an in-tree build. You can fix this by runnin=
g \
-"$(MAKE) distclean && rm -rf *-linux-user *-softmmu" in your source tree=
)
-endif
-endif
-
 CONFIG_SOFTMMU :=3D $(if $(filter %-softmmu,$(TARGET_DIRS)),y)
 CONFIG_USER_ONLY :=3D $(if $(filter %-user,$(TARGET_DIRS)),y)
 CONFIG_XEN :=3D $(CONFIG_XEN_BACKEND)
@@ -1028,6 +1018,25 @@ ifdef SIGNCODE
 endif # SIGNCODE
 endif # CONFIG_WIN
=20
+define nl
+
+
+endef
+
+CHECK_FILES =3D config-host.mak $(filter-out .git-submodule-status, $(GE=
NERATED_FILES))
+UNEXPECTED_FILES =3D $(wildcard $(CHECK_FILES:%=3D$(SRC_PATH)/%))
+
+# Check that we're not trying to do an out-of-tree build from
+# a tree that's been used for an in-tree build.
+ifneq ($(realpath $(SRC_PATH)),$(realpath .))
+ifneq ($(UNEXPECTED_FILES),)
+$(error Stale files in source tree:${nl}${nl} $(UNEXPECTED_FILES:%=3D  %=
${nl}) ${nl}\
+This is an out of tree build but your source tree ($(SRC_PATH)) \
+seems to have been used for an in-tree build. You can fix this by runnin=
g \
+"$(MAKE) distclean && rm -rf *-linux-user *-softmmu" in your source tree=
)
+endif
+endif
+
 # Add a dependency on the generated files, so that they are always
 # rebuilt before other object files
 ifneq ($(wildcard config-host.mak),)
--=20
2.14.3


