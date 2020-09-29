Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNAXC-0006or-Oz
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2020 03:58:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNAXA-0006lH-VH
 for qemu-trivial@nongnu.org; Tue, 29 Sep 2020 03:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kNAX1-0006yu-Hq
 for qemu-trivial@nongnu.org; Tue, 29 Sep 2020 03:58:44 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601366310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XGX51FhzlIjBbFwFd9c49yTkQcvN1XAuBQ4U/e9L9uM=;
 b=LZFu1R3+q6sMdeHU8MEwc8dS3s+NVHoi9u0kvIgZGdMqZf/tCFh0r1MjzfnGOy3jtPMkzL
 DnVLYs8PGtFfqKcI9Zvs2CjjtTCEY6GcvLmeRHuqyX5LhqdBy8odjuoA/8zIHhvYUea9f7
 C2mOYXbRYUIfpuxvpeiqTJQAaxify9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-GL2WojBpPdGf8IbgFVdUmw-1; Tue, 29 Sep 2020 03:58:27 -0400
X-MC-Unique: GL2WojBpPdGf8IbgFVdUmw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24EF0640B9;
 Tue, 29 Sep 2020 07:58:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-101.ams2.redhat.com
 [10.36.112.101])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8FEF5C1D0;
 Tue, 29 Sep 2020 07:58:25 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 72C59113864A; Tue, 29 Sep 2020 09:58:24 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-trivial@nongnu.org
Subject: [PATCH 0/2] Update leftover comments that mention Texinfo
Date: Tue, 29 Sep 2020 09:58:22 +0200
Message-Id: <20200929075824.1517969-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/29 02:22:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 29 Sep 2020 07:58:49 -0000

Markus Armbruster (2):
  qemu-img-cmds.hx: Update comment that mentions Texinfo
  target/i386/cpu: Update comment that mentions Texinfo

 target/i386/cpu.c | 3 ++-
 qemu-img-cmds.hx  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.26.2


