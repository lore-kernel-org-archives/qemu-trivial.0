Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liwof-0003dt-Od
	for mharc-qemu-trivial@gnu.org; Tue, 18 May 2021 06:19:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liwoc-0003Zd-OD
 for qemu-trivial@nongnu.org; Tue, 18 May 2021 06:19:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1liwoa-0004xZ-Ik
 for qemu-trivial@nongnu.org; Tue, 18 May 2021 06:19:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621333144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQIQRZp84IINtVtIIj2CwxESswI4vlUr/Sh6a+qKSRg=;
 b=L5XxFPcpGCpqnki51Vn9y10/xxKm3Hk0P8EBzDAfDXi9M1XE0JSZxRVNPfGn5J42muDeC7
 8yZzX/NQpugLkivVemJzC/s2TPvqlkjfktLyDMG6fst3nuKqksNcTbDNyXXqeU7KTxjngA
 JPZXWAFY5qgKcdvPOxUmgWF/jPpktEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-FDnK348dOn-4pDyncJha8A-1; Tue, 18 May 2021 06:19:02 -0400
X-MC-Unique: FDnK348dOn-4pDyncJha8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 711291020C41;
 Tue, 18 May 2021 10:19:01 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-0.ams2.redhat.com
 [10.36.114.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DDB910016F2;
 Tue, 18 May 2021 10:19:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 91566180079B; Tue, 18 May 2021 12:18:59 +0200 (CEST)
Date: Tue, 18 May 2021 12:18:59 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Katsuhiro Ueno <uenobk@gmail.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/input/hid: Add support for keys of jp106 keyboard.
Message-ID: <20210518101859.zj4vxqletnzjn4mt@sirius.home.kraxel.org>
References: <CA+pCdY3iG+pKKQqEVknnWF-W0wK36S4U1jxPvxmGAPp6FFvz1Q@mail.gmail.com>
 <CANrJRq+XjSjRqweBqDak8V9vi7cyNPiv8-g-irHbr6VAzo0a9w@mail.gmail.com>
 <0532d1d6-1ddb-2c9c-6d16-dae5dacc86d1@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <0532d1d6-1ddb-2c9c-6d16-dae5dacc86d1@vivier.eu>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 18 May 2021 10:19:07 -0000

On Thu, May 13, 2021 at 09:53:34AM +0200, Laurent Vivier wrote:
> Le 13/05/2021 à 08:11, Katsuhiro Ueno a écrit :
> > Ping.
> 
> cc Gerd

Added to usb queue.

thanks,
  Gerd


