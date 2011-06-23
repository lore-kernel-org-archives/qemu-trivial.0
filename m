Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZk3c-0006iZ-BD
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 09:34:56 -0400
Received: from eggs.gnu.org ([140.186.70.92]:41794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk3Y-0006gw-PP
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:34:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QZk3X-00039j-9W
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 09:34:52 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:62380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QZk3W-00039c-TR; Thu, 23 Jun 2011 09:34:51 -0400
Received: by wwf26 with SMTP id 26so1680020wwf.10
	for <multiple recipients>; Thu, 23 Jun 2011 06:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=gyLbk9QHEPaeAhFQfpThXLOkMasl85jHzXnzX73hg+4=;
	b=hkTL0Ul1HD2/Y6we1DRzd6riqlxdT6X2VZEQWXb1d2bY3ZdJQ27kwFazVdjYHLQD4a
	39z5tcN83TP8Sw/KOg5jdwhxcjLUNuuElwweDCav2gCvQflXm4FZleGuHpabC+tS3t5W
	80JEsX0SIQqU1xihQ6daSWC1JWsPVFWJW6RYk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=t9XX36Zwvqm9cOeHVn9B9OmZEkusUWYU1dgBF0c9PFe1O9tuW+INmpiwXaDSbhw1m1
	8rytDR8dq/poQAJpMHW8TCfM1bY0s2nf2u6bNVpPOZIHW3xkUB0R1r6sT6Giws3qIGUy
	JIwl8XLMzwSQGdfMtBHHOJ9JX/o4EqLumuG9o=
Received: by 10.216.254.37 with SMTP id g37mr1923401wes.36.1308836088353;
	Thu, 23 Jun 2011 06:34:48 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id w58sm865367weq.25.2011.06.23.06.34.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Jun 2011 06:34:47 -0700 (PDT)
Date: Thu, 23 Jun 2011 14:34:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20110623133444.GE12698@stefanha-thinkpad.localdomain>
References: <4E02F63B.7050701@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E02F63B.7050701@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <weil@mail.berlios.de>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Do not include compatfd for WIN32
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
X-List-Received-Date: Thu, 23 Jun 2011 13:34:54 -0000

On Thu, Jun 23, 2011 at 10:15:55AM +0200, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> sigset_t, used by that header, is not available in mingw32 environments.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  cpus.c |    3 +++
>  1 files changed, 3 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

