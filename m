Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S86Zj-0000PG-LX
	for mharc-qemu-trivial@gnu.org; Thu, 15 Mar 2012 05:02:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S86Za-0008PL-Bu
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 05:02:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S86ZE-00053m-IW
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 05:02:13 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:61084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S86ZE-00053I-9P; Thu, 15 Mar 2012 05:01:52 -0400
Received: by wibhr17 with SMTP id hr17so3494128wib.10
	for <multiple recipients>; Thu, 15 Mar 2012 02:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gvLwS/m6paVK925uX09bg9UzIy82WyhZYslOQjua9aA=;
	b=vKUWzlJKtnbqR91bkLSuUojPpd7M0Pps0McXJv9KpNeb1u8L8T7v+PjqrXm9nw1aWi
	NUSOssh4FiaKSoQSR2M8vsqBUJrgMBnI5u0sggjVG+/o+fkcMqTJCQXcSQQu0He2TvH5
	lzmKdm5CYCFA0Z6xAvGemYs1hPGC+gNrT/QLgw2anrxnotS9GmWGOKHx1BX0OxchxnE+
	+E534QVcFrZpLt+wcxZspyknYglPLjdLNHygtDaACuC7GRV0/n/SpYzcCPOIxlM6Yodn
	cvrGd2cp5odtg6hKzcS2PLFw4QVw/7ecdt0evfv1B/6sDaYCQO29MBohrFxsyGHFYKjg
	QAyw==
Received: by 10.216.138.17 with SMTP id z17mr3551296wei.18.1331802109497;
	Thu, 15 Mar 2012 02:01:49 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id w10sm5904932wiy.3.2012.03.15.02.01.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 02:01:48 -0700 (PDT)
Date: Thu, 15 Mar 2012 08:21:21 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20120315082121.GA14640@stefanha-thinkpad.localdomain>
References: <1331168981-13139-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1331168981-13139-1-git-send-email-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] .gitignore update
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
X-List-Received-Date: Thu, 15 Mar 2012 09:02:21 -0000

On Thu, Mar 08, 2012 at 12:09:40PM +1100, David Gibson wrote:
> This adds a few previously missing generated files to .gitignore: the
> qemu-bridge-helper binary, and the linuxboot and multiboot images from
> pc-bios/optionrom.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  .gitignore                   |    1 +
>  pc-bios/optionrom/.gitignore |    5 +++++
>  2 files changed, 6 insertions(+), 0 deletions(-)
>  create mode 100644 pc-bios/optionrom/.gitignore

Only taking Patch 1, since Patch 2 seems to be covered by a
yet-to-be-merged patch on the list.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

