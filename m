Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QrqYD-00009r-QV
	for mharc-qemu-trivial@gnu.org; Fri, 12 Aug 2011 08:09:21 -0400
Received: from eggs.gnu.org ([140.186.70.92]:34620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QrqYB-0008Sy-5F
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2011 08:09:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QrqYA-0000Ck-94
	for qemu-trivial@nongnu.org; Fri, 12 Aug 2011 08:09:19 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:58410)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QrqY7-0000CA-Sa; Fri, 12 Aug 2011 08:09:16 -0400
Received: by fxbb27 with SMTP id b27so2593996fxb.4
	for <multiple recipients>; Fri, 12 Aug 2011 05:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3Ir5gHZ0XLc6syYhrjTLoU9Y7fXiNYyuqo98A/kY0Es=;
	b=ioIXGnvPaQ/GdJbi3gzCcMaeIL7MjR1yKrCStoegVnP02RbDe/aCqnA36x04ru5gRU
	uyDAdBZO3IiOGk494k/Pure2pet/VDY4CSeMVpS9Zau4pCBbnTl3q5p8sVKUy2/RCrBy
	5pN27GAzcdsta+md6RqJIqFyOU5ELsPI8Y/XE=
Received: by 10.223.134.88 with SMTP id i24mr1176068fat.68.1313150954969;
	Fri, 12 Aug 2011 05:09:14 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id 11sm1015642faf.25.2011.08.12.05.09.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Aug 2011 05:09:14 -0700 (PDT)
Date: Fri, 12 Aug 2011 13:09:08 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20110812120908.GA8454@stefanha-thinkpad.localdomain>
References: <1313147894-12524-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1313147894-12524-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] fix QLIST usage for RAM list
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
X-List-Received-Date: Fri, 12 Aug 2011 12:09:20 -0000

On Fri, Aug 12, 2011 at 01:18:14PM +0200, Paolo Bonzini wrote:
> Spotted while reviewing the migration thread patches.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  cpu-all.h |    2 +-
>  exec.c    |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

