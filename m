Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1liu4j-0007Bs-Nf
	for mharc-qemu-trivial@gnu.org; Tue, 18 May 2021 03:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1liu4e-0007BU-Sl
 for qemu-trivial@nongnu.org; Tue, 18 May 2021 03:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1liu4Z-0006sg-E0
 for qemu-trivial@nongnu.org; Tue, 18 May 2021 03:23:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621322601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZrOVK7W11LS1brAT+Ae3P8xkUfUc+ru/O3rnNycrfU=;
 b=B0tzXtgKd4GCKvr2ze6PQq6QErM50BVKgjG9o5Tycz1n4E/RTcQUYXcAZ7ThuOxAxR9816
 7+9vZUpEbu0xg2YL230Q5kw2hBVDH6FbFJWA1tImEDHPcGWL2qu5xS+qv+J7hQGO/koG7A
 AP768ZmgZ85wX4woxSjiVgOShNRPNRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-9yz_DkCENCOMsuQ0IcQtmg-1; Tue, 18 May 2021 03:23:17 -0400
X-MC-Unique: 9yz_DkCENCOMsuQ0IcQtmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89A6A107ACC7;
 Tue, 18 May 2021 07:23:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C5E0505AB;
 Tue, 18 May 2021 07:23:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ABB35113861E; Tue, 18 May 2021 09:23:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dmitry Voronetskiy <davoronetskiy@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  Dmitry Voronetskiy
 <vda1999@yandex.ru>
Subject: Re: [PATCH] Signed-off-by: Dmitry Voronetskiy <vda1999@yandex.ru>
References: <20210517084055.24792-1-davoronetskiy@gmail.com>
Date: Tue, 18 May 2021 09:23:14 +0200
In-Reply-To: <20210517084055.24792-1-davoronetskiy@gmail.com> (Dmitry
 Voronetskiy's message of "Mon, 17 May 2021 11:40:55 +0300")
Message-ID: <877djwtsil.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 18 May 2021 07:23:29 -0000

Dmitry Voronetskiy <davoronetskiy@gmail.com> writes:

> From: Dmitry Voronetskiy <vda1999@yandex.ru>
>
> the value passed to strerror should be positive

Your commit message is out of order :)

With that fixed:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

How did you track these down?


