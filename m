Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZMMY-000297-E4
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2012 08:53:42 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMMT-0001vC-UI
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:53:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMMQ-0003UH-RS
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:53:37 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:42271)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TZMMK-0003Tn-CG; Fri, 16 Nov 2012 08:53:28 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so1677239eek.4
	for <multiple recipients>; Fri, 16 Nov 2012 05:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1EhFJZ5GLg5qBNSY3Wt9GOD5u5+9IlzU297hmr/YxGk=;
	b=TtGW1YthekP+1ZLXNbXfi42t3fTXy9jGetA4gv4zhItBRVCcO7F4z1TM1lrVlKtTj8
	YsOG4JgJAfFGYnnSiaBVGoslAengYVeXyTo5mRE8LVxVJ0c5Cayp7zoToQ0XgEvEs3Wp
	8nIejJ2CS56iYie1iJfZHDhAHRqs/5PcjuQcM7TDza9ycOXcUj0LGkAb3F8a3GeK/ni3
	PvoAFlRgw9rphvcWIu/qSFyq8fD4UTbiOarkiazGF/rg7jNgbxd4ETvfLSE2EV7S8RXN
	dAVFbXnSb5LDv4jjBbKzI3nY/gjtQ+C/12sY9senjOhKYe18/GgcT4Jg9T13ZOTrBkfO
	mzug==
Received: by 10.14.1.69 with SMTP id 45mr13818796eec.23.1353074007550;
	Fri, 16 Nov 2012 05:53:27 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id f3sm3604179eeo.13.2012.11.16.05.53.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 05:53:27 -0800 (PST)
Date: Fri, 16 Nov 2012 14:53:25 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20121116135325.GC31927@stefanha-thinkpad.redhat.com>
References: <1352961173-16498-1-git-send-email-peter.crosthwaite@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1352961173-16498-1-git-send-email-peter.crosthwaite@xilinx.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sd: Send debug printfery to stderr not
 stdout
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
X-List-Received-Date: Fri, 16 Nov 2012 13:53:41 -0000

On Thu, Nov 15, 2012 at 04:32:53PM +1000, Peter Crosthwaite wrote:
> Some debug printfs for SD are coming up in stdout. Redirected them to stderr
> instead.
> 
> Signed-off-by: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
> ---
>  hw/sd.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

