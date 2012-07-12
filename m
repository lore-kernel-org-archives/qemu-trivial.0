Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SpGtl-0007OK-WD
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jul 2012 06:45:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SpGta-0007Ms-Nz
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2012 06:45:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SpGtU-0000Ln-0H
	for qemu-trivial@nongnu.org; Thu, 12 Jul 2012 06:45:18 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:35063)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SpGtT-0000LJ-Ph; Thu, 12 Jul 2012 06:45:11 -0400
Received: by weyz53 with SMTP id z53so1514960wey.4
	for <multiple recipients>; Thu, 12 Jul 2012 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EAbSLnol7GY2vSFlEgDKEXoJbOe8fRWxxit699LqO/A=;
	b=TSXLahyLL/x8M1MPFPvzdievcl+WudelxQG3uNqpaG8yiRgUMSIx/wHEZ+ovU0JsXm
	cVPOlZMY9h5yPPLQTJMueuiiVOVBTJVFSSS7k+a+ilnuKR/6Kc+uBAms/qTKbpZGEnTP
	QlgrLkz0yUEupSmY6MRT+QjpMFb9+etzzBIHBd5khYTAhSIklaYwl1Bv7eKkFO6PV0J4
	9UUvQa3C9kfyZFKakXDt6XjG8b037tLsrvPYogJ+3VBNJGkSxyEoWyDqHmRvM9AsF75s
	agALEuP0iZwQVJc2kLVtGpUr4JJQk/A7A8w7Wu9BdoA2WLNf1S1gANowgbusjYZlSiyk
	754g==
Received: by 10.180.105.163 with SMTP id gn3mr54867202wib.2.1342089910877;
	Thu, 12 Jul 2012 03:45:10 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	k20sm11606542wiv.11.2012.07.12.03.45.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 03:45:10 -0700 (PDT)
Date: Thu, 12 Jul 2012 11:45:07 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hannes Reinecke <hare@suse.de>
Message-ID: <20120712104507.GB22719@stefanha-thinkpad.localdomain>
References: <1341396145-31338-1-git-send-email-hare@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1341396145-31338-1-git-send-email-hare@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] MAINTAINERS: mark megasas
	as maintained
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
X-List-Received-Date: Thu, 12 Jul 2012 10:45:28 -0000

On Wed, Jul 04, 2012 at 12:02:25PM +0200, Hannes Reinecke wrote:
> Add maintainers entry for megasas.
> Patch is on top of Paolo's scsi-next tree.
> 
> Signed-off-by: Hannes Reinecke <hare@suse.de>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  MAINTAINERS |    6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)

Changing ./MAINTAINERS is never trivial.  Please go directly through
qemu.git.

Stefan

