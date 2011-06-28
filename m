Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QbVc1-0006nD-H2
	for mharc-qemu-trivial@gnu.org; Tue, 28 Jun 2011 06:33:45 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QbVbx-0006mC-8J
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2011 06:33:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QbVbv-0003kG-6D
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2011 06:33:40 -0400
Received: from mail-fx0-f47.google.com ([209.85.161.47]:56391)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QbVbu-0003kB-NR
	for qemu-trivial@nongnu.org; Tue, 28 Jun 2011 06:33:38 -0400
Received: by fxg11 with SMTP id 11so95197fxg.34
	for <qemu-trivial@nongnu.org>; Tue, 28 Jun 2011 03:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iCyCqNCc8PjLm29tr+it8lyCZDJlwJLt6rojbdyLrjI=;
	b=CBD18z7Mk5XdLhoKQReRv811kZJmyTQu2JKoJIw3+ezK7I6WxAGztQEQztelfZ3D5S
	r/f8rtFhkww3zs8aT1qFme2F7qCNkWNYCL+65rxHtDTYjP4LeZvR4mE0LJrr7YvaJAe9
	dXytywjFTiHcMKzw6zlPqQMw4MvQxlpOi2z1o=
Received: by 10.223.143.17 with SMTP id s17mr1104162fau.34.1309257217475;
	Tue, 28 Jun 2011 03:33:37 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id b13sm45927fab.12.2011.06.28.03.33.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 03:33:36 -0700 (PDT)
Date: Tue, 28 Jun 2011 11:33:30 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Hans N <agenthh@gmail.com>
Message-ID: <20110628103221.GB23547@stefanha-thinkpad.localdomain>
References: <4E0970AA.4060501@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E0970AA.4060501@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.47
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix debug log option parsing in
 user-mode emulation
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
X-List-Received-Date: Tue, 28 Jun 2011 10:33:43 -0000

On Mon, Jun 27, 2011 at 11:11:54PM -0700, Hans N wrote:
> Fix cpu_str_to_log_mask() to actually use log_mask
> 
> Signed-off-by: Hans Nielsen <agenthh@gmail.com>
> ---
>  bsd-user/main.c    |    2 +-
>  darwin-user/main.c |    2 +-
>  linux-user/main.c  |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

