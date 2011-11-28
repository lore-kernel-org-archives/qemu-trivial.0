Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RUzK9-0000qf-DT
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2011 06:24:37 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RUzK6-0000qA-FW
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 06:24:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RUzK5-0004N2-H3
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 06:24:34 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:60771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RUzK5-0004Mc-9p; Mon, 28 Nov 2011 06:24:33 -0500
Received: by bkbzu5 with SMTP id zu5so9184458bkb.4
	for <multiple recipients>; Mon, 28 Nov 2011 03:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sWcMRYJewxv8nSvU7ka3OtHLJr7hp0xwW0INxSiQbMU=;
	b=QddxlYcSNBolVh/Een9WKBRKQtSNS/GlXm7qnJRyZlFuAkJRz/y/+uoym3jI6eTrrg
	M3WN2VUp/00tFdx3f7kwVB11meBZEng8iznyDaaRzHSV7tf98gO5HPn0i1Y8ZpHc9mCS
	B4KZYxopv4w70wyxyx747EZ4Se/HAKrISDUJY=
Received: by 10.205.42.202 with SMTP id tz10mr6474722bkb.57.1322479472280;
	Mon, 28 Nov 2011 03:24:32 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	hy13sm29074494bkc.0.2011.11.28.03.24.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 03:24:31 -0800 (PST)
Date: Mon, 28 Nov 2011 11:24:30 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
Message-ID: <20111128112430.GA7564@stefanha-thinkpad.localdomain>
References: <CAGrFBsh-1AZm8=6NW+EZ2KhYsK+q1pW6oKkr+pfPNzXD295=Kg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGrFBsh-1AZm8=6NW+EZ2KhYsK+q1pW6oKkr+pfPNzXD295=Kg@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH 1/2] fix typo: delete redundant semicolon
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
X-List-Received-Date: Mon, 28 Nov 2011 11:24:35 -0000

On Mon, Nov 28, 2011 at 04:59:40PM +0800, Dong Xu Wang wrote:
> Double semicolons should be single.
> 
> Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
> ---

Applying: fix typo: delete redundant semicolon
fatal: corrupt patch at line 24
Patch failed at 0001 fix typo: delete redundant semicolon

Your patch is line-wrapped and does not apply.  Please check your mailer
configuration or use git-send-email(1).

Stefan

