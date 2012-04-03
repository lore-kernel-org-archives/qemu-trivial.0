Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SF0hl-0000t4-2p
	for mharc-qemu-trivial@gnu.org; Tue, 03 Apr 2012 06:11:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SF0he-0000sC-QU
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2012 06:11:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SF0hY-0001zb-Lq
	for qemu-trivial@nongnu.org; Tue, 03 Apr 2012 06:11:06 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:63625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SF0hY-0001zL-D9; Tue, 03 Apr 2012 06:11:00 -0400
Received: by wgbfm10 with SMTP id fm10so3209873wgb.10
	for <multiple recipients>; Tue, 03 Apr 2012 03:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=YzUBX2OqIwOikx+4AJlafV7P2Jia3tK+sORn3DRlqDY=;
	b=g2amydeT/627WSWJe1O+8f7eOOU5YpmgPE2bKQ5oXaWgdYW1X2Fxn7Y4EsZptG7Ovy
	EWIW8oUDaO/FU+TdA+T58nIrrtTkUZPYIfzKx9ukuHBOubqRXVOFMYJyq/ytUNdoxtKY
	PrOc3tDzKtT0WFobZ7GyqHbxyAu8fvyCQjEjtlo7B8rJLP+H7EVmVUhChu6NgXSEYDer
	Hu4jGHch2usDG675VsK4RCJYM/mvly0A0EigsCvBVm9DVs6q2muyAp1WbZse2+jnyVW8
	VKPL2QLpdHyAvCa3MCroJM7UigclJ05AGnbBdshlMHcj1QmBV15Oy3V7gvSU9UsIIn4b
	yH/A==
Received: by 10.180.95.129 with SMTP id dk1mr40746182wib.3.1333447857371;
	Tue, 03 Apr 2012 03:10:57 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	o2sm67544445wiv.11.2012.04.03.03.10.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 Apr 2012 03:10:56 -0700 (PDT)
Date: Tue, 3 Apr 2012 11:10:54 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20120403101054.GA17972@stefanha-thinkpad.localdomain>
References: <1333379439-8688-1-git-send-email-anthony.perard@citrix.com>
	<20120403085620.GC30614@stefanha-thinkpad.localdomain>
	<CAJJyHj+gJOeAhoK9dLBt5YKwXh55tB2gJBHTxPC6z7h8KVYN=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJJyHj+gJOeAhoK9dLBt5YKwXh55tB2gJBHTxPC6z7h8KVYN=Q@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial <qemu-trivial@nongnu.org>, QEMU-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] make: fix clean
 rule by removing build file in qom/
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
X-List-Received-Date: Tue, 03 Apr 2012 10:11:11 -0000

On Tue, Apr 03, 2012 at 11:06:45AM +0100, Anthony PERARD wrote:
> On Tue, Apr 3, 2012 at 09:56, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> >
> >> tg: (a3b6181..) fix/make-clean (depends on: master)
> >
> > What's this?  I'm curious.  First I thought it was a signature joke that
> > I didn't get but I guess it's for some kind of commit tracking system?
> 
> No, it is not. To prepare a patch (or patch set), I use a tool called topgit.
> 
> http://repo.or.cz/w/topgit.git
> 
> It creates one git branch per patch, and you can add as many
> dependence branch as you want. When you want to "rebase" a patch,
> topgit will merge with the depends.

Thanks for sharing!

Stefan

