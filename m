Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SHagS-0000p6-W9
	for mharc-qemu-trivial@gnu.org; Tue, 10 Apr 2012 09:00:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:48000)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SHagL-0000Ql-2F
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 09:00:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SHagE-0000Cy-OA
	for qemu-trivial@nongnu.org; Tue, 10 Apr 2012 09:00:24 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:63001)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SHafz-0008Rc-DL; Tue, 10 Apr 2012 09:00:03 -0400
Received: by wibhn6 with SMTP id hn6so2967825wib.10
	for <multiple recipients>; Tue, 10 Apr 2012 06:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CX7x+35SXGFtFYFFeORSOv6u1s/6Cx4Bxi+RKRvZ2R0=;
	b=ZU47S/wOfVAl92RJ+awlVfXGWXju7eC33SbjHB9FXHzyDOFGwwIrUcLZMekRJBIiNw
	0FeahH2UUlBzC0+xx9Rad5qwAwFUpAbMNEwhaEnGq2rbgRIgpa7odrzlyIokTC2ohBt+
	L5xt4vjXFxqxNbEZD4xc5+WKg8krMKI2LrPp9MHvdHMPoO2xcw9+x45U5RIW1KfFmmcA
	Cnwehv2cecECsL9lzOOBoPHGfo9oMf9Pz6jmyhRqqWeCsH5dBXRIJMJAE/L5Z/Fy018d
	u4cYDON+/y+z4IFTTdIBBu7cwy5Tf5DQHvB6DmdeVEvgn8cS0LZxqT7o3+w2RF5HWOZG
	bpdg==
Received: by 10.216.208.142 with SMTP id q14mr1926122weo.65.1334062800093;
	Tue, 10 Apr 2012 06:00:00 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id 6sm37557596wiz.1.2012.04.10.05.59.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 05:59:59 -0700 (PDT)
Date: Tue, 10 Apr 2012 13:59:57 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20120410125957.GB9094@stefanha-thinkpad.localdomain>
References: <1333555395-12873-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1333555395-12873-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	qemu-devel@nongnu.org, patches@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Remove useless
 uses of ARCH_CFLAGS
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
X-List-Received-Date: Tue, 10 Apr 2012 13:00:31 -0000

On Wed, Apr 04, 2012 at 05:03:15PM +0100, Peter Maydell wrote:
> Remove some useless uses of ARCH_CFLAGS -- this variable was never set
> so will always be empty. The uses were accidental: in commit 0c439cbf8
> Juan Quintela removed ARCH_CFLAGS in favour of CFLAGS (which in turn
> became QEMU_CFLAGS). However in commit be17dc90 a use of it was
> reintroduced (apparently accidentally) by Michael S. Tsirkin, and then
> I subsequently cut-n-pasted that into a number of other configure
> feature tests.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  configure |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

