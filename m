Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dxsl6-0000Es-4H
	for mharc-qemu-trivial@gnu.org; Fri, 29 Sep 2017 06:43:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1dxsl3-0000Cx-Hu
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 06:43:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1dxsl2-0001ct-Sm
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 06:43:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57830)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1dxsky-0001b1-L1; Fri, 29 Sep 2017 06:42:56 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 92EC883F3E;
	Fri, 29 Sep 2017 10:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 92EC883F3E
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=kraxel@redhat.com
Received: from sirius.home.kraxel.org (ovpn-116-102.ams2.redhat.com
	[10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AD72D58857;
	Fri, 29 Sep 2017 10:42:52 +0000 (UTC)
Received: from localhost (localhost [IPv6:::1])
	by sirius.home.kraxel.org (Postfix) with ESMTP id 3B8B74F980;
	Fri, 29 Sep 2017 12:42:51 +0200 (CEST)
Message-ID: <1506681771.6902.27.camel@redhat.com>
From: Gerd Hoffmann <kraxel@redhat.com>
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Fri, 29 Sep 2017 12:42:51 +0200
In-Reply-To: <20170929103411.GF26066@lemon.lan>
References: <20170920085952.3872-1-famz@redhat.com>
	<20170929103411.GF26066@lemon.lan>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 29 Sep 2017 10:42:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] usb: Use angle brackets for
 cacard include directive
X-BeenThere: qemu-trivial@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@gnu.org>
List-Help: <mailto:qemu-trivial-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@gnu.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Sep 2017 10:43:02 -0000

  Hi,

> Cc: qemu-trivial@nongnu.org

fyi: preparing usb request right now with this one included.

cheers,
  Gerd

