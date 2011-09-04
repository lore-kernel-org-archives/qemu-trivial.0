Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R0EcN-0005kp-4a
	for mharc-qemu-trivial@gnu.org; Sun, 04 Sep 2011 11:28:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:48359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0EcK-0005c6-Id
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 11:28:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0EcJ-0003KM-Gc
	for qemu-trivial@nongnu.org; Sun, 04 Sep 2011 11:28:16 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:43230)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R0EcH-0003Jz-0E; Sun, 04 Sep 2011 11:28:13 -0400
Received: by wyf22 with SMTP id 22so3696567wyf.4
	for <multiple recipients>; Sun, 04 Sep 2011 08:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0gimACeEUMEGngZUOZr8lWED0e2fx5B0aBDsZtTu0C4=;
	b=cBTAXr8nrt/Xfdqb5fuDK7JwWiPvDu/p0l0sugw+9f2ZT7C/g4B2SRYNxx2XtgF717
	x5EUX5Ama02NkNEfOR3X7i5ONV8VyCF4g2MpgwUWDM25YcbDhNEjcCbZYqTs4tEorKMs
	w3t05ygrakG6WqDJkxb1NwidxKFQA5vER2tlM=
Received: by 10.227.28.141 with SMTP id m13mr3019685wbc.37.1315150091363;
	Sun, 04 Sep 2011 08:28:11 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id b3sm5202937wbp.10.2011.09.04.08.28.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Sep 2011 08:28:10 -0700 (PDT)
Date: Sun, 4 Sep 2011 16:28:04 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110904152804.GA15133@stefanha-thinkpad.localdomain>
References: <1315142266-9800-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1315142266-9800-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix comment (install patch
	-> install path)
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
X-List-Received-Date: Sun, 04 Sep 2011 15:28:17 -0000

On Sun, Sep 04, 2011 at 03:17:46PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  vl.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

