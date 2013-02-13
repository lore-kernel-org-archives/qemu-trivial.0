Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U5Y7n-00034b-4F
	for mharc-qemu-trivial@gnu.org; Wed, 13 Feb 2013 03:55:31 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U5Y7f-0002gG-GO
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2013 03:55:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U5Y7d-0003FZ-LK
	for qemu-trivial@nongnu.org; Wed, 13 Feb 2013 03:55:23 -0500
Received: from mail-we0-x22d.google.com ([2a00:1450:400c:c03::22d]:64847)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U5Y7Y-0003Eo-U0; Wed, 13 Feb 2013 03:55:17 -0500
Received: by mail-we0-f173.google.com with SMTP id r5so770954wey.4
	for <multiple recipients>; Wed, 13 Feb 2013 00:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=Rn70JFhwI8I3sBYhqxoZlsM6tv1+UGtp+TMuKhrjy34=;
	b=tKhY5ct66Klz/hzldfkR8LmYagrBkHhLBhW1L3cEbTim33x16pSuh9iUm1ttyTMWy6
	AoIDZgWH+rpcibWp72HQCay/dAFX5GSG18mkCfZM51dr+7IoZXB6U3iTgP/tXH+5/0b6
	ILryocVlP+FQv1arCeGzlZ7UXfeWSxUrmZCeN1LOuTknSmuX4QAMDOlsSHBlL1X//0yP
	NMHPr10GXAPDrNep8k+kWhBff7j3Q/XM9eVISAYgtOlrtvUREE9FcqsR5ewAAkf/C/9j
	glfymHFEcxO5gmt9PJzTExBMjkJ4nPOftrTsvJz0s991MLq262+od8ejeJKVNfMtE8PP
	flOA==
X-Received: by 10.180.77.68 with SMTP id q4mr8357723wiw.10.1360745715660;
	Wed, 13 Feb 2013 00:55:15 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id fg6sm24979734wib.10.2013.02.13.00.55.13
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 13 Feb 2013 00:55:14 -0800 (PST)
Date: Wed, 13 Feb 2013 09:55:12 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20130213085512.GA8577@stefanha-thinkpad.redhat.com>
References: <0c6a908b-571a-4573-b175-47f760f22135@CH1EHSMHS010.ehs.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c6a908b-571a-4573-b175-47f760f22135@CH1EHSMHS010.ehs.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22d
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] xilinx_axienet.c: Assert no error when
 making link
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
X-List-Received-Date: Wed, 13 Feb 2013 08:55:29 -0000

On Mon, Feb 11, 2013 at 05:16:05PM +1000, Peter Crosthwaite wrote:
> This gives an awful silent failure when it doesn't work. Assert against link
> creation failure.
> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>  hw/xilinx_axienet.c |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches -next tree:
https://github.com/stefanha/qemu/commits/trivial-patches-next

Stefan

