Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RkE7x-00027b-1z
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jan 2012 07:15:01 -0500
Received: from eggs.gnu.org ([140.186.70.92]:34347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RkE7p-0001hU-Sq
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 07:14:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RkE7l-0006H3-Jv
	for qemu-trivial@nongnu.org; Mon, 09 Jan 2012 07:14:53 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:57779)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RkE7a-0006Fn-Sr; Mon, 09 Jan 2012 07:14:38 -0500
Received: by eekb45 with SMTP id b45so2397167eek.4
	for <multiple recipients>; Mon, 09 Jan 2012 04:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b0NoCMo2nNwdm7aiaA16r+IhuWAi974B1Sw6z+DtWNI=;
	b=Xbw5Wp84REE3EKsWbrtCcwINtSUYie/bKSzyLi3du0AN3nGTZ8bywOf2SdWKqVlo4k
	5G4Sit2qAUxvrmcr+O+zh+hh6jNBYtSFbz0xwDtC7xcJzGM/IRKEisTBLkr6qhJ389Ht
	thDg8Mg/sOTeqJhXJUr2ULEz9GPYdXJ1SUR7w=
Received: by 10.14.37.2 with SMTP id x2mr6149363eea.90.1326111277615;
	Mon, 09 Jan 2012 04:14:37 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	u53sm242278996eeu.6.2012.01.09.04.14.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Jan 2012 04:14:36 -0800 (PST)
Date: Mon, 9 Jan 2012 12:14:35 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Message-ID: <20120109121435.GB14603@stefanha-thinkpad.localdomain>
References: <1325966426-475-1-git-send-email-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1325966426-475-1-git-send-email-aurelien@aurel32.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tcg-arm: fix a typo in comments
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
X-List-Received-Date: Mon, 09 Jan 2012 12:14:59 -0000

On Sat, Jan 07, 2012 at 09:00:25PM +0100, Aurelien Jarno wrote:
> ARM still doesn't support 16GB buffers in 32-bit modes, replace the
> 16GB by 16MB in the comment.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  exec.c               |    2 +-
>  tcg/arm/tcg-target.c |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

