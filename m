Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmpTM-0003F7-3x
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 16:17:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40173)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YmpTJ-0003BZ-6K
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 16:17:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YmpTB-0005PG-Ad
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 16:17:41 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:36969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YmpTB-0005Oq-6c
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 16:17:33 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
	by mailout.nyi.internal (Postfix) with ESMTP id C034620B61
	for <qemu-trivial@nongnu.org>; Mon, 27 Apr 2015 16:17:32 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute2.internal (MEProxy); Mon, 27 Apr 2015 16:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=yE21R
	OdqGNmf/QaxOCMqUXP4coM=; b=KWiB2yh93YzvrVoviC2yHuf3Eesynyn81AjE5
	D0JrjqQovtIKEkcp2Jkv52ZC8ba/ubeNhJcPunNMktsKPJwABKmpDIbS8lSo1Qjt
	3PsJpaI6jAKm4aWeC7B/1dxROMt0esRcEAiCTOpRh/8vEbA4uIkvbqv8866dmm3r
	W43L9M=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=yE21ROdqGNmf/QaxOCMqUXP4coM=; b=Z/ehv
	IEwLoqhbKm/ba/R/JmX4HytQ6pwWKt3i+CRj4hdfMyUXPoDLQAVF8GrxFYnKdv8Z
	lzXv0R2V8p5XWJ0jtm371JN0IApHeZR2OmEnVqxHQboWo4rY8tWBPP7FX/bXjxU8
	QbjiUvWN5x2O7X+YjLrGiPSv0yLSKPW/wffpgU=
X-Sasl-enc: WRbMoIc3i6BQjJ6Rt24M47SMvcmZNglfFYjjvKMsNpXx 1430165852
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 8571AC00011;
	Mon, 27 Apr 2015 16:17:32 -0400 (EDT)
Date: Mon, 27 Apr 2015 16:18:06 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20150427201806.GA9078@flamenco>
References: <1430153133-30988-1-git-send-email-cota@braap.org>
	<1430153133-30988-5-git-send-email-cota@braap.org>
	<CAEgOgz5LL=9EChHirsppPBVqP4vM2td5ZMdm+1g_tAsTo2WejQ@mail.gmail.com>
	<553E7FB0.1020404@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <553E7FB0.1020404@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.25
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/6] gitignore: ignore
	*.patch files
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
X-List-Received-Date: Mon, 27 Apr 2015 20:17:42 -0000

On Mon, Apr 27, 2015 at 12:28:00 -0600, Eric Blake wrote:
> On 04/27/2015 12:11 PM, Peter Crosthwaite wrote:
> > This Issue is discussed and I think it was concluded to not gitignore
> > patches. See:
> > 
> > commit f3a22014e94dfaacb57277dafce66b41cd994869
> > Author: Michael Tokarev <mjt@tls.msk.ru>
> > Date:   Thu Jun 6 01:14:54 2013 +0400
> > 
> >     gitignore: unignore *.patch
> 
> You can always ignore them locally:
> echo '*.patch' >> .git/info/exclude
> 
> without requiring everyone to ignore them (I actually like seeing them
> show up, to know when I have not yet hit send on a series).

Thanks for the tip!

All: please ignore this patch in the series.

		Emilio

