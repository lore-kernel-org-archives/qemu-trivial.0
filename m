Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RdJsX-0005wd-U8
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2011 05:58:33 -0500
Received: from eggs.gnu.org ([140.186.70.92]:51454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RdJsS-0005w3-Rn
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 05:58:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RdJsN-0005Gp-9P
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2011 05:58:28 -0500
Received: from mail-qw0-f45.google.com ([209.85.216.45]:42640)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RdJsN-0005Gf-7I; Wed, 21 Dec 2011 05:58:23 -0500
Received: by qadc10 with SMTP id c10so3537455qad.4
	for <multiple recipients>; Wed, 21 Dec 2011 02:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AA4ckzQ0fm+vZxALfkQWtYj2037lPOTQ8fD+sNZg4iA=;
	b=PNX3/30Ygcm2cZOwP6Z6yK1r9DV2NfzEoTFCG+MAl9zakn6f4KTlvdtH3d7ysGgQ96
	dh62AgW9AyWDiJuMSkJHpBfOttVcuBvrhsN574DnTnfZBmhARcTcih4Fc+r0EZb7UF4D
	AWKDIaz+/H6uJCkiVBywtW1EUZu58cUfoFHLQ=
Received: by 10.224.199.134 with SMTP id es6mr7687259qab.2.1324465101872;
	Wed, 21 Dec 2011 02:58:21 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id ed2sm9880441qab.15.2011.12.21.02.58.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 02:58:21 -0800 (PST)
Date: Wed, 21 Dec 2011 10:58:17 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alon Levy <alevy@redhat.com>
Message-ID: <20111221105817.GA22697@stefanha-thinkpad.localdomain>
References: <1324379118-2570-1-git-send-email-alevy@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1324379118-2570-1-git-send-email-alevy@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.45
Cc: qemu-trivial@nongnu.org, kraxel@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options.hx: fix
	tls-channel help text
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
X-List-Received-Date: Wed, 21 Dec 2011 10:58:32 -0000

On Tue, Dec 20, 2011 at 01:05:18PM +0200, Alon Levy wrote:
> Remove the default compiled out tunnel channel, add the always available
> cursor channel. Optimally the man page would depend on compiled in
> options, but that's harder to do.
> 
> RHBZ: 688586
> 
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>  qemu-options.hx |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

Looks fine but giving Gerd a chance to review and respond.

Stefan

