Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RBMlR-00081z-Md
	for mharc-qemu-trivial@gnu.org; Wed, 05 Oct 2011 04:23:41 -0400
Received: from eggs.gnu.org ([140.186.70.92]:56611)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RBMlN-0007ju-Cb
	for qemu-trivial@nongnu.org; Wed, 05 Oct 2011 04:23:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RBMlM-0007sp-1P
	for qemu-trivial@nongnu.org; Wed, 05 Oct 2011 04:23:37 -0400
Received: from mail-wy0-f173.google.com ([74.125.82.173]:49579)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RBMlJ-0007sW-21; Wed, 05 Oct 2011 04:23:33 -0400
Received: by wyh22 with SMTP id 22so1566221wyh.4
	for <multiple recipients>; Wed, 05 Oct 2011 01:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ECgF9GeTE0KpfaeB10S3mddB1TWdf3SM7F+aWQ5APxA=;
	b=eV3/oVQYTAMDkiAdsv/iRy3ep6yAW7U3uhh6qMTc206hJsNO9sk21LybkOi2zpWQ8B
	DiVAL01FcsYwnmxJpRQ1S3vRRdJTeON7rWeJp28TH5g4m6Ey7S47tIDQLk7uENpjnY2R
	J+bh4gxme8n+x8yKGABvjefaTMWMuIBQII9CI=
Received: by 10.227.25.12 with SMTP id x12mr2746730wbb.54.1317803012055;
	Wed, 05 Oct 2011 01:23:32 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id h14sm1547678wbo.7.2011.10.05.01.23.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Oct 2011 01:23:30 -0700 (PDT)
Date: Wed, 5 Oct 2011 09:23:28 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
Message-ID: <20111005082328.GB17877@stefanha-thinkpad.localdomain>
References: <1317574389-15007-1-git-send-email-weil@mail.berlios.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1317574389-15007-1-git-send-email-weil@mail.berlios.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix mismatching allocation and
 deallocation
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
X-List-Received-Date: Wed, 05 Oct 2011 08:23:38 -0000

On Sun, Oct 02, 2011 at 06:53:09PM +0200, Stefan Weil wrote:
> This error was reported by cppcheck.
> 
> Signed-off-by: Stefan Weil <weil@mail.berlios.de>
> ---
>  console.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

