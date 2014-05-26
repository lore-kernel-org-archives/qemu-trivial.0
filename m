Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoqSJ-000312-0I
	for mharc-qemu-trivial@gnu.org; Mon, 26 May 2014 04:40:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqS9-0002ht-A0
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:40:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqS1-0000B8-RH
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:40:17 -0400
Received: from mail-qg0-f54.google.com ([209.85.192.54]:58804)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1WoqS1-0000An-OO
	for qemu-trivial@nongnu.org; Mon, 26 May 2014 04:40:09 -0400
Received: by mail-qg0-f54.google.com with SMTP id q108so11494429qgd.41
	for <qemu-trivial@nongnu.org>; Mon, 26 May 2014 01:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=EpFSbH5yGjsY96wINuklN+ohfpHiYw9mTV9si9r4+Mc=;
	b=jDg6ZfYl6RsPhKVA+4/1Ik3Cwvh9E++cyvYSPnloCTSA9SE7LTT6nW9JqVXSCKcq5c
	0URDkEpUY+I7xTJG3DOX2GPIXU0fw1A1PslC7adJMbSqE1OWlVV211G+/cn4UegxqXio
	JicaUY0+uw/C553AC9R7WKVTM1xtwyalda8UnY76ggkf5Hg3W/hnwzfsYA9g4IyWjMbn
	VdE/w/k6S8yUex7YFMy74BKhMgG5GYETcdjY3Z9rVuwDp8gCXPyn7aRO6lI9FJtjcJ+7
	Pmqm0MU2onQE5utVC0nJJZjONlDWb1V8mnENAAlns8fAtRPEKCcKis/dX7RPwPVXrxGS
	fJpg==
X-Gm-Message-State: ALoCoQmCJDjxS8d7Mg2qpOGltRPTRdvrjmZDV1sexeyumPFxOR4XgIds70LgBb8rL/HTxyekoByU
X-Received: by 10.140.25.166 with SMTP id 35mr28950993qgt.103.1401093609348;
	Mon, 26 May 2014 01:40:09 -0700 (PDT)
Received: from localhost ([149.199.62.254])
	by mx.google.com with ESMTPSA id 60sm7558090qgr.29.2014.05.26.01.40.08
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 26 May 2014 01:40:08 -0700 (PDT)
Sender: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: qemu-devel@nongnu.org
Date: Mon, 26 May 2014 01:37:13 -0700
Message-Id: <cover.1401092237.git.peter.crosthwaite@xilinx.com>
X-Mailer: git-send-email 1.9.3.1.ga73a6ad
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.192.54
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH trivial v2 0/4]  Cadence GEM patches
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 26 May 2014 08:40:25 -0000


Hi Michael,

Found a bug in the Cadence GEM. Fixed in P1. Have some follow up
trivials as well (P2-4).

Changed since v1:
Addressed mjt review
Dropped "top comment patch" (applied to trivial already).
Fixed other &foo[0] usages

Regards,
Peter


Peter Crosthwaite (4):
  net: cadence_gem: Fix Tx descriptor update
  net: cadence_gem: Add Tx descriptor fetch printf
  net: cadence_gem: Comment spelling sweep
  net: cadence_gem: Remove &desc[0] usages

 hw/net/cadence_gem.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

-- 
1.9.3.1.ga73a6ad


