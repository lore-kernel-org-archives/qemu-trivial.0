Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSlx2-0006hk-3M
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2012 05:48:08 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TSlwu-0006OQ-Mu
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 05:48:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TSlwt-0004MH-QG
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2012 05:48:00 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:34116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TSlwi-0004KT-6l; Mon, 29 Oct 2012 05:47:48 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so1552868bkc.4
	for <multiple recipients>; Mon, 29 Oct 2012 02:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wc8MTW6GjoYcHT7QbFzEySEtXVpSOh6r2iAPRGtcCbM=;
	b=xQVv9f2z+maCRqoZ34IXF9SWst3SP0xh97cjwXIPlW0S58E32xs4ocNV9U7dFW+A0b
	iCuw5a4n3klfAcSn36AbtChoddYBN8IuWHcqywVqShCgaFPExbYQh2pcGJVqcsYYJzQQ
	cl5Vsmn80AbJ2+mouJ9XJyLw+fzutH/veh9FU9VOEy0iPjJR8RQdDuE6Yg8yW1qEtyih
	BMCNrnuYqwyHY3ZiISgWJ3D9EYW6eL1m12hFTCpIWCu4gDrbhrHTPjuTqtJOuK9MdXVB
	dC/AoV2HIiftVKyx8ap2Kn6/fJ43izDh5U119NtokG6g5hDRCQKlaNKaPbYnlLETrij+
	CuSQ==
Received: by 10.204.150.220 with SMTP id z28mr9167307bkv.125.1351504067199;
	Mon, 29 Oct 2012 02:47:47 -0700 (PDT)
Received: from localhost ([89.204.138.63])
	by mx.google.com with ESMTPS id z22sm3394588bkw.2.2012.10.29.02.47.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Oct 2012 02:47:46 -0700 (PDT)
Date: Mon, 29 Oct 2012 10:47:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20121029094744.GA30593@stefanha-thinkpad.redhat.com>
References: <1350637684-32300-1-git-send-email-peter.crosthwaite@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350637684-32300-1-git-send-email-peter.crosthwaite@xilinx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] cadence_uart: More debug information
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
X-List-Received-Date: Mon, 29 Oct 2012 09:48:06 -0000

On Fri, Oct 19, 2012 at 07:08:04PM +1000, Peter Crosthwaite wrote:
> Add more helpful debug information to the cadence UART.
> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>  hw/cadence_uart.c |   11 +++++++----
>  1 files changed, 7 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

