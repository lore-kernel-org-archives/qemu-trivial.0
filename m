Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QOpqy-0006EB-Ct
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2011 07:32:48 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QOpqw-0006AL-Hk
	for qemu-trivial@nongnu.org; Tue, 24 May 2011 07:32:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QOpqv-0002WD-My
	for qemu-trivial@nongnu.org; Tue, 24 May 2011 07:32:46 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:46408)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QOpqt-0002Vk-Nd; Tue, 24 May 2011 07:32:43 -0400
Received: by wwj40 with SMTP id 40so6432562wwj.10
	for <multiple recipients>; Tue, 24 May 2011 04:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=RGTWUl5G6EhK/HbaSKT1tO01xGXcs4UBo/ppTf9YgQs=;
	b=xCwwxSz9qlFchCYH3xbGO7pH6+XMzjbo5NixI+Yvpa3hvjVhyNJn5td5rKcDFU4rpG
	bZDcml698sWqA6Y+FlA0qp5Ts7pu3sZFrtkiMS7br//J/+3owvFkfmz3hF1uuakM1q25
	kUZ3IVF0oYjWb3Sg9GSinVfF3Jjt1J5bw1eN4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=b9LyV8qJsBb4+XRHq9OFuC+1str2IEssQWRu6Rmer3hTkgJL40lf8X7aU6dZcT7bJs
	4DhdPeh6g117JfU+OgzekVHpTcbH85g5ySe4krhkE2v7rrlzdwpf1oyAAAsECdQha5Tu
	vVaySU996XIhUtjzTl6HrwiWAePWp+a0yPWqs=
Received: by 10.216.132.133 with SMTP id o5mr3236814wei.94.1306236762858;
	Tue, 24 May 2011 04:32:42 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id s40sm3769981weq.28.2011.05.24.04.32.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 04:32:42 -0700 (PDT)
Date: Tue, 24 May 2011 12:32:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110524113238.GB22385@stefanha-thinkpad.localdomain>
References: <1306065760-4541-1-git-send-email-weil@mail.berlios.de>
	<1306065760-4541-2-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1306065760-4541-2-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 2/2] Fix spelling in comment (additon ->
 addition)
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
X-List-Received-Date: Tue, 24 May 2011 11:32:47 -0000

On Sun, May 22, 2011 at 02:02:40PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  tcg/tcg.h |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial-patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

