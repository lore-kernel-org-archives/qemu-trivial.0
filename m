Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RqePH-000768-4R
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 00:31:27 -0500
Received: from eggs.gnu.org ([140.186.70.92]:32784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqePD-0006uL-HW
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 00:31:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RqePB-0004OU-UV
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 00:31:23 -0500
Received: from mail-pz0-f45.google.com ([209.85.210.45]:34380)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RqeP9-0004O9-73; Fri, 27 Jan 2012 00:31:19 -0500
Received: by dajr28 with SMTP id r28so1397732daj.4
	for <multiple recipients>; Thu, 26 Jan 2012 21:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=aCatjivjqGcbwJQrBwqJyjK/CemUgsldftzNya1g2U4=;
	b=BMbUgsF3Yqp3NPgyy1XGJUGeAovVHPY6SyIKlS8gMqhGXY8xQuKo8PWBsRq4GYY3KJ
	CNI7lxUs5u0AZfT/CNzpJc/gJHxrLD74FWoyjffjnV0TSB6khDKireTetfzZlgnLvmdM
	JBixqkRAQrWltAX2fvEuOCd/PJxC232XGYJUc=
Received: by 10.68.74.72 with SMTP id r8mr11744903pbv.8.1327642277448;
	Thu, 26 Jan 2012 21:31:17 -0800 (PST)
Received: from localhost (42-98-55-070.static.netvigator.com. [42.98.55.70])
	by mx.google.com with ESMTPS id x4sm1969262pbx.16.2012.01.26.21.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 21:31:15 -0800 (PST)
Date: Fri, 27 Jan 2012 05:31:11 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20120127053111.GA17836@stefanha-thinkpad.localdomain>
References: <1327057522-6590-2-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1327057522-6590-2-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] remove #if 0 code for timers
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
X-List-Received-Date: Fri, 27 Jan 2012 05:31:25 -0000

On Fri, Jan 20, 2012 at 12:05:22PM +0100, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  qemu-timer.c |   29 -----------------------------
>  1 files changed, 0 insertions(+), 29 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

