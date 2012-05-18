Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SVJDG-0005VF-Pf
	for mharc-qemu-trivial@gnu.org; Fri, 18 May 2012 05:11:06 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SVJD8-0005Uy-NC
	for qemu-trivial@nongnu.org; Fri, 18 May 2012 05:11:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SVJD3-00047x-An
	for qemu-trivial@nongnu.org; Fri, 18 May 2012 05:10:58 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:36909)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SVJD3-00041r-23; Fri, 18 May 2012 05:10:53 -0400
Received: by wgbds1 with SMTP id ds1so717423wgb.4
	for <multiple recipients>; Fri, 18 May 2012 02:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iCn1XKJalx2NjcU+Gr1F49Rd0da1jeWN05k7HDsoIVQ=;
	b=rm0MyPZKqTwgd/PUqVZ8GqekVMuASLRl57OhJNA5RfgpeWC26DNmNcv/zwztbTO3wl
	d8HKnjLX2OWO8w332bZALiHGDL5PcoMBcaSalHXcomzg2AqkG6ZR1B5abP5UjtMitnsw
	CVsQzdqxYBWUHJrIZiT2+uWJ1hj2q2hovJES7bPu7TUiK0uy4whNcAdCdF6uy3vGiL9w
	ebpmT0XaTHzfVUmCJVOltBlwVMJvrketcJDJ5ogqLLDV7OdNpAAgA0BimwsKwNPGWwRI
	koTRNBdZik5/xv1IEyXUwZ2mahmFpCU4uIIh4i6y0AutCO4RibegP8HVh/bba2WOGc77
	PvSg==
Received: by 10.216.140.211 with SMTP id e61mr6518760wej.98.1337332249540;
	Fri, 18 May 2012 02:10:49 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	fn2sm31076268wib.0.2012.05.18.02.10.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 18 May 2012 02:10:49 -0700 (PDT)
Date: Fri, 18 May 2012 10:10:44 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: dunrong huang <riegamaths@gmail.com>
Message-ID: <20120518091044.GA17355@stefanha-thinkpad.localdomain>
References: <1336034082-5288-1-git-send-email-riegamaths@gmail.com>
	<4FB15EC4.3050206@weilnetz.de> <20120514204011.GF28865@illuin>
	<CAOZVR5bkPnLZrHNXC7UfZTK_aNQM8ev0eK-UYCdAtdWH8XLuQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOZVR5bkPnLZrHNXC7UfZTK_aNQM8ev0eK-UYCdAtdWH8XLuQA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qdev: Fix memory leak
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
X-List-Received-Date: Fri, 18 May 2012 09:11:05 -0000

On Tue, May 15, 2012 at 11:21:13AM +0800, dunrong huang wrote:
> Thanks for your reply.
> 
> As you say, for an input visitor we dont need to initialize the pointer.
> "visit_type_str" in set_mac function and set_pci_devfn function is a input
> visitor, it points to
> "qmp_input_type_str", if qmp_input_type_str failed, it will alloc a Error
> struct and return.
> 
> So, i think it doesnt matter whether initializing it or not in this
> situation.
> But the str must be freed to avoid memory leak

Want to send a fixed "[PATCH 1.1 v2]" that can be merged for QEMU 1.1?
Please go directly through Anthony Liguori or another qemu.git committer
instead of qemu-trivial for QEMU 1.1 fixes.

Stefan

