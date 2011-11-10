Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROSvT-0000hZ-Ar
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2011 06:36:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ROSvQ-0000ZV-Qc
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 06:36:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ROSvP-00041u-J7
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 06:36:08 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:61374)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ROSvI-0003wo-Lt; Thu, 10 Nov 2011 06:36:00 -0500
Received: by mail-fx0-f45.google.com with SMTP id p15so3324761faa.4
	for <multiple recipients>; Thu, 10 Nov 2011 03:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gss+0b2Bsi3bmkEFnaXdPsx39uD8JYHM4N6xLxl1fcU=;
	b=rp6ZXdnk5lWvkHnYHnobWq6+tvcuwLwUP4f7qgqCS0UwTb7d8+UycxSyDIzmfDakQF
	LaauZaqdUXtz1HXEFttAN4ybT34KYeQ1GApPOLQ3HcJt1+VP0YG1BwKbsW3JuuIb4E1w
	nPn+4UGr9+tYLPxzji5lSdeCVDw5wEIY+hxJY=
Received: by 10.223.62.209 with SMTP id y17mr11610581fah.7.1320924960173;
	Thu, 10 Nov 2011 03:36:00 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	a21sm10745306fao.18.2011.11.10.03.35.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 03:35:59 -0800 (PST)
Date: Thu, 10 Nov 2011 11:35:57 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20111110113557.GD12527@stefanha-thinkpad.localdomain>
References: <1320867938-10127-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320867938-10127-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: Delete
	spurious '.'
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
X-List-Received-Date: Thu, 10 Nov 2011 11:36:09 -0000

On Wed, Nov 09, 2011 at 07:45:38PM +0000, Peter Maydell wrote:
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> If anything qualifies as a trivial patch, this does :-)
> 
>  MAINTAINERS |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Normally I wouldn't touch MAINTAINERS but this really is trivial :).

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

