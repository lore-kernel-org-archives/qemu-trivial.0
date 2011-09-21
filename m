Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R6Jvb-0005ln-BQ
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2011 06:21:19 -0400
Received: from eggs.gnu.org ([140.186.70.92]:58738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R6JvZ-0005lg-OZ
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:21:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1R6JvY-0005NZ-Gj
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2011 06:21:17 -0400
Received: from mail-ew0-f47.google.com ([209.85.215.47]:52553)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1R6JvY-0005NU-Aw; Wed, 21 Sep 2011 06:21:16 -0400
Received: by ewy7 with SMTP id 7so1202206ewy.34
	for <multiple recipients>; Wed, 21 Sep 2011 03:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7+ra9JOlswfnD9DDBPhUxgWEKCRiZvDBoJEBKZoweOU=;
	b=JKi4PY/ca4+KEeV5Yr+fSJmjKoW6BMlScHIkfEdV7AOh0WcrgXWu1SbcIeWeXV4/Bz
	gdVk1vhaZmNAcKyspdADTBEEHCQjr9+AvZExqamISvh7NnvlPEHcpzswi5XsyIaPgeMx
	WpslT8qIARZ8jvAXer8189xsZ9Ms6F2D3DEtU=
Received: by 10.216.21.73 with SMTP id q51mr2014677weq.8.1316600469882;
	Wed, 21 Sep 2011 03:21:09 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id f26sm6322436wbp.7.2011.09.21.03.21.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Sep 2011 03:21:08 -0700 (PDT)
Date: Wed, 21 Sep 2011 11:21:06 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <20110921102106.GB5308@stefanha-thinkpad.localdomain>
References: <4E798FC8.8080800@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E798FC8.8080800@siemens.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.47
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] Silence make if nothing is to do for
 libcacard
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
X-List-Received-Date: Wed, 21 Sep 2011 10:21:18 -0000

On Wed, Sep 21, 2011 at 09:18:32AM +0200, Jan Kiszka wrote:
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  libcacard/Makefile |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

