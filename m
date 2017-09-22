Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvQsY-0007pt-OW
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 12:32:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQsV-0007o1-Je
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:32:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dvQsU-0006ts-QZ
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:32:35 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:43910)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dvQsU-0006tK-KU
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 12:32:34 -0400
Received: by mail-wr0-x235.google.com with SMTP id a43so1339107wrc.0
	for <qemu-trivial@nongnu.org>; Fri, 22 Sep 2017 09:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yhXBntZnmBIQ5sr2ezMKg6APh1qFV4Ot5f2x9tF6aKE=;
	b=j0nTIwVtc2z9mydZKpiyJYtT85HHRD/EGrpO8VRTZ9kYoHdoCH1zzzy78mQCeIkaLa
	10wepjeF69FVE4PhGcoClujWmwKs8Aoz/IICcbnwE7vuf7BAliL3ASjRE+I4+0aVLWUi
	dSCn/12vtbVpseIRS/kvWDf92bin604GfoGco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yhXBntZnmBIQ5sr2ezMKg6APh1qFV4Ot5f2x9tF6aKE=;
	b=HksIny4FA0DLKZ3FzaG3O6cp5+0jLbVhlpjfNJeq4uVKJfsrwXwXjb2yVCw5s2k4dp
	F61wMFT8ZK9DOFDAEdm+nGXEJtyWaPwWXMKIn7L6ZU9h09m2Wgxxcd3Zho3BFV4Tbpsy
	ZGedOqUY2SLL1bnaCoOLU7bQldF8aWHJ1teIF63egSqIu5XGidtKPl4OZPcGJTUOsohG
	wxP1JSLGlzZ/2CkYG3Q7mkNaHRI7STmlNrThuifRxk+vlgv4KFg2RS3dgcWzK0x8upE+
	glo3hwGyRA2C08y5xra0PEhlk//Ey5maBbdWG9pnA6/go9SYwpbYqyqhrsY/2aGg5iIy
	rP0g==
X-Gm-Message-State: AHPjjUhSEiIngvMXDMpzxOf+wyVS4Y58CRbhBtMMgSDdPiki3TpCUk1W
	+dLEu3VxjvXvmUzvupO69GL0+OM3M1zpWcL6Bkf1ow==
X-Google-Smtp-Source: AOwi7QDSv+2t1ESrwKYU1cYqGG1WCe9q5qjuVGl6Y5ANu5jWy/TDiRp9ATNVmBiPDyT1dopkf3bZel1hQXGherDuBg4=
X-Received: by 10.223.134.174 with SMTP id 43mr5774758wrx.173.1506097953639;
	Fri, 22 Sep 2017 09:32:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Fri, 22 Sep 2017 09:32:13 -0700 (PDT)
In-Reply-To: <20170922154014.29350-4-f4bug@amsat.org>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Sep 2017 17:32:13 +0100
Message-ID: <CAFEAcA9C1h0LBuSGiV1_UjgUuu5cjPVFbfK8nHBOsD1Bv6F8Rw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, 
	Max Reitz <mreitz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-trivial] [PATCH 03/34] block: remove "qemu/osdep.h" from
 header file
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
X-List-Received-Date: Fri, 22 Sep 2017 16:32:37 -0000

On 22 September 2017 at 16:39, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> applied using ./scripts/clean-includes
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  block/dmg.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/block/dmg.h b/block/dmg.h
> index b592d6fa8b..2ecf239ba5 100644
> --- a/block/dmg.h
> +++ b/block/dmg.h
> @@ -26,7 +26,6 @@
>  #ifndef BLOCK_DMG_H
>  #define BLOCK_DMG_H
>
> -#include "qemu/osdep.h"
>  #include "qemu-common.h"
>  #include "block/block_int.h"
>  #include <zlib.h>
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

