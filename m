Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jf5UL-0001t5-GV
	for mharc-qemu-trivial@gnu.org; Sat, 30 May 2020 13:41:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jf5UK-0001ss-7l
 for qemu-trivial@nongnu.org; Sat, 30 May 2020 13:41:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55009
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jf5UH-0007C9-GG
 for qemu-trivial@nongnu.org; Sat, 30 May 2020 13:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590860495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=C8+O4jKfZw2x6/nZ3z91acMOF/azKglpza49Rye/lx0=;
 b=NJP+lnIqIy2oBkpAB15sggmeeA2viRrdK/ZINEmrOd9cSyZF9RHgThXhqJuhIwUSVmNKki
 cBCE9GowEQFgaVeTrLa3g5mvIBFPPQP25+mzj3ml6uvsk93MF13sWuWFpgf2dpcob1SuwA
 Gc2pcD+Chvc3r4E7D0N+yDQhBaI/kxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-lF9vksptM72L1wPVfZYQ8A-1; Sat, 30 May 2020 13:41:34 -0400
X-MC-Unique: lF9vksptM72L1wPVfZYQ8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D293880B700;
 Sat, 30 May 2020 17:41:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0ADF710013C1;
 Sat, 30 May 2020 17:41:28 +0000 (UTC)
Subject: Re: [PATCH] hw/display/cirrus_vga: Fix code mis-indentation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20200529165436.23573-1-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <17c858f1-dbd0-42b9-f2fa-22954133891a@redhat.com>
Date: Sat, 30 May 2020 19:41:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200529165436.23573-1-f4bug@amsat.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/30 12:03:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sat, 30 May 2020 17:41:40 -0000

On 29/05/2020 18.54, Philippe Mathieu-Daudé wrote:
> While replacing fprintf() by qemu_log_mask() in commit
> 2b55f4d3504, we incorrectly used a 'tab = 4 spaces'
> alignment, leading to misindented new code. Fix now.
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/display/cirrus_vga.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/display/cirrus_vga.c b/hw/display/cirrus_vga.c
> index 92c197cdde..212d6f5e61 100644
> --- a/hw/display/cirrus_vga.c
> +++ b/hw/display/cirrus_vga.c
> @@ -1032,9 +1032,9 @@ static void cirrus_bitblt_start(CirrusVGAState * s)
>          } else {
>  	    if (s->cirrus_blt_mode & CIRRUS_BLTMODE_TRANSPARENTCOMP) {
>  		if (s->cirrus_blt_pixelwidth > 2) {
> -            qemu_log_mask(LOG_GUEST_ERROR,
> -                          "cirrus: src transparent without colorexpand "
> -                          "must be 8bpp or 16bpp\n");
> +                    qemu_log_mask(LOG_GUEST_ERROR,
> +                                  "cirrus: src transparent without colorexpand "
> +                                  "must be 8bpp or 16bpp\n");
>  		    goto bitblt_ignore;
>  		}
>  		if (s->cirrus_blt_mode & CIRRUS_BLTMODE_BACKWARDS) {
> 

I think it would be better to fix the TABs in the whole surounding area,
too. Or maybe even in the whole file. Otherwise this problem will happen
soon again...

 Thomas


