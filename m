Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S86Zs-0000o7-OF
	for mharc-qemu-trivial@gnu.org; Thu, 15 Mar 2012 05:02:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S86Zk-0000Qk-EL
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 05:02:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S86ZF-00053z-31
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 05:02:23 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:41087)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S86ZE-00052y-RF; Thu, 15 Mar 2012 05:01:53 -0400
Received: by mail-we0-f173.google.com with SMTP id p12so2972793wer.4
	for <multiple recipients>; Thu, 15 Mar 2012 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=LhxhxjWBdDfYuJXektBzm8Ltu44ozNRb5SSA7iPmL58=;
	b=ClZ8aY4A4W7fHvrKpDGDmDWuLSWks3AjVf9DKbbiTY0StZxs9tiGe2Y+F6nLzFt4nd
	sG2ZjiYpseBW5FwlqbqXPZ5QNw715su8nnmykntpGSvCmmnfKd2Pak/jMP8EHjD+zA36
	Iu3rAIMd+bIVqPV2/hDE94qabgitEOsSTknJZVGBNFHuxfEMFyTxAvt9PweYJneU3pfY
	2x1MnplUDhZZpz/WY/F7doeE4ZCVLsFirQFLULaR8wMakU4q4c431RfdQWm0b3DbDP1U
	hyiMnAUR+4dhtHChGjweev/kq4piHj4KhLOt8VmGLSlb1B+BWjl4nuRuQCG7f7C0SW7Z
	9mGw==
Received: by 10.216.137.100 with SMTP id x78mr3562187wei.72.1331802111274;
	Thu, 15 Mar 2012 02:01:51 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id fi4sm3535368wib.4.2012.03.15.02.01.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 02:01:50 -0700 (PDT)
Date: Thu, 15 Mar 2012 08:22:26 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jason Wang <jasowang@redhat.com>
Message-ID: <20120315082226.GB14640@stefanha-thinkpad.localdomain>
References: <20120308020522.24053.8087.stgit@amd-6168-8-1.englab.nay.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120308020522.24053.8087.stgit@amd-6168-8-1.englab.nay.redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ioapic: fix build with DEBUG_IOAPIC
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
X-List-Received-Date: Thu, 15 Mar 2012 09:02:31 -0000

On Thu, Mar 08, 2012 at 10:05:22AM +0800, Jason Wang wrote:
> ioapic.c:198: error: format ‘%08x’ expects type ‘unsigned int’, but argument 3 has type ‘uint64_t’
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/ioapic.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/hw/ioapic.c b/hw/ioapic.c
> index 3fee011..2b0e6e9 100644
> --- a/hw/ioapic.c
> +++ b/hw/ioapic.c
> @@ -195,7 +195,7 @@ ioapic_mem_write(void *opaque, target_phys_addr_t addr, uint64_t val,
>          if (size != 4) {
>              break;
>          }
> -        DPRINTF("write: %08x = %08x\n", s->ioregsel, val);
> +        DPRINTF("write: %08x = %lx\n", s->ioregsel, val);

Please use PRIx64 since the argument is uint64_t.  On a 32-bit host the
%lx format string will be wrong and the compiler may issue a warning.

Stefan

