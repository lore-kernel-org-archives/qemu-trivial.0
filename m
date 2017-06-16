Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dLtye-0001K1-Um
	for mharc-qemu-trivial@gnu.org; Fri, 16 Jun 2017 12:20:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57780)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dLtyd-0001Gv-8K
	for qemu-trivial@nongnu.org; Fri, 16 Jun 2017 12:20:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1dLtyc-0004pA-HH
	for qemu-trivial@nongnu.org; Fri, 16 Jun 2017 12:20:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1dLtyX-0004mT-Ac; Fri, 16 Jun 2017 12:19:57 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AC5AB174;
	Fri, 16 Jun 2017 16:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3AC5AB174
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=kwolf@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3AC5AB174
Received: from noname.fritz.box (ovpn-116-180.ams2.redhat.com [10.36.116.180])
	by smtp.corp.redhat.com (Postfix) with SMTP id DF1929CB6B;
	Fri, 16 Jun 2017 16:19:54 +0000 (UTC)
Date: Fri, 16 Jun 2017 18:19:54 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Message-ID: <20170616161954.GD4366@noname.fritz.box>
References: <1495486409-5197-1-git-send-email-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1495486409-5197-1-git-send-email-thuth@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 16 Jun 2017 16:19:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-doc: Move the qemu-ga
 description into a separate chapter
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
X-List-Received-Date: Fri, 16 Jun 2017 16:20:04 -0000

Am 22.05.2017 um 22:53 hat Thomas Huth geschrieben:
> The qemu-ga description is currently a subsection of the Disk Images
> chapter - which does not make much sense since the qemu-ga is not
> directly related to disk images. So let's move this information
> into a separate chapter instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

This patch messed up the start of the manpage (qemu.1).

It refers to "qemu-ga - QEMU Guest Agent" now and the synopsis section
includes the description of a part of the targets as well as some
literal texinfo code.

Kevin

