Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bf7ry-0004fI-I3
	for mharc-qemu-trivial@gnu.org; Wed, 31 Aug 2016 11:56:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fullmanet@gmail.com>) id 1bf7rv-0004dj-FG
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 11:56:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fullmanet@gmail.com>) id 1bf7ru-0002Xo-Gk
	for qemu-trivial@nongnu.org; Wed, 31 Aug 2016 11:56:03 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:35522)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fullmanet@gmail.com>)
	id 1bf7rp-0002WO-NQ; Wed, 31 Aug 2016 11:55:57 -0400
Received: by mail-wm0-x244.google.com with SMTP id i5so8239644wmg.2;
	Wed, 31 Aug 2016 08:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=06Ieo9zK0gxOHgtvLB+lFsArkbBZmk++VOTLfis79T0=;
	b=qroHup1d6nKH5/Z9ECgG7i01jiAZF3531PQEe0gVUGS1Tf1Bi2YsNPnjC3oKzXFJOR
	pehPQWpl0ZKP2Befjd/fVq5sJNzH/07JOFO/lZAko9mDK0AqULI8kdRf2lC+kSS9z9mi
	zwCrJdpTYPvZNobYc1ucQPogymCAR59xr3nh9yBw81jHuzQdHVPbmC30R7u7vPf/bOgZ
	zzlthuTe9BMMXsI+5iCeOExUPEX++RWqMLeDBzXhdlioGapETJUAcmyKGk/GihUh+JpR
	xOb1UJ8PU+gt4XDmuwT7CRWsTRPcwq1BQABsu9DMekAa2LYRpnQu1btChGTUp7Hj9FK7
	/QZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=06Ieo9zK0gxOHgtvLB+lFsArkbBZmk++VOTLfis79T0=;
	b=b2xWULMpITPMS96FBJGR3tndNwa8ralDtn9uZwCvnk+Cze3cUPF5uGQDU1Tw28NVOd
	graLSZPWCvSegvHmARIkwbIP2lMjN7lQUdbBfEW0lQnCkAB+jkEV2/Q8sKoDJFqrQHNt
	94UkRy9DlneuU/vEoSD2uWHRjYbMgkyzzW4CdcwsIku3hEk7NA7Bi6MyvvBQs7burEXv
	wvegT2c8IGu4HQ3yFnacjhM0G9Smy8pndiYO02xdAytnJlK3Sv4/dmosLzdBG8Yz7rbA
	BLMTBFi+6xZ+2sTqzSuuwQKIecZi6P78JwYl+6j2Ui3OTbL+z6IVrbJ8i465Og9EA9tw
	qStg==
X-Gm-Message-State: AE9vXwNBV4WK+Zf+VS3jaHBD1nd84kewrhH2swc93a0rwAzyO5XdZUvzhQXjOo9jaxFIQg==
X-Received: by 10.194.187.134 with SMTP id fs6mr9681915wjc.3.1472658955598;
	Wed, 31 Aug 2016 08:55:55 -0700 (PDT)
Received: from cinque_stelle.sm14.sm.cri.epita.net ([163.5.208.108])
	by smtp.gmail.com with ESMTPSA id i8sm9607292wmg.21.2016.08.31.08.55.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Aug 2016 08:55:54 -0700 (PDT)
From: Reda Sallahi <fullmanet@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Magnus Damm <magnus.damm@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Reda Sallahi <fullmanet@gmail.com>
Date: Wed, 31 Aug 2016 17:54:49 +0200
Message-Id: <20160831155449.5154-1-fullmanet@gmail.com>
X-Mailer: git-send-email 2.9.3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-trivial] [PATCH] sh4: fix broken link to documentation
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
X-List-Received-Date: Wed, 31 Aug 2016 15:56:04 -0000

The page that was previously linked in the source code and the README file is
no longer available so it now returns a 404 error message.

This puts a previous snapshot from archive.org instead.

Signed-off-by: Reda Sallahi <fullmanet@gmail.com>
---
 hw/sh4/shix.c         | 2 +-
 target-sh4/README.sh4 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index ccc9e75..2ac79fc 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -23,7 +23,7 @@
  */
 /*
    Shix 2.0 board by Alexis Polti, described at
-   http://perso.enst.fr/~polti/realisations/shix20/
+   web.archive.org/web/20070917001736/perso.enst.fr/~polti/realisations/shix20
 
    More information in target-sh4/README.sh4
 */
diff --git a/target-sh4/README.sh4 b/target-sh4/README.sh4
index e578830..ece0464 100644
--- a/target-sh4/README.sh4
+++ b/target-sh4/README.sh4
@@ -25,7 +25,7 @@ Goals
 
 The primary model being worked on is the soft MMU target to be able to
 emulate the Shix 2.0 board by Alexis Polti, described at
-http://perso.enst.fr/~polti/realisations/shix20/
+https://web.archive.org/web/20070917001736/http://perso.enst.fr/~polti/realisations/shix20/
 
 Ultimately, qemu will be coupled with a system C or a verilog
 simulator to simulate the whole board functionalities.
-- 
2.9.3


