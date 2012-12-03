Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TfVW2-0002cF-5Z
	for mharc-qemu-trivial@gnu.org; Mon, 03 Dec 2012 07:52:54 -0500
Received: from eggs.gnu.org ([208.118.235.92]:46763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVVz-0002V4-FN
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 07:52:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TfVVt-00082f-Qe
	for qemu-trivial@nongnu.org; Mon, 03 Dec 2012 07:52:51 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:64338)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TfVVn-00081F-0L; Mon, 03 Dec 2012 07:52:39 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so1680585eek.4
	for <multiple recipients>; Mon, 03 Dec 2012 04:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Z4u1gaQKvNkGKiDua7W8ah3fRCPbap/+miQKK/qO/HU=;
	b=PSycVbdMBkhtiB00sVFKBOVY/H744P1wGhurokeMssywajMEvfy8ElNpb1/a9wJEop
	Xt/+25H3xzmxDR7GoJjPMBqqUeYatJiGT+aAFJxKNgGMbGKc9avgu9Zbdixgke3oe1Z8
	C2qL6u1D0xwTiUh0FV1n9wdFiZqeUyZK3TmCxgtnmduF/4Ho6mL2GnoInMEz0TULTi9Z
	aDYOWaJvvC8GjNUE3a7BEsPARESqS3MSl9AYJGNRWiAmjp03C+OpzSvzTn8V/Ldpto5C
	9oICo8U8XvTviTw2vgQSUDhjwVGjXGJKJlsTcAp7dT5nPmASqD3n4uophkDRoohjCa0/
	YCqA==
Received: by 10.14.215.197 with SMTP id e45mr36480643eep.0.1354539157955;
	Mon, 03 Dec 2012 04:52:37 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id b2sm31099013eep.9.2012.12.03.04.52.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 04:52:37 -0800 (PST)
Date: Mon, 3 Dec 2012 13:52:36 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20121203125236.GB6048@stefanha-thinkpad.redhat.com>
References: <1353302029-14255-1-git-send-email-peter.crosthwaite@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1353302029-14255-1-git-send-email-peter.crosthwaite@xilinx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] arm: a9mpcore: remove un-used
 ptimer_iomem field
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
X-List-Received-Date: Mon, 03 Dec 2012 12:52:52 -0000

On Mon, Nov 19, 2012 at 03:13:49PM +1000, Peter Crosthwaite wrote:
> I'm guessing this is a hangover from a previous coreification of the mptimer
> sub-module. This field is completely unused - removed.
> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>  hw/a9mpcore.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

