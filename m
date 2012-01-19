Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rnp0Y-00053P-PO
	for mharc-qemu-trivial@gnu.org; Thu, 19 Jan 2012 05:14:14 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56461)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rnp0Q-0004Xz-8M
	for qemu-trivial@nongnu.org; Thu, 19 Jan 2012 05:14:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rnp0K-0003Tq-Ge
	for qemu-trivial@nongnu.org; Thu, 19 Jan 2012 05:14:06 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:51834)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Rnp0D-0003RN-Qg; Thu, 19 Jan 2012 05:13:53 -0500
Received: by wgbdr1 with SMTP id dr1so202490wgb.10
	for <multiple recipients>; Thu, 19 Jan 2012 02:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SEfNE8dQALK0AuuJy0NXlTmT6nV9u7bx9CuAQaZTtCk=;
	b=eDvOWDMiLSfyXjWFWh/0Y9W83w7tUBvtjpuoJiOfEC/zxiHX43HyjDtmydgz1C2rVw
	B1J/Lx/VPgW6kOjvvPYlqCdg6ntk8OPcm0R6Fc5kcQzJGGh25qahVBLMwlGRMMOhbuu6
	qr9SEir0fzuyCnqwWKDZ44DkfzYEy66rh6E4o=
Received: by 10.180.81.35 with SMTP id w3mr42683968wix.10.1326968032848;
	Thu, 19 Jan 2012 02:13:52 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	bj10sm27180136wib.9.2012.01.19.02.13.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jan 2012 02:13:52 -0800 (PST)
Date: Thu, 19 Jan 2012 08:16:19 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120119081619.GA23160@stefanha-thinkpad.localdomain>
References: <1326695187-14008-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1326695187-14008-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] tests: Silence gtester in Makefile
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
X-List-Received-Date: Thu, 19 Jan 2012 10:14:12 -0000

On Mon, Jan 16, 2012 at 07:26:27AM +0100, Stefan Weil wrote:
> This prettifies make output a little by avoiding a very long line.
> As gtester prints the checks when they are run, no information is lost.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tests/Makefile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

