Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbVDA-0002zX-D2
	for mharc-qemu-trivial@gnu.org; Fri, 16 Dec 2011 05:40:20 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37669)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RbVD7-0002ql-CC
	for qemu-trivial@nongnu.org; Fri, 16 Dec 2011 05:40:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RbVD1-0006KQ-Re
	for qemu-trivial@nongnu.org; Fri, 16 Dec 2011 05:40:17 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:41280)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RbVCq-0006F9-0T; Fri, 16 Dec 2011 05:40:00 -0500
Received: by eekb45 with SMTP id b45so3396730eek.4
	for <multiple recipients>; Fri, 16 Dec 2011 02:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SrXw98JwN562QiNEInOaTgBLDoRIXZZv+IYSxF475AY=;
	b=g+4n49jCDNmLH/3Ij8UncmxTWDvUSaQjgTPeKjLQ9LcIpNdGNGKY4WvmlMb2aB96mF
	ojJV1XofA4t77nCoTROPunoirpfY4/xQB0ciwM2icXQLHhfLn9d11ucNkKw0zYByMArY
	CJG+toSgATTNG/4QsdcqAzsbQhISyquQien14=
Received: by 10.14.123.2 with SMTP id u2mr2880099eeh.99.1324031999056;
	Fri, 16 Dec 2011 02:39:59 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	58sm36387896eet.11.2011.12.16.02.39.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 02:39:58 -0800 (PST)
Date: Fri, 16 Dec 2011 10:39:56 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20111216103956.GA2687@stefanha-thinkpad.localdomain>
References: <1323973732-21848-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323973732-21848-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile.target: Remove unnecessary
 dependency rules
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
X-List-Received-Date: Fri, 16 Dec 2011 10:40:19 -0000

On Thu, Dec 15, 2011 at 06:28:52PM +0000, Peter Maydell wrote:
> Remove some dependency rules which aren't necessary (the automatically
> generated .d files cover all these). These were leftovers from dyngen
> days, when the object files also had a dependency on some generated
> files.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  Makefile.target |    6 ------
>  1 files changed, 0 insertions(+), 6 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

