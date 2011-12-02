Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWQy0-00072i-2T
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2011 06:07:44 -0500
Received: from eggs.gnu.org ([140.186.70.92]:53649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RWQxs-00071q-C6
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 06:07:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RWQxm-0006cu-Rw
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 06:07:36 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:63926)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RWQxm-0006cK-GS
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 06:07:30 -0500
Received: by faaa20 with SMTP id a20so416218faa.4
	for <qemu-trivial@nongnu.org>; Fri, 02 Dec 2011 03:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=76uWzB0zl6pm0SvkVCfgSzqQhYgnSPrt4hRUeLyxz/c=;
	b=dZeEboC73Y07QjlP8U7h2+USuZDy8NMuaAD4Jdd8z48pLTBoC5le4jiEzXMBkwCEii
	R61EvLsFYLUFp4URq2wUp0LfokHIurqDmmsC9KHE8iPKYEwZJnrkQDCfERiPqzW9jlEC
	xKHktkqAIfi1GTU/59GT9jhKAXgb9t1jZ/K/w=
Received: by 10.180.104.2 with SMTP id ga2mr219742wib.33.1322824049195;
	Fri, 02 Dec 2011 03:07:29 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	em4sm9715025wbb.20.2011.12.02.03.07.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 03:07:27 -0800 (PST)
Date: Fri, 2 Dec 2011 11:07:26 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
Message-ID: <20111202110726.GA19437@stefanha-thinkpad.localdomain>
References: <1322627987-8698-1-git-send-email-wuzhy@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1322627987-8698-1-git-send-email-wuzhy@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, yamahata@valinux.co.jp,
	stefanha@linux.vnet.ibm.com
Subject: Re: [Qemu-trivial] [PATCH] pcie_aer: adjust
 do_pcie_aer_inejct_error -> do_pcie_aer_inject_error
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
X-List-Received-Date: Fri, 02 Dec 2011 11:07:41 -0000

On Wed, Nov 30, 2011 at 12:39:47PM +0800, Zhi Yong Wu wrote:
> This function name is a bit wrong. Although it doesn't impact function, it is a bit necessary that we should fixup it.
> 
> 
> Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
> ---
>  hmp-commands.hx |    2 +-
>  hw/pci-stub.c   |    2 +-
>  hw/pcie_aer.c   |    2 +-
>  sysemu.h        |    2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

