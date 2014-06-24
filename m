Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzXsR-0002hx-Pf
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 17:03:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WzXsJ-0002X8-LF
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 17:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WzXsC-0006TU-QH
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 17:03:31 -0400
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e]:34085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WzXry-00067n-Ve; Tue, 24 Jun 2014 17:03:11 -0400
Received: by mail-wi0-f174.google.com with SMTP id bs8so6733332wib.1
	for <multiple recipients>; Tue, 24 Jun 2014 14:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=aeWKiIU8qgLl1DDkvbM6iW6LwpD+4JZrl7+NHKWt36c=;
	b=VMPM9rEb6BSW1XRFze4w9BqGNuUdjC2IDYh3O1th5eSA0+Slo9TK0xoPtDAfe3ruxA
	6qwa1Btr/M+L4zacYxSB/j2ggXYWYSg5vplSsJNTF2abZaAZERXqI/rmHkLDHktBrk8V
	FI7WC+/wBZ9F52fkzOrdp5oY3Cm2r9FFx4ZXoCJR9Fz5plIFTykPrJSWV839gwtlQXOq
	B7gCKK9DpiguxddkLfA0A7EbP4oiXVFeMHEJrdhLjwzsuhJ8mI+JWhWDr2iCnxJkJ9bC
	Sa9mE163GgRUF+vzkzjQbgIao6ev3AT6F005rcu/Czj0mf8k3H3hIOv3BzswZTc1pDwA
	zlvw==
X-Received: by 10.180.211.144 with SMTP id nc16mr36878203wic.43.1403643789860; 
	Tue, 24 Jun 2014 14:03:09 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-2-36-226-104.cust.vodafonedsl.it.
	[2.36.226.104])
	by mx.google.com with ESMTPSA id fh5sm46519026wic.9.2014.06.24.14.03.08
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 24 Jun 2014 14:03:08 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <53A9E789.8040809@redhat.com>
Date: Tue, 24 Jun 2014 23:03:05 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1403643149-30440-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1403643149-30440-1-git-send-email-sw@weilnetz.de>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22e
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] oslib-posix: Fix new compiler error with
	-Wclobbered
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
X-List-Received-Date: Tue, 24 Jun 2014 21:03:39 -0000

Il 24/06/2014 22:52, Stefan Weil ha scritto:
> Newer versions of gcc report a warning (or an error with -Werror) when
> compiler option -Wclobbered (or -Wextra) is active:
>
> util/oslib-posix.c:372:12: error:
>  variable ‘hpagesize’ might be clobbered by ‘longjmp’ or ‘vfork’ [-Werror=clobbered]
>
> The rewritten code fixes this warning: variable 'hpagesize' is now set and
> used in a block without any call of sigsetjmp or similar functions.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

