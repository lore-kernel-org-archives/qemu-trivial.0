Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lJxhB-0003nr-RM
	for mharc-qemu-trivial@gnu.org; Wed, 10 Mar 2021 07:12:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJxhA-0003nQ-5B
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 07:12:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lJxh8-0003oD-43
 for qemu-trivial@nongnu.org; Wed, 10 Mar 2021 07:12:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615378325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wjcPNmotweXLER6t9MD1Z7Qz/m4Yy/hTYBZysgY4sX4=;
 b=C+FnIoJysyppwBIPm+A/KCzvQjOVtbq3Ik29PE7iOyfVI0Bzgxdz8Qex2NcdPFiS1jWhXf
 RBTTlGdKy2iKwf61tF7nXJ5CjoPhje5m9MgEtgJBwlb5NvuwNq2qa9A7T8Q7BfajJ8sVcO
 fE4RYL56jOqU9g5w3q9O/CAMY836LmQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-sxi19QDqOrSut_KqRUZt-A-1; Wed, 10 Mar 2021 07:12:01 -0500
X-MC-Unique: sxi19QDqOrSut_KqRUZt-A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B03F983DD24;
 Wed, 10 Mar 2021 12:12:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-141.ams2.redhat.com
 [10.36.112.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A38C5945D;
 Wed, 10 Mar 2021 12:12:00 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6DEBB18000AC; Wed, 10 Mar 2021 13:11:58 +0100 (CET)
Date: Wed, 10 Mar 2021 13:11:58 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] docs: Fix removal text of -show-cursor
Message-ID: <20210310121158.75wczgjguocqbrsh@sirius.home.kraxel.org>
References: <20210310045821.1004396-1-thuth@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210310045821.1004396-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
X-List-Received-Date: Wed, 10 Mar 2021 12:12:08 -0000

On Wed, Mar 10, 2021 at 05:58:21AM +0100, Thomas Huth wrote:
> We should say now when it was removed, not when it was deprecated.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Added to UI queue.

thanks,
  Gerd


