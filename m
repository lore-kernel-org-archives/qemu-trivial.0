Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwva0-0002sL-SW
	for mharc-qemu-trivial@gnu.org; Tue, 26 Sep 2017 15:31:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dwvZy-0002r6-DR
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 15:31:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dwvZx-0005K4-CR
	for qemu-trivial@nongnu.org; Tue, 26 Sep 2017 15:31:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39296)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dwvZt-0005Hr-2e; Tue, 26 Sep 2017 15:31:33 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 09DDB5AFED;
	Tue, 26 Sep 2017 19:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 09DDB5AFED
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=mst@redhat.com
Received: from redhat.com (ovpn-122-9.rdu2.redhat.com [10.10.122.9])
	by smtp.corp.redhat.com (Postfix) with SMTP id A49AA17B0F;
	Tue, 26 Sep 2017 19:31:28 +0000 (UTC)
Date: Tue, 26 Sep 2017 22:31:23 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
	Victor Kaplansky <victork@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Message-ID: <20170926223046-mutt-send-email-mst@kernel.org>
References: <1506049617-25716-1-git-send-email-thuth@redhat.com>
	<513bbb2d-280b-92f8-b45f-89963f7118e2@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <513bbb2d-280b-92f8-b45f-89963f7118e2@msgid.tls.msk.ru>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 26 Sep 2017 19:31:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] tests/boot-sector: Increase timeout to
 600 seconds
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
X-List-Received-Date: Tue, 26 Sep 2017 19:31:39 -0000

On Mon, Sep 25, 2017 at 12:06:40AM +0300, Michael Tokarev wrote:
> 22.09.2017 06:06, Thomas Huth wrote:
> > If QEMU has been compiled with the flags --enable-tcg-interpreter and
> > --enable-debug, the guest is running incredibly slow. The pxe boot test
> > can take up to 400 seconds when testing the pseries ppc64 machine. While
> > we should still look for ways to speed up the test on the pseries machine,
> > it's better to increase the timeout in this test to 600 seconds anyway to
> > allow the test to pass successfully now with this unusal configuration
> > already.
> 
> Applied to -trivial, thanks!
> 
> /mjt

Please do not apply this, trivial is not appropriate for functional
changes like this.


