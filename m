Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qogcX-0000il-Gm
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2023 04:55:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qogcT-0000iI-R4
 for qemu-trivial@nongnu.org; Fri, 06 Oct 2023 04:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1qogcS-0006Ae-DU
 for qemu-trivial@nongnu.org; Fri, 06 Oct 2023 04:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696582535;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EOvMqYbICyvz30S6H5KGlR4/71Gm0fZFULiLCmI6qY8=;
 b=UNKSpOJJYs94aHQdzaPl5XWgwZ8QZNzUuL8kaIRGaNYBQpWK+j/3SG1gsR7QFnsHGRQ5P0
 JMqkTCFRzlYk7rUbzDneFnJZNsi10gbCanKCDRffyIji/QL5WRZh56Jh7SsthLnZShPSCq
 oPX9uT8psZtEZMVpA/h6NB49hDMzf3k=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-bbq4nHEMOTK2_nZ3fvGbDw-1; Fri, 06 Oct 2023 04:55:30 -0400
X-MC-Unique: bbq4nHEMOTK2_nZ3fvGbDw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B50793C13513;
 Fri,  6 Oct 2023 08:55:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 032FD2027046;
 Fri,  6 Oct 2023 08:55:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id EA75E21E6904; Fri,  6 Oct 2023 10:55:27 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Thomas Huth <thuth@redhat.com>,  qemu-devel@nongnu.org,  "Michael S.
 Tsirkin" <mst@redhat.com>,  qemu-trivial@nongnu.org
Subject: Re: [PATCH] hw/virtio/vhost: Silence compiler warnings in vhost
 code when using -Wshadow
References: <20231004114809.105672-1-thuth@redhat.com>
 <18f1faab-71f4-4dbd-a319-fcd65721f58b@tls.msk.ru>
Date: Fri, 06 Oct 2023 10:55:27 +0200
In-Reply-To: <18f1faab-71f4-4dbd-a319-fcd65721f58b@tls.msk.ru> (Michael
 Tokarev's message of "Fri, 6 Oct 2023 09:26:50 +0300")
Message-ID: <87h6n4p1ts.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2023 08:55:39 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

> Applied to my trivial-patches tree, thanks!
>
> Marcus, you picked up previous patches of this theme, --
> you can continue this tradition if you like :)

I intend to post a pull request for the -Wshadow patches that have
R-bys.  I'm also tracking the unreviewed ones, and hope they get
reviewed.


