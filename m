Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIGgB-0000fy-EW
	for mharc-qemu-trivial@gnu.org; Thu, 12 Apr 2012 05:51:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:60988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SIGg5-0000f2-MU
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 05:51:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SIGg3-00026K-Qf
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 05:50:57 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:61860)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SIGg3-00025l-I1; Thu, 12 Apr 2012 05:50:55 -0400
Received: by wibhr17 with SMTP id hr17so1603454wib.10
	for <multiple recipients>; Thu, 12 Apr 2012 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ydX8SqKSK8A4QgA8to93Gos4WyuzfMTYYzoI2CYn0qE=;
	b=zpeOGhVON1O7pAAu5MHoT4qGkiGa5hWO66V6Fr1v2P1ThLMGKpa6tfZC0sw7RlHQ+j
	wewKeoUiCsLMtV3iXt4LKQPok2B3cGbYXlNEKxoDasCnhpAvwLFb/ghK3oQE1zeqdaZJ
	OxwJHTUZznuJf/qK4oRyHahkUMyBsTQl6Gkhmy8veNoUn/7s0M83a7043YtHub5Ommm5
	FBeT7m1BkNMETvyo7urAJ5E420D++Y30mjoH9PHofpV75l+Hp17GEeN5hm561DZQW3/V
	RkUFjrUqZu1H95q3nf6Fz21JxuWJULs4zuIHgt3FKD0ut5FG4NRWu0NXGqZoFbQiOpnh
	0LHQ==
Received: by 10.180.107.234 with SMTP id hf10mr2131785wib.0.1334224252677;
	Thu, 12 Apr 2012 02:50:52 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	n20sm19803941wiw.5.2012.04.12.02.50.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 02:50:52 -0700 (PDT)
Date: Thu, 12 Apr 2012 10:50:50 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Wanpeng Li <liwp@linux.vnet.ibm.com>
Message-ID: <20120412095050.GB20334@stefanha-thinkpad.localdomain>
References: <1334106141-4312-1-git-send-email-liwp@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334106141-4312-1-git-send-email-liwp@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] avoid repeating contain header file
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
X-List-Received-Date: Thu, 12 Apr 2012 09:51:02 -0000

On Wed, Apr 11, 2012 at 09:02:21AM +0800, Wanpeng Li wrote:
> Signed-off-by: Wanpeng Li <liwp@linux.vnet.ibm.com>
> ---
>  hw/ps2.h |   29 +++++++++++++++++++++++++++++
>  1 files changed, 29 insertions(+), 0 deletions(-)

In this case I think adding the license header is okay, it matches the
hw/ps2.c file.  But it's best to avoid adding license headers on
someone's behalf since it basically makes a statement that they never
agreed to.

Anthony: if you think the BSD license with Fabrice's name shouldn't be
added, please let me know and I'll drop this patch.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

