Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFCdl-0000np-LC
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2021 04:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFCdd-0000mT-EB
 for qemu-trivial@nongnu.org; Thu, 25 Feb 2021 04:08:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lFCdT-0002HL-D1
 for qemu-trivial@nongnu.org; Thu, 25 Feb 2021 04:08:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614244115;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rizPlqyQsfbUxS7LeN1iSz3JbJ3181xF5/Gab0E2ULM=;
 b=hvBh/NXwvS4T4GQWhbV3093rC5tZ8U9StrtNtbFD/UBvAoe0FCyuDq4K2M0cuN+huJsQNJ
 LNTYaQQ48JmFFRiMSn486/j27ogB4Yx7sz/i3McaAQwtZwkZuNhpYTGQaqiK6h4AGZFoYu
 hp/KG1x3FCiGqCvRCtfdw5ETS9RGklU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-Rq4u4ix3PDKK27GUhF6Plg-1; Thu, 25 Feb 2021 04:08:32 -0500
X-MC-Unique: Rq4u4ix3PDKK27GUhF6Plg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CC95AFA85;
 Thu, 25 Feb 2021 09:08:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-115-79.ams2.redhat.com
 [10.36.115.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B44062467;
 Thu, 25 Feb 2021 09:08:31 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0112E113860F; Thu, 25 Feb 2021 10:08:29 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Chen Qun <kuhn.chenqun@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <qemu-trivial@nongnu.org>,
 lvivier@redhat.com,  thuth@redhat.com,  zhang.zhanghailiang@huawei.com,
 ganqixin@huawei.com
Subject: Re: [PATCH] qtest: delete redundant qtest.h header files
References: <20210225055251.192104-1-kuhn.chenqun@huawei.com>
Date: Thu, 25 Feb 2021 10:08:29 +0100
In-Reply-To: <20210225055251.192104-1-kuhn.chenqun@huawei.com> (Chen Qun's
 message of "Thu, 25 Feb 2021 13:52:51 +0800")
Message-ID: <87h7m0v7jm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-List-Received-Date: Thu, 25 Feb 2021 09:08:49 -0000

Chen Qun <kuhn.chenqun@huawei.com> writes:

> There are 23 files that include the "sysemu/qtest.h",
> but they do not use any qtest functions.
>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

The subject sounds as if you were deleting file include/sysemu/qtest.h,
which would be wrong.  You're actually deleting inclusions.  Suggest to
say

    qtest: delete superfluous inclusions of qtest.h

or

    delete superfluous #include "sysemu/qtest.h"

Perhaps the maintainer merging your patch can do that for you.


