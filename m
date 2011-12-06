Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXs3M-0007IJ-HT
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2011 05:15:12 -0500
Received: from eggs.gnu.org ([140.186.70.92]:33261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXs3K-0007H5-0q
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:15:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXs3E-0004ew-33
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:15:09 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:41151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RXs3D-0004bQ-Ir; Tue, 06 Dec 2011 05:15:04 -0500
Received: by mail-bw0-f45.google.com with SMTP id q10so5940900bka.4
	for <multiple recipients>; Tue, 06 Dec 2011 02:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=jxsJM7HRrKz77a7A9wO9ObwsRGf/Aj2sTEcLiByIQTc=;
	b=R60yLIJVFRqJr7ZpT1Q+zfoDsxfZ+OwwDgrhPvlf/00gUonzKlxwIRY7RVkz8Q+lwn
	OoNq8iIgSwbnzsWSc3G7OdrmTHJEmgnw7ZknVxTR0h7jGHid+3t44P9jevitxiiPvgM1
	qWcCBNNmBhwQ8bbXfAkzQJi3bvBSWlhagj9wY=
Received: by 10.180.104.35 with SMTP id gb3mr17168312wib.11.1323166502857;
	Tue, 06 Dec 2011 02:15:02 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id m5sm13976713wie.2.2011.12.06.02.15.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:15:02 -0800 (PST)
Date: Tue, 6 Dec 2011 10:15:01 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111206101501.GB9809@stefanha-thinkpad.localdomain>
References: <1322854245-17590-1-git-send-email-peter.maydell@linaro.org>
	<4ED9D60F.6000107@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ED9D60F.6000107@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>, Riku Voipio <riku.voipio@iki.fi>,
	=?iso-8859-1?Q?Lo=EFc?= Minier <lool@dooz.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] linux-user: Fix
	non-UTF-8 characters
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
X-List-Received-Date: Tue, 06 Dec 2011 10:15:11 -0000

On Sat, Dec 03, 2011 at 08:55:59AM +0100, Stefan Weil wrote:
> Am 02.12.2011 20:30, schrieb Peter Maydell:
> >These two patches fix some non-UTF-8 characters in linux-user/
> >source files. Other than the five files Stefan Weil recently sent
> >a patch to fix, these are the only remaining non-UTF-8 characters
> >in the source tree.
> >
> >Since I don't entirely trust the email path for sending patches
> >to files where the diffs include non-UTF-8, I've also put the
> >changes up in a git repo, so you may prefer to pull from there:
> 
> 'git am' accepted both patches here without any problem.
> 
> >The following changes since commit 1c8a881daaca6fe0646a425b0970fb3ad25f6732:
> >
> >   Update version for 1.0 release (2011-12-01 14:04:21 -0600)
> >
> >are available in the git repository at:
> >   git://git.linaro.org/people/pmaydell/qemu-arm.git non-utf-fixes
> >
> >Peter Maydell (2):
> >       linux-user/cpu-uname.c: Convert to UTF-8
> >       linux-user/arm/nwfpe/fpopcode.h: Fix non-UTF-8 characters
> >
> >  linux-user/arm/nwfpe/fpopcode.h |   34 +++++++++++++++++-----------------
> >  linux-user/cpu-uname.c          |    2 +-
> >  2 files changed, 18 insertions(+), 18 deletions(-)
> 
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
> 
> I cc'ed qemu-trivial, too. Stefan, you can take both patches
> into the trivial patch queue.

Thänk§, äppliéd to thé triviäl pätché§ -néxt tréé.

Stefan

