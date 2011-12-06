Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXsWj-0007dY-H3
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2011 05:45:33 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsWf-0007O1-IR
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:45:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsWd-0002Vz-Sl
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:45:29 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:34759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RXsWT-0002Hf-CC; Tue, 06 Dec 2011 05:45:17 -0500
Received: by mail-bw0-f45.google.com with SMTP id q10so5975115bka.4
	for <multiple recipients>; Tue, 06 Dec 2011 02:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hz49Y9174J11cFVhaJK6+yM0w6r/JBC2Q4BhANlIS3k=;
	b=vp4U0NoPyrhwZ1CHw+fiF7e+s/COxy1KNOoxE5IN3ih9ZLVhaMfswdf58JPAGgYqwX
	WarNf6cZMj/EDcH7F7hJk9VATEmXH2xRXvnqL9XXx5vwbunOUUXgf7Qjy8nAmuORT19q
	E5Kksl9buBofLy8hYTf4Ko4BOZnr+25vaMUOk=
Received: by 10.216.229.39 with SMTP id g39mr2906668weq.81.1323168316737;
	Tue, 06 Dec 2011 02:45:16 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	o3sm13062053wiy.14.2011.12.06.02.45.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:45:16 -0800 (PST)
Date: Tue, 6 Dec 2011 10:45:14 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20111206104514.GE10165@stefanha-thinkpad.localdomain>
References: <1323126710-2242-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1323126710-2242-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	qemu-devel@nongnu.org, patches@linaro.org, Alexander Graf <agraf@suse.de>
Subject: Re: [Qemu-trivial] [PATCH] linux-user/syscall.c: Don't skip
 stracing for fcntl64 failure case
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
X-List-Received-Date: Tue, 06 Dec 2011 10:45:31 -0000

On Mon, Dec 05, 2011 at 11:11:50PM +0000, Peter Maydell wrote:
> In an fcntl64 failure path, we were returning directly rather than
> simply breaking out of the switch statement. This skips the strace
> code for printing the syscall return value, so don't do that.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Alex Graf spotted this one...
> 
>  linux-user/syscall.c |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

