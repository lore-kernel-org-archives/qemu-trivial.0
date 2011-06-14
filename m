Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QWOev-0006IR-Nn
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jun 2011 04:07:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QWOes-0006Hb-Cb
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2011 04:07:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QWOeq-0000jF-QL
	for qemu-trivial@nongnu.org; Tue, 14 Jun 2011 04:07:33 -0400
Received: from mail-ww0-f53.google.com ([74.125.82.53]:48183)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QWOem-0000iF-3H; Tue, 14 Jun 2011 04:07:28 -0400
Received: by wwj40 with SMTP id 40so5008841wwj.10
	for <multiple recipients>; Tue, 14 Jun 2011 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=35UxkMXQgoupKf0GCSWwP+vR7yc7bnm8IPRH9mMVN/o=;
	b=lmtf7BvNsv7j8Ufz/maILGietyhNqofmuZtO8C45PMpdCOQDQev5pZ705v63Qk1omf
	b5P5pnSi0I1kWE61TeSgh3ddBV+KNvLQ1gOQ9jaL6fhFA38Ro9l8KocxvA44q/YAUWSG
	fEwS339f0a8ZDddlHw+/d7ByTR/MuM0DV1F9w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=d/1HISPicPQulF69cVTKgHIINBtxl9Jhuryan0FvEbMpawbhqdEPYMImIvZfHmoM1/
	LiKRxzrvefgbD1UhxSgaMB4VdR8XSOAqjscmk8Kpl0rn7au88vuf/nN6KfZ2PyJ80h/X
	JZijIfB5wCLfflu93S5bWyzpUW3PFg7BTrxug=
Received: by 10.216.159.75 with SMTP id r53mr5851824wek.98.1308038847043;
	Tue, 14 Jun 2011 01:07:27 -0700 (PDT)
Received: from stefanha-thinkpad.localdomain
	(gbibp9ph1--blueice2n1.emea.ibm.com [195.212.29.75])
	by mx.google.com with ESMTPS id h22sm3332841wes.32.2011.06.14.01.07.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Jun 2011 01:07:25 -0700 (PDT)
Date: Tue, 14 Jun 2011 09:07:19 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexandre Raymond <cerbere@gmail.com>
Message-ID: <20110614080719.GA19163@stefanha-thinkpad.localdomain>
References: <1308017796-397-1-git-send-email-cerbere@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1308017796-397-1-git-send-email-cerbere@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix typo in cpus.c
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
X-List-Received-Date: Tue, 14 Jun 2011 08:07:35 -0000

On Mon, Jun 13, 2011 at 10:16:36PM -0400, Alexandre Raymond wrote:
> filed -> failed
> 
> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
> ---
>  cpus.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches

Stefan

