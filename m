Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QOpqd-0005ZH-OJ
	for mharc-qemu-trivial@gnu.org; Tue, 24 May 2011 07:32:27 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QOpqa-0005Tr-N8
	for qemu-trivial@nongnu.org; Tue, 24 May 2011 07:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QOpqZ-0002U6-Ou
	for qemu-trivial@nongnu.org; Tue, 24 May 2011 07:32:24 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:58037)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QOpqT-0002TQ-G3; Tue, 24 May 2011 07:32:17 -0400
Received: by wyb42 with SMTP id 42so5579079wyb.4
	for <multiple recipients>; Tue, 24 May 2011 04:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=WZ6phV4V7kAxbqU0onGkdtYAc9ix2dStahFaSesRuc0=;
	b=j7RDvRJzQ3Nv3LNBiL5Qp0OdBDq6v1li17fyREDUbjZSxrQh+Q2se8wjLr2KGaaZk8
	/b/GlWUbeSxHpvfgfNZnPMcOEv1PNUbiZsfgmSbqvSFXyRjPFYZQfiQJvuqWLI1lyP+a
	wmblxbYiyvjKgobvSlRX5tnEaYq4WME8C/zDU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=cPUEAmg8c67cDqMN5PidppxjRDI0e59dl6enkepvP+2LwU9UEnif1awvsG4pMlVRLr
	QV150qfL1qSOLGLskaxLSEcgcNrtb8CTWeS0V7i8Hh2Bt58TaPx3w1yQuT6gSAEC9D8X
	k4sPfkdCBtoN+eJOsAPqrLN0hR4zIrOPky9UI=
Received: by 10.216.221.67 with SMTP id q45mr3200433wep.97.1306236736447;
	Tue, 24 May 2011 04:32:16 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id bi13sm4706853wbb.25.2011.05.24.04.32.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 04:32:15 -0700 (PDT)
Date: Tue, 24 May 2011 12:32:09 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110524113209.GA22385@stefanha-thinkpad.localdomain>
References: <1306065760-4541-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1306065760-4541-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH 1/2] pflash_cfi02: Fix a typo in debug
 code (TARGET_FMT_pld -> TARGET_FMT_plx)
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
X-List-Received-Date: Tue, 24 May 2011 11:32:25 -0000

On Sun, May 22, 2011 at 02:02:39PM +0200, Stefan Weil wrote:
> Thanks to Tobias Hoffmann <th55@gmx.de> for this patch.
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  hw/pflash_cfi02.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial-patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

