Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qmkuw-0000Jh-0h
	for mharc-qemu-trivial@gnu.org; Fri, 29 Jul 2011 07:07:46 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qmkut-0000AD-6q
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 07:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Qmkur-0000gw-Rk
	for qemu-trivial@nongnu.org; Fri, 29 Jul 2011 07:07:43 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:37376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Qmkup-0000g4-3j; Fri, 29 Jul 2011 07:07:39 -0400
Received: by fxbb27 with SMTP id b27so2172480fxb.4
	for <multiple recipients>; Fri, 29 Jul 2011 04:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bm389HlG7tTsNNOc/p4RDlhq8bBMn5m1bGnyXhaWpfI=;
	b=nsIbNRf9NzZaq521Nhww3USUUF3GD2NuPqCiSg+SJ2z5gtYvFU+IfA2lW11GLv3fiU
	kHUNu1Gy6nHpih/pu7t7Oz2v4yaukOzfwkzaSF4/I+5ZrnNg7Tgn0NPvLlXgWjUDC0Y4
	4kYxtYdHcHFD/pGnxv6yp+Fo7BxxpJr2ZKoew=
Received: by 10.223.76.71 with SMTP id b7mr1670476fak.30.1311937657365;
	Fri, 29 Jul 2011 04:07:37 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id 28sm1025549fax.27.2011.07.29.04.07.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Jul 2011 04:07:35 -0700 (PDT)
Date: Fri, 29 Jul 2011 12:07:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Message-ID: <20110729110730.GA24406@stefanha-thinkpad.localdomain>
References: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
	<1311652562-10794-3-git-send-email-cerbere@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1311652562-10794-3-git-send-email-cerbere@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Makefile: delete
	config.log in distclean
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
X-List-Received-Date: Fri, 29 Jul 2011 11:07:44 -0000

On Mon, Jul 25, 2011 at 11:56:02PM -0400, Alexandre Raymond wrote:
> Distclean should remove anything created by the configure script.
> 
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
>  Makefile |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

