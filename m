Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RzP26-0006Mj-4F
	for mharc-qemu-trivial@gnu.org; Mon, 20 Feb 2012 03:55:42 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38836)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RzP1z-00065r-An
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2012 03:55:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RzP1v-000176-2x
	for qemu-trivial@nongnu.org; Mon, 20 Feb 2012 03:55:35 -0500
Received: from mail-wi0-f173.google.com ([209.85.212.173]:57363)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RzP1l-000154-2C; Mon, 20 Feb 2012 03:55:21 -0500
Received: by wibhi20 with SMTP id hi20so3435544wib.4
	for <multiple recipients>; Mon, 20 Feb 2012 00:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GAxod++31ULYWX2V9rb6TpbDatcze+SV3dRUqPb5SLY=;
	b=W+EPhMN2LOCa7l/IDN/UhzmJUV6XiWLvRWREgOLFcFN3XejYO6723mKxfUjTqFd7+n
	+XBNmXMWDEPzAbSHoMQKNFc0w88euRXfGiNB08rKqDGNWLDO4Aj17pv/7EedpFUHIa2P
	zY46YEkTKE97RdAL8hC85BfZpDCYIEVHoV1JA=
Received: by 10.180.8.164 with SMTP id s4mr12616172wia.6.1329728117849;
	Mon, 20 Feb 2012 00:55:17 -0800 (PST)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id m16sm36791499wie.9.2012.02.20.00.55.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 20 Feb 2012 00:55:16 -0800 (PST)
Date: Mon, 20 Feb 2012 08:55:12 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120220085512.GA14535@stefanha-thinkpad.localdomain>
References: <1328951275-23481-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1328951275-23481-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tcg: Remove unneeded include statements
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
X-List-Received-Date: Mon, 20 Feb 2012 08:55:39 -0000

On Sat, Feb 11, 2012 at 10:07:55AM +0100, Stefan Weil wrote:
> The standard include files are already included in qemu-common.h.
> 
> malloc.h and alloca.h were needed for alloca() which was removed
> from TCG code some years ago when switching from dyngen to TCG
> (see commit 49516bc0d622112caac9df628caf19010fda8b67).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tcg/tcg.c |   12 ------------
>  1 files changed, 0 insertions(+), 12 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

