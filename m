Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RRMh1-0001NQ-3R
	for mharc-qemu-trivial@gnu.org; Fri, 18 Nov 2011 06:33:15 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMgv-000130-25
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:33:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMgr-0008Sf-DN
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:33:09 -0500
Received: from mail-fx0-f45.google.com ([209.85.161.45]:55934)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RRMgi-0008RD-E3; Fri, 18 Nov 2011 06:32:56 -0500
Received: by faas14 with SMTP id s14so4558135faa.4
	for <multiple recipients>; Fri, 18 Nov 2011 03:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=a1W9C5YOIGG7Dd+UCaB0tilgzLvtXvEmle0sOd7Kr5A=;
	b=n2uHQRKL2uteDqyibyKM8CLYc2VIKbZxYIepZgFYDZMLBAm1m+HRVUol9zugSBDB9W
	cWegbI0gqstg2Tc9lMrwToBXT5SCoSPT7QtKKKkM+AHeJAswvyglbX5CwTe7BMGZJ2N7
	POUrCMicYeE1FwPUWq0qZikpPOx437HWtjt8E=
Received: by 10.205.119.207 with SMTP id fv15mr2929675bkc.100.1321615975372;
	Fri, 18 Nov 2011 03:32:55 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id z3sm5104399faf.13.2011.11.18.03.32.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 03:32:54 -0800 (PST)
Date: Fri, 18 Nov 2011 11:32:53 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111118113253.GA13224@stefanha-thinkpad.localdomain>
References: <1321554178-12486-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321554178-12486-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] gdbstub: Fix GDBRegisterState memory
 leak and use g_new0 to allocate it
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
X-List-Received-Date: Fri, 18 Nov 2011 11:33:12 -0000

On Thu, Nov 17, 2011 at 07:22:58PM +0100, Stefan Weil wrote:
> cppcheck reported a memory leak which is fixed here.
> 
> I also replaced the corresponding g_malloc0 by g_new0 because
> that helps reviewers, and it is required by latest recommendations
> anyway.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  gdbstub.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

