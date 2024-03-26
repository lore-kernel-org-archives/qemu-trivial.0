Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rp5eU-0003I3-VR
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2024 08:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1rp5eL-0003H6-Pn
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 08:11:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1rp5eJ-0003Ej-TE
 for qemu-trivial@nongnu.org; Tue, 26 Mar 2024 08:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711455086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ukAcib95DKwJleYYNFW0g/eUYKFbc9tvGzHisW50wDM=;
 b=dEcN5g1j+N6KHBUBW5yZImpLWIUOCqTqYQoxhpMUPyrkFZUCSOTKU3+ivOTePiHguacMI5
 p4uTIrck0jezHee/BVfsKkRk0D25zMRxQCEnWbIYbGWSpdO6+MhOrQ8UB9VPRvL2n6VmeT
 XIooBxfnJ5SdpaitnmwPILdgoSg/2Bs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-390-tNEWK7A1OqilPoPpu7nKTQ-1; Tue, 26 Mar 2024 08:11:21 -0400
X-MC-Unique: tNEWK7A1OqilPoPpu7nKTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82D01185A786;
 Tue, 26 Mar 2024 12:11:20 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7303D2166B32;
 Tue, 26 Mar 2024 12:11:19 +0000 (UTC)
Date: Tue, 26 Mar 2024 13:11:14 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Subject: Re: [PATCH] tests/qemu-iotests: Test 157 and 227 require virtio-blk
Message-ID: <ZgK7YnAlMD6XU-7U@redhat.com>
References: <20240325154737.1305063-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325154737.1305063-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 26 Mar 2024 12:11:37 -0000

Am 25.03.2024 um 16:47 hat Thomas Huth geschrieben:
> Tests 157 and 227 use the virtio-blk device, so we have to mark these
> tests accordingly to be skipped if this devices is not available (e.g.
> when running the tests with qemu-system-avr only).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Thanks, applied to the block branch.

Kevin


