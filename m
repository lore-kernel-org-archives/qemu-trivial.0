Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmkVU-0002Za-8n
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jun 2013 08:50:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UmkVO-0002Qu-HZ
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 08:50:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UmkVJ-0008B0-Qn
	for qemu-trivial@nongnu.org; Wed, 12 Jun 2013 08:50:26 -0400
Received: from mail-qa0-x22b.google.com ([2607:f8b0:400d:c00::22b]:61667)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UmkVG-0008A8-Vn; Wed, 12 Jun 2013 08:50:19 -0400
Received: by mail-qa0-f43.google.com with SMTP id d13so288099qak.16
	for <multiple recipients>; Wed, 12 Jun 2013 05:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=k1floIIeHOHRl8sSIdyoQH/RwKdwTJa1o6srpEDkmJM=;
	b=UW829hPUmLXTymIe4R6agIRL3xVwmu6ndDLw9MT8AyYzj08pTiBiY8mXfxjVEjW2Q1
	Pu/MmBZ47MhI8nvAjDwcoxOmGzvpK9euQXTyHsaPLJimUCgWfi4IXmk8R0/frwRnTkn2
	YeEGzML/kGn3p2uSgWL17qBpZU4S1QV4vfg5s0czXBC0rHFZYptPEbWU2tJWAhJ/kN8s
	FXzv5/X0iRkAUFXjgDMbHtiiCh5nvWlGUGicZqy3mi3LQOVe7QvXp/5faDbw2seuEVNO
	ng7yCihNcgIHTmxeHtG9PcuROrPP8tBH6XDLpT7ek8ePjrTk3D+SPUN7vBAebYOKL+rg
	Afzw==
X-Received: by 10.49.24.226 with SMTP id x2mr22648990qef.64.1371041418441;
	Wed, 12 Jun 2013 05:50:18 -0700 (PDT)
Received: from yakj.usersys.redhat.com ([64.251.112.55])
	by mx.google.com with ESMTPSA id j3sm25887030qav.1.2013.06.12.05.50.16
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 05:50:17 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <51B86E88.2020405@redhat.com>
Date: Wed, 12 Jun 2013 08:50:16 -0400
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1371040588-17938-1-git-send-email-mjt@msgid.tls.msk.ru>
In-Reply-To: <1371040588-17938-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] main-loop: do not include
 slirp/slirp.h, use libslirp.h instead
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
X-List-Received-Date: Wed, 12 Jun 2013 12:50:31 -0000

Il 12/06/2013 08:36, Michael Tokarev ha scritto:
> 
> Including slirp/slirp.h is somewhat dangerous since it redefines
> errno on WIN32, so any file including it may misbehave wrt errno.
> 
> Unfortunately libslirp isn't self-contained, it needs declaration
> of struct in_addr, which is provided by qemu/sockets.h.  Maybe
> instead of #including qemu/sockets.h before libslirp.h, it is
> better to make the latter self-contained.

Yeah, but I agree with having the smallest patch for now.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>


