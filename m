Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QJ2g3-0003SU-Sb
	for mharc-qemu-trivial@gnu.org; Sun, 08 May 2011 08:01:36 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2g1-0003Md-K6
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:01:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QJ2g0-0003EY-LB
	for qemu-trivial@nongnu.org; Sun, 08 May 2011 08:01:33 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:53391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QJ2fv-0003EC-1r; Sun, 08 May 2011 08:01:27 -0400
Received: by wyb42 with SMTP id 42so3834898wyb.4
	for <multiple recipients>; Sun, 08 May 2011 05:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=37w4kD3SolJOxOYjSwelCDwU8cPC16YI9b8MdSSFqVM=;
	b=d2zznGqOlPDtBsOUi07Stz7mguSJYadv2Z9ELaLUR4BIyMw0yQ2EANdxBRsHFvnBsC
	4voftaaOrpIYSGgyia3kPh2aBd/sbod2B/0Zo3O6ljQH0m+AAK3FbQlf1qI1dWMEL6+v
	lrD9VBdCGtx2NDAbypAvFTex/d2yFmK8SkyIU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=wsmtOlZBbSCwjk0HS7f0wbfzM3JFyH32yBJ/aEFAO3Cf3+bsBJWsim65DYKt938GkI
	1GZVQqKBVI0FrxeX2X41zRY7xmbYe1BKGiFufB9OwaTJnoUJIuv70QM9LvkBA/nDQ6Be
	xXKVFsXiQzDQUXREclxqF3Q3mVAJvTpXQEx78=
Received: by 10.227.28.129 with SMTP id m1mr4050499wbc.20.1304856086104;
	Sun, 08 May 2011 05:01:26 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain ([109.224.133.37])
	by mx.google.com with ESMTPS id bd8sm3108237wbb.65.2011.05.08.05.01.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 May 2011 05:01:24 -0700 (PDT)
Date: Sun, 8 May 2011 13:01:21 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110508120121.GB10500@stefanha-thinkpad.localdomain>
References: <1304196566-14909-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1304196566-14909-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Fix typos in comments (chek
	-> check)
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
X-List-Received-Date: Sun, 08 May 2011 12:01:34 -0000

On Sat, Apr 30, 2011 at 10:49:26PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  exec.c            |    2 +-
>  target-ppc/STATUS |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Thanks, applied to the trivial-patches branch:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

For more information see http://wiki.qemu.org/Contribute/TrivialPatches.

Stefan

