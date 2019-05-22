Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTTmq-00026e-Ex
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2019 12:08:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTmo-00024v-1q
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hTTmm-0003XW-4Q
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 12:08:14 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:54831)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hTTmh-0003CK-It; Wed, 22 May 2019 12:08:08 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MsZ3N-1gfEN10tKN-00u1Um; Wed, 22 May 2019 18:07:36 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Tony Krowiak <akrowiak@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Cornelia Huck <cohuck@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	qemu-s390x@nongnu.org, Eric Farman <farman@linux.ibm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
	qemu-trivial@nongnu.org, Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Pierre Morel <pmorel@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
	Stefano Garzarella <sgarzare@redhat.com>
Date: Wed, 22 May 2019 18:07:18 +0200
Message-Id: <20190522160723.31484-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190522160723.31484-1-laurent@vivier.eu>
References: <20190522160723.31484-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pelZVAYvf6bAcdi/TzvnuphvuJvZb8gP2K002+yyYudFzfaUbKN
	PwWHwqQUXmDumrsI2Tz+ssQVte5zBpCzw6gDComtbsQazy+0RhgN80zi5fc7hwbAaxPef40
	qQ0lYlZ/6sVhAcRPfzp3pXB8bX3she3Eg5vtRsLK57Noj+i/V4CitY+d0+2WTLM8Oix6I2I
	gZxerAYGYcGdC6KfvhPIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nmtVPSIdWAk=:gsrEu+6Bw1rRqXegeJ+yuY
	h0CJuDBwncxJNG9/de+in6VHsbXoaMtkSgyRLgPEQNaFeP52Tt5x4lWLKSnP9OeprYu9MURXz
	G6WPYA1OtPrQH62GtQSbfNoRVMfIryqFPRh2XxndgUzKrlqJFidsXh2RtkC258lLiKFIscdBo
	0zMf7734C5cJ6RGpi3zfoaszbUl4fgO0N/4diZ35soCdjbXYtDtBjXr2gAz4avGs88STGR7YV
	yOul0/5wdTYevvaZL3mVa+pgAf39zsAzZ4ikeuvxDoUmj14ji8QYn/haLdtcZycSuzMv+DxzZ
	dXtoLud28UGx4cgJWeotT7BlMJMvrqqWuzvegzRj8sU43ZP7rdoo1tTJETnhAc64xssW71dt+
	Gurry32bCRUEck0QGRf357rX+vp4uXVU3N9v/OIqJaCfOLHGiWj5IylhP8YpmMa08f+DgXhrl
	Vu9uWPmzsmfcusWOn4bND3v31MFjU9MuKaBOmFjlTO/JreuX5Jt3jA1qmZphcRHIREGpnFxuP
	k16+twS5nazxaMrx/CtCn4YUhzU1aKwSLxuu6OyMETWO1tSevD5bh8XE9g/WRwixK6ACgH21k
	x6BcaWwrcA85SmfeHTRGqLJuCvimfIaOy+XQ5FxXzP5/pAuKL51oT99OxIp22iLFPdUtkwoso
	mn/1qWqWyAYeHwcbjn35+RfcjRjYVL2J0lDTTlyXZT8YGIRAOkNjnJIoJXd5lW2efKgeHAmDm
	3Ew/MFL4mIfnTBSHJ+qHrUIAWB+ZynCr9/bw2g==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PULL 4/9] migration: Fix typo in
 migrate_add_blocker() error message
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
X-List-Received-Date: Wed, 22 May 2019 16:08:15 -0000

From: Greg Kurz <groug@kaod.org>

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Message-Id: <155800428514.543845.17558475870097990036.stgit@bahia.lan>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 migration/migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index d0a0f68f11ea..2865ae3fa948 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1728,7 +1728,7 @@ int migrate_add_blocker(Error *reason, Error **errp)
     if (only_migratable) {
         error_propagate_prepend(errp, error_copy(reason),
                                 "disallowing migration blocker "
-                                "(--only_migratable) for: ");
+                                "(--only-migratable) for: ");
         return -EACCES;
     }
 
-- 
2.20.1


