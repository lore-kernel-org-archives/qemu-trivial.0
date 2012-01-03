Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ri1zw-0006h0-Nm
	for mharc-qemu-trivial@gnu.org; Tue, 03 Jan 2012 05:53:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:60173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1zr-0006gY-Ay
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:53:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Ri1zn-0004VL-13
	for qemu-trivial@nongnu.org; Tue, 03 Jan 2012 05:53:35 -0500
Received: from mail-ee0-f45.google.com ([74.125.83.45]:57578)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Ri1zm-0004V6-T1; Tue, 03 Jan 2012 05:53:30 -0500
Received: by eekb45 with SMTP id b45so18565158eek.4
	for <multiple recipients>; Tue, 03 Jan 2012 02:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=H3yUTGsb4b8MRBXuewuVQYc2rlkR9Jppnpfb16p/bOg=;
	b=d5xdB4j5vPdvlLO+jsrUfORqtKDT2nEzbfVd5/Aj3/BsdAPXNJ2WDe2OGeGW8t1AAg
	K1CuKXVIkKljzkXPlaLjOAMDXHACs4tIlHB25HdSPn+TEKYPpzperksVwaKyWYSO4NJh
	U3wmwgPMKdsORzN2M2FxF12qRgJlp8aElREZo=
Received: by 10.14.127.76 with SMTP id c52mr21141008eei.102.1325588009751;
	Tue, 03 Jan 2012 02:53:29 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	s16sm204217786eef.2.2012.01.03.02.53.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Jan 2012 02:53:29 -0800 (PST)
Date: Tue, 3 Jan 2012 10:53:27 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120103105327.GA28826@stefanha-thinkpad.localdomain>
References: <5DE30B86318741F8B2D56EA407C5A8DB@FSCPC>
	<4EFE4483.1010707@weilnetz.de> <1325289569$267@local>
	<CAFEAcA9f4Bb=UOs3+=S=aZxaUN+Pb1MUROhSZCF+Sm1uTuyStw@mail.gmail.com>
	<1325330087$3142@local> <4EFEF00F.1070306@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4EFEF00F.1070306@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Sebastian Herbszt <herbszt@gmx.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH V2] Make python mandatory
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
X-List-Received-Date: Tue, 03 Jan 2012 10:53:39 -0000

On Sat, Dec 31, 2011 at 12:20:47PM +0100, Stefan Weil wrote:
> Am 31.12.2011 12:14, schrieb Sebastian Herbszt:
> >Make python mandatory.
> >
> >Signed-off-by: Sebastian Herbszt <herbszt@gmx.de>
> >---
> >configure | 10 +++-------
> >1 files changed, 3 insertions(+), 7 deletions(-)
> >
> >diff --git a/configure b/configure
> >index 640e815..a54439d 100755
> >--- a/configure
> >+++ b/configure
> >@@ -1185,13 +1185,9 @@ if test "$solaris" = "yes" ; then
> >fi
> >fi
> >
> >-if test "$guest_agent" != "no" ; then
> >- if has $python; then
> >- :
> >- else
> >- echo "Python not found. Use --python=/path/to/python"
> >- exit 1
> >- fi
> >+if ! has $python; then
> >+ echo "Python not found. Use --python=/path/to/python"
> >+ exit 1
> >fi
> >
> >if test -z "$target_list" ; then
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> Maybe this patch can be applied via qemu-trivial.

Thanks, applied to the trivial patches -next tree:

https://github.com/stefanha/qemu/tree/trivial-patches-next

Stefan

