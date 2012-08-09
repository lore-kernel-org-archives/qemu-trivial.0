Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SzOtd-0001CS-Gd
	for mharc-qemu-trivial@gnu.org; Thu, 09 Aug 2012 05:19:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SzOtZ-00014O-Aj
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 05:19:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SzOtY-0008Kw-DT
	for qemu-trivial@nongnu.org; Thu, 09 Aug 2012 05:19:09 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:53123)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SzOtV-0008KQ-Na; Thu, 09 Aug 2012 05:19:05 -0400
Received: by lbbgm13 with SMTP id gm13so154299lbb.4
	for <multiple recipients>; Thu, 09 Aug 2012 02:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Xh7Sc9FG5a8s1en7VnJ6T2Gu75g8+QAsEEmz0+ZWBE0=;
	b=ywlBGlOXqHSfCNGECygOW6VLyURmwS7fnncaTLsmvisrjSMZqDjZU1lt53c3npnCdU
	6NLInto+vDKPOWor7seTMRlpio2oISTTbzCXlt1vacAKyeyg8pq+ggwRY9psaE5jUDfj
	Ppa0CdVKoUxkHOQH7eoBAuyFCf+FQA4d0fDFPu0UPUBS68iXcuPY5Nc34fml+BD4sEE5
	z470762HudtYdoaMOK319jhMb5rnwQnpRJ0p+utLCfZELJmvxQyKYMLBiFMmbUlmmSKL
	MKOW3Ppn5SdwRv3fEWOCbnF/4v/+oZagwJRpjXPZ9qfQBfLe6QMzIl7ICFx2r96X166K
	7I2Q==
MIME-Version: 1.0
Received: by 10.112.43.98 with SMTP id v2mr510424lbl.1.1344503944552; Thu, 09
	Aug 2012 02:19:04 -0700 (PDT)
Received: by 10.112.99.129 with HTTP; Thu, 9 Aug 2012 02:19:04 -0700 (PDT)
In-Reply-To: <1344495471-3957-1-git-send-email-riegamaths@gmail.com>
References: <1344495471-3957-1-git-send-email-riegamaths@gmail.com>
Date: Thu, 9 Aug 2012 10:19:04 +0100
Message-ID: <CAJSP0QXuht+pw4=HtPxYzzKEEs_s5MW1X2NNZODpbpzmQvYSmQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: riegamaths@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [RESEND PATCH] vl.c: Exit QEMU early if no
 machine is found
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
X-List-Received-Date: Thu, 09 Aug 2012 09:19:10 -0000

On Thu, Aug 9, 2012 at 7:57 AM,  <riegamaths@gmail.com> wrote:
> From: Dunrong Huang <riegamaths@gmail.com>
>
> We check whether the variable machine is NULL or not before accessing
> it. If machine is NULL, exit QEMU with an error, this can avoids a
> segfault error.
>
> Signed-off-by: Dunrong Huang <riegamaths@gmail.com>
> ---
>  vl.c |   10 +++++-----
>  1 files changed, 5 insertions(+), 5 deletions(-)

Applied to the trivial-patches tree in the other email thread.

Stefan

