Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFkQ9-0001G3-7P
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 14:31:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gFkQ6-0001ER-Ni
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 14:31:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gFkQ5-0007o8-1i
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 14:31:46 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:44455)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gFkQ0-0007lG-2r; Thu, 25 Oct 2018 14:31:40 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id E878021F22;
	Thu, 25 Oct 2018 14:31:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
	by compute4.internal (MEProxy); Thu, 25 Oct 2018 14:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=WsM2IzDz2tQKc9Ou7aloaPRo
	XZDikiFSv8JfdGPdiZQ=; b=tbRFm9jT69n0RtjFWHaXsa9uHO7FtOddKY94BuTt
	O2xXPbNTpKcw0SJGt/BLeqfeWP9HG6wDVwe8cGBxa5wdU31NRsnpw6Bz4D25IC4j
	7gq0sTZDxCr0Cg1sZM41FstJ1XrdJhqbCIKqb5AvQ8mU8sx4od5+VvCQgmBG5yoK
	11Q=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WsM2Iz
	Dz2tQKc9Ou7aloaPRoXZDikiFSv8JfdGPdiZQ=; b=r3b0hDloQOeUDStOMqNcfF
	HFFaKNfTR+bXhjzxxdTN71M/tsxIBU2kQA36HZAgbogXo0+y3o/7bx5g3r1VhAUW
	pJgx4JQrRMOFzWnIJfGTkXJ343zfsoWboCai01SpQOaFAXFeHOVfCw0ytFONm9rl
	3Rz7D3ZHqUfdfw+sfepnpGSVnqCTqKHRLyFpUoMOP0bMaeDKbI0a6CYaXNqYfP47
	67fCOOdv9eulhVMR85Yp87cBcTeb0d3lrfWK8rks/8oMuwEHZdQMBdRuxDzH6hli
	qg7Xn9c3e47BzUx+eqn6HlNqzZPEbdHDbInXo4oM4C6eNge2ccMqHo76GoP0h6vQ
	==
X-ME-Sender: <xms:CAzSWz3eZGEmnqds0o7aQIrhbVj2oKK8glfr9U8GtYsuujPhb1pmHA>
X-ME-Proxy: <xmx:CAzSW6bHzHKbVhsrARVTpnfjnxYDPMqNEMjSMoxFPJtv2Z-fpMw4Kw>
	<xmx:CAzSW30zMadlVzOEYwaQQdN3qmL8pSdrkMBXCRut_vqu-_reGWenjw>
	<xmx:CAzSW8e425NIC5ZoloiT-gquiQhrY-O0y7Xa2jHhfPaiTHxPKTi1Lw>
	<xmx:CAzSW0KY9MLwnDY5lYJE_btHANf-RrQOWLVmz1pMeJ_AULbfdqDfAw>
	<xmx:CAzSW6q_NcGeNbPQMOWGIilhQ4kRVdFt2xObfKU_XpGcjftCZe6gDg>
	<xmx:CgzSWyQ84bi64GJ8NqDY9LJ7fG5APjG1Nruf9W1sgaXCQ1GvUhNr5w>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 5406EE4897;
	Thu, 25 Oct 2018 14:31:36 -0400 (EDT)
Date: Thu, 25 Oct 2018 14:31:35 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	qemu-devel qemu-devel <qemu-devel@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20181025183135.GA29428@flamenco>
References: <38b0df70-338e-c842-95bb-c1a5fbd54b7b@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38b0df70-338e-c842-95bb-c1a5fbd54b7b@vivier.eu>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.27
Subject: Re: [Qemu-trivial] [Qemu-devel] Call for patches for the
 qemu-trivial pull request
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Oct 2018 18:31:47 -0000

On Tue, Oct 23, 2018 at 11:04:36 +0100, Laurent Vivier wrote:
> So, it would be helpful if any of you knowing that some patches have to
> be added to the pull request send me their list.

I sent this one in August:

 linux-user: fix comment s/atomic_write/atomic_set/
 https://lists.gnu.org/archive/html/qemu-devel/2018-08/msg01964.html

Thanks,

		Emilio

