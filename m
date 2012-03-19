Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9an9-0001gu-VX
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 07:30:23 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36350)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9an2-0001gR-HS
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 07:30:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9amx-0007Az-Ku
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 07:30:16 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:32850)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S9amx-0007An-Bu; Mon, 19 Mar 2012 07:30:11 -0400
Received: by wibhr17 with SMTP id hr17so3212968wib.10
	for <multiple recipients>; Mon, 19 Mar 2012 04:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=T+RpFCXqVbq8OZ8k0J3SvQD60fTlREQP0jKJ5H+fSHo=;
	b=jPkRQt9ADHlByDyLA1FrzOj2VEbg0t6T8AAOo5aL44VMXR6hUfZ+mBlA8kRrG631Ul
	f7lIm6YCelmpVsrf68bb1qAhvGb2S1cFceJ2pwC3p4kGfM8TlVWGsmieveVvCrTuqj+x
	MbdyFJJRPL2AzDWyqR4gdWz3oS2vX9Fj6Ghc7u7nJX3NBFAAyvVUyKrXJVMSP82v00oD
	AVPxkLych4q6AM/WAtliSgRIsEKwbyAjLJ0yDb49EGaNlIxgWAixxVQi/LwqyBexbf92
	0Ok9Nd8MsSapyYDGyndfBUUY16IzPiYZVAA3TC6bg1UUUuEV/CRgZRe4m+EZr9gKe6cH
	aKzw==
Received: by 10.216.134.200 with SMTP id s50mr6655833wei.116.1332156608664;
	Mon, 19 Mar 2012 04:30:08 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	bx13sm11440602wib.10.2012.03.19.04.30.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 04:30:07 -0700 (PDT)
Date: Mon, 19 Mar 2012 11:30:06 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20120319113006.GC30033@stefanha-thinkpad.localdomain>
References: <1331998306-30941-1-git-send-email-sw@weilnetz.de>
	<CAFEAcA89CWS=+N1JPXo=o-sR9sAxBg4X+AZGb47UdzdWCTjy2A@mail.gmail.com>
	<4F64B4F2.5020805@weilnetz.de>
	<CAFEAcA9_P8tmG-M2ytw5eaRPq8KBPc7iXWuGf1M9=rkxnsWRdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9_P8tmG-M2ytw5eaRPq8KBPc7iXWuGf1M9=rkxnsWRdw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Fix creation of
 symbolic links for MinGW toolchain
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
X-List-Received-Date: Mon, 19 Mar 2012 11:30:22 -0000

On Sat, Mar 17, 2012 at 05:24:08PM +0000, Peter Maydell wrote:
> On 17 March 2012 15:59, Stefan Weil <sw@weilnetz.de> wrote:
> > Am 17.03.2012 16:49, schrieb Peter Maydell:
> >> Where do we symlink directories? (I exclude the setting up
> >> of the linux headers because that will only happen on Linux
> >> hosts where we know we have working symlinks.)
> 
> > pc-bios/keymaps
> 
> Oh yes, missed that one (since it's a directory name cunningly
> hidden in a variable named FILES :-)).
> 
> I'm just a little wary of 'rm -rf', especially here where
> we're nuking whatever was passed as an argument and we
> aren't getting the shell quoting right. In theory we could
> use a wildcard for the keymaps the same way we do for a
> bunch of the other pc-bios files; I'm not sure if it's worth
> the effort, though.

Yes, I'm not comfortable with the 'rm -rf' either.  Please use "$2" so
that the path is at least quoted.

Stefan

