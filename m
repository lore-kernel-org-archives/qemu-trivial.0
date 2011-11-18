Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RRMXp-0006My-LT
	for mharc-qemu-trivial@gnu.org; Fri, 18 Nov 2011 06:23:45 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMXk-0006MR-DX
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:23:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMXg-000700-Fc
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:23:40 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:50078)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RRMXg-0006zr-8Y
	for qemu-trivial@nongnu.org; Fri, 18 Nov 2011 06:23:36 -0500
Received: by bkbzu5 with SMTP id zu5so3818860bkb.4
	for <qemu-trivial@nongnu.org>; Fri, 18 Nov 2011 03:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MV3Y1fXpSTp8p2pBWaPTYw63RkZdeBtgnYVikjUTaLQ=;
	b=hyghqtFfuAhOLJKLE1Sp/kfvGLrJ1mtvKMgvv82a9UArP9eQrturGg0KL5jbhlThRN
	T6uMJyOx1CovK5E97smI9V1fpAqmr/1o2APEdqeyXINoanlc5xfcxLe5/91jJbdOoOLG
	3ZMS/YKdflYu7FewAa7P76jS6Q6fJ6ajgo6Kk=
Received: by 10.204.154.151 with SMTP id o23mr2928542bkw.62.1321615415393;
	Fri, 18 Nov 2011 03:23:35 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id r5sm5097144fam.4.2011.11.18.03.23.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 Nov 2011 03:23:33 -0800 (PST)
Date: Fri, 18 Nov 2011 11:23:32 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Vagrant Cascadian <vagrant@freegeek.org>
Message-ID: <20111118112332.GA12781@stefanha-thinkpad.localdomain>
References: <20111114220623.GJ26987@talon.fglan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20111114220623.GJ26987@talon.fglan>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] Patch: fix typo: runnning -> running
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
X-List-Received-Date: Fri, 18 Nov 2011 11:23:44 -0000

On Mon, Nov 14, 2011 at 02:06:23PM -0800, Vagrant Cascadian wrote:
> One n too many for running, need we say more.
> 
> Signed-Off-By: Vagrant Cascadian <vagrant@freegeek.org>

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

I have already sent a pull request including this patch for QEMU 1.0.

Stefan

