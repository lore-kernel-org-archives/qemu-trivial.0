Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxyC-00057b-4U
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy9-00054f-Db
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy8-0004Um-I5
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:49 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36503)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxy4-0004OX-8V; Fri, 28 Jul 2017 01:37:44 -0400
Received: by mail-qt0-x243.google.com with SMTP id c15so6555693qta.3;
	Thu, 27 Jul 2017 22:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=t0jadvrrstZUVZY/W/e06Mr8djlquNApt0/QTCn+ENA=;
	b=hv4c0FvD+/uaoIE2PdrF3/EGDqZVnOccSl9Zzc9t4x4CJgZV9lnWGNly7ArlrlgVY4
	ry4Y2zd/AaMhzVhC7986hHur8iVfqpDB6lHesVvT/pj4loYr7E/unH6xmPWbWFc3znA+
	u+KASfWEaL59vGc4flKaI8kzvMfFGfdCibI1SsKweCR7e7I6xH1+srJLcvsrADGU0wvP
	7EiYGoY9dfsoZOMnodc94/5uBkLhFigDdp1SGvRxMjUvWJSlQHkncK+Fo1oDMY4xd1PL
	8EDqEtkzcti+UOQP/DFdATi7dC111v/ZL3SN4WEFJR1JRYsbQTL4pl+0l82IOLgmEcjD
	3cbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=t0jadvrrstZUVZY/W/e06Mr8djlquNApt0/QTCn+ENA=;
	b=MJR7dcxln+76fHMUQdzz3QDzAWdFmyDe6kZVNIq+m9DJ73i3qvjJXOvQWqMZG/4EU+
	wtbC0iV3AhYY3PHkspzQiW6d7FHgj0/b/v0yBKWgDPpzBnfRVOOSoL9+27u0rodk7PkD
	WK+1WW2KhpXnJ0yZtp/OTDtFA98gZKY6ex5fmM1bOD9p3+LMXA4doARAlaArEezWdT7T
	VzBHT679IFklzxsJM+vNbxiwg2tLrCWPGTgZ9K8KiFjO8Vz70x7haHNx2Q7CiICTLk33
	juB1cSzf+fzaM4sKlHiH69bGQ3R2GbD0Et8O3Ibwi26xzLE/3mC2OSAIy2mC+UU781Wn
	9JiQ==
X-Gm-Message-State: AIVw113VMdDxyAVtlrQ1aajLQ7t7acLhdZ2bNZA7ibuyGhK/kPL1F5cQ
	szMTbvIjMnai5Q==
X-Received: by 10.200.3.135 with SMTP id t7mr8799843qtg.216.1501220263859;
	Thu, 27 Jul 2017 22:37:43 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alberto Garcia <berto@igalia.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:58 -0300
Message-Id: <20170728053610.15770-36-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH 35/47] MAINTAINERS: add missing entries for
 throttling infra
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
X-List-Received-Date: Fri, 28 Jul 2017 05:37:50 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a2b008e305..b9a132d964 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1584,8 +1584,10 @@ M: Alberto Garcia <berto@igalia.com>
 S: Supported
 F: block/throttle-groups.c
 F: include/block/throttle-groups.h
-F: include/qemu/throttle.h
+F: include/qemu/throttle*.h
 F: util/throttle.c
+F: docs/throttle.txt
+F: tests/test-throttle.c
 L: qemu-block@nongnu.org
 
 UUID
-- 
2.13.3


