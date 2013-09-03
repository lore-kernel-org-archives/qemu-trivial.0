Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGt0M-0005N6-GH
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 11:58:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1VGt0G-0005G2-MJ
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:58:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1VGt0B-000423-HN
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:58:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:31781)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>)
	id 1VGt01-000413-7d; Tue, 03 Sep 2013 11:58:37 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r83FwXBc004418
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 3 Sep 2013 11:58:33 -0400
Received: from [10.3.113.8] ([10.3.113.8])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r83FwWZq009763; Tue, 3 Sep 2013 11:58:33 -0400
Message-ID: <1378223912.3246.36.camel@ul30vt.home>
From: Alex Williamson <alex.williamson@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Date: Tue, 03 Sep 2013 09:58:32 -0600
In-Reply-To: <5226048E.2090004@ozlabs.ru>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru>
	<CAFEAcA8b26fm17sUZ=aUeETVD9q2AahkXQDLQWuRJGM9JMMqkQ@mail.gmail.com>
	<5226048E.2090004@ozlabs.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
	Gleb Natapov <gleb@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-headers: update to
	3.11
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
X-List-Received-Date: Tue, 03 Sep 2013 15:58:57 -0000

On Wed, 2013-09-04 at 01:47 +1000, Alexey Kardashevskiy wrote:
> On 09/04/2013 01:34 AM, Peter Maydell wrote:
> > On 3 September 2013 16:28, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
> >> On 09/03/2013 08:42 PM, Jan Kiszka wrote:
> >>> This shouldn't be routed through trivial in general as things broke too
> >>> often in this area.
> >>
> >>
> >> Sorry for my ignorance, but this is The Kernel, it is already there, broken
> >> or not, even if it is broken, qemu cannot stay isolated, no?
> >> This is a mechanical change, no more.
> > 
> > The classic way for things to break is that a header
> > update accidentally reverts something (because a
> > previous update was from kvm-next and this one is
> > from mainline, for example). Accidental updates against
> > a kernel which is neither kvm-next nor mainline are
> > the other common "broken" version of a header update
> > patch.
> 
> I can understand that but this update is a mainline kernel update and it is
> not an accidental one but very specific :-/

I was under the impression that we were only ever updating linux-headers
from mainline, never from kvm-next.  Therefore any mainline tag should
be a reasonable re-base target.  Thanks,

Alex


