Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QAInf-00039H-Sf
	for mharc-qemu-trivial@gnu.org; Thu, 14 Apr 2011 05:25:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:43180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QAInd-00036h-O9
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2011 05:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QAInc-00061U-Sf
	for qemu-trivial@nongnu.org; Thu, 14 Apr 2011 05:25:17 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:42046)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QAInZ-00060i-TG; Thu, 14 Apr 2011 05:25:13 -0400
Received: by wyb42 with SMTP id 42so1401693wyb.4
	for <multiple recipients>; Thu, 14 Apr 2011 02:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=gi4bOQyqXexIvo52P29XOV1soJRncya/OiziEun7O8U=;
	b=d4yGbMGfQgOWmbq2Uog5aoz01KOpSD4aoAncve7Bdjb6vB3R2WX3rG8eENeqyIf16k
	LvFjbmR8avnFo8qbj5R9ea+W8bwNBK/D3Lvi64wmjz2gx0MGG5986jCWf6VR6eNzqlKV
	T9FFpArUcYTrAseOG+pVzvvLSWrRHohADuNDk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Ey/E4JhpdnKwjmcggZ4UFAjLPpazfTBQPmgacHKL/tbcpQNPuQb56nSxIptwyXb/tQ
	ONPboyQR6flkYx6vgjwwHJXJpwbvsxVSGmp/w6CrllW7hxlyhMnPFOXiAt82NBj3zhAG
	Fqp2JAX0YS6Sn48dt4lXaVl2ZQHwb/EhUmWy0=
Received: by 10.227.61.13 with SMTP id r13mr585815wbh.52.1302773112911;
	Thu, 14 Apr 2011 02:25:12 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id e13sm859724wbi.57.2011.04.14.02.25.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 14 Apr 2011 02:25:11 -0700 (PDT)
Date: Thu, 14 Apr 2011 10:25:06 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110414092506.GA32105@stefanha-thinkpad.localdomain>
References: <1302727522-15406-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1302727522-15406-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix some typos in comments and
 documentation
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <http://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <http://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Apr 2011 09:25:18 -0000

On Wed, Apr 13, 2011 at 10:45:22PM +0200, Stefan Weil wrote:
> helpfull -> helpful
> usefull -> useful
> cotrol -> control
> 
> and a grammar fix.
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  qemu-options.hx     |    4 ++--
>  savevm.c            |    2 +-
>  target-arm/helper.c |    2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)

Merged into the trivial-patches tree.  I will send a pull request to the
qemu.git maintainers:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

For more information, see
http://wiki.qemu.org/Contribute/TrivialPatches.

Stefan

