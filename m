Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsWIm-0002V2-49
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jul 2012 05:48:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:40465)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWIj-0002Ts-TT
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:48:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWIi-0007Z9-WD
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:48:41 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:59299)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SsWIi-0007Z5-Ov; Sat, 21 Jul 2012 05:48:40 -0400
Received: by wgbfm10 with SMTP id fm10so3626982wgb.10
	for <multiple recipients>; Sat, 21 Jul 2012 02:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=L0PblgBG15zkHI7VzfG8p2WQ7MLmKi9S05hCURPFUdA=;
	b=zUVKkbg5u0H/Wtb4BQJH0DN0YZiyiQLRRxP0BivC4YttbWqdV7ugmdxMD/oFdiX/nZ
	vnnv/vamHPUyu1Kv4/TPv9ScWs2PxP49hhWOghiN5Quv7/DMLrUyZLMXoOfLDsml6u9T
	leMr6CCfYJis+Xe8bIN8CM1VNUogUMT+HOD9Tj2UvqesRIz6VmFV5XokxwQ6QtcQ2nJi
	wKTVKj2KL+VJ+0BXAjptvdlBRHR+QxYyb0Cz8CcRQxhVfKX3INTQ4u7h7OtYu4hAGjao
	Ggk8mfV9U0w2FReweD6g/nOb4NoIwffDqp7D4xp9AV5O6+TRT0hq+epOplI6CN5qCfpj
	lH6g==
Received: by 10.216.134.101 with SMTP id r79mr1599919wei.60.1342864119951;
	Sat, 21 Jul 2012 02:48:39 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id ck9sm4863656wib.2.2012.07.21.02.48.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 02:48:39 -0700 (PDT)
Date: Sat, 21 Jul 2012 10:48:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120721094838.GC14213@stefanha-thinkpad.localdomain>
References: <1342818289-31860-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1342818289-31860-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev: Fix Open Firmware
	comment
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
X-List-Received-Date: Sat, 21 Jul 2012 09:48:43 -0000

On Fri, Jul 20, 2012 at 11:04:49PM +0200, Stefan Weil wrote:
> Commit 0d936928ef87ca1bb7b41b5b89c400c699a7691c removed code,
> but left the related comment at a location where it no longer
> belongs to.
> 
> The patch moves the comment to the correct callback and improves the text.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/qdev.h |   11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

