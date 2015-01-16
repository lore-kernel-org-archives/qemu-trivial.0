Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YCCbj-0003Ss-5t
	for mharc-qemu-trivial@gnu.org; Fri, 16 Jan 2015 14:30:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCbg-0003Nd-6v
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:30:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dkoch@verizon.com>) id 1YCCbf-00043B-DQ
	for qemu-trivial@nongnu.org; Fri, 16 Jan 2015 14:30:56 -0500
Received: from omzsmtpe04.verizonbusiness.com ([199.249.25.207]:11229)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dkoch@verizon.com>)
	id 1YCCbb-00042m-5d; Fri, 16 Jan 2015 14:30:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=verizon.com; i=dkoch@verizon.com; q=dns/txt; s=corp;
	t=1421436651; x=1452972651;
	h=date:from:to:cc:subject:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=S1bDqtV98PduA7oAs4zIxrR2uM5SmWFrhbtronoMz6Y=;
	b=i56ML5vjBoeVNGeVMHa5QcFUcvZQO95ci/9QegdD/lqbChuV/JlMGQWg
	NhmGWLXThK9WZl7U8ACN5W1N5VaC2m1tvesBXwl5oC/BkBeKeSZSh33y2
	gYEzh6fIO4sUVFopdCQl9J/aDW21Q2Qi+xocGQN/70tQK9TcXo1pICq0e o=;
X-IronPort-Anti-Spam-Filtered: false
Received: from unknown (HELO fldsmtpi03.verizon.com) ([166.68.71.145])
	by omzsmtpe04.verizonbusiness.com with ESMTP; 16 Jan 2015 19:30:40 +0000
X-VzAPP: 1
X-IronPort-AV: E=Sophos;i="5.09,412,1418083200"; d="scan'208";a="917044838"
Received: from unknown (HELO yoyo) ([208.52.205.215])
	by fldsmtpi03.verizon.com with SMTP; 16 Jan 2015 19:30:40 +0000
Date: Fri, 16 Jan 2015 14:30:39 -0500
From: Don Koch <dkoch@verizon.com>
To: Don Koch <dkoch@verizon.com>
Message-Id: <20150116143039.8c84b478dbeabd2054d831e8@verizon.com>
In-Reply-To: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
References: <1421436099-2487-1-git-send-email-dkoch@verizon.com>
X-Mailer: Sylpheed 3.4.0beta6 (GTK+ 2.24.22; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 199.249.25.207
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 0/3] Trace calls for xenfb, ps2 and pcnet
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
X-List-Received-Date: Fri, 16 Jan 2015 19:30:57 -0000

Obviously, subject should have read: [PATCH 0/4] ...

On Fri, 16 Jan 2015 14:21:35 -0500
Don Koch <dkoch@verizon.com> wrote:

> Add trace calls for debugging xenfb, ps2 and pcnet.
> 
> Don Koch (4):
>   Add tracing to xenfb.
>   Add trace to ps2.c.
>   Add/convert trace calls in pcnet-pci.c.
>   Convert some debugging printfs to trace calls in pcnet.c.
> 
>  hw/display/xenfb.c |  5 +++++
>  hw/input/ps2.c     | 16 ++++++++++++++++
>  hw/net/pcnet-pci.c | 49 +++++++++++++++++++------------------------------
>  hw/net/pcnet.c     | 28 ++++++++--------------------
>  trace-events       | 41 +++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 89 insertions(+), 50 deletions(-)
> 
> -- 
> 1.8.3.1
> 

