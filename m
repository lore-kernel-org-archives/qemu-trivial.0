Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmDiG-0000FG-Ks
	for mharc-qemu-trivial@gnu.org; Mon, 07 Dec 2020 05:25:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmDiE-0000Bx-K4
 for qemu-trivial@nongnu.org; Mon, 07 Dec 2020 05:25:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kmDi7-0003r8-Cu
 for qemu-trivial@nongnu.org; Mon, 07 Dec 2020 05:25:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607336737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gGBj+nIBcVSafCQ8H4EgbSR/pIRcQdeUgtRnvl93quA=;
 b=flkfkMRGWxrjr7DKrY9cAk5fVqzkdiCdSJk2yGJ7U2sHNaX7D5jUZiEgGjzrc7IV8r5P/Z
 r4xTxUbMWl71S3P2c8INklmCkadVwyiSQLCfN4ojRHKuxChrBIHKgcfSPd0KZA0v6CT/wP
 F2lVywQmfOSE0se0kmnL6Nx9zFNcfHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-28UM64CeM7yk1Labbmt5XQ-1; Mon, 07 Dec 2020 05:25:35 -0500
X-MC-Unique: 28UM64CeM7yk1Labbmt5XQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81977800D53;
 Mon,  7 Dec 2020 10:25:34 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4E10D60BE2;
 Mon,  7 Dec 2020 10:25:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8C36411AB8; Mon,  7 Dec 2020 11:25:33 +0100 (CET)
Date: Mon, 7 Dec 2020 11:25:33 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Darrell Walisser <darrell.walisser@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] sdl2: Add extra mouse buttons
Message-ID: <20201207102533.sjlkepbetjjrkobm@sirius.home.kraxel.org>
References: <CAPDU3-+Q+7zC8e9pmXuaMqmefP_9jrg4kEFMH_=gQZLGskHkjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPDU3-+Q+7zC8e9pmXuaMqmefP_9jrg4kEFMH_=gQZLGskHkjA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 07 Dec 2020 10:25:46 -0000

On Sun, Dec 06, 2020 at 01:16:30PM -0500, Darrell Walisser wrote:
> Sends mouse buttons 4 and 5, aka "SIDE" and "EXTRA" to the guest
> 
> Signed-off-by: Darrell Walisser <darrell.walisser@gmail.com>
> ---
>  ui/sdl2.c | 2 ++
>  1 file changed, 2 insertions(+)

> +        [INPUT_BUTTON_SIDE]       = SDL_BUTTON(SDL_BUTTON_X1),
> +        [INPUT_BUTTON_EXTRA]      = SDL_BUTTON(SDL_BUTTON_X2)

Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>


