Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK6uD-0005Uv-HL
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 08:21:25 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6u4-00054u-S4
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:21:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6u0-0005w0-Ng
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:21:16 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:49892)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK6tx-0005uW-57; Fri, 05 Oct 2012 08:21:09 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so764844bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2y1iurJOI0xyENZxHruEXfk89jcQqvKa96+fT9AKGN0=;
	b=DLzbM4YaNL7eIIQhuyqPtQRxjwkhuE0Jo6M6f5irCJLae/Txc7HvyE7W34OJgT1i5g
	iejUve1gd6D+hkfyOD84EO5ASIMgGM3dAWvxACAFFxvwMIuCxXcFUCL/baDGJMEOACUl
	a86klPGE9oVB/i9gKfYohgAX+IZqzEGPGzP8LaMDfyS1Z7jQZcpKmoahe6Kh7TsW0NcU
	aZs4i1/T3dncsLFc6wJle5V9nWgYj4phQnGycQmMrLCFHXglmH+xQUKTuL4LGyyuHalc
	E+GnbCo/IONZojaVKVl88YZ8ylqHs+BmsuG8o+EVOD3sqaAHyk9XkbnyOfKUwLWBvGJP
	XidQ==
Received: by 10.204.150.209 with SMTP id z17mr2718100bkv.8.1349439668241;
	Fri, 05 Oct 2012 05:21:08 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id e13sm7564312bkw.12.2012.10.05.05.21.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 05:21:07 -0700 (PDT)
Date: Fri, 5 Oct 2012 14:21:04 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121005122104.GB10951@stefanha-thinkpad.redhat.com>
References: <1348754143-18251-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348754143-18251-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Andrzej Zaborowski <balrogg@gmail.com>,
	qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] tcg/arm: Use tcg_out_mov_reg rather than
 inline equivalent code
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
X-List-Received-Date: Fri, 05 Oct 2012 12:21:23 -0000

On Thu, Sep 27, 2012 at 02:55:43PM +0100, Peter Maydell wrote:
> Use the recently introduced tcg_out_mov_reg() function rather than
> the equivalent inline code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a minor follow-on cleanup patch after commit 9716ef3b1.
> 
>  tcg/arm/tcg-target.c |   15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

