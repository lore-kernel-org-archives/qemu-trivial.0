Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXsPT-00053Q-1N
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2011 05:38:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:37075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsPN-0004iN-84
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:38:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsPH-0000fo-Ea
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:37:57 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:45029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RXsP9-0000ek-0M; Tue, 06 Dec 2011 05:37:43 -0500
Received: by bkaq10 with SMTP id q10so5967663bka.4
	for <multiple recipients>; Tue, 06 Dec 2011 02:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SLuZ1BvtxVZk4ONuu5o6sgEVVw37nm0/HCInGTV5FBQ=;
	b=ZFQp2i8i9b47dYIfIKPL5Z7GzVUpAXL7aNGxJth+zji8g1ZZRADYcPfRHcaDgUfeII
	WrEEIk1MZo6AVlBKpeATjMqSpuqrdSqX1RykhPiCKpsYFVudr5KmQcCrt2Z0xbdcj35a
	Jt+9mFbF1pp36nxIisEj3Ao1c7eZEjo6byWpk=
Received: by 10.181.11.226 with SMTP id el2mr16530970wid.64.1323167860751;
	Tue, 06 Dec 2011 02:37:40 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id 4sm12187471wbx.11.2011.12.06.02.37.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:37:40 -0800 (PST)
Date: Tue, 6 Dec 2011 10:37:38 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111206103738.GA10165@stefanha-thinkpad.localdomain>
References: <1322905525-354-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1322905525-354-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Convert keymap file to UTF-8 encoding
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
X-List-Received-Date: Tue, 06 Dec 2011 10:38:01 -0000

On Sat, Dec 03, 2011 at 10:45:25AM +0100, Stefan Weil wrote:
> Most QEMU files either are pure ASCII or use UTF-8.
> Convert this keymap file which still used ISO-8859-1 to UTF-8.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  pc-bios/keymaps/is |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

