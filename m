Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmhXM-00041v-Dk
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 05:40:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmhKq-0006E9-BM
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 05:27:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmhKp-0000ke-04
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 05:27:20 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56822)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmhKi-0000hx-Mi; Wed, 12 Jun 2013 05:27:13 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9599641368;
	Wed, 12 Jun 2013 13:27:11 +0400 (MSK)
Message-ID: <51B83EEE.9030403@msgid.tls.msk.ru>
Date: Wed, 12 Jun 2013 13:27:10 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1371022015-7576-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH 0/4 v2] header update request
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
X-List-Received-Date: Wed, 12 Jun 2013 09:27:21 -0000

12.06.2013 11:26, Alexey Kardashevskiy wrote:
> We need new headers for live migration and in-kernel interrupt controller support.
> 
> However just copying new headers breaks at least PPC so dummy kvm_arch_init_irq_routing()
> is required as well.
> 
> Changes since v1:
> * added dummy functions for ARM and S390 as they are supposed to get broken after
> the headers update;
> * now headers are from v3.10-rc5 (the previous try was for rc4).

Thank you, applied to the trivial patches queue.

Some notes:

1. I haven't tried to build it on neither PPC nor ARM nor S390,
   so I've no idea if that will work or not... ;)

2. the difference between -rc4 and rc5 is wihin mips kvm.h,
   which introduced a bunch of definitions in there.  And whole
   patchset introduces kvm definitions for mips for the first
   time.  JFYI.

/mjt

