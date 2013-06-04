Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjyKS-0005vb-RF
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:59:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjyKQ-0005sH-Fa
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjyKP-0000hO-MO
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:59:38 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:43488)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1UjyKN-0000gw-M3; Tue, 04 Jun 2013 16:59:35 -0400
Received: from zmail15.collab.prod.int.phx2.redhat.com
	(zmail15.collab.prod.int.phx2.redhat.com [10.5.83.17])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id r54KxYkF000880;
	Tue, 4 Jun 2013 16:59:34 -0400
Date: Tue, 4 Jun 2013 16:59:34 -0400 (EDT)
From: Alon Levy <alevy@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <1906731494.14304293.1370379574347.JavaMail.root@redhat.com>
In-Reply-To: <51AE5249.3060401@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<1370377419-31788-2-git-send-email-alevy@redhat.com>
	<51AE5249.3060401@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.5.82.11]
X-Mailer: Zimbra 8.0.3_GA_5664 (ZimbraWebClient - FF21 (Linux)/8.0.3_GA_5664)
Thread-Topic: use qemu_pipe_non_block
Thread-Index: m75nERdEBt9l8kArMZKa7XCpt33cIw==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/5] use qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 20:59:39 -0000

> Il 04/06/2013 22:23, Alon Levy ha scritto:
> > This fixes six instances of unchecked fcntl return status, spotted by
> > Coverity.
> 
> I think we're just assuming that they cannot fail...  I don't think we
> need the previous patch and this one, unless they help porting stuff to
> Windows.

This was purely to satisfy coverity, but I thought we would want to check fcntl return status? also, shouldn't we be looping if EINTR?

> 
> Paolo
> 
> 

