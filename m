Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhqiu-0003pQ-Lw
	for mharc-qemu-trivial@gnu.org; Fri, 22 Apr 2022 06:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nhqid-0003jU-5B
 for qemu-trivial@nongnu.org; Fri, 22 Apr 2022 06:40:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1nhqiZ-0008Us-H8
 for qemu-trivial@nongnu.org; Fri, 22 Apr 2022 06:40:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650624048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PAuucCbo3qLFpvPSw8VpRrHOmmStcCZLD50v3awWHDw=;
 b=H6uYK6Rd7X+36q2VRM+dbxsXflqbMH5PjEFpO/y1oYXgnjwAxfLFcmKQu889flEkDj9g9O
 LpA5zK51OiP2QResi8XlPQPwKV73jOrWncqy69On6+ac/k5KEtwD8QVbMBWtjjnXDfbvmX
 a4k0xWCCC0u5XFiqSV1L4d67pP7COO4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-KPJrm1qFPcS__zDk7x2pdA-1; Fri, 22 Apr 2022 06:40:45 -0400
X-MC-Unique: KPJrm1qFPcS__zDk7x2pdA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A74C1014A60;
 Fri, 22 Apr 2022 10:40:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2376F40D0174;
 Fri, 22 Apr 2022 10:40:44 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1FE37180098B; Fri, 22 Apr 2022 12:40:30 +0200 (CEST)
Date: Fri, 22 Apr 2022 12:40:30 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Carwyn Ellis <carwynellis@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH v3 2/2] hw/display/vmware_vga: do not discard screen
 updates
Message-ID: <20220422104030.kte6wcu3zc4oywey@sirius.home.kraxel.org>
References: <20220206183956.10694-1-carwynellis@gmail.com>
 <20220206183956.10694-3-carwynellis@gmail.com>
 <2CBB155B-88D6-42EC-9EA0-88968C3FD3B7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2CBB155B-88D6-42EC-9EA0-88968C3FD3B7@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 22 Apr 2022 10:40:57 -0000

On Sun, Apr 10, 2022 at 05:49:30PM +0100, Carwyn Ellis wrote:
> ping
> 
> https://patchew.org/QEMU/20220206183956.10694-1-carwynellis@gmail.com/20220206183956.10694-3-carwynellis@gmail.com/
> 
> Originally submitted as one of two patches, the first patch to use trace events has been merged, however the patch that fixes garbled output hasn’t been reviewed yet.

Hmm, slipped through for some reason, IIRC I cherry-picked the trace
events patch from v2 series and probably simply missed v3.  Queued now.

thanks,
  Gerd


