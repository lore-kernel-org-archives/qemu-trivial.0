Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez3wI-000893-5U
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 13:23:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38678)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez3wF-00087z-Uc
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:23:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez3wF-0002IY-5X
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:23:43 -0400
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:44078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ez3wE-0002I1-Vc
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:23:43 -0400
Received: by mail-oi0-x22e.google.com with SMTP id 23-v6so8027931oir.11
	for <qemu-trivial@nongnu.org>; Thu, 22 Mar 2018 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TohuQrZ8hh0OSjq4v96Bg1ahElj6lVZOp+pKGTG7sto=;
	b=c8oxz5+zCGPkX/iJPRH14oIQSQ1mRkLsF8y6WIf8qISGvRB1OwRpOMaI6soFuxiIfm
	5tA0iUiSJ/ocEjngX35AHmrAzo+ptom4tm3ax8/OS54VvjVyOpzDQ47hMcjwnreJdnwd
	GDhSd67titIE2/WgGmfPnp3lpJkQuGZziN7T4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TohuQrZ8hh0OSjq4v96Bg1ahElj6lVZOp+pKGTG7sto=;
	b=hSofqh55ewuYpKwLg6wiv3DP16CuNZeW6lVoVQRV30L4KV583/ookB4vrBmr3Y4fFR
	YlO0ZQCSjqnYWnP8AizMFPTCLofoSHLmuUEnoxR/YMcLgMPefurYvK3MiGEMX+BkS3OB
	r+Zn4OQP2uhJc0t08gtNp0JU4i+H66SFccL11pzCrbCIhA+n49V71H6EOcAuWcVsnWCI
	MDRdndALPqxmVSi2H/XtGn6/a4UElPpSQH+EZTKzfPibcwCXYDeSZV5L1eQJJr7SNugb
	Ijc8fzCnG5l7u7EmklOfqciUboV5Ox2LKIpxfZDGG6vIAD2u52q/AZAXOq2G1Cnlhygj
	UvFA==
X-Gm-Message-State: AElRT7Hmd3ddQcZP2pEqkpbi+80CQLriDrOLJcnQajPR89D4dKiyfSNc
	MouwWHDlcIx2JSPKgrrz0Uwuoz2SySxmHsasU2qqXw==
X-Google-Smtp-Source: AG47ELsKrzTbf5QCqofFZh9rWMIdxck1Wchig/aHm8rpYrt44+guWkqfzcXZBrr4hIYhBugPHbv8mJVqevWSGtJaiHE=
X-Received: by 10.202.63.85 with SMTP id m82mr13357686oia.252.1521739421946;
	Thu, 22 Mar 2018 10:23:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 10:23:21
	-0700 (PDT)
In-Reply-To: <CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
	<6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
	<CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 17:23:21 +0000
Message-ID: <CAFEAcA8iVaYmnCgQ9-2D=3w_sf6Zs_oAvXBDPL3KVBpomA3PxQ@mail.gmail.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
	qemu-ppc <qemu-ppc@nongnu.org>, 
	Alberto Garcia <berto@igalia.com>, Qemu-block <qemu-block@nongnu.org>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22e
Subject: Re: [Qemu-trivial] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
X-List-Received-Date: Thu, 22 Mar 2018 17:23:45 -0000

On 22 March 2018 at 17:19, Max Filippov <jcmvbkbc@gmail.com> wrote:
> Ok, I can add a fixup that changes #include <xtensa-isa.h> to #include
> "xtensa-isa.h".
> Adding #include "qemu/osdep.h" there seems pointless to me.

Every top level .c file must start with including osdep.h.
Other headers that it might include rely on that.
It looks like these files aren't actually top level .c files,
but are only compiled by being #included from some other file.
Our convention for that kind of thing is to give the file
a .inc.c extension. If you follow that then clean-includes
will skip the file rather than trying to apply the requirements
for a top level .c file to it.

thanks
-- PMM

