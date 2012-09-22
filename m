Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFRaW-0008Fx-0V
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 11:25:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRaT-0008F2-Ht
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:25:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRaS-0004E0-FE
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:25:45 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:49927)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFRaS-0004Du-8U; Sat, 22 Sep 2012 11:25:44 -0400
Received: by wibhm2 with SMTP id hm2so2337571wib.10
	for <multiple recipients>; Sat, 22 Sep 2012 08:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fblnoniQaBtMsywDv72Xy+I3N3bA1Ykvf/SSuNlNY5g=;
	b=fMwUfnkcXgawWLNsslaalC03aOfNvMRBuUGzmWkIAOp+8IcFSDc56bET5Lq2w4ndOp
	t9PzCbNJV3sQ/EH4/1M7Mt4z9nj6yQYxsWNN8hPUcm04dZt14xTQlrJKxY279qSrAPhh
	/dKGLGOidHORYgQmySto8ORfeMx2J+wUgHuNHBlJC28heN139qO/UG4c9WRFiHX5ncIr
	e5ZjwIdLbWol5YP1s0m9Po6EwyYtrIyRNNDOFf5VGdUClB2Gv++PYDzpVPx8sGbPnHMd
	b67M4gZJwqcZkM5Hx0yicziJuj2NFBzNtuU+0mZNjxjlqw6RoxJXWxs2MtgWvWMpREfg
	rUBQ==
Received: by 10.180.87.34 with SMTP id u2mr3625017wiz.3.1348327543296;
	Sat, 22 Sep 2012 08:25:43 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id dm3sm4710142wib.3.2012.09.22.08.25.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:25:42 -0700 (PDT)
Date: Sat, 22 Sep 2012 16:25:40 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120922152540.GA13216@stefanha-thinkpad.localdomain>
References: <1346484855-29649-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346484855-29649-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-ga: Remove unreachable
 code after g_error
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
X-List-Received-Date: Sat, 22 Sep 2012 15:25:46 -0000

On Sat, Sep 01, 2012 at 09:34:15AM +0200, Stefan Weil wrote:
> Report from smatch:
> qemu-ga.c:117 register_signal_handlers(11) info: ignoring unreachable code.
> qemu-ga.c:122 register_signal_handlers(16) info: ignoring unreachable code.
> 
> g_error calls abort which terminates the program.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu-ga.c |    2 --
>  1 file changed, 2 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

