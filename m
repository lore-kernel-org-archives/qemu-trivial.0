Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VM9kZ-0004Lv-C0
	for mharc-qemu-trivial@gnu.org; Wed, 18 Sep 2013 00:52:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1VM9kS-0004CX-HN
	for qemu-trivial@nongnu.org; Wed, 18 Sep 2013 00:52:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gleb@redhat.com>) id 1VM9kM-0004TN-IN
	for qemu-trivial@nongnu.org; Wed, 18 Sep 2013 00:52:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58904)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gleb@redhat.com>)
	id 1VM9kA-00048B-3L; Wed, 18 Sep 2013 00:52:02 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8I4pugU032061
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 18 Sep 2013 00:51:57 -0400
Received: from dhcp-1-237.tlv.redhat.com (dhcp-4-97.tlv.redhat.com
	[10.35.4.97])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8I4ppNb006293; Wed, 18 Sep 2013 00:51:52 -0400
Received: by dhcp-1-237.tlv.redhat.com (Postfix, from userid 13519)
	id B7B9E18D39D; Wed, 18 Sep 2013 07:51:49 +0300 (IDT)
Date: Wed, 18 Sep 2013 07:51:49 +0300
From: Gleb Natapov <gleb@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <20130918045149.GC5657@redhat.com>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru> <522601AB.1050901@redhat.com>
	<5227F79B.8090804@ozlabs.ru> <52281F93.4070805@redhat.com>
	<52391821.1050004@ozlabs.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52391821.1050004@ozlabs.ru>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
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
X-List-Received-Date: Wed, 18 Sep 2013 04:52:26 -0000

On Wed, Sep 18, 2013 at 01:04:01PM +1000, Alexey Kardashevskiy wrote:
> On 09/05/2013 04:07 PM, Paolo Bonzini wrote:
> > Il 05/09/2013 05:16, Alexey Kardashevskiy ha scritto:
> >>>>>> Sorry for my ignorance, but this is The Kernel, it is already there, broken
> >>>>>> or not, even if it is broken, qemu cannot stay isolated, no?
> >>>>>> This is a mechanical change, no more.
> >>>>
> >>>> It's a matter of keeping things bisectable.  If we can detect a
> >>>> breakage, we can first work around it, and then apply the header update.
> >>>>  And if we don't detect it, maintainers usually send pull requests when
> >>>> they have time to work on breakage caused by their patches.
> >>
> >> I can see the discussion but I do not see if anyone is going to pull this
> >> through any tree. Please, somebody, pull. Thanks.
> > 
> > It will go in through the KVM tree, probably sometime next week.
> 
> 
> It is pretty impressive how such a trivial patch is still on its way to the
> upstream :)
> 
It was applied long time ago
https://git.kernel.org/cgit/virt/kvm/qemu-kvm.git/commit/?h=uq/master&id=8c409e659bc1373fab49a277bb5dc71babb73551

Sync with qemu.git does not happen after every patch though. If you are
working on kvm parts using qemu-kvm.git uq/master branch will make sure
that you are working on most up to date kvm bits. If you work depends on
something that is not in qemu-kvm.git then let kvm maintainers know and
we will send pull request to Anthony earlier.

--
			Gleb.

