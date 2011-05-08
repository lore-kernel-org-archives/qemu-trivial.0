Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ2iD-0005MZ-Sm
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 08:03:49 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2iB-0005HO-G3
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:03:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2iA-0003g1-Cu
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:03:47 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:46348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJ2i7-0003fU-Nw; Sun, 08 May 2011 08:03:43 -0400
Received: by wyb42 with SMTP id 42so3835719wyb.4
	for <multiple recipients>; Sun, 08 May 2011 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ajLpU+C3XuwuYpkwXWYdE6wKt2QL7ArGofHJ+naju0M=;
	b=wDt0R8ZOFvB6TfcyNm9T/Y5Xc1UsMTNO20T5dBUBhsKA6HFCz7n6C9xRTi7Lg4Zzz0
	s2G6RCKZQ5pwk23EYjatgnXn2Sf1U33sxI81X/3kAP7Za22RJ2MNBegaJZc++1wFVD1z
	nxPRAvj+YMLo7RZ32qz11hv8HyAAFYeJWFvFk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=vSHcb0E0hJwcdpk8GeEzyV5a1Yq1cKpflZobofD/T+1omOxx3viVyvnpGmtNak6qdo
	PVdWalB9zktTUOzm1kuisOFli5yANy9EFuKkGfNfDYVGBW3nncolDPx4ogXWfM5xJsOB
	7FdvGVnX1G/8DcD2YCoymjhUwtGTmorufkduI=
Received: by 10.216.60.193 with SMTP id u43mr1550155wec.103.1304856222934;
	Sun, 08 May 2011 05:03:42 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id f52sm2503230wes.11.2011.05.08.05.03.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 05:03:42 -0700 (PDT)
Date: Sun, 8 May 2011 13:03:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110508120338.GE10500@stefanha-thinkpad.localdomain>
References: <1304800345-21474-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304800345-21474-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Replace
	deprecated function
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
X-List-Received-Date: Sun, 08 May 2011 12:03:48 -0000

On Sat, May 07, 2011 at 10:32:25PM +0200, Stefan Weil wrote:
> Function bzero is deprecated, so replace it by function memset.
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  linux-user/syscall.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial-patches branch:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

For more information see http://wiki.qemu.org/Contribute/TrivialPatches.

Stefan

