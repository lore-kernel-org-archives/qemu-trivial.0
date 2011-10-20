Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RGwKl-0000DK-OV
	for mharc-qemu-trivial@gnu.org; Thu, 20 Oct 2011 13:23:11 -0400
Received: from eggs.gnu.org ([140.186.70.92]:42039)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGwKi-00007a-QP
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 13:23:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RGwKh-0000MT-TC
	for qemu-trivial@nongnu.org; Thu, 20 Oct 2011 13:23:08 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:34409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RGwKf-0000Lt-CU; Thu, 20 Oct 2011 13:23:05 -0400
Received: by iakl21 with SMTP id l21so4259251iak.4
	for <multiple recipients>; Thu, 20 Oct 2011 10:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NJyO1fEwjFCNAIo9n4RpHb9Ir6cY/LAWcDO6wDJTvLw=;
	b=OTgkNBVNjTBHYhIZaegcqQgNVRKEOQ74TCmvuCDJxLuHEGcKlNy/Pl7MqIVLikRkpP
	RFvSWRdXbjbCd7b9O4mum161pH1FuBw/aASQbtHHYITQ8j6lgAmDXYA0pyEFyG2YT1MJ
	zWBp+U47r/yJHlFF5Lvs5UuyIIfbfRxwXfCJc=
Received: by 10.42.197.197 with SMTP id el5mr19568116icb.23.1319131383268;
	Thu, 20 Oct 2011 10:23:03 -0700 (PDT)
Received: from localhost ([71.198.47.196])
	by mx.google.com with ESMTPS id eh34sm25235972ibb.5.2011.10.20.10.23.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Oct 2011 10:23:02 -0700 (PDT)
Date: Thu, 20 Oct 2011 10:23:01 -0700
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Pavel Borzenkov <pavel.borzenkov@gmail.com>
Message-ID: <20111020172301.GA14359@stefanha-thinkpad.localdomain>
References: <1318958255-14008-1-git-send-email-pavel.borzenkov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1318958255-14008-1-git-send-email-pavel.borzenkov@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qed: don't pass NULL to memcpy
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
X-List-Received-Date: Thu, 20 Oct 2011 17:23:10 -0000

On Tue, Oct 18, 2011 at 09:17:35PM +0400, Pavel Borzenkov wrote:
> Spotted by Clang Analyzer
> 
> Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
> ---
>  block/qed.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

