Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R88f8-0001BJ-Lr
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2011 06:43:50 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R88f6-0001Au-Hw
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 06:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R88f5-000083-A5
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 06:43:48 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:49045)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R88f5-00007y-5p; Mon, 26 Sep 2011 06:43:47 -0400
Received: by wwg14 with SMTP id 14so5452030wwg.10
	for <multiple recipients>; Mon, 26 Sep 2011 03:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0/uP4vrMXXOK2EPpWhFZnSgd/s2ixkJI2jrkJ/OKbZg=;
	b=xoJSt2altaHmp3Iliw1FgEivGJ9paGq5Ufjahfb3RYHr7Fyj5exaOrqt2zm0Up/DD6
	ydI4+QjXvaJFFIvsdnqewzAUbWIssz7YvWuQGE64owGJ3K+bVu+MdvY+jRMaZF2v+xm6
	hM2YSi7QepbgomYAFDgDpu/KkoiLkmxcn+nJo=
Received: by 10.216.24.70 with SMTP id w48mr7244439wew.20.1317033826368;
	Mon, 26 Sep 2011 03:43:46 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id o7sm30356066wbh.8.2011.09.26.03.43.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 03:43:45 -0700 (PDT)
Date: Mon, 26 Sep 2011 11:43:43 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20110926104343.GC9503@stefanha-thinkpad.localdomain>
References: <4E804649.7010100@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E804649.7010100@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] lsi: Fix tag reference in debug print
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
X-List-Received-Date: Mon, 26 Sep 2011 10:43:49 -0000

On Mon, Sep 26, 2011 at 11:30:49AM +0200, Jan Kiszka wrote:
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  hw/lsi53c895a.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

