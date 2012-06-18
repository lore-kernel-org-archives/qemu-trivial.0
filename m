Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SgYYN-0007Ka-Hx
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jun 2012 05:47:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SgYYH-0007Jg-8e
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2012 05:47:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SgYYF-0005Ev-Do
	for qemu-trivial@nongnu.org; Mon, 18 Jun 2012 05:47:16 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:53676)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SgYYF-0005ES-4x; Mon, 18 Jun 2012 05:47:15 -0400
Received: by bkwj10 with SMTP id j10so4061465bkw.4
	for <multiple recipients>; Mon, 18 Jun 2012 02:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HEi16GjnjXDJ2/KzhgE6d/u4r27rbYWWyAvR6O6ECrg=;
	b=b76UQWbhCljP0qxaGbDM3DECY+371XHSi3l+W8RmBgw+CL2p0ww30KcSTCpRTzPOhp
	ZYnOUetTtvMOkhQYE1DiOM357H5xxPwO1nm/ny0c8z5cstOp+84vs6Ym9w2lDkdhJWb1
	9JiTMAFijBRosY7cifRs05oLKg+HLvJjXpFzj8tsMrbXNsiucK6qrXt7avTehZe4JhZg
	wjdZDzoAel8WWpwcbt8RNYmcLH4VM1siqZnzPhf5t3B9z8MphvEreGvUR32m5f7GhLp6
	RYHl44OmozG02AnbhHeJdWnzJ2Q7fqnSMGDDoO6qBfFht9z2xVKf8wLUB1ARCGbgv6Pv
	Hk5g==
Received: by 10.205.119.146 with SMTP id fu18mr6258875bkc.14.1340012832219;
	Mon, 18 Jun 2012 02:47:12 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	e20sm17828297bkv.10.2012.06.18.02.47.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Jun 2012 02:47:11 -0700 (PDT)
Date: Mon, 18 Jun 2012 10:47:09 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120618094709.GA6031@stefanha-thinkpad.localdomain>
References: <1339831750-14704-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1339831750-14704-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-config: Use QEMU
	instead of Qemu
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
X-List-Received-Date: Mon, 18 Jun 2012 09:47:21 -0000

On Sat, Jun 16, 2012 at 09:29:10AM +0200, Stefan Weil wrote:
> This new 'Qemu' was recently added.
> Replace it by the official all upper case 'QEMU'.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-config.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

