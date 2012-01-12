Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlKoI-0004Tw-QX
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 08:35:18 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49352)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKoH-0004Tp-1w
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:35:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlKoE-0001eY-Pj
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:35:17 -0500
Received: from mail-ee0-f46.google.com ([74.125.83.46]:41632)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RlKoE-0001eB-IZ; Thu, 12 Jan 2012 08:35:14 -0500
Received: by eekd4 with SMTP id d4so791445eek.33
	for <multiple recipients>; Thu, 12 Jan 2012 05:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=sg3hWmthO7IJt4X5GK+zYO1VBaAoAjKytweGUOigJm8=;
	b=EjgVlAp7oP6Hy/rRLRtfPjoPTtew6UATw0RQ1bstpyr6izBqBV8Nb0X/FnD+pVBkR6
	2bzoYvosN//yPEMgkwOSKfN4bWlQB7I9WikItCjohpT4cXtT8qoKr15kgWX8DQKKlbvT
	uv5TwV/EHvIPsV76lLrFiLQuZOa1fLfP47FJc=
Received: by 10.14.29.14 with SMTP id h14mr1389857eea.70.1326375312944;
	Thu, 12 Jan 2012 05:35:12 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id 15sm19621306eeu.1.2012.01.12.05.35.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 05:35:12 -0800 (PST)
Date: Thu, 12 Jan 2012 13:35:10 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Berger <stefanb@linux.vnet.ibm.com>
Message-ID: <20120112133510.GA23222@stefanha-thinkpad.localdomain>
References: <4F0DB018.5080302@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F0DB018.5080302@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.83.46
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] hmp: Fix freeing of PciInfoList
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
X-List-Received-Date: Thu, 12 Jan 2012 13:35:18 -0000

On Wed, Jan 11, 2012 at 10:51:52AM -0500, Stefan Berger wrote:
> Remember the original PciInfoList in info_list and use
> the info variable to traverse the list.
> 
> Signed-off-by: Stefan Berger <stefanb@linux.vnet.ibm.com>
> 
> ---
>  hmp.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree but see below:
https://github.com/stefanha/qemu/commits/trivial-patches

Your patch seems to use two columns instead of just one column for
'-'/'+'/' '.  This confused both git-am(1) and patch(1).  Perhaps you
can figure out why your patch was generated like this?  It reminds me of
diff3 where there are two columns because it compares file A and B
against a common ancestor file.

> Index: qemu-git.pt/hmp.c
> ===================================================================
> --- qemu-git.pt.orig/hmp.c
> +++ qemu-git.pt/hmp.c
> @@ -486,17 +486,17 @@ static void hmp_info_pci_device(Monitor
> 
>  void hmp_info_pci(Monitor *mon)
>  {
> -    PciInfoList *info;
> +    PciInfoList *info_list, info;

Missing '*' to make info a pointer too.  Fails to build, I fixed this
when merging so don't worry about it.

Stefan

