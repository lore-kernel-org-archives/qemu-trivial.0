Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROSv8-0008Nu-1a
	for mharc-qemu-trivial@gnu.org; Thu, 10 Nov 2011 06:35:50 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50837)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ROSv5-0008FG-3u
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 06:35:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ROSv4-0003yg-9B
	for qemu-trivial@nongnu.org; Thu, 10 Nov 2011 06:35:47 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:61374)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ROSux-0003wo-GO; Thu, 10 Nov 2011 06:35:39 -0500
Received: by faap15 with SMTP id p15so3324761faa.4
	for <multiple recipients>; Thu, 10 Nov 2011 03:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=/MEFGaz6QOXORNtlNWd4mP+ecUEeKPXbhh+uLRE7rjM=;
	b=p+2aEsXEcHo1BC2FeuWMaiPPbSkGPM39DqGJPTkKCruEp4Ftq4dm0nWa5OcSiAp3d3
	NAsg8w31FRMkrypyQeD1rTcOWOnJAm7j3PYxKTqtx2Vnxp5iWWIwkgE5XYlGEvXusmkW
	pVD7yflMKG378FI2f8z8fokht3i199fpFDdGk=
Received: by 10.223.1.137 with SMTP id 9mr11523210faf.19.1320924935563;
	Thu, 10 Nov 2011 03:35:35 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	l18sm10759893fab.9.2011.11.10.03.35.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Nov 2011 03:35:34 -0800 (PST)
Date: Thu, 10 Nov 2011 11:35:33 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20111110113533.GC12527@stefanha-thinkpad.localdomain>
References: <1320867268-10015-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1320867268-10015-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/tc58128.c: Remove unnecessary check
 for g_malloc failure
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
X-List-Received-Date: Thu, 10 Nov 2011 11:35:48 -0000

On Wed, Nov 09, 2011 at 07:34:28PM +0000, Peter Maydell wrote:
> Remove a check for g_malloc failing: this never happens.
> Also use g_malloc rather than g_malloc0 as we immediately
> memset the entire region and so zero-initialising it is pointless.
> Spotted by Coverity (see bug 887883).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/tc58128.c |    6 +-----
>  1 files changed, 1 insertions(+), 5 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

