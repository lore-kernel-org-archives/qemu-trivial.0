Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TFS1k-0001Fv-5F
	for mharc-qemu-trivial@gnu.org; Sat, 22 Sep 2012 11:53:56 -0400
Received: from eggs.gnu.org ([208.118.235.92]:52576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFS1h-00017B-DL
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:53:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TFS1g-0007E9-F4
	for qemu-trivial@nongnu.org; Sat, 22 Sep 2012 11:53:53 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:56830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TFS1e-0007Cy-8V; Sat, 22 Sep 2012 11:53:50 -0400
Received: by weyt11 with SMTP id t11so2287882wey.4
	for <multiple recipients>; Sat, 22 Sep 2012 08:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Hod0t5JK0AK5c1MJaT0Z/xlsPNXoS5pXIaExB40rmzs=;
	b=QHyFxz35CtfA6kpGrcsLKch/yyuqhqZj/jtYpHbOCG8mimqooGEMiAgif9B3JUmJio
	n5DDovwXwabHtpsThCb4hGpxKxmmNADwzktT9xSWD0+NRDN6Kf7kNtr2IT8LTlPwSa1G
	iOvhQmjQ6/uVBA5ypZZ++ehCJFHWvgeUC+2PRWye95gzqC9+SOrYiEJzrXK+SZMy8ohc
	72oA6+PatU04tEH5Vo6zUnLCs2KltFODtNzHXBBou5s/Eh9/53r13mL3ELgmEVwfXQDb
	vuBviGVgSTHjGkXr52hEnrelP4DMwrMXUCYkPWJcX8GW19+jEp5oWQnTdv6b+NVsloZ3
	fr/A==
Received: by 10.180.94.164 with SMTP id dd4mr3728005wib.1.1348329229224;
	Sat, 22 Sep 2012 08:53:49 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id j6sm4849143wiy.4.2012.09.22.08.53.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 22 Sep 2012 08:53:48 -0700 (PDT)
Date: Sat, 22 Sep 2012 16:53:46 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alon Levy <alevy@redhat.com>
Message-ID: <20120922155346.GG13216@stefanha-thinkpad.localdomain>
References: <1346540656-2927-1-git-send-email-alevy@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1346540656-2927-1-git-send-email-alevy@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] dtrace backend: add function to reserved
 words
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
X-List-Received-Date: Sat, 22 Sep 2012 15:53:54 -0000

On Sun, Sep 02, 2012 at 02:04:16AM +0300, Alon Levy wrote:
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>  scripts/tracetool/backend/dtrace.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

