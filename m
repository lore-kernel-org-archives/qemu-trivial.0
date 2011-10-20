Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGwR3-0001am-Hm
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2011 13:29:41 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGwR0-0001RW-Bc
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 13:29:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGwQy-000233-E0
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 13:29:37 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:55284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RGwQt-00020w-Nh; Thu, 20 Oct 2011 13:29:31 -0400
Received: by ywp17 with SMTP id 17so3670753ywp.4
	for <multiple recipients>; Thu, 20 Oct 2011 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NTVAeGLQ/RqsIg3Ppas+0+lo+suExDHoOeLKeAPDtQA=;
	b=Bb4ISR5cKn7Y+iXENmSjp8qvEaH5QeGRDu7pc08PNNXK0XmQsOii4e1bUvqICbg9Ji
	y1l5fyRd6vCRbmLVAvRgD8OTf3TjDBsV45DjelDA37PtXi64rAVqBBSMKaWC18Tsw2/U
	FBFyOMQHBXpZbPNryryLTHm8O30GCwzWoX3OU=
Received: by 10.68.36.6 with SMTP id m6mr19754236pbj.111.1319131391510;
	Thu, 20 Oct 2011 10:23:11 -0700 (PDT)
Received: from localhost ([71.198.47.196])
	by mx.google.com with ESMTPS id v8sm20855830pbf.8.2011.10.20.10.23.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 10:23:10 -0700 (PDT)
Date: Thu, 20 Oct 2011 10:23:09 -0700
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Pavel Borzenkov <pavel.borzenkov@gmail.com>
Message-ID: <20111020172309.GB14359@stefanha-thinkpad.localdomain>
References: <1318958276-14049-1-git-send-email-pavel.borzenkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1318958276-14049-1-git-send-email-pavel.borzenkov@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qed: remove unneeded variable assignment
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
X-List-Received-Date: Thu, 20 Oct 2011 17:29:39 -0000

On Tue, Oct 18, 2011 at 09:17:56PM +0400, Pavel Borzenkov wrote:
> 'ret' is unconditionally overwitten by qed_read_l1_table_sync()
> 
> Spotted by Clang Analyzer
> 
> Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
> ---
>  block/qed.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

