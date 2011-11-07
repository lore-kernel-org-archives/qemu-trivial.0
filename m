Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNLOW-00072n-HP
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2011 04:21:32 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOR-0006mJ-FI
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOP-0001Ld-ON
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:27 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:56270)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RNLOP-0001L3-Jn
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2011 04:21:25 -0500
Received: by mail-fx0-f45.google.com with SMTP id p15so5986632faa.4
	for <qemu-trivial@nongnu.org>; Mon, 07 Nov 2011 01:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=Mc+TmL0+MlUuVdAmtwa4atEOtO8UJJ9ZJ6y+jiyo/gc=;
	b=fl3/G6v4OW3ERzc5EgDIdVecTVbr0DbcdgSDxjVgpKQT4wAhke+5OnbsB7BCHl4WIc
	cChZPn7qk1X6G9DmagqKnZ6rKRFOs+F2G2fVMsqiRxxsC/X2Ygh1uIx4C83yr+xKccGA
	U7gUFvf177RmYz8m/oBNhpaQXf2mO1x0+lytE=
Received: by 10.223.58.8 with SMTP id e8mr7302242fah.27.1320657685238;
	Mon, 07 Nov 2011 01:21:25 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	w11sm30550673fad.7.2011.11.07.01.21.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 Nov 2011 01:21:24 -0800 (PST)
Date: Mon, 7 Nov 2011 08:11:52 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: =?utf-8?B?6Zmz6Z+L5Lu7?= <chenwj@iis.sinica.edu.tw>
Message-ID: <20111107081152.GC9450@stefanha-thinkpad.localdomain>
References: <20111104171444.GA85143@cs.nctu.edu.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20111104171444.GA85143@cs.nctu.edu.tw>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-tech.texi: Update default code
 cache size
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
X-List-Received-Date: Mon, 07 Nov 2011 09:21:30 -0000

On Sat, Nov 05, 2011 at 01:14:44AM +0800, 陳韋任 wrote:
>   Update the document since the default code cache size is 32 MB now.
> 
> Signed-off-by: chenwj <chenwj@cs.nctu.edu.tw>
> ---
>  qemu-tech.texi |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Can you point me to the place in the code where we use 32 MB?

Thanks,
Stefan

