Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X04BX-0005FT-EI
	for mharc-qemu-trivial@gnu.org; Thu, 26 Jun 2014 03:33:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1X04BP-00055Y-2r
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 03:33:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1X04BH-00076U-Ce
	for qemu-trivial@nongnu.org; Thu, 26 Jun 2014 03:33:23 -0400
Received: from oxygen.pond.sub.org ([144.76.244.19]:42229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1X04B2-0006oo-3i; Thu, 26 Jun 2014 03:33:00 -0400
Received: from blackfin.pond.sub.org (p5B3299DC.dip0.t-ipconnect.de
	[91.50.153.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by oxygen.pond.sub.org (Postfix) with ESMTPSA id 2260925471;
	Thu, 26 Jun 2014 09:32:58 +0200 (CEST)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5114E30403AF; Thu, 26 Jun 2014 09:32:57 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <1403720497-5318-1-git-send-email-pbonzini@redhat.com>
Date: Thu, 26 Jun 2014 09:32:57 +0200
In-Reply-To: <1403720497-5318-1-git-send-email-pbonzini@redhat.com> (Paolo
	Bonzini's message of "Wed, 25 Jun 2014 20:21:37 +0200")
Message-ID: <877g442kie.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 144.76.244.19
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kraxel@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] serial-pci: remove memory
	regions from BAR before destroying them
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
X-List-Received-Date: Thu, 26 Jun 2014 07:33:30 -0000

Paolo Bonzini <pbonzini@redhat.com> writes:

> Otherwise, hot-unplug of pci-serial-2x trips the assertion
> in memory_region_destroy:
>
>     (qemu) device_del gg
>     (qemu) qemu-system-x86_64: /work/armbru/tmp/qemu/memory.c:1021: memory_region_destroy: Assertion `((&mr->subregions)->tqh_first == ((void *)0))' failed.
>     Aborted (core dumped)
>
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

Would it make sense to add a "must not contain subregions" to
memory_region_destroy()'s function comment?

