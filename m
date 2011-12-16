Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbVDL-0003cj-TO
	for mharc-qemu-trivial@gnu.org; Fri, 16 Dec 2011 05:40:31 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37693)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RbVDE-0003G3-Vo
	for qemu-trivial@nongnu.org; Fri, 16 Dec 2011 05:40:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RbVD9-0006L6-C5
	for qemu-trivial@nongnu.org; Fri, 16 Dec 2011 05:40:24 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:41280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RbVCx-0006F9-V0; Fri, 16 Dec 2011 05:40:08 -0500
Received: by mail-ee0-f45.google.com with SMTP id b45so3396730eek.4
	for <multiple recipients>; Fri, 16 Dec 2011 02:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X531YP4AO1mUf/aSxT2/EgJs1u1K+FLaGJk/XzYUaaE=;
	b=WZOch3pTcXc888tGHBUgA4o113y45ljhRn6ujg2F15dtb34UqqyH7HHyAEE2/xBFuR
	E1RbjTqLPQflUDltoVr2jNj4zc6cQmPSJx0penJv/10bnk213hkYJzZmlh4csFhKvmlK
	PB/z1a1Cov15Lc3KKRU38RwipbxOYCd1IGgR8=
Received: by 10.213.4.138 with SMTP id 10mr285046ebr.19.1324032007342;
	Fri, 16 Dec 2011 02:40:07 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id 76sm36499502eeh.0.2011.12.16.02.40.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 02:40:06 -0800 (PST)
Date: Fri, 16 Dec 2011 10:40:05 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20111216104005.GB2687@stefanha-thinkpad.localdomain>
References: <1323975506-21941-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323975506-21941-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] stellaris: Calculate system
 clock period on reset
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
X-List-Received-Date: Fri, 16 Dec 2011 10:40:29 -0000

On Thu, Dec 15, 2011 at 06:58:26PM +0000, Peter Maydell wrote:
> Calculate the system clock period on reset; otherwise it remains
> set to the default value of zero and attempting to use it provokes
> a hang. This is one of the issues noted in LP:696094.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/stellaris.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

