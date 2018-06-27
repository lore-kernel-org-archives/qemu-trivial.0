Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fY3Yw-0004ej-Lt
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 02:04:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34202)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3Ys-0004e1-39
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:04:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY3Yo-00084O-Vc
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:04:14 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:46472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY3Yo-00082j-Gw
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 02:04:10 -0400
Received: by mail-pl0-x241.google.com with SMTP id 30-v6so519202pld.13
	for <qemu-trivial@nongnu.org>; Tue, 26 Jun 2018 23:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5uhpoBxRzDKUBz3dgiA+xgijQsJhMY/j68iX1jNTYYw=;
	b=Tr85/3sGU883PoJ4psUmvJTKhDdUgyd0Oz8RrexglZi5JatKcPW3V53CBcps/rksPK
	At8qpV31HtedNNXXYMeO09nOvOESzN1NEamJHew5wwKvq5CZ3DxNYlvjiBwJBcmfhySO
	NTngbd994WclDmIo16X2YM4FxnWdVajDqtunw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5uhpoBxRzDKUBz3dgiA+xgijQsJhMY/j68iX1jNTYYw=;
	b=O1B32wp+Smh1lorvC9Y7fSSZDouCgOYK81TrC8ZCGDm8KnJDucl3nA96ndVhL23Tta
	zRgAwAlouR2RigEPEt6ZKj+1yeF6d65reAkGKRUBcXfUJNi3DSwDdq/Btu6h7/S4VFXx
	yTK5Eft5atp6zs6w14H+lCuzkLIwN4crwDGVi8+nI7DekCLHuGoI/cGa4faxtOeToTGZ
	hWtDiUBCMXXTH2jS5UK5Ll9aTKEnik729TdLtza5cVR6JBvn16gu48nQx2wofn0AbeFH
	c8ds3XDsr7q0avaoBHm+lkT+2oZxJLMt0p1EsLfuHpGZ/DBOZF9/5lthCw2Ji/gEa+jE
	/yxw==
X-Gm-Message-State: APt69E0Tl+p0vGe56jG2IifV/xU6nyurDv3jBL396NeTM5CyNCcmkXQx
	rLEwVKKpgwXwmmrKHd4j0vEZ/A==
X-Google-Smtp-Source: ADUXVKI8EIaDcWpdAysBU0t8nnGorHFLnsVRxbmIiTTLOQYzp8Gqw6wM8cPZH6RNNhv3CkZuxYLzuw==
X-Received: by 2002:a17:902:1007:: with SMTP id
	b7-v6mr4641240pla.277.1530079449497; 
	Tue, 26 Jun 2018 23:04:09 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	x2-v6sm5854069pgq.33.2018.06.26.23.04.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jun 2018 23:04:08 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
	Paul Burton <paul.burton@mips.com>, "open list:ARM" <qemu-arm@nongnu.org>, 
	"open list:PowerPC" <qemu-ppc@nongnu.org>, Yongbok Kim
	<yongbok.kim@mips.com>, Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-7-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4b975f8b-681e-eb6d-9c7b-baa565ee4a52@linaro.org>
Date: Tue, 26 Jun 2018 23:04:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-7-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 06/46] hw: Directly use
 "qemu/units.h" instead of "qemu/cutils.h"
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
X-List-Received-Date: Wed, 27 Jun 2018 06:04:15 -0000

On 06/25/2018 05:41 AM, Philippe Mathieu-Daudé wrote:
> These files don't use anything exposed by "qemu/cutils.h",
> simplify preprocessing including directly "qemu/units.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc parts)
> ---
>  hw/arm/msf2-soc.c  | 2 +-
>  hw/arm/msf2-som.c  | 2 +-
>  hw/core/machine.c  | 2 +-
>  hw/display/sm501.c | 2 +-
>  hw/mips/boston.c   | 2 +-
>  hw/ppc/pnv.c       | 2 +-
>  hw/ppc/ppc440_uc.c | 2 +-
>  7 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


