Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4rsh-0000eQ-8D
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:16:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34137)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rsf-0000Y4-Dy
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:16:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rsZ-0002Zc-My
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:16:49 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:61302)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4rsX-0002ZM-5l; Fri, 24 Aug 2012 07:16:41 -0400
Received: by bkcji1 with SMTP id ji1so476717bkc.4
	for <multiple recipients>; Fri, 24 Aug 2012 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OjNXXyjLJ9BMm4z2Kkd8PU4D/ugTQ6SyAxXP5JQJMm8=;
	b=I+MiL7T9L/ShaejtuAfj2IkC9tmkQlQSeCBORe0hCpWGgXHPH3pQwJLgTAAD755SW6
	Y5/h/uTeA0eWJnV/rXZroXMXmdWtIDH1DWVI96IHDXdev6LMqw09fzoILaLDWl0/Hz+L
	TX3IMHgumny8oeoM5cBDWTnX8//O+Eg1T2iVKkY0QRs0JoJbNpm2/0vQ/beyHcUeLDHR
	hJZDvVb5v9k2tOmACrVKWNd36uoEbBH1GrQ2WqsEYSEpDaUPpaZwoFA/0m1cxowpiRpb
	V5IFg7SBS6OH109Y3uFxD4Aoj17XuJv+PKotfdLawr74/RuIjmgcUCyxnoU9rwSYcM57
	yPTw==
Received: by 10.204.145.90 with SMTP id c26mr1783975bkv.34.1345807000090;
	Fri, 24 Aug 2012 04:16:40 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id t23sm6183222bks.4.2012.08.24.04.16.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 04:16:38 -0700 (PDT)
Date: Fri, 24 Aug 2012 12:16:37 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20120824111637.GH10867@stefanha-thinkpad.localdomain>
References: <Pine.GSO.4.64.1208221718470.28960@mono>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.64.1208221718470.28960@mono>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] console: Correct
 computation of bytes per pixel from bits per pixel
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
X-List-Received-Date: Fri, 24 Aug 2012 11:16:50 -0000

On Wed, Aug 22, 2012 at 05:19:42PM +0200, BALATON Zoltan wrote:
> Division with round up is the correct way to compute this even if the
> only case where division with round down gives incorrect result is
> probably 15 bpp. This case was explicitely patched up in one of these
> functions but was unhandled in the other. (I'm not sure about setting
> 16 bpp for the 15bpp case either but I left that there for now.)
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  console.c |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
>  v2: Use DIV_ROUND_UP and extended commit message

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

