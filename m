Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gpfCP-0002A6-1w
	for mharc-qemu-trivial@gnu.org; Fri, 01 Feb 2019 15:14:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gpfCN-000293-Sa
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2019 15:14:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gpfCN-0007Pg-4j
	for qemu-trivial@nongnu.org; Fri, 01 Feb 2019 15:14:03 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44907)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gpfC8-0007DT-A7; Fri, 01 Feb 2019 15:13:52 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id F144621D27;
	Fri,  1 Feb 2019 15:13:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Fri, 01 Feb 2019 15:13:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=mesmtp; bh=t1hulAvaQ4+LlAd1BBiraD5s
	pG7MPFVAK4AA1IXfhSo=; b=f/qkycE3AiofzidcdSt6x3aP5J2zY3RkLD1XeG5C
	3BDQbQnKZltJby/XqGTNfmngIZvAtQVHcJw/16XmTF16jD9uc/yvhW90Mv0IFpBc
	pqFeeVVyuBbP9+hI3flBc0WwKM7RkmMYNSD297SF3EQZZC+MXdGaYSpYZ60L8D6B
	ChQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t1hulA
	vaQ4+LlAd1BBiraD5spG7MPFVAK4AA1IXfhSo=; b=TIv+B4NYpK2uLtBu5pkbee
	qFbMTQZwYgch4frRwfPSEVjdur2pMMjVgtPKoR4BHrRoFnHNbIhLbWuY3Og8oMbD
	FlC0RXfDztt5lxbhqQARXfFdcJzccezYW59Bo1b3Btec+8w7kJ4zkd9MKL40cKTy
	aCGXXyCJqRloCsEPFXIlQ4Qqxc/HFa003i/A0mWrHv/mzX2RID0edDdVyTWgOFQy
	BNFdAslZUZ8UshHJOPueWSBRzV/4AblDu9eynR30KRRL281vuOl3Qih6tYbJ0vcA
	HErTAVgxMCbfNBPikjhNDzh5BHi5XB5QRYW6XinbPe+qTkzePmpahD2Dx3QkhO4A
	==
X-ME-Sender: <xms:dahUXLGW1gk7R7xw9He0tnM4eCCbBcmJXMi02HVFCTI_mB5S8Mdb6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeekgddufeeiucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfquhhtnecuuegrihhlohhuthemucef
	tddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfh
	ggtggujggfsehttdertddtredvnecuhfhrohhmpedfgfhmihhlihhoucfirdcuvehothgr
	fdcuoegtohhtrgessghrrggrphdrohhrgheqnecukfhppeduvdekrdehledrvddtrddvud
	einecurfgrrhgrmhepmhgrihhlfhhrohhmpegtohhtrgessghrrggrphdrohhrghenucev
	lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:dahUXERFGt7BAJwwzZma6JH9dd37e-sXK_lRwrxpsRt5RKhfOEcUjw>
	<xmx:dahUXAOzq5vb96laelhqY_aOVqSLURpbUkTtqd1N7mj8PhxtKke1Gg>
	<xmx:dahUXEeag1ss2BJDCWnp5Yh8w7mp79jd2YQl2DI8Fnvb26d3Zpgi3w>
	<xmx:dahUXG4Ywf0zwb3hsUUnaWJGI4wvpu1zWD7-0A_ZIcyTiLNWDESCBA>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2DA311030F;
	Fri,  1 Feb 2019 15:13:41 -0500 (EST)
Date: Fri, 1 Feb 2019 15:13:40 -0500
From: "Emilio G. Cota" <cota@braap.org>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, alex.bennee@linaro.org
Message-ID: <20190201201340.GA20601@flamenco>
References: <20190201193234.20796-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190201193234.20796-1-eblake@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: Ignore fp test
 outputs
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
X-List-Received-Date: Fri, 01 Feb 2019 20:14:04 -0000

On Fri, Feb 01, 2019 at 13:32:34 -0600, Eric Blake wrote:
> Commit 2cade3d wired up new tests, but did not exclude the
> new *.out files produced by running the tests.
> 
> Signed-off-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Emilio G. Cota <cota@braap.org>

		E.

