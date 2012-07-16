Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SqjCB-0002Hr-Ka
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jul 2012 07:10:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SqjC7-00025U-KY
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2012 07:10:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SqjC2-0001Gl-TR
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2012 07:10:27 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:42264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SqjBn-0001Cq-Bs; Mon, 16 Jul 2012 07:10:07 -0400
Received: by bkcji1 with SMTP id ji1so3686316bkc.4
	for <multiple recipients>; Mon, 16 Jul 2012 04:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FQjdOk5BHQgAPf4o3K+xQOlcRvhBpPZkhHt0TaO6T8A=;
	b=k70an0qXsWu/kcawjo5DvGBA+bX6IPd8C1V60ZJVQkJ9bcCZ8yv3MeG2ym+mu0nvMk
	Ruee/zW94iVc5TmYOjrfCDGQ1rDVYOeezasphMrLi30UpIXGoXZTHnBMMZawtNor+hwX
	/fDXd3xm1hctL8xTY/DqXhFVBgKEHN3stdbXEO0GOVF1/Eywbiu3wgOwdzcD5O8aWg3j
	av0/zuUqPZfFOe6mHgpGKMJpy1F0LgJmen/ekzi6SO1Uij5yBKVAYfLONotEWQxKlsEX
	ykk+qkkShF6aoQ2fzCAkVZTA4TNhI/Q4fgcfOEMQ1NOzcagQJITmmVGesdl1nSS9Oc7H
	QIOA==
Received: by 10.204.136.215 with SMTP id s23mr4591829bkt.32.1342437005661;
	Mon, 16 Jul 2012 04:10:05 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	z19sm3835094bkw.10.2012.07.16.04.10.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 16 Jul 2012 04:10:05 -0700 (PDT)
Date: Mon, 16 Jul 2012 12:10:03 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20120716111003.GA6898@stefanha-thinkpad.localdomain>
References: <1342381105-20395-1-git-send-email-lersek@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1342381105-20395-1-git-send-email-lersek@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, agraf@suse.de, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: adapt vde test
	to -Werror
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
X-List-Received-Date: Mon, 16 Jul 2012 11:10:29 -0000

On Sun, Jul 15, 2012 at 09:38:25PM +0200, Laszlo Ersek wrote:
> ... after commit 417c9d72 ("configure: add -Werror to QEMU_CFLAGS early")
> 
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> ---
>  configure |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

