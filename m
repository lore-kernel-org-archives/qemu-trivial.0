Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R88SH-0006Yq-TN
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2011 06:30:33 -0400
Received: from eggs.gnu.org ([140.186.70.92]:59026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R88SE-0006Mi-Au
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 06:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R88SD-0006IM-AV
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2011 06:30:30 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:36814)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R88SA-0006HS-RX; Mon, 26 Sep 2011 06:30:26 -0400
Received: by wyh22 with SMTP id 22so6414095wyh.4
	for <multiple recipients>; Mon, 26 Sep 2011 03:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a4sGda6QcTEFV6Jxd7gNl9Y2zGJfeNPXX1nO8sDMsIc=;
	b=pOa800qjx1enf8Cafjmskhrdz2W0ApimkAS4wHt7QxOyKW8hclzPmkuQIbryzK5XJf
	toyGGJE3mYATo+I5r5hs6t4AiImXH69kZ+B2dOjxV9qz4opRb6PYI2cRL1DEmmejk9Dx
	XI2hSZSK3dZP7asG86srqvI1EQEvCR2LAwCQw=
Received: by 10.216.138.142 with SMTP id a14mr8517487wej.63.1317033025840;
	Mon, 26 Sep 2011 03:30:25 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	n21sm30324068wbp.2.2011.09.26.03.30.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 26 Sep 2011 03:30:24 -0700 (PDT)
Date: Mon, 26 Sep 2011 11:30:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20110926103022.GA9503@stefanha-thinkpad.localdomain>
References: <1316711327-4046-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1316711327-4046-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] makefile: extract tools-obj-y
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
X-List-Received-Date: Mon, 26 Sep 2011 10:30:31 -0000

On Thu, Sep 22, 2011 at 07:08:47PM +0200, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  Makefile |    9 +++++----
>  1 files changed, 5 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

