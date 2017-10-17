Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4TcK-0005GK-Lu
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 11:17:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1e4TcI-0005EX-Ha
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 11:17:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1e4TcH-0002bx-KB
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 11:17:14 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1e4Tc9-0002XE-90; Tue, 17 Oct 2017 11:17:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA357356F3;
	Tue, 17 Oct 2017 15:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BA357356F3
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=cohuck@redhat.com
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C131D617BB;
	Tue, 17 Oct 2017 15:16:32 +0000 (UTC)
Date: Tue, 17 Oct 2017 17:16:29 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Ladi Prosek <lprosek@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Chubb <peter.chubb@nicta.com.au>, Christian
	Borntraeger <borntraeger@de.ibm.com>, Riku Voipio <riku.voipio@iki.fi>, 
	Laurent Vivier <laurent@vivier.eu>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Eduardo
	Habkost <ehabkost@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20171017171629.1b2aa212.cohuck@redhat.com>
In-Reply-To: <3651bc50-e8f4-8aa3-fff4-462ac7a7ff05@redhat.com>
References: <20171017144051.8452-1-lprosek@redhat.com>
	<3651bc50-e8f4-8aa3-fff4-462ac7a7ff05@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 17 Oct 2017 15:17:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH trivial] Remove empty statements
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
X-List-Received-Date: Tue, 17 Oct 2017 15:17:15 -0000

On Tue, 17 Oct 2017 16:50:41 +0200
Laszlo Ersek <lersek@redhat.com> wrote:

> On 10/17/17 16:40, Ladi Prosek wrote:
> > Thanks to Laszlo Ersek for spotting the double semicolon in target/i386/kvm.c
> > 
> > I have trivially grepped the tree for ';;' in C files.
> > 
> > Suggested-by: Laszlo Ersek <lersek@redhat.com>
> > Signed-off-by: Ladi Prosek <lprosek@redhat.com>
> > ---
> >  hw/misc/imx6_ccm.c     | 2 +-
> >  hw/s390x/virtio-ccw.c  | 2 +-
> >  linux-user/signal.c    | 2 +-
> >  migration/block.c      | 2 +-
> >  target/i386/cpu.c      | 2 +-
> >  target/i386/kvm.c      | 2 +-
> >  target/sh4/translate.c | 2 +-
> >  7 files changed, 7 insertions(+), 7 deletions(-)  
> 
> I've run "get_maintainer.pl" on the above files, and added some CCs.
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Trivial ;) enough, but

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

