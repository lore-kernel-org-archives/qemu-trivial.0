Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YtAYI-0004Dy-NH
	for mharc-qemu-trivial@gnu.org; Fri, 15 May 2015 04:01:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YtAYC-000414-08
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 04:01:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YtAYA-0003Ur-RF
	for qemu-trivial@nongnu.org; Fri, 15 May 2015 04:00:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YtAY5-0003Sq-He; Fri, 15 May 2015 04:00:49 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t4F80mxd029398
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 15 May 2015 04:00:48 -0400
Received: from blackfin.pond.sub.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4F80kdV005519
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 15 May 2015 04:00:47 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 8B5EF303FEAE; Fri, 15 May 2015 10:00:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
References: <1431635892-31996-1-git-send-email-sw@weilnetz.de>
Date: Fri, 15 May 2015 10:00:45 +0200
In-Reply-To: <1431635892-31996-1-git-send-email-sw@weilnetz.de> (Stefan Weil's
	message of "Thu, 14 May 2015 22:38:12 +0200")
Message-ID: <87y4kqnuc2.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developer <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] pci: Fix compiler warning
	(MinGW-w64 gcc 4.9)
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
X-List-Received-Date: Fri, 15 May 2015 08:01:01 -0000

Stefan Weil <sw@weilnetz.de> writes:

> i686-w64-mingw32-gcc 4.9.1 from Debian Jessie complains:
>
> hw/pci/pci.c:938:29: warning:
>  array subscript is above array bounds [-Warray-bounds]
>
> Using g_assert instead of assert fixes this warning.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/pci/pci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 48f19a3..34f71dc 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -927,8 +927,8 @@ void pci_register_bar(PCIDevice *pci_dev, int region_num,
>      uint64_t wmask;
>      pcibus_t size = memory_region_size(memory);
>  
> -    assert(region_num >= 0);
> -    assert(region_num < PCI_NUM_REGIONS);
> +    g_assert(region_num >= 0);
> +    g_assert(region_num < PCI_NUM_REGIONS);
>      if (size & (size-1)) {
>          fprintf(stderr, "ERROR: PCI region size must be pow2 "
>                      "type=0x%x, size=0x%"FMT_PCIBUS"\n", type, size);

This is obviously a bug in that version of MinGW.  Have you reported it?
Do we really want to work around it?

