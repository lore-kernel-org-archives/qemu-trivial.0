Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TL6XX-0007m3-GN
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2012 02:10:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TL6XU-0007bk-5S
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 02:10:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TL6XR-0006Pw-Pc
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 02:10:03 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:51070)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TL6XP-0006OB-FW; Mon, 08 Oct 2012 02:09:59 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so1527396bkc.4
	for <multiple recipients>; Sun, 07 Oct 2012 23:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fh6rgOND5tvcfbJTq+Ki+2/e0HGNpWbSvERQVgcYrAM=;
	b=R0pyZw8adovqYyPPE9dbJkVFI1yqbvF28+ePz9ZCziRf9xqx7mXITpzrhJXOlZ1b+E
	2d9DuppSNJ+SGlZ7BA17dJhL8suggb27Myd+CylTH0IC3LkaXRd8bTWNrsMT7l5RH5uX
	cQHh9JZBuoW1NgWgjbTixygAe3bIwYtfDWsTyY0ZpI2mOysl0M4Zp52K4Q01xY5ZliGS
	r355mx/FvlMqPFANawe4RVxtXAi8FMJdAqIZxzH7CIEQHJrx4nMs1AeZ/oDBTlrb6dzy
	fxee8uO3JFWvnHrzmwk0ln1FXXmZyL+AYwaBe9k+HG6UEKTzPqdSaMZA2B1HFCaiGTel
	s0uA==
Received: by 10.204.150.220 with SMTP id z28mr4941770bkv.125.1349676598519;
	Sun, 07 Oct 2012 23:09:58 -0700 (PDT)
Received: from localhost ([89.204.130.116])
	by mx.google.com with ESMTPS id fm5sm5502530bkc.5.2012.10.07.23.09.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 07 Oct 2012 23:09:57 -0700 (PDT)
Date: Mon, 8 Oct 2012 08:09:55 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: MORITA Kazutaka <morita.kazutaka@lab.ntt.co.jp>
Message-ID: <20121008060955.GD12140@stefanha-thinkpad.redhat.com>
References: <1349542634-17251-1-git-send-email-morita.kazutaka@lab.ntt.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1349542634-17251-1-git-send-email-morita.kazutaka@lab.ntt.co.jp>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] sheepdog: use bool for boolean variables
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
X-List-Received-Date: Mon, 08 Oct 2012 06:10:05 -0000

On Sun, Oct 07, 2012 at 01:57:14AM +0900, MORITA Kazutaka wrote:
> This improves readability.
> 
> Signed-off-by: MORITA Kazutaka <morita.kazutaka@lab.ntt.co.jp>
> ---
>  block/sheepdog.c |   70 +++++++++++++++++++++++++++---------------------------
>  1 files changed, 35 insertions(+), 35 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

