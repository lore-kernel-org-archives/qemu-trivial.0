Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TL6uj-0004Cv-Mw
	for mharc-qemu-trivial@gnu.org; Mon, 08 Oct 2012 02:34:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TL6uh-00046G-7D
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 02:34:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1TL6ug-0005ZC-8D
	for qemu-trivial@nongnu.org; Mon, 08 Oct 2012 02:34:03 -0400
Received: from mail-bk0-f45.google.com ([209.85.214.45]:48390)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1TL6ue-0005Yp-26; Mon, 08 Oct 2012 02:34:00 -0400
Received: by mail-bk0-f45.google.com with SMTP id jf3so1533704bkc.4
	for <multiple recipients>; Sun, 07 Oct 2012 23:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=GV6OtkoijdXTFiL3UC6UkH501+nVjHCSy2e9Qbb8/FQ=;
	b=qyY68sQB81Deade9vF0tdVq7sIQr1QvcdRdTSs7ZCQGTVXn6+uw6Jj/QJNe1tAh0Pp
	5qgghAn5DkDrpHrOtZ1ipN/9wJ95AB4aYaSyOqCtHclD0puTwT9neHI738fbf6vmfBbb
	362hxMddyiqoWPHK+wnQI0yUT1rPAr2Hzeot3SQelvkQOLP7PMvOpRcIpce7bLw2qzfK
	g3Jjj/0b7YwNVtAuWjUUhOT5zbxMhx5WWQMVlJXI4W8sYGB+kPRys4IpBz7moaMGxMOC
	BZ2MQcOIt92D/3TWrV9WaGFE2u6VGPdkaJqnMUtoAiBZxU1QwPhEwv4NQi2goZNt/gFl
	yiuA==
Received: by 10.204.148.146 with SMTP id p18mr5029594bkv.51.1349678039021;
	Sun, 07 Oct 2012 23:33:59 -0700 (PDT)
Received: from localhost ([89.204.130.116])
	by mx.google.com with ESMTPS id e3sm11249842bks.7.2012.10.07.23.33.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 07 Oct 2012 23:33:58 -0700 (PDT)
Date: Mon, 8 Oct 2012 08:33:53 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: MORITA Kazutaka <morita.kazutaka@lab.ntt.co.jp>
Message-ID: <20121008063353.GB12433@stefanha-thinkpad.redhat.com>
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
X-List-Received-Date: Mon, 08 Oct 2012 06:34:04 -0000

On Sun, Oct 07, 2012 at 01:57:14AM +0900, MORITA Kazutaka wrote:
> This improves readability.
> 
> Signed-off-by: MORITA Kazutaka <morita.kazutaka@lab.ntt.co.jp>
> ---
>  block/sheepdog.c |   70 +++++++++++++++++++++++++++---------------------------
>  1 files changed, 35 insertions(+), 35 deletions(-)

Applied, thanks!

https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

