Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kKVso-0000Cw-LY
	for mharc-qemu-trivial@gnu.org; Mon, 21 Sep 2020 20:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1kKVsl-0000CX-AC; Mon, 21 Sep 2020 20:10:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:55040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1kKVsj-0006KU-IT; Mon, 21 Sep 2020 20:10:06 -0400
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DB7121789;
 Tue, 22 Sep 2020 00:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600733403;
 bh=E/BrcJFsVqD8zc+U2gIwgRluxmFCpSl7ZHU1/v0Rx1Q=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=qq610C7FrEfQsZCHpuFqYZZztksKSnF2nSrfGgYSulCQr0LvcHSliT2+1FmbTen/E
 VuN9jl+msQ6slmD+o7KBvFYaW7547CQhmmeg5mayyE7EzRb0brpa8dpQ9prf5ZrNjS
 aZ3vjcT8PprJz+kvT+KBVjEeO6NJOlxHwfYcMTGs=
Date: Mon, 21 Sep 2020 17:10:02 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
cc: Anthony PERARD <anthony.perard@citrix.com>, 
 Michael Tokarev <mjt@tls.msk.ru>, 
 Stefano Stabellini <sstabellini@kernel.org>, qemu-devel@nongnu.org, 
 QEMU Trivial <qemu-trivial@nongnu.org>, paul@xen.org
Subject: Re: [PATCH] xen: xenguest is not used so is not needed
In-Reply-To: <07fb2cbf-e006-0ee8-a749-af0d5b4fcc9e@amsat.org>
Message-ID: <alpine.DEB.2.21.2009211709370.1495@sstabellini-ThinkPad-T480s>
References: <20200727140048.19779-1-mjt@msgid.tls.msk.ru>
 <20200727150949.GC2866@perard.uk.xensource.com>
 <07fb2cbf-e006-0ee8-a749-af0d5b4fcc9e@amsat.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-167742171-1600733403=:1495"
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=sstabellini@kernel.org; helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 19:46:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.455,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Sep 2020 00:10:08 -0000

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-167742171-1600733403=:1495
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

Adding Paul


On Sat, 19 Sep 2020, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-trivial@
> 
> On 7/27/20 5:09 PM, Anthony PERARD wrote:
> > On Mon, Jul 27, 2020 at 05:00:48PM +0300, Michael Tokarev wrote:
> >> There's no references in only file which includes xenguest.h
> >> to any xen definitions. And there's no references to -lxenguest
> >> in qemu, either. Drop it.
> > 
> > I'm not sure what you mean by "no references to -lxenguest", do you mean
> > in the binary?
> > 
> >> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> > 
> > Otherwise, thanks for the cleanup!
> > 
> > Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
> > 
> 
--8323329-167742171-1600733403=:1495--

