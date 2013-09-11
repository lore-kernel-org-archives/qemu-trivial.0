Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VJmMI-0004TN-U1
	for mharc-qemu-trivial@gnu.org; Wed, 11 Sep 2013 11:29:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VJmMC-0004SR-AJ
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VJmM6-00065b-3N
	for qemu-trivial@nongnu.org; Wed, 11 Sep 2013 11:29:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45878)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VJmM5-00065Q-RY; Wed, 11 Sep 2013 11:29:22 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8BFTFrk004550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 11 Sep 2013 11:29:16 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-54.ams2.redhat.com
	[10.36.112.54])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8BFTCLu018434; Wed, 11 Sep 2013 11:29:13 -0400
Message-ID: <52308C52.5090001@redhat.com>
Date: Wed, 11 Sep 2013 17:29:22 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Gabriel Kerneis <gabriel@kerneis.info>
References: <1378906912-14015-1-git-send-email-gabriel@kerneis.info>
	<523077CE.6070303@redhat.com> <20130911144230.GA15227@kerneis.info>
	<523083EF.7050203@redhat.com> <20130911150137.GC15227@kerneis.info>
	<52308701.1020706@redhat.com> <20130911151628.GB22569@kerneis.info>
	<20130911152327.GC22569@kerneis.info>
In-Reply-To: <20130911152327.GC22569@kerneis.info>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Quote extra_cflags in
	config-host.mak
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
X-List-Received-Date: Wed, 11 Sep 2013 15:29:34 -0000

Il 11/09/2013 17:23, Gabriel Kerneis ha scritto:
> On Wed, Sep 11, 2013 at 04:16:28PM +0100, Gabriel Kerneis wrote:
>>> > > Yeah, what I'm missing now is why your patch works.
>> > 
>> > That is indeed very mysterious :-)
> Okay, the answer is simple enough: it doesn't fix the issue at all.
> Long story short, I had a sed script to rewrite the faulty extra_cflags=
> line but I did not realize it *also* fixed the "Configured with:" line!
> Then turned that into a patch for QEMU, and didn't test it thoroughly
> enough, with the aforementioned chicken-and-egg issue.
> 
> Oh well, please ignore this whole thread. I'll fix it properly tomorrow.

No problem at all, it happens.

Shell is boring, let's go shopping.

Paolo

