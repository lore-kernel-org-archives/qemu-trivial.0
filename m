Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RRMYg-0007rw-Hx
	for mharc-qemu-trivial@gnu.org; Fri, 18 Nov 2011 06:24:38 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40144)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMYd-0007hB-61
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:24:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMYc-0007I6-1h
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:24:35 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:47526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RRMYZ-00079x-RJ; Fri, 18 Nov 2011 06:24:32 -0500
Received: by mail-fx0-f45.google.com with SMTP id s14so4548802faa.4
	for <multiple recipients>; Fri, 18 Nov 2011 03:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3B5cXp4Je4J3dx4cM4cTPAjKBoknOiF0Dqv/0Q6FTgo=;
	b=fuz7nvvebV9OlAOrUH++7Ix1Anmnep2AlWxIEMpyhgZ+VAI1UzAU3GhCawblTSBVKJ
	woXZJA9uPGRdCkpii07s2WbsN652ploey6GGcx4jGHZbc7+IhVcqc9NsEHJJm4MRFts8
	ITuUAVumG9zEhw1+gvRyNRhIHEJy6siKv3w7s=
Received: by 10.204.154.137 with SMTP id o9mr2888587bkw.80.1321615471325;
	Fri, 18 Nov 2011 03:24:31 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id w11sm5094819fad.7.2011.11.18.03.24.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 03:24:30 -0800 (PST)
Date: Fri, 18 Nov 2011 11:24:29 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111118112429.GC12781@stefanha-thinkpad.localdomain>
References: <1321454627-19403-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321454627-19403-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] monitor: Fix file_completion() to check
 for stat() failure
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
X-List-Received-Date: Fri, 18 Nov 2011 11:24:36 -0000

On Wed, Nov 16, 2011 at 03:43:47PM +0100, Markus Armbruster wrote:
> stat() can fail for a file name just read with readdir().  Easiest way
> to trigger is a dangling symbolic link --- look ma, no race!  When it
> fails, file_completion() uses sb.st_mode uninitialized.  If the
> directory bit happens to be set, it appends a "/" to the completed
> name.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  monitor.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

I have already sent a pull request including this patch for QEMU 1.0.

Stefan

