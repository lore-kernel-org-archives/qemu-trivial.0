Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ2iT-0005sz-98
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 08:04:05 -0400
Received: from eggs.gnu.org ([140.186.70.92]:55002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2iR-0005oH-4G
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:04:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2iQ-0003hk-0H
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:04:03 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:46348)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJ2iN-0003fU-UM; Sun, 08 May 2011 08:04:00 -0400
Received: by mail-wy0-f173.google.com with SMTP id 42so3835719wyb.4
	for <multiple recipients>; Sun, 08 May 2011 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=eYQ8m2Bhv0/mB1WaebahvM968FlhmNWbZJdnkzNYqtM=;
	b=d0Jbt8mx3rjMPGpO+CpoPgZNQsRIeVNOf8i1xC/C0QeSBQ7TX6KodAiFJHg5shtiZJ
	2FmcTBbE1z4eyDJwGpw/tmVG8x/ieeyJ+erPblXHzvsJdfnJOlPyeZ47ZeRJl6gHhEz8
	DXRMUZ7BG97XTPlAJyR4kOXcpe5nnQzdN9aJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=aFJEG6+lXad74UkCDiNMAKkvbmJPKJYv2likfe24CDM9viYuWiUSg8eVdwpULfGQN6
	qNbAtTicihve26BX/SRRC0Xcf58yCAfacJBAT8aVmAdhaezpBrfzDGwJ3ySlFye7uzJG
	HuWPZAbUfx84ifRvlREgHDHiY8mBQjaPvuQLo=
Received: by 10.227.23.211 with SMTP id s19mr113874wbb.34.1304856239393;
	Sun, 08 May 2011 05:03:59 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id z9sm3109609wbx.51.2011.05.08.05.03.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 05:03:58 -0700 (PDT)
Date: Sun, 8 May 2011 13:03:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110508120355.GF10500@stefanha-thinkpad.localdomain>
References: <1304837891-28573-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304837891-28573-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ac97: Remove unused local
	variables
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
X-List-Received-Date: Sun, 08 May 2011 12:04:04 -0000

On Sun, May 08, 2011 at 08:58:11AM +0200, Stefan Weil wrote:
> cppcheck report:
> hw/ac97.c:1004: style:
>  Variable 'written' is assigned a value that is never used
> hw/ac97.c:1072: style:
>  Variable 'written' is assigned a value that is never used
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  hw/ac97.c |    6 +-----
>  1 files changed, 1 insertions(+), 5 deletions(-)

Thanks, applied to the trivial-patches branch:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

For more information see http://wiki.qemu.org/Contribute/TrivialPatches.

Stefan

