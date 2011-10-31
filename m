Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RKqR7-0001Kv-PW
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2011 07:53:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RKqR3-00014C-HJ
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 07:53:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RKqR1-0006nZ-2v
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 07:53:49 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:55247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RKqQy-0006mv-2i; Mon, 31 Oct 2011 07:53:44 -0400
Received: by faap15 with SMTP id p15so6466716faa.4
	for <multiple recipients>; Mon, 31 Oct 2011 04:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Kr2mbIQ4By+l/aPpqZ3bfbqrZGHNnVLSPU1a9YaU1pc=;
	b=TQRrNmMf5HSK2JCsO2DyBQXy3n9K3+PsuPxHRJ8TyGH3/8AIuPgtoPZ2ypAc9OSOOD
	3vxzWBMNshO0vMvQykcYdVrUCxq1ggtVbOsHsbeLUnI3jPRtXPr1HFdDiI1eZsgk3Tdi
	XYUHmUw27JQjVuDGXshK3XloQCJTaEyNgozUg=
Received: by 10.223.58.146 with SMTP id g18mr29036164fah.13.1320062023172;
	Mon, 31 Oct 2011 04:53:43 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	y17sm37601628faf.1.2011.10.31.04.53.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 04:53:42 -0700 (PDT)
Date: Mon, 31 Oct 2011 11:53:41 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Message-ID: <20111031115341.GB10693@stefanha-thinkpad.localdomain>
References: <1319813906-21196-1-git-send-email-stefanha@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1319813906-21196-1-git-send-email-stefanha@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qapi: fix typos in documentation JSON
 examples
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
X-List-Received-Date: Mon, 31 Oct 2011 11:53:51 -0000

On Fri, Oct 28, 2011 at 03:58:26PM +0100, Stefan Hajnoczi wrote:
> Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
> ---
>  docs/qapi-code-gen.txt |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

