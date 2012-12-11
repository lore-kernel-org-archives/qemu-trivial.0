Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TiMHQ-00078Q-Vb
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2012 04:37:37 -0500
Received: from eggs.gnu.org ([208.118.235.92]:44142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TiMHN-00077H-A1
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2012 04:37:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TiMHI-0001Nq-VE
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2012 04:37:33 -0500
Received: from mail-we0-f173.google.com ([74.125.82.173]:62194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TiMHI-0001Nj-PJ; Tue, 11 Dec 2012 04:37:28 -0500
Received: by mail-we0-f173.google.com with SMTP id z2so1583094wey.4
	for <multiple recipients>; Tue, 11 Dec 2012 01:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=67gnzpgPDprP9x8hDsFpBfl57D8VU3Usxrv8p3F3ar8=;
	b=O06yuHmxP1RUJUCB9Lwr9xahIFpv4S8Ar8u93ji4/Sfxhevc0ZtAaS3mSgXgn0wzFm
	5ikpHrYPoxo58Hc/xvnsgfgGQoQX2FI0nKiXAfqwL3s+RA55o4CsQyTDIszZtsReNB2Q
	V0XtkRvB6QFP+NTKxBGYrUYueS4cFrnBXm0qn64KU5z+ZOq3kCUdllC7IefVgIEhMvHR
	Im1ZWxLgEHGuuojLP1shmKy0LXqc7618dyQHTFKLsY0JOicGG/vyh+WhS/IcYKxtVbB+
	9/M2nw5Dl5FiKlPzN8qpH8tstqZI56qXUZ0zWpbqORdOKkunNIOT+lZ5yVKvR46qrdQB
	QbUg==
Received: by 10.216.217.234 with SMTP id i84mr471557wep.5.1355218647843;
	Tue, 11 Dec 2012 01:37:27 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id o3sm13541507wic.0.2012.12.11.01.37.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Dec 2012 01:37:26 -0800 (PST)
Date: Tue, 11 Dec 2012 10:37:24 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: zwu.kernel@gmail.com
Message-ID: <20121211093724.GB796@stefanha-thinkpad.muc.redhat.com>
References: <1354844598-14092-1-git-send-email-zwu.kernel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1354844598-14092-1-git-send-email-zwu.kernel@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org, Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] net,
	hub: fix the indent in the comments
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
X-List-Received-Date: Tue, 11 Dec 2012 09:37:34 -0000

On Fri, Dec 07, 2012 at 09:43:18AM +0800, zwu.kernel@gmail.com wrote:
> From: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
> 
>   Remove some redundant blanks in the comments of
> net_hub_id_for_client().
> 
> Signed-off-by: Zhi Yong Wu <wuzhy@linux.vnet.ibm.com>
> ---
>  net/hub.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

