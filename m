Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZMJd-0000jL-L6
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2012 08:50:41 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55157)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMJZ-0000Vm-02
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:50:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMJV-0002yP-TN
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:50:36 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:42732)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TZMJP-0002wo-IO; Fri, 16 Nov 2012 08:50:27 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so1675092eek.4
	for <multiple recipients>; Fri, 16 Nov 2012 05:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6uN0SuVYD4aW2CBPqhH0duptkGc/0PJXG+56/iGJmz0=;
	b=nLTNM4o3r2fPUF++GcV23dtpaY022FQq5x8lr8C4bqlIMIh2oj8nEw6JHS5Img7HCu
	sfUWsaAQ/dv+hPNSYDCxi0iUrXDpF45qQmLhF0EPeK1YudEO9hIavAYYR3hj9peZJPpT
	W0klOK4No9n+hzk2uvKXnZjrePITrPic3tE73nfU9fFhNfgnE2M1glVrHfXVxp337cyt
	jU7LEBxll3z5yKXHlcRga0n6X4UwnoIjhNSM42Ve8vpvWWSxPE8eA5lCCYMeY5KbfEgT
	UGDHxmVGnCf4QSvNs258MYuVOtH7hI4PUcvfSJGAq+2Wc9BWj3bxdf3Hshq2YfoVFDe6
	A06Q==
Received: by 10.14.182.70 with SMTP id n46mr5646434eem.5.1353073826740;
	Fri, 16 Nov 2012 05:50:26 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id 42sm3635214eee.0.2012.11.16.05.50.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 05:50:26 -0800 (PST)
Date: Fri, 16 Nov 2012 14:50:24 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20121116135024.GB31927@stefanha-thinkpad.redhat.com>
References: <20121111221650.GA3575@foober.ini.cmu.edu>
	<50A0CECA.9060102@redhat.com>
	<20121112144918.GA2107@hedwig.ini.cmu.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20121112144918.GA2107@hedwig.ini.cmu.edu>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, jbaron@redhat.com, somlo@cmu.edu,
	qemu-devel@nongnu.org, "Gabriel L. Somlo" <gsomlo@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ehci: fix compile error
 with EHCI_DEBUG enabled
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
X-List-Received-Date: Fri, 16 Nov 2012 13:50:40 -0000

On Mon, Nov 12, 2012 at 09:49:19AM -0500, Gabriel L. Somlo wrote:
> This patch fixes a few debugging print statements whose arguments fell
> out of sync over time with changes being made to the active code base.
> 
> Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
> ---
> 
> On Mon, Nov 12, 2012 at 11:26:18AM +0100, Gerd Hoffmann wrote:
> > Seems macos doesn't like something in our ehci emulation ...
> > Can you send a trace with all ehci tracepoints enabled?
> 
> Turning EHCI_DEBUG on gave me compile errors. This is my best guess
> as to what the DPRINTF arguments *should* be, hope I guessed right :)

In that case I'll let Gerd confirm whether or not the guesses are
correct.

Gerd: can you review and take this through the USB tree?

Thanks,
Stefan

