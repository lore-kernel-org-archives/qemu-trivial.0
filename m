Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TK6yq-0007c8-HE
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2012 08:26:12 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6yo-0007bl-CV
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:26:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TK6yi-00083r-LZ
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2012 08:26:10 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:61753)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TK6yi-00083V-AP; Fri, 05 Oct 2012 08:26:04 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so767271bkc.4
	for <multiple recipients>; Fri, 05 Oct 2012 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HVDMWvHplFVXDn+ng6MG825Gu/c1z/aeC9eMqnHxau8=;
	b=AJEWcS+sRBhuob/NUA8/dLTu8aB2SS0kmycyeEhnN+sp8xbCLxopSKpHUn7sx2yy3n
	m1O1CGgg7+ohDDoPO1zpKWOynYAsB3flnhNvYMFkYwkLEgzxOwUzmzkXltoCQQx5rugc
	tBiAVCowqvqGksD445A1TKwB3009D68ZBKZKKqX86vEgbrOT2ZH3CxTdWEc5V6CE4gpe
	tkE8WN4TE10PGIP3MB8TBQ4TgyoSavKzPzeAVViyg7DitzQSTLWCj03Ch1Td71/qLZ7r
	KeS8nVBKgKr+mYBfuc9WD1mTJq6l62DSObfDBR8LKXaUfYf7O157GqJpfUehe3+CgJzY
	213Q==
Received: by 10.204.155.133 with SMTP id s5mr2820492bkw.112.1349439963454;
	Fri, 05 Oct 2012 05:26:03 -0700 (PDT)
Received: from localhost ([82.113.121.2])
	by mx.google.com with ESMTPS id gy18sm7554613bkc.4.2012.10.05.05.26.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 05 Oct 2012 05:26:02 -0700 (PDT)
Date: Fri, 5 Oct 2012 14:25:53 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20121005122553.GD10951@stefanha-thinkpad.redhat.com>
References: <1348848709-14118-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1348848709-14118-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vnc: Fix spelling (hellmen
 -> hellman) in comment
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
X-List-Received-Date: Fri, 05 Oct 2012 12:26:11 -0000

On Fri, Sep 28, 2012 at 06:11:49PM +0200, Stefan Weil wrote:
> The algorithm was named after Martin E. Hellman.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  ui/vnc-tls.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

