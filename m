Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lD1tx-0007aM-J5
	for mharc-qemu-trivial@gnu.org; Fri, 19 Feb 2021 04:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD1tv-0007ZG-Fx
 for qemu-trivial@nongnu.org; Fri, 19 Feb 2021 04:16:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48499)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lD1tr-0003UC-1T
 for qemu-trivial@nongnu.org; Fri, 19 Feb 2021 04:16:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613726193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=buyzDmOSNA6CHfnj87ke8+wv/8v3McBlVPpTCTY5otc=;
 b=RcEohCSDIO+9WtymbToCTky14WD1fXP294+anhPZ1nBLm6ARcGmTVXawXwm31UFr2uUZHK
 lVQvYjGqYLwlOsnM7C90dDh1ASDAyGO6Y0zGQh5wf3CH38koohDAmuS1T8hs0pNQcZBlzs
 sIE/gYqAm15iSmB/Ur/u+BlEmEcMvzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-9DSK-zAVM_-RuJf10AhX0w-1; Fri, 19 Feb 2021 04:16:32 -0500
X-MC-Unique: 9DSK-zAVM_-RuJf10AhX0w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2301780197B;
 Fri, 19 Feb 2021 09:16:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 54F45171FE;
 Fri, 19 Feb 2021 09:16:22 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 089F2113860F; Fri, 19 Feb 2021 10:16:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 kraxel@redhat.com
Subject: Re: [PATCH 0/2] g_return_if_fail(), g_return_val_if_fail() misuse
References: <20210126124240.2081959-1-armbru@redhat.com>
Date: Fri, 19 Feb 2021 10:16:21 +0100
In-Reply-To: <20210126124240.2081959-1-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 26 Jan 2021 13:42:38 +0100")
Message-ID: <87zh00o1sq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 19 Feb 2021 09:16:40 -0000

I think this could go via qemu-trivial.

Markus Armbruster <armbru@redhat.com> writes:

> Markus Armbruster (2):
>   backends/dbus-vmstate: Fix short read error handling
>   vhost_user_gpu: Drop dead check for g_malloc() failure
>
>  backends/dbus-vmstate.c     | 5 ++++-
>  hw/display/vhost-user-gpu.c | 1 -
>  2 files changed, 4 insertions(+), 2 deletions(-)


