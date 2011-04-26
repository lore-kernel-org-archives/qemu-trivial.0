Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QEeWx-0000Ms-IE
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2011 05:26:03 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QEeWv-0000Ja-Pz
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2011 05:26:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QEeWv-0000sU-2i
	for qemu-trivial@nongnu.org; Tue, 26 Apr 2011 05:26:01 -0400
Received: from mail-gx0-f173.google.com ([209.85.161.173]:54630)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QEeWs-0000ra-Q8; Tue, 26 Apr 2011 05:25:58 -0400
Received: by gxk26 with SMTP id 26so197032gxk.4
	for <multiple recipients>; Tue, 26 Apr 2011 02:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=g/+DhfCA5sb49czmIzkYrpiL2utgL/3Ywyjr8OCYiy4=;
	b=osk091dpWLCCambv5QNJaC2BUUx7nJdnel9Q5OzMVGNqetBFtOYh2I/BrPRbw1Kmh4
	f9ci+APEB/rc3pOSIJVHZQXQcEP2famhtiX4M+brl1KpQC5qLeCUL7jxe9LeOq5Tz31B
	HuyNQvAJ90mo8LqQLRVz1l0nz1rv+4s2l/xK8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=FQKu3xevaEOE3f3FRKj6hPm2Fl6StEWsqzjTJ7ee0xqDoiaF29TbPwaOLmvsJGH2YT
	ixRxv5du4ybJ9gkd0GEWZleZdbE0Cq28+wAwetEg7OGoLS1gJvd+tgdK/mYK0uwfu2vN
	2dwA9scbm5d/JJ5jmM2xvbET3n2tw0GwizG2g=
MIME-Version: 1.0
Received: by 10.150.93.17 with SMTP id q17mr471235ybb.186.1303809958107; Tue,
	26 Apr 2011 02:25:58 -0700 (PDT)
Received: by 10.147.172.9 with HTTP; Tue, 26 Apr 2011 02:25:58 -0700 (PDT)
In-Reply-To: <1303806576-10286-1-git-send-email-weil@mail.berlios.de>
References: <1303806576-10286-1-git-send-email-weil@mail.berlios.de>
Date: Tue, 26 Apr 2011 10:25:58 +0100
Message-ID: <BANLkTincnFqEYO2MmKaU01_jZQhHU=iKGg@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.173
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Fix typo in code and comments
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
X-List-Received-Date: Tue, 26 Apr 2011 09:26:02 -0000

On Tue, Apr 26, 2011 at 9:29 AM, Stefan Weil <weil@mail.berlios.de> wrote:
> Replace writeable -> writable

Why make this change?  writeable and writable are both commonly used spellings.

Stefan

