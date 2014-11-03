Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlLuf-0004er-1R
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 12:59:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46077)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1XlLuc-0004aT-Hp
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 12:59:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>) id 1XlLub-0001pj-KF
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 12:59:30 -0500
Received: from mail.lekensteyn.nl ([2a02:2308::360:1:25]:43891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter@lekensteyn.nl>)
	id 1XlLuX-0001nn-JE; Mon, 03 Nov 2014 12:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lekensteyn.nl; s=s2048-2014-q3; 
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From;
	bh=cDEzoW/OjSmAeyqemmBVKMSlRlv0wEArFoOcvvC93KI=; 
	b=IHT8fwcIf1sC+ELAPf8N3ZgPsZA/reGls0pXLrGse91sDULkpPleJlqgR9x2JuFhSYQlecbMWxW0hdIb3vK6dNzhnXrt3rHWmsZDamxcrFgMsQ7U0GkXlp9LQ4mNzpSCUocEKxP3uXmiTqbv1Y3yvNWLNqrpy5sX9zJTl7AqFDym7ZIBZtWSkv0MKuOLfRrRVh945YU916ZOtNcPGCFoNnlHY/4ifFifIX7oKuXFNz1MxZtaPcUzpN8YnsSyi6vJUfMvW5j8AbpVY0PlrlQ2vhwhQjDO0m+bpUXys6ZWJWXE18w7kg2VFEacJ8etJn5r0rouX4c0wgroSBwCkEttuA==;
Received: by lekensteyn.nl with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
	(Exim 4.80) (envelope-from <peter@lekensteyn.nl>)
	id 1XlLuU-0006wK-Oo; Mon, 03 Nov 2014 18:59:23 +0100
From: Peter Wu <peter@lekensteyn.nl>
To: qemu-devel@nongnu.org
Date: Mon, 03 Nov 2014 18:59:21 +0100
Message-ID: <3098080.6ftE1k1ya5@al>
User-Agent: KMail/4.13.3 (Linux/3.17.0-rc4-custom-00168-g7ec62d4; KDE/4.14.2;
	x86_64; ; )
In-Reply-To: <54578DFC.3070807@msgid.tls.msk.ru>
References: <1415011930-1964-1-git-send-email-peter@lekensteyn.nl>
	<54578DFC.3070807@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a02:2308::360:1:25
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] slirp/smbd: disable printer
	in smb config
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
X-List-Received-Date: Mon, 03 Nov 2014 17:59:31 -0000

On Monday 03 November 2014 17:15:24 Michael Tokarev wrote:
> BTW, I'm not sure `socket address' paraameter is relevant in this context
> at all, -- smbd should not use it in inetd mode.  It'd be interesting to
> know why this option is here to start with, and whenever we really need
> the new interfaces/bind-interfacs-only replacement.

The socket option is unused when QEMU invokes the command directly. The
only (weak) reason why it is still there is to ease testing, such that
you can simply use:

    smbd -s smb.conf -p 1337

Without the socket option, I am afraid that you will accidentally expose
the very permissive share to the network.

So either append a comment explaining the above or just remove it. I am
fine with removing the interfaces option from this patch (or in a future
patch if you prefer that).
-- 
Kind regards,
Peter
https://lekensteyn.nl


