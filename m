Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gH67w-0007SK-0J
	for mharc-qemu-trivial@gnu.org; Mon, 29 Oct 2018 07:54:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gH67t-0007Q9-B3
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 07:54:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gH67r-0007iP-4v
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 07:54:33 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:38347)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gH67q-0007c2-TJ
	for qemu-trivial@nongnu.org; Mon, 29 Oct 2018 07:54:30 -0400
Received: by mail-oi1-x244.google.com with SMTP id v83-v6so793489oia.5
	for <qemu-trivial@nongnu.org>; Mon, 29 Oct 2018 04:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YNejyqvlvtqZ5lekjzx/o1ZDa4m359Wd/oZyre5a2vw=;
	b=hyl9Xec+0issRvxxfMji7qUYEIlErPCw6h5RlkydBiX9OH1ngBVMJOEMNv1HsoEv9k
	ot46Jh8ABhfz6NfoGk2PLoqEJZBl2e6zMeMiccRKw+IRrym8/FuevOzJWu7srgquFrW+
	lznUXZfRwqDBb2kHnBicBWfmgwxdpeOpa8xgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YNejyqvlvtqZ5lekjzx/o1ZDa4m359Wd/oZyre5a2vw=;
	b=R62DbC9mHOZ3koI+/BygiuZifMGnQq74KVEM7x9CucgqSm9O227m+Z0cDYptKvlOiR
	BshNWXdgQBJsjGlVQnHQOyJEalHWRFoqxm7aozbmdGQHG0Gl9QIlX1xWwc7kR1mnR30O
	qr+JFCtDleT1Ho9X8cOI5bTQ/K5lZ4ug+YK1Hddre4cyVumPtUKJ+DDDJvr0sTHofwh3
	wkMKLlEW60fEkZoH+FDmBpdtFUsVZX1zttjAWPUh/6HqqOctbd2Of9lOFauSFGR6xAtB
	/rIcBeQdj4K2FVTa/isyyx/sDUZtgPHRHtNyz3lK4MSVs0LvWjiQKzbfXQLj8jpDyRYk
	JDrw==
X-Gm-Message-State: AGRZ1gKdSq4vfJZfNi7JsmOTT1D5ifv3DY2tdquT3aDM9noue7kUEfBk
	TKyIpWJhzj3sMeLI+d4ABIeSWcoW/X4nduieZSIudA==
X-Google-Smtp-Source: AJdET5ehURSSvcsUSsBmx/awNHewJrPOLYG4gJ/DtIIivq41+pIrhA/ThnUuBG7J2h7ZVmEu2iJiz84nIiymJnQ+nFA=
X-Received: by 2002:aca:c509:: with SMTP id v9-v6mr7717600oif.48.1540814067282;
	Mon, 29 Oct 2018 04:54:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Mon, 29 Oct 2018 04:54:06
	-0700 (PDT)
In-Reply-To: <20181026153125.24738-1-laurent@vivier.eu>
References: <20181026153125.24738-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Oct 2018 11:54:06 +0000
Message-ID: <CAFEAcA-8sN2MGK6OcK5uMbMuw33MMOAgsdr9y4Uj2qmpbTkeig@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
	Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, 
	"open list:X86" <xen-devel@lists.xenproject.org>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, 
	Max Reitz <mreitz@redhat.com>, Fam Zheng <famz@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-trivial] [PULL 00/20] Trivial patches patches
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
X-List-Received-Date: Mon, 29 Oct 2018 11:54:34 -0000

On 26 October 2018 at 16:31, Laurent Vivier <laurent@vivier.eu> wrote:
> The following changes since commit 808ebd66e467f77c0d1f8c6346235f81e9c99cf2:
>
>   Merge remote-tracking branch 'remotes/riscv/tags/riscv-for-master-3.1-sf0' into staging (2018-10-25 17:41:03 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-patches-pull-request
>
> for you to fetch changes up to 4b03da6e87c34793137a231b558231fd406c05e8:
>
>   ppc: move at24c to its own CONFIG_ symbol (2018-10-26 17:17:32 +0200)
>
> ----------------------------------------------------------------
> QEMU trivial patches collected between June and October 2018
> (Thank you to Thomas Huth)
>
> ----------------------------------------------------------------

Hi; I get a compile error due to a format string issue:

In file included from
/home/petmay01/qemu-for-merges/hw/net/milkymist-minimac2.c:33:0:
/home/petmay01/qemu-for-merges/hw/net/milkymist-minimac2.c: In
function 'minimac2_write':
/home/petmay01/qemu-for-merges/hw/net/milkymist-minimac2.c:420:23:
error: format '%lx' expects
 argument of type 'long unsigned int', but argument 4 has type
'uint64_t {aka long long unsign
ed int}' [-Werror=format=]
                       "milkymist_minimac2_wr%d: 0x%" HWADDR_PRIx " = 0x%lx\n",
                       ^
/home/petmay01/qemu-for-merges/include/qemu/log.h:85:22: note: in
definition of macro 'qemu_lo
g_mask'
             qemu_log(FMT, ## __VA_ARGS__);              \
                      ^
cc1: all warnings being treated as errors

(affects windows crossbuilds, OSX and 32-bit hosts).

thanks
-- PMM

