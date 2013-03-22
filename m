Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJ0zi-0006y2-04
	for mharc-qemu-trivial@gnu.org; Fri, 22 Mar 2013 08:22:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ0zf-0006ux-4b
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:22:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UJ0zd-00056c-8v
	for qemu-trivial@nongnu.org; Fri, 22 Mar 2013 08:22:47 -0400
Received: from mail-wi0-x236.google.com ([2a00:1450:400c:c05::236]:41941)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UJ0zS-00053C-Q4; Fri, 22 Mar 2013 08:22:34 -0400
Received: by mail-wi0-f182.google.com with SMTP id hi18so4244187wib.9
	for <multiple recipients>; Fri, 22 Mar 2013 05:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=UoQyBt3yK6ZtuRtWI7UVTmk+S83+N7yxrsL4WbD14RQ=;
	b=Grfo4O9jJthix3hBnkRUk7SAuLZ9nYsw0fsyyLamrMum0VgMruT5UB0jU+YElabn9a
	kNbLluG3O/9Jbwh6YuS/chtEVgjTLvgCufMYIJtdMxisTrHErRiHo5+vfszU6daSp4di
	0L2ipHf/IVjI42xfgpZHeCZewwdx8fmoVpDqB7U7bzMGnKxs2ZsIGLIbpumlNt4YtXtE
	BP8jAcnoH4KrFb7Cf6B2sNF9EckJZZTPFbCP8JlceK//skuxtqBVShiHhhP/oMNq5zeM
	mLZw23yVR84AW3vhhf217bIJluKhd391IF71ztdSmE02j+f+2eyKWmPt6cBfiQRg5gJH
	OrUQ==
X-Received: by 10.180.79.6 with SMTP id f6mr10832241wix.26.1363954950435;
	Fri, 22 Mar 2013 05:22:30 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:81b0:6069:490c:9a88])
	by mx.google.com with ESMTPS id r7sm3181260wiz.2.2013.03.22.05.22.28
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 22 Mar 2013 05:22:29 -0700 (PDT)
Date: Fri, 22 Mar 2013 13:22:27 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hu Tao <hutao@cn.fujitsu.com>
Message-ID: <20130322122227.GB30604@stefanha-thinkpad.redhat.com>
References: <1363329121-20625-1-git-send-email-hutao@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1363329121-20625-1-git-send-email-hutao@cn.fujitsu.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::236
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] memory: fix a bug of detection of memory
 region collision
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
X-List-Received-Date: Fri, 22 Mar 2013 12:22:48 -0000

On Fri, Mar 15, 2013 at 02:32:01PM +0800, Hu Tao wrote:
> The collision reports before and after this patch are:
> 
> before:
> 
> warning: subregion collision cfc/4 (pci-conf-data) vs cf8/4 (pci-conf-idx)
> warning: subregion collision 8000000/f8000000 (pci-hole) vs 0/8000000 (ram-below-4g)
> warning: subregion collision 100000000/4000000000000000 (pci-hole64) vs 8000000/f8000000 (pci-hole)
> warning: subregion collision 4d1/1 (kvm-elcr) vs 4d0/1 (kvm-elcr)
> warning: subregion collision fec00000/1000 (kvm-ioapic) vs 8000000/f8000000 (pci-hole)
> warning: subregion collision 80/1 (ioport80) vs 7e/2 (kvmvapic)
> warning: subregion collision fed00000/400 (hpet) vs 8000000/f8000000 (pci-hole)
> warning: subregion collision 81/3 (dma-page) vs 80/1 (ioport80)
> warning: subregion collision 8/8 (dma-cont) vs 0/8 (dma-chan)
> warning: subregion collision d0/10 (dma-cont) vs c0/10 (dma-chan)
> warning: subregion collision 0/80 (ich9-pm) vs 8/8 (dma-cont)
> warning: subregion collision 0/80 (ich9-pm) vs 0/8 (dma-chan)
> warning: subregion collision 0/80 (ich9-pm) vs 64/1 (i8042-cmd)
> warning: subregion collision 0/80 (ich9-pm) vs 60/1 (i8042-data)
> warning: subregion collision 0/80 (ich9-pm) vs 61/1 (elcr)
> warning: subregion collision 0/80 (ich9-pm) vs 40/4 (kvm-pit)
> warning: subregion collision 0/80 (ich9-pm) vs 70/2 (rtc)
> warning: subregion collision 0/80 (ich9-pm) vs 20/2 (kvm-pic)
> warning: subregion collision 0/80 (ich9-pm) vs 7e/2 (kvmvapic)
> warning: subregion collision 4/2 (acpi-cnt) vs 0/4 (acpi-evt)
> warning: subregion collision 30/8 (apci-smi) vs 20/10 (apci-gpe0)
> warning: subregion collision b0000000/10000000 (pcie-mmcfg) vs 8000000/f8000000 (pci-hole)
> 
> after:
> 
> warning: subregion collision fec00000/1000 (kvm-ioapic) vs 8000000/f8000000 (pci-hole)
> warning: subregion collision fed00000/400 (hpet) vs 8000000/f8000000 (pci-hole)
> warning: subregion collision 0/80 (ich9-pm) vs 8/8 (dma-cont)
> warning: subregion collision 0/80 (ich9-pm) vs 0/8 (dma-chan)
> warning: subregion collision 0/80 (ich9-pm) vs 64/1 (i8042-cmd)
> warning: subregion collision 0/80 (ich9-pm) vs 60/1 (i8042-data)
> warning: subregion collision 0/80 (ich9-pm) vs 61/1 (elcr)
> warning: subregion collision 0/80 (ich9-pm) vs 40/4 (kvm-pit)
> warning: subregion collision 0/80 (ich9-pm) vs 70/2 (rtc)
> warning: subregion collision 0/80 (ich9-pm) vs 20/2 (kvm-pic)
> warning: subregion collision 0/80 (ich9-pm) vs 7e/2 (kvmvapic)
> warning: subregion collision b0000000/10000000 (pcie-mmcfg) vs 8000000/f8000000 (pci-hole)
> 
> Signed-off-by: Hu Tao <hutao@cn.fujitsu.com>
> ---
>  memory.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

The int128_le() comparison below suggests that int128_gt() really should
be int128_ge().

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

