Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZMuM-0006kb-Sn
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2012 09:28:38 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMuJ-0006Z6-3r
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 09:28:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMuF-0005pS-Ul
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 09:28:34 -0500
Received: from mail-ea0-f173.google.com ([209.85.215.173]:55191)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TZMu9-0005oQ-JR; Fri, 16 Nov 2012 09:28:25 -0500
Received: by mail-ea0-f173.google.com with SMTP id i13so1138906eaa.4
	for <multiple recipients>; Fri, 16 Nov 2012 06:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PSPmsBZzz1G5eYvZLAaSK7Mc7j0S4/CKoCQA/Hq/C+Y=;
	b=jsBiA7YCcK/Lpjx6kbO/A5m9+Bx07QbW7HFMHpd7gUs4XAhfhMXrB2QIVmg3vAYvi2
	a/6E8cP3M7CCkIvnK+Y/vu3cQh2S5KjS4Ptw9FaXTftOFiSfl7nGm1pUJb+FmPhfo184
	8WG2gX8q5QDc64C/jPmUTxVdxIgC9oxqfKs+D1bzPjphx8tJgzNdb5tPKxpmQljx/G66
	p+QZtSNVE8OHk694lrUcvitQjIyUv4RmuP4E3VHYChbzY1TGELYkHZeNqX0J0M8NSaOo
	SEfVc9iD8YhZkgt82SGOM5qnayDOEqfhxGNqE/aDzVF1ci7efV8lswTLdJoOoyodNsD3
	S6+w==
Received: by 10.14.213.65 with SMTP id z41mr13867891eeo.29.1353076104648;
	Fri, 16 Nov 2012 06:28:24 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id g5sm3806876eem.4.2012.11.16.06.28.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 06:28:23 -0800 (PST)
Date: Fri, 16 Nov 2012 15:28:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20121116142822.GA3991@stefanha-thinkpad.redhat.com>
References: <1350761824-28185-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1350761824-28185-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Remove stray debug output
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
X-List-Received-Date: Fri, 16 Nov 2012 14:28:38 -0000

On Sat, Oct 20, 2012 at 08:37:04PM +0100, Peter Maydell wrote:
> Rather than printing a message saying we're silently falling
> back to gthread coroutines when running on MacOS, actually
> do it silently.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I guess this is a self-falsifying echo :-)
> 
>  configure | 2 --
>  1 file changed, 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

