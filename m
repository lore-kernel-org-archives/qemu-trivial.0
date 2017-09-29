Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dxt1D-0006YO-M6
	for mharc-qemu-trivial@gnu.org; Fri, 29 Sep 2017 06:59:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dxt1B-0006XK-Os
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 06:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dxt1B-0000Sk-4f
	for qemu-trivial@nongnu.org; Fri, 29 Sep 2017 06:59:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46496)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dxt16-0000Pi-TA; Fri, 29 Sep 2017 06:59:37 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C9FA583F3E;
	Fri, 29 Sep 2017 10:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C9FA583F3E
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=famz@redhat.com
Received: from localhost (ovpn-12-120.pek2.redhat.com [10.72.12.120])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3063C6061D;
	Fri, 29 Sep 2017 10:59:33 +0000 (UTC)
Date: Fri, 29 Sep 2017 18:59:31 +0800
From: Fam Zheng <famz@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170929105931.GG26066@lemon.lan>
References: <20170920085952.3872-1-famz@redhat.com>
	<20170929103411.GF26066@lemon.lan>
	<1506681771.6902.27.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1506681771.6902.27.camel@redhat.com>
User-Agent: Mutt/1.9.0 (2017-09-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 29 Sep 2017 10:59:35 +0000 (UTC)
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
X-List-Received-Date: Fri, 29 Sep 2017 10:59:42 -0000

On Fri, 09/29 12:42, Gerd Hoffmann wrote:
>   Hi,
> 
> > Cc: qemu-trivial@nongnu.org
> 
> fyi: preparing usb request right now with this one included.

Cool, thanks!

Fam

