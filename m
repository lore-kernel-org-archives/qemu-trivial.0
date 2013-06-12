Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Umm76-00010q-0M
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 10:33:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57791)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Umm74-0000xj-3N
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 10:33:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1Umm73-0005Sc-1z
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 10:33:26 -0400
Received: from cantor2.suse.de ([195.135.220.15]:41856 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1Umm6y-0005QW-4V; Wed, 12 Jun 2013 10:33:20 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 25333A3B99;
	Wed, 12 Jun 2013 16:33:16 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: text/plain; charset=us-ascii
From: Alexander Graf <agraf@suse.de>
In-Reply-To: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
Date: Wed, 12 Jun 2013 16:33:14 +0200
Content-Transfer-Encoding: 7bit
Message-Id: <9CFAF006-9051-4997-9213-1BD87191EE9E@suse.de>
References: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
X-Mailer: Apple Mail (2.1278)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH] spapr: add yet another maintainer
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
X-List-Received-Date: Wed, 12 Jun 2013 14:33:27 -0000


On 12.06.2013, at 16:27, Alexey Kardashevskiy wrote:

> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
> MAINTAINERS |    1 +
> 1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 13c0cc5..1e00bb1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -430,6 +430,7 @@ F: hw/isa/pc87312.[hc]
> sPAPR
> M: David Gibson <david@gibson.dropbear.id.au>

David should get removed here then, no?


Alex

> M: Alexander Graf <agraf@suse.de>
> +M: Alexey Kardashevskiy <aik@ozlabs.ru>
> L: qemu-ppc@nongnu.org
> S: Supported
> F: hw/*/spapr*
> -- 
> 1.7.10.4
> 


