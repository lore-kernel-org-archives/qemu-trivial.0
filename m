Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R0wX7-0008Qm-PY
	for mharc-qemu-trivial@gnu.org; Tue, 06 Sep 2011 10:21:49 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0wX2-00089c-OR
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2011 10:21:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R0wWw-0005y3-FX
	for qemu-trivial@nongnu.org; Tue, 06 Sep 2011 10:21:44 -0400
Received: from mail-ew0-f45.google.com ([209.85.215.45]:51751)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R0wWl-0005x1-IV; Tue, 06 Sep 2011 10:21:27 -0400
Received: by ewy24 with SMTP id 24so2881530ewy.4
	for <multiple recipients>; Tue, 06 Sep 2011 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WrUVz8wDu4f6OlX+EMs5n4jWKEBbMguc+UaCJElOw+Y=;
	b=TGlNt4gkfnu4gNWgT8FKfX4lirr+rvWgkkcropLXbMTyvFoXsmqwbUBVBBTvHEjPSH
	27OfCV55SBc4gxsdSzCP8c9BZ3UrJSMh4DZL6iz1i6uWOWbe2QADhPQyFlaDGMsIesHH
	KLQkbjTSS33gPIUPR+++LQ82USnMZnJCZksY8=
Received: by 10.213.19.145 with SMTP id a17mr1819760ebb.145.1315318884662;
	Tue, 06 Sep 2011 07:21:24 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id d12sm514656eeb.8.2011.09.06.07.21.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Sep 2011 07:21:22 -0700 (PDT)
Date: Tue, 6 Sep 2011 15:21:19 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110906142119.GA27859@stefanha-thinkpad.localdomain>
References: <1315153802-24346-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1315153802-24346-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] configure: Avoid duplicate flags when
 calling compile_prog
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
X-List-Received-Date: Tue, 06 Sep 2011 14:21:49 -0000

On Sun, Sep 04, 2011 at 06:30:02PM +0200, Stefan Weil wrote:
> This patch removes redundant shell code and cleans it a little bit.
> 
> Shell macro compile_prog takes two arguments:
> local_cflags and local ldflags.
> 
> $QEMU_CFLAGS is added automatically to the cflags, so there is no need
> to pass it as an argument.
> 
> It is also unnecessary to pass -Werror twice.
> 
> $flag is a compiler warning option, so it should be in local_cflags
> instead of local_ldflags.
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches -next tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches-next

Stefan

