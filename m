Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwBzZ-0000XW-GB
	for mharc-qemu-trivial@gnu.org; Thu, 06 Apr 2017 14:18:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37236)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1cwBzX-0000Vj-Nn
	for qemu-trivial@nongnu.org; Thu, 06 Apr 2017 14:18:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1cwBzW-0002Jl-Sx
	for qemu-trivial@nongnu.org; Thu, 06 Apr 2017 14:18:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1cwBzS-0002IJ-M8; Thu, 06 Apr 2017 14:18:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 65EB97D0D7;
	Thu,  6 Apr 2017 18:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 65EB97D0D7
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=kwolf@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 65EB97D0D7
Received: from noname.redhat.com (ovpn-117-62.ams2.redhat.com [10.36.117.62])
	by smtp.corp.redhat.com (Postfix) with SMTP id B615917B88;
	Thu,  6 Apr 2017 18:18:34 +0000 (UTC)
Date: Thu, 6 Apr 2017 20:18:33 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Jeff Cody <jcody@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, berrange@redhat.com,
	mreitz@redhat.com
Message-ID: <20170406181833.GN4341@noname.redhat.com>
References: <433d922c5ad43020493323c5e065b4c4ef4157ab.1491500481.git.jcody@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <433d922c5ad43020493323c5e065b4c4ef4157ab.1491500481.git.jcody@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 06 Apr 2017 18:18:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH 1/1] qemu-img: img_create does not
 support image-opts, fix docs
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
X-List-Received-Date: Thu, 06 Apr 2017 18:18:44 -0000

Am 06.04.2017 um 19:45 hat Jeff Cody geschrieben:
> The documentation and help for qemu-img claims that 'qemu-img create'
> will take the '--image-opts' argument.  This is not true, so this
> patch removes those claims.
> 
> Signed-off-by: Jeff Cody <jcody@redhat.com>

Thanks, applied to the block branch.

Kevin

