Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QxzOw-0004rK-Vh
	for mharc-qemu-trivial@gnu.org; Mon, 29 Aug 2011 06:49:10 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QxzOu-0004mj-Tx
	for qemu-trivial@nongnu.org; Mon, 29 Aug 2011 06:49:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QxzOt-0002E4-RV
	for qemu-trivial@nongnu.org; Mon, 29 Aug 2011 06:49:08 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:41132)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QxzOr-0002DL-G3; Mon, 29 Aug 2011 06:49:05 -0400
Received: by wwf25 with SMTP id 25so5175503wwf.10
	for <multiple recipients>; Mon, 29 Aug 2011 03:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AXUvy2YLKEUZynD1N61MS194FErY/pSlepoFZhQkpsc=;
	b=kGjSAqfwIH0Ogi0crkCLcofia3l9evI70hDXGNiTkRH+8jNt8QsSqgx5p8C2q/W+ya
	QMX+0ExozGx+5skoEXBZPwJy29U/+kLaRqiijSLTCZni0kaSQsJAkPtUXxFy9S6hIFkL
	0bY5Nu0jcksjxlvJ+ww6PWzTnUd6N+eRaNbL0=
Received: by 10.216.230.89 with SMTP id i67mr3470962weq.79.1314614944052;
	Mon, 29 Aug 2011 03:49:04 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id o57sm2815371weq.10.2011.08.29.03.49.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 29 Aug 2011 03:49:02 -0700 (PDT)
Date: Mon, 29 Aug 2011 11:48:54 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110829104806.GA19425@stefanha-thinkpad.localdomain>
References: <1314560740-6136-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1314560740-6136-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix spelling in comments and debug
 messages (recieve -> receive)
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
X-List-Received-Date: Mon, 29 Aug 2011 10:49:09 -0000

On Sun, Aug 28, 2011 at 09:45:40PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  docs/qapi-code-gen.txt |    2 +-
>  libcacard/vscclient.c  |    2 +-
>  qemu-ga.c              |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

