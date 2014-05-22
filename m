Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnSQM-0001jt-Pu
	for mharc-qemu-trivial@gnu.org; Thu, 22 May 2014 08:48:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WnSQC-0001Yo-PN
	for qemu-trivial@nongnu.org; Thu, 22 May 2014 08:48:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WnSQ3-0004Ww-IY
	for qemu-trivial@nongnu.org; Thu, 22 May 2014 08:48:32 -0400
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235]:61465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WnSPl-0004RJ-98; Thu, 22 May 2014 08:48:05 -0400
Received: by mail-ee0-f53.google.com with SMTP id c13so2632390eek.12
	for <multiple recipients>; Thu, 22 May 2014 05:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=0eQUVDYHEA6tJU1cVcnxRpEgHcMR3lrObmuVfDwcrVo=;
	b=suwFi0x5cl0okxjpdzhc7gAXhoeRwHyfurj4lk0JjZIl0gUnwHEpVPOYu1YPiTL3se
	IFaUXHfqjADR8oltBk0pR3gLELiEs3EDKJHVOGuMXIia3vQbE2czrEW/6R4iZDetW2+p
	PavPFKyC9R3FHVVIkz9M0cDtjwQvlmDHc/eoFaYUa8ebUhydq+MoxE5UIItKZXh8SeH3
	inFETSdrZP6vccDW00mdfpXOc7I4WMVobVG3uryXMmHA0Lw/dE5l3wmryfmlOB68gGjt
	r6o3WQgN5c/Ob8WAGjMY6lc8VrXe64v2jrKmMtXcKvoRx2gqz8nrwj5rvpVw+rwbTmoy
	ZeYg==
X-Received: by 10.14.127.9 with SMTP id c9mr3276340eei.93.1400762883765;
	Thu, 22 May 2014 05:48:03 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-117-141-58.cust.vodafonedsl.it.
	[37.117.141.58])
	by mx.google.com with ESMTPSA id a41sm274715eef.30.2014.05.22.05.48.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 May 2014 05:48:02 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <537DF1FF.3000101@redhat.com>
Date: Thu, 22 May 2014 14:47:59 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Saravanakumar <saravanakumar.punith@gmail.com>, 
 qemu-devel@nongnu.org
References: <1400758430-32697-1-git-send-email-saravanakumar.punith@gmail.com>
In-Reply-To: <1400758430-32697-1-git-send-email-saravanakumar.punith@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::235
Cc: qemu-trivial@nongnu.org, mst@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] pci: move dereferencing of root only
 after verifying valid root pointer.
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
X-List-Received-Date: Thu, 22 May 2014 12:48:41 -0000

Il 22/05/2014 13:33, Saravanakumar ha scritto:
> Move dereferencing of root only after verifying valid root pointer.
>
>
> Signed-off-by: Saravanakumar <saravanakumar.punith@gmail.com>
> ---
>  hw/pci/pci.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
> index 22fe5ee..8d6a8d4 100644
> --- a/hw/pci/pci.c
> +++ b/hw/pci/pci.c
> @@ -605,13 +605,13 @@ PCIBus *pci_get_bus_devfn(int *devfnp, PCIBus *root, const char *devaddr)
>      int dom, bus;
>      unsigned slot;
>
> -    assert(!root->parent_dev);
> -
>      if (!root) {
>          fprintf(stderr, "No primary PCI bus\n");
>          return NULL;
>      }
>
> +    assert(!root->parent_dev);
> +
>      if (!devaddr) {
>          *devfnp = -1;
>          return pci_find_bus_nr(root, 0);
>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

