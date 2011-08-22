Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QvPoI-00040V-On
	for mharc-qemu-trivial@gnu.org; Mon, 22 Aug 2011 04:24:42 -0400
Received: from eggs.gnu.org ([140.186.70.92]:50873)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QvPoH-00040O-5Q
	for qemu-trivial@nongnu.org; Mon, 22 Aug 2011 04:24:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QvPoF-0001Zz-FH
	for qemu-trivial@nongnu.org; Mon, 22 Aug 2011 04:24:41 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:42492)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QvPoF-0001Zt-8M; Mon, 22 Aug 2011 04:24:39 -0400
Received: by fxbb27 with SMTP id b27so3529034fxb.4
	for <multiple recipients>; Mon, 22 Aug 2011 01:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7xOgF0eX8tIFIMAdRdZjZZm10tB3jkhMuS2Hze68VbM=;
	b=Eg9Ts+u6+C2lVS8OS/YhHEJlyKpjw63F3GTCY3ZDOBwfkQA8iGxjS7JhE2tkaI3CvM
	kyIebhA4z+3QtVwHBzcEiwAQiEOWfSrQCR2fOPkoI8owmftmfdK8bCA+Bxbz0pNNHNch
	pm3y8QbNjxh+FYXgG37/b7fqoQyFEXOMcmdgI=
Received: by 10.223.26.69 with SMTP id d5mr3318118fac.136.1314001478166;
	Mon, 22 Aug 2011 01:24:38 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id b13sm3059293fak.16.2011.08.22.01.24.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Aug 2011 01:24:36 -0700 (PDT)
Date: Mon, 22 Aug 2011 09:24:31 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20110822082431.GA7635@stefanha-thinkpad.localdomain>
References: <4E49AAC0.1090508@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E49AAC0.1090508@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix up some style nits of last uq/master
 merge
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
X-List-Received-Date: Mon, 22 Aug 2011 08:24:42 -0000

On Mon, Aug 15, 2011 at 04:24:48PM -0700, Jan Kiszka wrote:
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  cutils.c          |    2 +-
>  target-i386/kvm.c |    5 +++--
>  2 files changed, 4 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

