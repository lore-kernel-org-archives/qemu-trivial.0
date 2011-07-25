Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlIJK-0001lj-Dz
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 06:22:54 -0400
Received: from eggs.gnu.org ([140.186.70.92]:51727)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlIJH-0001ed-RX
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 06:22:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlIJH-0005NM-0R
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 06:22:51 -0400
Received: from mail-fx0-f47.google.com ([209.85.161.47]:38029)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QlIJE-0005Iq-B0; Mon, 25 Jul 2011 06:22:48 -0400
Received: by mail-fx0-f47.google.com with SMTP id 11so9500353fxg.34
	for <multiple recipients>; Mon, 25 Jul 2011 03:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BSZuqFPocNEl9ID+C5Kcr1THyq3fbG7LUg6CjKNpre4=;
	b=m1JIAJw7wx51kqyL2IULB6W2piuwc9H4sEL2JSvkftGAGmSp5hSxgkhBbZsAjl6kNV
	Lgosw0xZChUOYWbqBJ2t34nNd7SoWuqRveoLbxXCJYqbBz5S/TnuV05Y4lyd2Pn613Ew
	70YaMQzCORAItKAIdlc/V7ZZzXyYSd/kTaYm4=
Received: by 10.223.6.77 with SMTP id 13mr6711460fay.41.1311589367533;
	Mon, 25 Jul 2011 03:22:47 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice3n2.emea.ibm.com [195.212.29.84])
	by mx.google.com with ESMTPS id r12sm3714177fam.0.2011.07.25.03.22.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 03:22:46 -0700 (PDT)
Date: Mon, 25 Jul 2011 11:22:43 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Message-ID: <20110725102243.GC15078@stefanha-thinkpad.localdomain>
References: <1311217935-5283-1-git-send-email-cerbere@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1311217935-5283-1-git-send-email-cerbere@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.161.47
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v2] Makefile: Minor cscope fixups
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
X-List-Received-Date: Mon, 25 Jul 2011 10:22:53 -0000

On Wed, Jul 20, 2011 at 11:12:15PM -0400, Alexandre Raymond wrote:
> Changes since v1:
> -Use SRC_PATH instead of PWD
> 
> -Create cscope symbols for assembly files in addition to .c/.h files.
> -Create cscope database with full path instead of relative path so cscope
>  can be used with CSCOPE_DB in any directory.
> 
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
>  Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

