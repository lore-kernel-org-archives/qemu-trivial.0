Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TZMDn-0002nH-3k
	for mharc-qemu-trivial@gnu.org; Fri, 16 Nov 2012 08:44:39 -0500
Received: from eggs.gnu.org ([208.118.235.92]:35031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMDj-0002be-2A
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:44:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TZMDg-0001Xz-0U
	for qemu-trivial@nongnu.org; Fri, 16 Nov 2012 08:44:35 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:37837)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TZMDZ-0001XY-Ks; Fri, 16 Nov 2012 08:44:25 -0500
Received: by mail-ee0-f45.google.com with SMTP id d49so1670604eek.4
	for <multiple recipients>; Fri, 16 Nov 2012 05:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B4HgyJgnKEbCs4KUs9yQPI+P54nQqxJXTaEx9V+cS+A=;
	b=kAgdqkreBtEAz17Zt/rTw4o/HEZP2X97QwZYPdPPMYDMT6Rll7p8gapQgM/REH3PJZ
	K6vVkyYSJu8anZohel6FlX5LVKoOxWb8ZuuVi5nTX0nBQN86t6oEz9zvnD7D3Xn7s2v9
	YbtZVV2nbQC0nm+yj4yXbwIFMlDru5CNE0NWf+CK+61zcUXLTR+qWo7vJwrlNaGVrp4S
	8IbKG8FmMgzKoOryr7Kok3JN/pEUaz8CxQxl3BOBGSMhcuPkM1KmVKew/ujgLYoLPhoA
	Xw0OrJ26QRFEDlLcyMgWmNzEuxKNV30LOTm+gw1gG0Iz7piRvnVmI7HWK6/AqzHiCiWk
	Sj0Q==
Received: by 10.14.194.2 with SMTP id l2mr13851861een.12.1353073464740;
	Fri, 16 Nov 2012 05:44:24 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id z43sm3551313een.16.2012.11.16.05.44.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Nov 2012 05:44:24 -0800 (PST)
Date: Fri, 16 Nov 2012 14:44:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20121116134422.GA31927@stefanha-thinkpad.redhat.com>
References: <1352461854-18195-1-git-send-email-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1352461854-18195-1-git-send-email-anthony.perard@citrix.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.83.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	QEMU-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH V2] qemu-sockets: Fix parsing of the inet
 option 'to'.
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
X-List-Received-Date: Fri, 16 Nov 2012 13:44:38 -0000

On Fri, Nov 09, 2012 at 11:50:54AM +0000, Anthony PERARD wrote:
> Having a qemu command line argument like "-vnc 127.0.0.1:0,to=99" is broken.
> This have been break with commit 879e45c72da1569e07fbbc6a1aa2a708ea796044.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> 
> ---
>  qemu-sockets.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

