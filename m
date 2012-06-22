Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ShzX9-0004PD-1K
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 04:48:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShzX5-0004OL-Qt
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 04:48:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1ShzX3-0002a5-Ul
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 04:47:59 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:40989)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1ShzX3-0002Zd-LJ; Fri, 22 Jun 2012 04:47:57 -0400
Received: by bkwj10 with SMTP id j10so1430593bkw.4
	for <multiple recipients>; Fri, 22 Jun 2012 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=74HHO06o5YNlOl62fQ/hXxzmG9Sf4KG/XMCvZYjMk6U=;
	b=T+NWR9nR2moxAq4rVSJM/3YiSDESgx5YPleRe7bLOs5GYaIclNt6mpyQ6xlUwRt6Mn
	b8CyPyGs/sNAhz0a9dSV1jMBtDwWhdohzl77zcch9e+GgjqGg1bjR9KPKN5Fe2fgqR8R
	OeAO2ceArtlmEe9UMMc6WlxeKtTu+efWwdKQ1fvBsv7Qq49LehJmKOmsXkQ4IROdE7RR
	dEhd3LQNVVdNCeA8DQGL50WfVc7lE3fEQ6hIuGyLHV79ikCdEuMZsBC9EnCwC+5j6bQq
	plfcmXyN+sj+jHUEJHpzkD3POzOLFhk2qkxqvxaIxQpXlcGV6+7roTs1YhsQZZ1FgRY4
	IySQ==
Received: by 10.204.157.23 with SMTP id z23mr447973bkw.71.1340354874452;
	Fri, 22 Jun 2012 01:47:54 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id m2sm35091797bkm.2.2012.06.22.01.47.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Jun 2012 01:47:53 -0700 (PDT)
Date: Fri, 22 Jun 2012 09:47:52 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120622084752.GA27038@stefanha-thinkpad.localdomain>
References: <1340050266-3395-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1340050266-3395-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	"Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] configure: Fix typo
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
X-List-Received-Date: Fri, 22 Jun 2012 08:48:01 -0000

On Mon, Jun 18, 2012 at 10:11:06PM +0200, Stefan Weil wrote:
> The typo did not cause an error because open_by_handle_at
> was only compared to "yes".
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  configure |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

