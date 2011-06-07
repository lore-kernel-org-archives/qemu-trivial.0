Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTwlq-0001zc-UX
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jun 2011 09:56:39 -0400
Received: from eggs.gnu.org ([140.186.70.92]:37372)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTwlj-0001yI-0I
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 09:56:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QTwle-0002oI-18
	for qemu-trivial@nongnu.org; Tue, 07 Jun 2011 09:56:30 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:51613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QTwld-0002oD-Io; Tue, 07 Jun 2011 09:56:25 -0400
Received: by wyb42 with SMTP id 42so4131048wyb.4
	for <multiple recipients>; Tue, 07 Jun 2011 06:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=GrYH9WZu1Xwo9ZMuni1/R8TP2eMLEB3kTXbcjMngoKg=;
	b=lvzKruROeF6rsShJwxHCzJrux52cjuXtHH634QZ1w09KaViRTPUv+weFQ8hDIuYQgY
	aUHo+aBDxoqzk4VF/NbA04V6aCGW82uj5pfiX7tLuT7U3OwlivZQrLBYXStsphDxuXun
	5rdHqMfftMydpTlDzR9gK/Jlohv5p5P9PtNTI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=lXKyJt/baJklFYpJ1fOr66jHiwe4j6OjiswQcgd2rxUbFYIPS68pPYm2BgIY5AyibH
	ta07uCIF9lymjkxwvky0SgelYyUTngYhfHZho1g1kgvKh8RKLnC1+e8HvScMjNJ0pxsL
	Ke3Uy5FoEnVcPJpD46FLKWCclmfre0kGDKxGE=
Received: by 10.216.254.82 with SMTP id g60mr5902887wes.90.1307454983704;
	Tue, 07 Jun 2011 06:56:23 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice4n2.emea.ibm.com [195.212.29.92])
	by mx.google.com with ESMTPS id c51sm2880535wek.47.2011.06.07.06.56.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Jun 2011 06:56:22 -0700 (PDT)
Date: Tue, 7 Jun 2011 14:56:19 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Andreas =?iso-8859-1?Q?F=E4rber?= <andreas.faerber@web.de>
Message-ID: <20110607135619.GC1493@stefanha-thinkpad.localdomain>
References: <1301081796-25364-1-git-send-email-laurent@vivier.eu>
	<78A4F565-9ABF-4B0E-885A-573D42DF1211@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78A4F565-9ABF-4B0E-885A-573D42DF1211@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Paul Brook <paul@codesourcery.com>,
	Laurent Vivier <Laurent@vivier.eu>,
	QEMU-devel Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] m68k: Replace gen_im32() by
 tcg_const_i32()
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
X-List-Received-Date: Tue, 07 Jun 2011 13:56:36 -0000

On Sun, Jun 05, 2011 at 12:26:18PM +0200, Andreas Färber wrote:
> I would add as description: "This resolves a FIXME."
> 
> Is "by" grammatically correct here? I would've thought to replace
> sth. "with" sth., by s.o.
> 
> Am 25.03.2011 um 20:36 schrieb Laurent Vivier:
> 
> >Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> 
> This patch accurately inlines and removes gen_im32().
> 
> Reviewed-by: Andreas Färber <andreas.faerber@web.de>
> 
> Stefan, this patch was sent the third time already, nobody else
> commented. It applies cleanly and compiles. Can we consider it a
> trivial patch and be done with it?
> 
> http://patchwork.ozlabs.org/patch/88417/

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

