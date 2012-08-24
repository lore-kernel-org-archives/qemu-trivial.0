Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4reu-0004W0-Ev
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:02:36 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4reo-0004Vg-Sy
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4ren-0006er-Iv
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:02:30 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:35476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4ren-0006ek-DP
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:02:29 -0400
Received: by weyz53 with SMTP id z53so893456wey.4
	for <qemu-trivial@nongnu.org>; Fri, 24 Aug 2012 04:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=K9ZqYk0/KmMVHEDs2btg7ZMIZaLg4/dKJmrsv93kEnE=;
	b=cf6uv6fUBSXGJxEeAzsXZtX7UJpFi/YvDHnEx8qOGoFMRS1f3Kjtp1YKQNWHAvari5
	fl9BK9oVWrBZg7LIW1TMQlh5M0on56n4GOKS4UrTCJmKmbMZwDxkp0pzcQptDCA/OnsA
	FEnT/VnQ/bYM+MXrJ4ryw1s+Zm6831J0uPm1vUB4Kl6NBiPWj5HsvSoFZuVCDMby2mQW
	vdMlLPIufdB4JFBVmkeIDblXbm7yCsZugexXYgUs0gDKe/mzpCcDd+xZ7BKMNhXGkF3G
	gnrU6XZhKx5B1z1VcY6MG0xik7NpxiqT6dZW96tAuO456qHinaRsz56pbg3xhARSMMQp
	zBiw==
Received: by 10.180.105.6 with SMTP id gi6mr4730159wib.4.1345806148569;
	Fri, 24 Aug 2012 04:02:28 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id l5sm5776581wix.5.2012.08.24.04.02.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 04:02:27 -0700 (PDT)
Date: Fri, 24 Aug 2012 12:02:24 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20120824110224.GE10867@stefanha-thinkpad.localdomain>
References: <1345498749-16769-1-git-send-email-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345498749-16769-1-git-send-email-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/3] configure: fix detection for cURL
 libs when static linking
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
X-List-Received-Date: Fri, 24 Aug 2012 11:02:34 -0000

On Mon, Aug 20, 2012 at 11:39:07PM +0200, Yann E. MORIN wrote:
> Currently, configure uses the same code-path to check for cURL libraries,
> whether we are doing a static or dynamic build.
> 
> Fix that by pasing the proper arguments: '--static-libs' for curl-config
> and '--static --libs' for pkg-config when a static build is attempted.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  configure |    8 +++++++-
>  1 files changed, 7 insertions(+), 1 deletions(-)

Can you set pkgconfig --static --libs in one place so the if [ "$static"
= "yes" ] code isn't duplicated several times?  (This is a general
question about the entire patch series.)

Stefan

