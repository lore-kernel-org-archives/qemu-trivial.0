Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK7g2-00059y-Sz
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 09:10:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK7fv-0004v9-Vn
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:10:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK7fp-0001jG-M7
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 09:10:43 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:52233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK7fp-0001hh-C1; Fri, 05 Oct 2012 09:10:37 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so789467bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 06:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jRgHTnvKbtZn21cCKchYsAHEwlLCdPsSQ4vm6yMzRhs=;
	b=sbazftXL5P9HBvpgqnxwRnAJ+ajNOpIiEKWH004nMvAYqfp0IuVRM3sObF8BK+6aNl
	6zbHyD2Ew4WXGmHImi6KV81sGhs24wDjrgPgLHv+zy34OY/UPJL82/YXggO3VJkf8WJ+
	psKmBZsNc1aZaVGhxMKCTxAIp2Y/4Sh+AJztbn8E2f/9SXo/ALOc/0sWKMSAu+hmIlfu
	6guf4FDpcdCimBrXQQmpE8C2k6qE1GJXUbWiUZPv1hvQLevg1mp0OPd9IiQeP+An3wpW
	IALXieijqO8+mPemYO+hfz95h0UNZX9M3K5+T0Cl6rVWQB9XhjnO/bzp9H4jWT8EN/PT
	+zmA==
Received: by 10.204.153.28 with SMTP id i28mr2743230bkw.19.1349442636407;
	Fri, 05 Oct 2012 06:10:36 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id m19sm7653423bkm.8.2012.10.05.06.10.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 06:10:35 -0700 (PDT)
Date: Fri, 5 Oct 2012 15:10:32 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Amos Kong <akong@redhat.com>
Message-ID: <20121005131032.GF10951@stefanha-thinkpad.redhat.com>
References: <1348896981-7558-1-git-send-email-akong@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348896981-7558-1-git-send-email-akong@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] cleanup useless return sentence
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
X-List-Received-Date: Fri, 05 Oct 2012 13:10:49 -0000

On Sat, Sep 29, 2012 at 01:36:21PM +0800, Amos Kong wrote:
> This patch cleans up return sentences in the end of void functions.
> 
> Reported-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  block/qed-table.c            |    1 -
>  blockdev.c                   |    1 -
>  hw/9pfs/virtio-9p.c          |    5 -----
>  hw/blizzard.c                |    2 --
>  hw/bt-hci.c                  |    1 -
>  hw/device-hotplug.c          |    1 -
>  hw/exynos4210_combiner.c     |    4 ----
>  hw/exynos4210_gic.c          |    4 ----
>  hw/exynos4210_mct.c          |    2 --
>  hw/fdc.c                     |    2 --
>  hw/framebuffer.c             |    1 -
>  hw/ide/macio.c               |    1 -
>  hw/ivshmem.c                 |    4 ----
>  hw/megasas.c                 |    1 -
>  hw/msix.c                    |    1 -
>  hw/pflash_cfi01.c            |    1 -
>  hw/pflash_cfi02.c            |    1 -
>  hw/pxa2xx_keypad.c           |    1 -
>  hw/sb16.c                    |    1 -
>  hw/scsi-disk.c               |    2 --
>  hw/tcx.c                     |    1 -
>  hw/usb/dev-uas.c             |    2 --
>  hw/usb/hcd-ohci.c            |    2 --
>  hw/usb/hcd-xhci.c            |    1 -
>  hw/xen_domainbuild.c         |    1 -
>  libcacard/vcard.c            |    1 -
>  libcacard/vcard_emul_nss.c   |    3 ---
>  libcacard/vreader.c          |    1 -
>  linux-user/signal.c          |    2 --
>  os-posix.c                   |    1 -
>  qemu-sockets.c               |    1 -
>  qga/commands-posix.c         |    2 --
>  qga/commands-win32.c         |    2 --
>  savevm.c                     |    1 -
>  slirp/ip_input.c             |    1 -
>  slirp/tcp_input.c            |    2 --
>  slirp/udp.c                  |    1 -
>  target-unicore32/translate.c |    2 --
>  ui/vnc-auth-sasl.c           |    1 -
>  vl.c                         |    1 -
>  xen-all.c                    |    1 -
>  41 files changed, 0 insertions(+), 67 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

