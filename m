Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UtZ5L-0000Vj-H7
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jul 2013 04:03:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56053)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UtZ5J-0000VX-68
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 04:03:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UtZ5G-000169-MJ
	for qemu-trivial@nongnu.org; Mon, 01 Jul 2013 04:03:41 -0400
Received: from mail-wg0-x231.google.com ([2a00:1450:400c:c00::231]:42550)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UtZ5G-000163-HK; Mon, 01 Jul 2013 04:03:38 -0400
Received: by mail-wg0-f49.google.com with SMTP id a12so3387680wgh.4
	for <multiple recipients>; Mon, 01 Jul 2013 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KUe6N+ttyvbxVkAUzjM2ENZB1qNsn1HMZfU4s6AvMXU=;
	b=Mqzu06HqA1jfa+eos+C4ckeX4DyMKwZqrWWYQJLedFnqqnKc2kWCupAGcBoaSAIhn2
	vcdhtk59UqEtndI9ljmOe+Mlcq8FU46tJ0Iqf/Gtxy1CqUzw2RshmxYI2TlODfEKdkWQ
	XJ+9HkBMBlxhmfNuLFLihN58D+zW7spu8DprLAWPUZCDmMzz3Rg6zMvgBJgDzL5ci9xy
	1uvmA79lgpxFXXpxojAzxyYdCWNU1fQr9qxdT9bzX09WLt+TkwnHU4baYiOyoMCisDmv
	+gQkXSk/TStas4RV6nvPVPrHflK2mZMyNXBDsDrY3+/jZhb+8wQ0u/MOXTmcUHxcHSv4
	/J9A==
X-Received: by 10.194.234.100 with SMTP id ud4mr10374704wjc.44.1372665817662; 
	Mon, 01 Jul 2013 01:03:37 -0700 (PDT)
Received: from localhost (178-27-101-222-dynip.superkabel.de. [178.27.101.222])
	by mx.google.com with ESMTPSA id
	cd11sm14495618wib.10.2013.07.01.01.03.35 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 01 Jul 2013 01:03:36 -0700 (PDT)
Date: Mon, 1 Jul 2013 10:03:34 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20130701080334.GB7105@stefanha-thinkpad.redhat.com>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51CD669A.1010100@msgid.tls.msk.ru>
	<CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
	<51CD8985.6020401@redhat.com>
	<CAFEAcA-M9RnRv8TZjcY8C1KgRj+2k8JT1QKrtHhfo6BafNQQWQ@mail.gmail.com>
	<51CDA1E7.9000100@redhat.com>
	<CAFEAcA-8n0GEYd3Rif-XGaPaC1vwKk_eYJKu2Z8VMyKp-0-nfw@mail.gmail.com>
	<51CDA797.9000803@redhat.com>
	<CAPyFy2D8wnCkKMF4TAB=PFt0y8Ld2LmYA=17D_sakdvR7Mkjtw@mail.gmail.com>
	<51CDADD2.2010405@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51CDADD2.2010405@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Mon, 01 Jul 2013 08:03:43 -0000

On Fri, Jun 28, 2013 at 05:37:54PM +0200, Paolo Bonzini wrote:
> Il 28/06/2013 17:35, Ed Maste ha scritto:
> > On 28 June 2013 11:11, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >> And of course if bsd-user supported 1:1 mapping between guest and host
> >> threads on FreeBSD, cpu_single_env would have to be thread-local.
> > 
> > This is the case for the bsd-user work that Stacey posted at the
> > beginning of the week and is currently being revised after the initial
> > round of comments.
> > 
> > Can you comment on how quickly your tls work is expected to arrive?
> > We'll have to rebase on top of it, if it's in the next few days or so.
> 
> Maybe a week or two.
> 
> To simplify rebase, if you want you can take the conflicting patch from
> http://article.gmane.org/gmane.comp.emulators.qemu/216583/raw.

I'll post the latest tweaked version of Paolo's improved tls.h that I'm
working with today.

Stefan

