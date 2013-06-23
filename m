Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uqs0T-0000HG-MW
	for mharc-qemu-trivial@gnu.org; Sun, 23 Jun 2013 17:39:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37411)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benh@kernel.crashing.org>) id 1Uqs0R-0000EK-SZ
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 17:39:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <benh@kernel.crashing.org>) id 1Uqs0Q-0005Gk-W3
	for qemu-trivial@nongnu.org; Sun, 23 Jun 2013 17:39:31 -0400
Received: from gate.crashing.org ([63.228.1.57]:48937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <benh@kernel.crashing.org>)
	id 1Uqs0O-0005GM-U2; Sun, 23 Jun 2013 17:39:29 -0400
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id r5NLdIES014328;
	Sun, 23 Jun 2013 16:39:19 -0500
Message-ID: <1372023554.3944.111.camel@pasglop>
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Anthony Liguori <anthony@codemonkey.ws>
Date: Mon, 24 Jun 2013 07:39:14 +1000
In-Reply-To: <CA+aC4ksTsWTH23F2jXYPXGk4Ya7JD1a7Q8p7xD65vOiD57Z=qQ@mail.gmail.com>
References: <1371737338-25148-1-git-send-email-aik@ozlabs.ru>
	<874ncshh67.fsf@codemonkey.ws> <51C39578.6020204@ozlabs.ru>
	<20130623140736.GB20842@redhat.com>
	<CA+aC4ksTsWTH23F2jXYPXGk4Ya7JD1a7Q8p7xD65vOiD57Z=qQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 63.228.1.57
Cc: Anthony Liguori <aliguori@us.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel <qemu-devel@nongnu.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Paul Mackerras <paulus@samba.org>,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-ppc] [Qemu-devel] [PATCH] RFC kvm irqfd:
 add directly mapped MSI IRQ support
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
X-List-Received-Date: Sun, 23 Jun 2013 21:39:32 -0000

On Sun, 2013-06-23 at 10:02 -0500, Anthony Liguori wrote:
> It doesn't make a lot of sense to have Power do MSI decoding in
> userspace while x86 does it in the kernel.  I assume the kernel
> doesn't have enough information to do the translation on Power?

Well, it would need the host bridge which it doesn't have and it
would need a concept of mapping that to interrupt numbers which
we don't want in the kernel.

We can keep the kernel side a LOT simpler (completely avoiding
the whole route bloatware) by sticking to our "simple" direct map kernel
stuff and doing the mapping from address/data to interrupts in qemu, so
we'll stick to that.

Cheers,
Ben.



