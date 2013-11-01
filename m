Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VcCZl-0001C7-B5
	for mharc-qemu-trivial@gnu.org; Fri, 01 Nov 2013 07:07:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48081)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VcCZd-0001AZ-Ie
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 07:07:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>) id 1VcCZX-0000Xp-W8
	for qemu-trivial@nongnu.org; Fri, 01 Nov 2013 07:07:29 -0400
Received: from mail-la0-x232.google.com ([2a00:1450:4010:c03::232]:37383)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonynpavlov@gmail.com>)
	id 1VcCZX-0000Xg-Ni; Fri, 01 Nov 2013 07:07:23 -0400
Received: by mail-la0-f50.google.com with SMTP id ec20so3208290lab.23
	for <multiple recipients>; Fri, 01 Nov 2013 04:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=/tGSuM2dQBWRlxxDOf/vAeqMYAxpYKGgzKemyP+vkj0=;
	b=orQ4gcxPLRuRu/tdj/lFDeE1bjQrLSzELnP1UOZpM/rS0QBDo47V43qScCo1+NCHQ0
	irZrrG5IG4q3dFouINbMpmhJWRNZaw8mfYQglvyhM5966cEI7D9vkXXD77JkcgcdZMCe
	DMzznqdA1PSaEmKf1B0vXtrnNBtNlxpg2M12wL0RwqMWexbobbbubt3E3CvWtoors0F0
	yLD1f8w9J6A2/Y2JCuZCKS2CyRn3NeL+eH+eo5dL1hkM/F1tDr52MYi7pI9ULHlc4ZKZ
	G49c67yhWIgRPrZgogQfceK8MBRqQtomdhm+3clhiKdRWz03yBu4v2cNU7P9rB6FB0Ou
	YIpw==
X-Received: by 10.152.3.42 with SMTP id 10mr1520237laz.22.1383304042007;
	Fri, 01 Nov 2013 04:07:22 -0700 (PDT)
Received: from flare (broadband-95-84-154-9.nationalcablenetworks.ru.
	[95.84.154.9])
	by mx.google.com with ESMTPSA id oc1sm6022725lbb.3.2013.11.01.04.07.19
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 01 Nov 2013 04:07:20 -0700 (PDT)
Date: Fri, 1 Nov 2013 15:14:02 +0400
From: Antony Pavlov <antonynpavlov@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-Id: <20131101151402.2275a138bbcb849db3206db4@gmail.com>
In-Reply-To: <52738284.5090708@msgid.tls.msk.ru>
References: <1383021391-3152-1-git-send-email-antonynpavlov@gmail.com>
	<52738284.5090708@msgid.tls.msk.ru>
X-Mailer: Sylpheed 3.4.0beta4 (GTK+ 2.24.21; i486-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::232
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [PATCH] vl: fix build when configured with no
 graphic support
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
X-List-Received-Date: Fri, 01 Nov 2013 11:07:35 -0000

On Fri, 01 Nov 2013 14:29:24 +0400
Michael Tokarev <mjt@tls.msk.ru> wrote:

> 29.10.2013 08:36, Antony Pavlov wrote
> > The following error occurs when building no graphic output support:
                                           ^^^^^
Can you plese fix misprint in my git commit message too.

I meant "when building with no graphic output support".

> >
> >    vl.c: In function ‘main’:
> >    vl.c:2829:19: error: variable ‘ds’ set but not used [-Werror=unused-but-set-variable]
> >         DisplayState *ds;
> >                       ^
> >    cc1: all warnings being treated as errors
> 
> Thanks, applied to the trivial-patches queue.
> 
> While at it, I also added a comment to the line being added,
> telling what this is all about:
> 
> --- a/vl.c
> +++ b/vl.c
> @@ -4269,6 +4269,7 @@ int main(int argc, char **argv, char **envp)
>       /* init local displays */
>       switch (display_type) {
>       case DT_NOGRAPHIC:
> +        (void)ds;      /* avoid warning if no display is configured */
>           break;
>   #if defined(CONFIG_CURSES)
>       case DT_CURSES:
> 
> Hopefully it is okay... ;)
> 
> /mjt


-- 
-- 
Best regards,
  Antony Pavlov

