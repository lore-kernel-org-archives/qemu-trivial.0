Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsWJ2-0003IZ-E3
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jul 2012 05:49:00 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40534)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWIy-00034D-AA
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:48:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWIx-0007az-AB
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:48:56 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:46010)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SsWIx-0007as-3L; Sat, 21 Jul 2012 05:48:55 -0400
Received: by wibhm2 with SMTP id hm2so971630wib.10
	for <multiple recipients>; Sat, 21 Jul 2012 02:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=YUgBwyCG8xPfzT9KF8BuCjTRsAsSZGPKX9wA9meuQvc=;
	b=qiZ7vp4rk8vYaNxewqUudfWwRM+hUPGnhWjLMKTUIlThtnswgmKp/n07Aqea8orTeA
	bKrY/CjAIngTPjGoDdf6yIr2G3Vye0TFpid+A+q47xXsP2fAXth0givigsp3rD3z7gF1
	6CFxSDqqOOTZW2A4XaKpir5Lx5k/nne1ycKBmaw06pzTKyz/Uw+XvPZMhSp4sDbZZ0tJ
	wOu6y7H7nUvnehcizu/NVyAjbif1iaHVPENkGkLs2z0z4zed2VUnSvRbN9U2FTMZZJAc
	gIywijB+ses4sx4iSheakORziOfag4oAg6EtEmj83zUTH93iAqeb9fDV0F5Cyky7YXBU
	EAhg==
Received: by 10.180.100.133 with SMTP id ey5mr21168422wib.4.1342864134226;
	Sat, 21 Jul 2012 02:48:54 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id ep14sm8472665wid.0.2012.07.21.02.48.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 02:48:53 -0700 (PDT)
Date: Sat, 21 Jul 2012 10:48:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120721094852.GD14213@stefanha-thinkpad.localdomain>
References: <1342819562-11053-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1342819562-11053-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix some more Qemus in
 documentation and help text
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
X-List-Received-Date: Sat, 21 Jul 2012 09:48:58 -0000

On Fri, Jul 20, 2012 at 11:26:02PM +0200, Stefan Weil wrote:
> Hopefully they will be eliminated one day.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  docs/usb-storage.txt |    2 +-
>  qemu-options.hx      |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

