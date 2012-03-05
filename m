Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4azq-0005OU-V4
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 11:42:50 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45436)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4azl-0005Nn-7N
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 11:42:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4azM-0005ca-B2
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 11:42:44 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:62267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4azM-0005bI-2f; Mon, 05 Mar 2012 11:42:20 -0500
Received: by werp12 with SMTP id p12so3113062wer.4
	for <multiple recipients>; Mon, 05 Mar 2012 08:42:17 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates
	10.180.14.37 as permitted sender) client-ip=10.180.14.37; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of stefanha@gmail.com
	designates 10.180.14.37 as permitted sender)
	smtp.mail=stefanha@gmail.com;
	dkim=pass header.i=stefanha@gmail.com
Received: from mr.google.com ([10.180.14.37])
	by 10.180.14.37 with SMTP id m5mr16385066wic.19.1330965737196 (num_hops
	= 1); Mon, 05 Mar 2012 08:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=E2q5f7yLHwJ6OaFNSQLS1U14McNt7eEu7EQkyrObWtk=;
	b=OY6wi1IiBg0vApBiiKNMeG6uHND9sz/U9YD43YTKySS8ty6TXny7UmW2/mhj7GiTpl
	HfN2E0RtGeDI5gz8JUEU7Df/81FdQ2GzrhEPh9dr9BLaD5ylDeQvImhbEfWmBUgvT/Mz
	XIVd10vwBQ1aPbJSY6NNg1CT2knEl+kCz/SzF5AulW74IXVHCnlm3aSthLOLGWbzg8W/
	0wfgU7nVphHBUhFFI5BZxXCg9nR5luWgMoqkkzl8ZEMOLjUNKHC4JLTFUpaf2B5yZQ0l
	iWNYJaYYEP9N/+nmzxp+jKeu4pmc2fBiQyUU5l1k0nvhNZLYF7AJ1HCVINa67QSvFspn
	JRdg==
Received: by 10.180.14.37 with SMTP id m5mr13001640wic.19.1330965737129;
	Mon, 05 Mar 2012 08:42:17 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	r8sm38630640wiw.10.2012.03.05.08.42.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 08:42:16 -0800 (PST)
Date: Mon, 5 Mar 2012 16:42:14 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120305164214.GA8197@stefanha-thinkpad.localdomain>
References: <1330263343-21307-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330263343-21307-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes in comments
	(it's -> its)
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
X-List-Received-Date: Mon, 05 Mar 2012 16:42:49 -0000

On Sun, Feb 26, 2012 at 02:35:43PM +0100, Stefan Weil wrote:
> * it's -> its (fixed for all files)
> * dont -> don't (only fixed in a line which was touched by the previous fix)
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure               |    2 +-
>  hw/exynos4210_mct.c     |    2 +-
>  hw/usb-ccid.c           |    2 +-
>  include/qemu/object.h   |    4 ++--
>  kvm-all.c               |    2 +-
>  libcacard/vscclient.c   |    2 +-
>  linux-user/signal.c     |    2 +-
>  qemu-file.h             |    2 +-
>  target-mips/op_helper.c |    2 +-
>  9 files changed, 10 insertions(+), 10 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

