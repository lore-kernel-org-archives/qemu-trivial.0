Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tl0EW-0004t7-3D
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2012 11:41:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45333)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tl0EI-0004lz-KF
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:41:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tl0E8-000230-V4
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:41:18 -0500
Received: from mail-wg0-f49.google.com ([74.125.82.49]:44031)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tl0E8-000226-Nx; Tue, 18 Dec 2012 11:41:08 -0500
Received: by mail-wg0-f49.google.com with SMTP id 15so391103wgd.28
	for <multiple recipients>; Tue, 18 Dec 2012 08:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=8n5OlwT0qqMdmnK9RzXNzYrslXTM/9apJGmXTYMnupQ=;
	b=v5Fcwnt1wFHms1rP1hWglC1Mc3sJIXYTcVmr3bnz9noRsDam6Sv7mXebcXCtebY9XY
	b+Zt8Swr5Y8I5cZc1pf+8Ou2dAjBvbjcN07TiGHR+8MEoXpS9NS9HmYYdYJpZCvUD4Sq
	UOGXieZ+SLQ3CNh8oEv6JgKaS5o/PBR+uWoigLNbAKVLd1YwG1zB3LDnk1mG/m3Y2/Ux
	n1sgf6rcAy5W7NRKFHnMRptSPvvw+1OvAUbySaq7KGvaVL1iqzOcuqfpyPZVkCIRTrPq
	cFQ9PwY8tdoFlniLmrfrC5WcrellR2Cd1Fyhg4rIHpAH8hVtQ3pAV1ihadUpz/pPmxD4
	poPg==
X-Received: by 10.180.101.99 with SMTP id ff3mr5571093wib.21.1355848867821;
	Tue, 18 Dec 2012 08:41:07 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id t17sm3434861wiv.6.2012.12.18.08.41.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:41:06 -0800 (PST)
Date: Tue, 18 Dec 2012 17:41:05 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121218164105.GB29445@stefanha-thinkpad.redhat.com>
References: <1355653785-2668-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1355653785-2668-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.49
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Earlier pkg-config probe
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
X-List-Received-Date: Tue, 18 Dec 2012 16:41:30 -0000

On Sun, Dec 16, 2012 at 11:29:45AM +0100, Stefan Weil wrote:
> Probe pkg-config before it is used for the first time (libseccomp check).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |   16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

