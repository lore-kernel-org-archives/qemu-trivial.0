Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kahTc-0002he-CZ
	for mharc-qemu-trivial@gnu.org; Thu, 05 Nov 2020 10:47:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kahTZ-0002be-Vj
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 10:47:01 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:53089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kahTY-0006bu-7b
 for qemu-trivial@nongnu.org; Thu, 05 Nov 2020 10:47:01 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-_zdXCZVAN9OSZi1rH-NlQA-1; Thu, 05 Nov 2020 10:46:55 -0500
X-MC-Unique: _zdXCZVAN9OSZi1rH-NlQA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7CF0425EF;
 Thu,  5 Nov 2020 15:46:54 +0000 (UTC)
Received: from bahia.lan (ovpn-113-123.ams2.redhat.com [10.36.113.123])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 005AB5C5DE;
 Thu,  5 Nov 2020 15:46:53 +0000 (UTC)
Subject: [PATCH for-5.2? 1/2] Makefile: Don't use $(quiet-@) within the body
 of a recipe
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-trivial@nongnu.org
Date: Thu, 05 Nov 2020 16:46:53 +0100
Message-ID: <160459121308.462591.11794514422987547665.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/05 10:46:57
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
X-List-Received-Date: Thu, 05 Nov 2020 15:47:02 -0000

A weird message is printed when doing 'make clean' or 'make distclean':

./configure && make clean
...
bash: @/usr/bin/ninja: No such file or directory

and ninja doesn't get called in this case.

It doesn't make sense to use $(quiet-@) within the body of a recipe.
Since both recipes are already prefixed by @ anyway, just drop the
$(quiet-@) invocations.

Fixes: 09e93326e448 ("build: replace ninjatool with ninja")
Cc: pbonzini@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 Makefile |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 9465720696e6..df7a02a61a43 100644
--- a/Makefile
+++ b/Makefile
@@ -212,7 +212,7 @@ recurse-clean: $(addsuffix /clean, $(ROM_DIRS))
 ######################################################################
=20
 clean: recurse-clean
-=09-@test -f build.ninja && $(quiet-@)$(NINJA) $(NINJAFLAGS) -t clean || :
+=09-@test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
 =09-@test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
 # avoid old build problems by removing potentially incorrect old files
 =09rm -f config.mak op-i386.h opc-i386.h gen-op-i386.h op-arm.h opc-arm.h =
gen-op-arm.h
@@ -231,7 +231,7 @@ qemu-%.tar.bz2:
 =09$(SRC_PATH)/scripts/make-release "$(SRC_PATH)" "$(patsubst qemu-%.tar.b=
z2,%,$@)"
=20
 distclean: clean
-=09-@test -f build.ninja && $(quiet-@)$(NINJA) $(NINJAFLAGS) -t clean -g |=
| :
+=09-@test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean -g || :
 =09rm -f config-host.mak config-host.h*
 =09rm -f tests/tcg/config-*.mak
 =09rm -f config-all-disas.mak config.status



