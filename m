Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK6bj-00008L-C5
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 08:02:19 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6bb-0008Fs-VP
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:02:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6bV-0006SE-Pn
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:02:11 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:60752)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK6bT-0006Rs-3M; Fri, 05 Oct 2012 08:02:03 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so755703bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 05:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tCQGDGu7enfH+sfy/GKqV5qi1pnJacISoaS/GQGkhEY=;
	b=qpoeY3XL5wXefYj4IDbmwbu6T9scPyR+ljeikc34DZPBDNmK0cvLoITqQVgfoOU5j9
	oZRL+ycONwER4ulH9bdCdIznL+o5ES/8aPTe2h/PR8cm2aMaPykBJPUNBifyw3SVtLSf
	kWjlv0BiyrIJniM+9PpC4CVaPt0o+3uMgeDVVfo12G6jK67n/2Zn3nSG4cIMjjeNrEiU
	jikIZW2xE8roBb8L2Rcc9dY4m+fO/GrENAXFfMgdEZD4J1A70i1qUdg6LCUwchpUDoc+
	i0Fl/PQ4Z1yLIop6yXcGzdOPvd5x0FJDXRBaiG+knOdj9M+MM/9mQXbvolH8XMyyYn2x
	peBQ==
Received: by 10.204.12.197 with SMTP id y5mr2743088bky.77.1349438521891;
	Fri, 05 Oct 2012 05:02:01 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id k21sm7500000bkv.1.2012.10.05.05.02.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 05:02:01 -0700 (PDT)
Date: Fri, 5 Oct 2012 14:01:58 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005120158.GC7068@stefanha-thinkpad.redhat.com>
References: <1348689878-11544-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348689878-11544-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Support empty
 target list (--target-list=)
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
X-List-Received-Date: Fri, 05 Oct 2012 12:02:17 -0000

On Wed, Sep 26, 2012 at 10:04:38PM +0200, Stefan Weil wrote:
> Specifying an empty target list with --target-list= is shorter
> than specifying --disable-user --disable-system.
> 
> Both variants should give the same result: no targets at all.
> 
> This modification implements that feature.
> 
> It uses a trick which works with POSIX compliant shells to test whether
> target_list is undefined (=> default targets) or empty (=> no targets).
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Applied, thanks!

http://github.com/stefanha/qemu/commits/trivial-patches

Stefan

