Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juuyH-0002bD-OS
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2020 05:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1juuyF-0002YF-Dw
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:41:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30035
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1juuyE-0008Lp-0b
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:41:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594633317;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qIZyrGdpKSrSVwqKwr6Yh9Wr9fG6Zi1hDm7axQUgCTE=;
 b=eGvN342RXNDU/qJJlX8z/SL6firNloRE2veLKSybzVQ7PayIxGKMsWNsnCVuUHgDLohtMF
 IRwjjN4IkpCJqxnETYWKnijFfMPTYBSZHMwvHpKHejDW+QLLTlNbe9+6Jy/TkJH+mPDbQ1
 vapCgG8LbgZr4W1eVN3M5GEdnhrLhnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-03Je2GZQNuqJkK_OXBJuIw-1; Mon, 13 Jul 2020 05:41:55 -0400
X-MC-Unique: 03Je2GZQNuqJkK_OXBJuIw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC939107ACCA;
 Mon, 13 Jul 2020 09:41:54 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-115-89.ams2.redhat.com
 [10.36.115.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B539260C84;
 Mon, 13 Jul 2020 09:41:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id DB5713EBB1; Mon, 13 Jul 2020 11:41:53 +0200 (CEST)
Date: Mon, 13 Jul 2020 11:41:53 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] docs/qdev-device-use: Clean up the sentences related to
 -usbdevice
Message-ID: <20200713094153.b225xsjdwkxxvm3o@sirius.home.kraxel.org>
References: <20200710065520.24784-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200710065520.24784-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 03:20:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 13 Jul 2020 09:41:59 -0000

On Fri, Jul 10, 2020 at 08:55:20AM +0200, Thomas Huth wrote:
> Most of the -usbdevice paramaters have been removed already. Update
> the doc accordingly.

Queued up for 5.1

thanks,
  Gerd


