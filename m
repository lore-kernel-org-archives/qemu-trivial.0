Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UnR79-0003Xg-1L
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jun 2013 06:20:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48750)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnR77-0003V5-8j
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:20:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UnR75-0002m4-Tc
	for qemu-trivial@nongnu.org; Fri, 14 Jun 2013 06:20:13 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UnR6w-0002Yg-Pr; Fri, 14 Jun 2013 06:20:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id B8FDB4165A;
	Fri, 14 Jun 2013 14:20:01 +0400 (MSK)
Message-ID: <51BAEE51.8040908@msgid.tls.msk.ru>
Date: Fri, 14 Jun 2013 14:20:01 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
In-Reply-To: <1371047245-19221-1-git-send-email-aik@ozlabs.ru>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
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
X-List-Received-Date: Fri, 14 Jun 2013 10:20:14 -0000

12.06.2013 18:27, Alexey Kardashevskiy wrote:
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  MAINTAINERS |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 13c0cc5..1e00bb1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -430,6 +430,7 @@ F: hw/isa/pc87312.[hc]
>  sPAPR
>  M: David Gibson <david@gibson.dropbear.id.au>
>  M: Alexander Graf <agraf@suse.de>
> +M: Alexey Kardashevskiy <aik@ozlabs.ru>

Since apparently there was no objections, I'm applying this to -trivial.
However, such things, even if trivial, are better be handled via the
corresponding arch tree (in this case the ppc tree).

Thanks,

/mjt

