Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1knKxj-0004wM-GA
	for mharc-qemu-trivial@gnu.org; Thu, 10 Dec 2020 07:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKxh-0004sh-IG
 for qemu-trivial@nongnu.org; Thu, 10 Dec 2020 07:22:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1knKxg-0001Bj-55
 for qemu-trivial@nongnu.org; Thu, 10 Dec 2020 07:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607602939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GsOY6eSUE7iGc2P0sKlZpXntqXervSpp6Fu+LhG2ITA=;
 b=NGsQdwTH5gn04eiFrFJyFX05jybGH6IaRHDSf/j5R2N0vmtsAxUNW1nH2T7pyTSYcAIOzk
 usHX2ghD+KZMxiy6sNHF6LFHLCNq3TgvUslolOrfvIFhKBs2pyvwa0V+u47slh2WpvX5Fz
 9GRPoloG6eJNoEhz15R+R5zmY2B8xiE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-bgJ6nnWKMLKXr2vJiOSV7g-1; Thu, 10 Dec 2020 07:22:15 -0500
X-MC-Unique: bgJ6nnWKMLKXr2vJiOSV7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 80804BBEE0;
 Thu, 10 Dec 2020 12:22:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-94.ams2.redhat.com
 [10.36.112.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49E355275D;
 Thu, 10 Dec 2020 12:22:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8157E9D92; Thu, 10 Dec 2020 13:22:13 +0100 (CET)
Date: Thu, 10 Dec 2020 13:22:13 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Darrell Walisser <darrell.walisser@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] sdl2: Add extra mouse buttons
Message-ID: <20201210122213.astxip4mazb7qotj@sirius.home.kraxel.org>
References: <CAPDU3-+Q+7zC8e9pmXuaMqmefP_9jrg4kEFMH_=gQZLGskHkjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPDU3-+Q+7zC8e9pmXuaMqmefP_9jrg4kEFMH_=gQZLGskHkjA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 10 Dec 2020 12:22:21 -0000

  Hi,

> @@ -275,6 +275,8 @@ static void sdl_send_mouse_event(struct
> sdl2_console *scon, int dx, int dy,

Patch is corrupted (mailer wrapped the line).
Can you resend with git send-email?

thanks,
  Gerd


