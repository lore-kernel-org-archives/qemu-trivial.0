Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnRFM-0005zP-1L
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:28:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1UnRFK-0005wp-3d
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:28:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1UnRFJ-0005Rc-8h
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:28:42 -0400
Received: from cantor2.suse.de ([195.135.220.15]:39699 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1UnRFF-0005Qc-6L; Fri, 14 Jun 2013 06:28:37 -0400
Received: from relay1.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 28BCEA51BB;
	Fri, 14 Jun 2013 12:28:33 +0200 (CEST)
References: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
	<51BAEE51.8040908@msgid.tls.msk.ru>
Mime-Version: 1.0 (1.0)
In-Reply-To: <51BAEE51.8040908@msgid.tls.msk.ru>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <4538BE8A-362A-45B2-9FFB-FEC990246781@suse.de>
X-Mailer: iPhone Mail (10B142)
From: Alexander Graf <agraf@suse.de>
Date: Fri, 14 Jun 2013 12:28:32 +0200
To: Michael Tokarev <mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
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
X-List-Received-Date: Fri, 14 Jun 2013 10:28:43 -0000



Am 14.06.2013 um 12:20 schrieb Michael Tokarev <mjt@tls.msk.ru>:

> 12.06.2013 18:27, Alexey Kardashevskiy wrote:
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>> MAINTAINERS |    1 +
>> 1 file changed, 1 insertion(+)
>> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 13c0cc5..1e00bb1 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -430,6 +430,7 @@ F: hw/isa/pc87312.[hc]
>> sPAPR
>> M: David Gibson <david@gibson.dropbear.id.au>
>> M: Alexander Graf <agraf@suse.de>
>> +M: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Since apparently there was no objections, I'm applying this to -trivial.
> However, such things, even if trivial, are better be handled via the
> corresponding arch tree (in this case the ppc tree).

There were objections and this has to go via the ppc tree.

Alex

> 
> Thanks,
> 
> /mjt

