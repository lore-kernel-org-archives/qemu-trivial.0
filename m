Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RT9RO-0005bU-Im
	for mharc-qemu-trivial@gnu.org; Wed, 23 Nov 2011 04:48:30 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT9RL-0005Q5-MY
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:48:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RT9RI-00018t-SS
	for qemu-trivial@nongnu.org; Wed, 23 Nov 2011 04:48:27 -0500
Received: from mail-yx0-f173.google.com ([209.85.213.173]:46679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RT9RG-0000sM-AX; Wed, 23 Nov 2011 04:48:22 -0500
Received: by mail-yx0-f173.google.com with SMTP id q2so1411242yen.4
	for <multiple recipients>; Wed, 23 Nov 2011 01:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fgz6P7z5ZYygQsDV5FXz/twSYdcxwybJ/tuOCDbb+/I=;
	b=DDIGX14KGJLXwO84SPBaIDIZTSMAlhTgcsgdXv7Y6lsqhl9zPlI2YcHG9wbqUQo/63
	drAztca5c+CJp+R9mZDhV1t+NpjpYDSXM6b2M/GvDMtTzDTw0RJGbbpxulbJorFuARGa
	pqbgetGklb8abt4vkiTkbshZ+O206i1fwtvUM=
Received: by 10.152.135.195 with SMTP id pu3mr14035975lab.17.1322041701366;
	Wed, 23 Nov 2011 01:48:21 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id mo6sm15301064lab.11.2011.11.23.01.48.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Nov 2011 01:48:20 -0800 (PST)
Date: Wed, 23 Nov 2011 09:48:18 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20111123094818.GB21327@stefanha-thinkpad.localdomain>
References: <1321962970-2876-1-git-send-email-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1321962970-2876-1-git-send-email-armbru@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Stefano.Stabellini@eu.citrix.com
Subject: Re: [Qemu-trivial] [PATCH] console: Fix qemu_default_pixelformat()
 for 24 bpp
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
X-List-Received-Date: Wed, 23 Nov 2011 09:48:28 -0000

On Tue, Nov 22, 2011 at 12:56:10PM +0100, Markus Armbruster wrote:
> Falls through to 32 bpp.  Harmless, because the only difference is the
> alpha component, and we're not using that.  Spotted by Coverity.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  console.c |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

