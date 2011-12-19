Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rcaq0-0004Wb-1v
	for mharc-qemu-trivial@gnu.org; Mon, 19 Dec 2011 05:52:56 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rcapw-0004W5-My
	for qemu-trivial@nongnu.org; Mon, 19 Dec 2011 05:52:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rcaps-0006dH-57
	for qemu-trivial@nongnu.org; Mon, 19 Dec 2011 05:52:52 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:35685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rcapr-0006d8-Sw
	for qemu-trivial@nongnu.org; Mon, 19 Dec 2011 05:52:48 -0500
Received: by eekb45 with SMTP id b45so5957568eek.4
	for <qemu-trivial@nongnu.org>; Mon, 19 Dec 2011 02:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Sl5On1u0M5YGwliii7qI67DL4s64robUMpsF2wenqRQ=;
	b=MwJiP+xrht3ZthUjPUWeEAp03EQ+3/kk61kNS42BpeOKkyldaeiunzjSn3eGKR6ho+
	VVQT0uEiTmpd1vQJxhe7lLZ1qUVcCKPBIBiA1bAwoSOVKfx2qCUzw50ORM16XB5Louf3
	wGtqghS6VkLcO5pqaR7f7a2wVeOIBCh3HRhfM=
Received: by 10.213.10.145 with SMTP id p17mr2542372ebp.43.1324291966930;
	Mon, 19 Dec 2011 02:52:46 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id 13sm22738841eeu.1.2011.12.19.02.52.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Dec 2011 02:52:46 -0800 (PST)
Date: Mon, 19 Dec 2011 10:52:45 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Julian Pidancet <julian.pidancet@gmail.com>
Message-ID: <20111219105245.GA10981@stefanha-thinkpad.localdomain>
References: <f6c6b01e6bb9a48a80db3eabc38df974bba2d132.1324231597.git.julian.pidancet@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f6c6b01e6bb9a48a80db3eabc38df974bba2d132.1324231597.git.julian.pidancet@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com
Subject: Re: [Qemu-trivial] [PATCH] Also create piix3 property when Xen is
 enabled
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
X-List-Received-Date: Mon, 19 Dec 2011 10:52:54 -0000

On Sun, Dec 18, 2011 at 06:08:44PM +0000, Julian Pidancet wrote:
> This recently added line in hw/pc_piix.c is causing a SEGV on a Xen
> setup because the piix3 property is never created:
> 
> qdev_property_add_child(qdev_resolve_path("/i440fx/piix3", NULL),
>                             "rtc", (DeviceState *)rtc_state, NULL);
> 
> Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
> ---
>  hw/piix_pci.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

