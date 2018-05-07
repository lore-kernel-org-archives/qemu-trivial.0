Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fFcs7-0002Jy-GF
	for mharc-qemu-trivial@gnu.org; Mon, 07 May 2018 05:55:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fFcs3-0002GA-NN
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 05:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fFcry-0005I8-Bl
	for qemu-trivial@nongnu.org; Mon, 07 May 2018 05:55:51 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41636 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fFcru-0005B1-6d; Mon, 07 May 2018 05:55:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C98F410FBB6;
	Mon,  7 May 2018 09:55:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-99.ams2.redhat.com
	[10.36.116.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 451812023227;
	Mon,  7 May 2018 09:55:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 9B73F51BA5; Mon,  7 May 2018 11:55:39 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>
Date: Mon,  7 May 2018 11:55:35 +0200
Message-Id: <20180507095539.19584-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 07 May 2018 09:55:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 07 May 2018 09:55:41 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-trivial] [PATCH v2 0/4] ui: use qapi-based parser for most
 -display options.
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
X-List-Received-Date: Mon, 07 May 2018 09:55:54 -0000

v2: rebase, adapt to gl= option changes.

Gerd Hoffmann (4):
  ui: add qapi parser for -display
  ui: switch trivial displays to qapi parser
  ui: switch gtk display to qapi parser
  ui: document non-qapi parser cases.

 ui/gtk.c |  6 ++++-
 vl.c     | 76 ++++++++++++++++++++++++++++++----------------------------------
 2 files changed, 41 insertions(+), 41 deletions(-)

-- 
2.9.3


