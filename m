Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tl0C3-0003h8-4w
	for mharc-qemu-trivial@gnu.org; Tue, 18 Dec 2012 11:38:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44487)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tl0C0-0003gz-Fx
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:38:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tl0Bx-0000zk-QC
	for qemu-trivial@nongnu.org; Tue, 18 Dec 2012 11:38:56 -0500
Received: from mail-wg0-f48.google.com ([74.125.82.48]:57089)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tl0Bx-0000zY-Jb; Tue, 18 Dec 2012 11:38:53 -0500
Received: by mail-wg0-f48.google.com with SMTP id dt10so405074wgb.27
	for <multiple recipients>; Tue, 18 Dec 2012 08:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=sNqnyNdGLNIynF9jummH95ekyqNIiw1Anc6eRflnus4=;
	b=zJuHBsBHKUDFdaZP/e9iGgOBm/TXa4iR20Xtz+Rq+2z5Gu0Dm7vYV3yiYVaWun6jfK
	PrzqmRI95VjPZsyeyMhYaC0YHVh1bANr+XkgJ88uZqwtsZhYGhlCUaQwfzHn2SR/4wZ1
	mXj07LE6gj5vBecAoHoso8fe+vRtiVprT7DbKZ+d6LTtU7XXolnByHRvx0rCk2BWCQ5m
	dsaBxV6oTOsl1s04w8rCvzQqvOY/F/3kheD4O1SUAvia5bR7mlW+UY4DFP8UW4pY1ocJ
	8U4JGvci225fUNyUX4plz+wA6V9Kaj/Gkjs1lb17OSntftiFT/O30H15FqiH334NZKjH
	IXIw==
X-Received: by 10.180.92.74 with SMTP id ck10mr6039056wib.9.1355848732581;
	Tue, 18 Dec 2012 08:38:52 -0800 (PST)
Received: from localhost (178-26-141-215-dynip.superkabel.de. [178.26.141.215])
	by mx.google.com with ESMTPS id ex6sm3434400wid.3.2012.12.18.08.38.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Dec 2012 08:38:51 -0800 (PST)
Date: Tue, 18 Dec 2012 17:38:50 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20121218163850.GA29445@stefanha-thinkpad.redhat.com>
References: <1355407309-7138-1-git-send-email-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1355407309-7138-1-git-send-email-lersek@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.48
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] vmmouse_reset(): remove minimal code
 duplication
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
X-List-Received-Date: Tue, 18 Dec 2012 16:38:58 -0000

On Thu, Dec 13, 2012 at 03:01:49PM +0100, Laszlo Ersek wrote:
> Commit 069ab0eb added a vmmouse_disable() call to vmmouse_reset().
> vmmouse_disable() resets the status already.
> 
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  hw/vmmouse.c |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

