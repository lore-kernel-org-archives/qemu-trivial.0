Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGvM5-0007gM-20
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2011 12:20:29 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGvM1-0007aD-3c
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 12:20:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGvM0-0003f6-5H
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 12:20:25 -0400
Received: from mail-pz0-f43.google.com ([209.85.210.43]:35764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RGvLv-0003dn-9o; Thu, 20 Oct 2011 12:20:19 -0400
Received: by pzk33 with SMTP id 33so7550763pzk.2
	for <multiple recipients>; Thu, 20 Oct 2011 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tlzaEUqCl2hvtSRyMtzGkGnpPFjpY4wow8321BTjunE=;
	b=Tj5RtAUHXG9oNL4scQ1zkrXiSjZgORVtpJoFrG96yXcEdg9RkpfjAtWrMv31wPPk0r
	y8NqqOFNireBYL5MvKbakeSpFJkWfvTRyPELVscqxrDlCXinqySEs9DPiFihf3tb76Q1
	nhHwu6KIoeNMLmqkjug45iG2MCEu4YL40bOfE=
Received: by 10.68.34.226 with SMTP id c2mr20941558pbj.99.1319127617412;
	Thu, 20 Oct 2011 09:20:17 -0700 (PDT)
Received: from localhost ([71.198.47.196])
	by mx.google.com with ESMTPS id z3sm20374892pbu.7.2011.10.20.09.20.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 09:20:15 -0700 (PDT)
Date: Thu, 20 Oct 2011 09:20:15 -0700
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111020162015.GA7089@stefanha-thinkpad.localdomain>
References: <1318882329-15119-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1318882329-15119-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.43
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] device_tree: Fix potential memory leak
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
X-List-Received-Date: Thu, 20 Oct 2011 16:20:27 -0000

On Mon, Oct 17, 2011 at 10:12:09PM +0200, Stefan Weil wrote:
> cppcheck error report:
> 
> device_tree.c:156: error: Memory leak: dupname
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  device_tree.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

