Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R4B0J-0005zW-JE
	for mharc-qemu-trivial@gnu.org; Thu, 15 Sep 2011 08:25:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R4B0F-0005mq-Jx
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2011 08:25:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R4B0B-0007V0-Pj
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2011 08:25:15 -0400
Received: from mail-fx0-f45.google.com ([209.85.161.45]:42356)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R4B02-0007O2-7r; Thu, 15 Sep 2011 08:25:02 -0400
Received: by mail-fx0-f45.google.com with SMTP id 13so648084fxh.4
	for <multiple recipients>; Thu, 15 Sep 2011 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BWmzoLsHJSaz9997b4dNR5K0rChU4wOeqSUnn2F/FPg=;
	b=D2THg5ElNM37UTCt0Zf7777I2i8LvylOWtmgZEsfQiNfOwBB0yoKOiZUcjMstoa9Wc
	iphxdqU6SYQRSSfthnoz3Dz3cfszFNj+ZF7AxlkaxCsiE5gjK6z5nxwgYhRVBITtEdRk
	vtHQi4mgol84/4vtsPS09quIAQV8Pxen+n/Pw=
Received: by 10.223.9.209 with SMTP id m17mr424425fam.13.1316089501591;
	Thu, 15 Sep 2011 05:25:01 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	f10sm2354856fac.14.2011.09.15.05.25.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Sep 2011 05:25:00 -0700 (PDT)
Date: Thu, 15 Sep 2011 13:24:58 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20110915122458.GB18553@stefanha-thinkpad.localdomain>
References: <1316017674-16380-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1316017674-16380-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] target-i386: Remove data type CCTable
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
X-List-Received-Date: Thu, 15 Sep 2011 12:25:16 -0000

On Wed, Sep 14, 2011 at 06:27:54PM +0200, Stefan Weil wrote:
> Remove also two assert statements which were the last remaining users.
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  target-i386/cpu.h       |    5 -----
>  target-i386/translate.c |    5 -----
>  2 files changed, 0 insertions(+), 10 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

