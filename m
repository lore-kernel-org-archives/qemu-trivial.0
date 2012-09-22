Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFRsM-0007gF-VC
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 11:44:14 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRsK-0007g8-SF
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFRsJ-0003jv-Rd
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:44:12 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:60527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFRsJ-0003jr-LS; Sat, 22 Sep 2012 11:44:11 -0400
Received: by wibhm2 with SMTP id hm2so2345527wib.10
	for <multiple recipients>; Sat, 22 Sep 2012 08:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gK7ATcYlOXT7IRl/tkEFsVBEZs2MjGOQj+iJpebmtyc=;
	b=kJCNa51Tnjnb6uJrlpWVkbo009swu15E75WCP8AZT4BzBBaa79DiKBSD5LUYcgeQZQ
	96/4SgRn3YuoYH5U457PguBYn6m0ASMGL3+ZjCFvMJdMYgl+ogBPXPfElGHhP21GQF5y
	5uFFg92qBCryCK+vATDfoP21PMSRN0Up8nODz0EOmI4W+1ZcWMIZAQKU2YLQ79Vstvgz
	DwzonyuvXz0xxkY5wrOxio4PKNo8nEPxbzsMWKY7+RnLipyhcl3l8K0m+mt+WTEQ6Mzm
	X09Wu7uKZfntVK7dZ+SdlQ1LZfs7vcrELzZ/S7bnFBHNmwEH5mExHwpmNcJcWG3eLsv1
	KjDg==
Received: by 10.180.73.76 with SMTP id j12mr3656418wiv.11.1348328650748;
	Sat, 22 Sep 2012 08:44:10 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id w7sm4214758wiz.0.2012.09.22.08.44.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:44:10 -0700 (PDT)
Date: Sat, 22 Sep 2012 16:44:08 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120922154408.GF13216@stefanha-thinkpad.localdomain>
References: <1346497248-14659-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346497248-14659-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] pflash_cfi01: Fix warning caused by
 unreachable code
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
X-List-Received-Date: Sat, 22 Sep 2012 15:44:13 -0000

On Sat, Sep 01, 2012 at 01:00:48PM +0200, Stefan Weil wrote:
> Report from smatch:
> hw/pflash_cfi01.c:431 pflash_write(180) info: ignoring unreachable code.
> 
> Instead of removing the return statement after the switch statement,
> the patch replaces the return statements in the switch statement by
> break statements. Other switch statements in the same code do it also
> like that.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/pflash_cfi01.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

