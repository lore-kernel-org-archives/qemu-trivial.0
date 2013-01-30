Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U0U3r-0004pP-RK
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2013 04:34:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59844)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0U1Q-0003sZ-24
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 04:32:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U0U1P-0004ZT-0n
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2013 04:31:59 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:58129)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U0U1M-0004Yy-OI; Wed, 30 Jan 2013 04:31:56 -0500
Received: by mail-ee0-f45.google.com with SMTP id b57so677455eek.18
	for <multiple recipients>; Wed, 30 Jan 2013 01:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=SnEuQNT3lzF+ocdIQ35BaZjAMR5N+FP2p9yI7qtTnyM=;
	b=MXV5p/2yIvzCXftU15MVTrXvc7Yn+DXum0Bsk28s9MtBBpJE0t8iH/0mCoFEQPWonr
	ZWFI+xXsmJDaydwhQBkxGcyNX3tVaCv5+Ww8mlCnYKi6/wNfEZi3IpSkb0jZGNgcKQWy
	ayXXkZkZn9fZACL0ISEfZo1FxWUvHIhJ6CzbvlXiDXza7lKwwC+zWXNSuSabTf60fRf3
	UR5jbeM8GrCDsMsQzsfif9pRitrTPoVLI8hzcRbR/YTw+RO26jz9eHwRL22aLlpFaU7H
	WhvXbA+I/HbP/UcGEsPxd2/Ovxokr7yE807KoBkz73B+ggsKxP12aGeooR3kIqKoWBIy
	RDsw==
X-Received: by 10.14.201.69 with SMTP id a45mr12524933eeo.43.1359538315763;
	Wed, 30 Jan 2013 01:31:55 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id g2sm1017809eep.16.2013.01.30.01.31.53
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 30 Jan 2013 01:31:54 -0800 (PST)
Date: Wed, 30 Jan 2013 10:31:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20130130093152.GB25131@stefanha-thinkpad.redhat.com>
References: <a96aa63e-80c2-436d-8e57-bfba6d45dc02@CO9EHSMHS025.ehs.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a96aa63e-80c2-436d-8e57-bfba6d45dc02@CO9EHSMHS025.ehs.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/4] Xilinx Trivial Patches
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
X-List-Received-Date: Wed, 30 Jan 2013 09:34:30 -0000

On Sat, Jan 26, 2013 at 12:54:32PM -0800, Peter Crosthwaite wrote:
> Current queue of trivial patches from the Xilinx tree.
> 
> Peter Crosthwaite (4):
>   cadence_ttc: Debug mode compile fixes
>   cadence_gem: Debug mode compile fixes
>   xilinx_axidma: Fix debug mode compile messages
>   qemu/log.h: Fix missing includes
> 
>  hw/cadence_gem.c   | 17 ++++++++++-------
>  hw/cadence_ttc.c   |  4 ++--
>  hw/xilinx_axidma.c |  2 +-
>  include/qemu/log.h |  1 +
>  4 files changed, 14 insertions(+), 10 deletions(-)
> 
> -- 
> 1.7.12.1.396.g16eed7c
> 
> 
> 

Thanks, patches 1-3 applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

