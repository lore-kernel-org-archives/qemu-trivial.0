Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1o13yr-0004g5-OL
	for mharc-qemu-trivial@gnu.org; Tue, 14 Jun 2022 06:41:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o13yp-0004dX-Ds
 for qemu-trivial@nongnu.org; Tue, 14 Jun 2022 06:41:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o13yi-00036D-H1
 for qemu-trivial@nongnu.org; Tue, 14 Jun 2022 06:41:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655203254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dRPbVwIf4XnA0zbA8xjue/8uTf0N+sXNTJaH1FMa9rk=;
 b=RUS+AvAAZ+rUU7+PWyPZVy+31zElR6+XYOmmHwdMZnDGDF4zK9MgtBw6cmpvPro0ao9zmy
 H9q29VYqdbhWIHPluLMQMa+r4OarAjXIaq3YRdyw6MxUNL7TP21cB+GaZNk1SUxDV61mA/
 yOTZ2x3XF1JUIv6nHW1zq8eEFimxrfs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-2h4qX7f_MqqDfNmAXisSxQ-1; Tue, 14 Jun 2022 06:40:53 -0400
X-MC-Unique: 2h4qX7f_MqqDfNmAXisSxQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0DD3811E75;
 Tue, 14 Jun 2022 10:40:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.179])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04F9A492C3B;
 Tue, 14 Jun 2022 10:40:50 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu,
 mjt@tls.msk.ru
Cc: danielhb413@gmail.com, clg@kaod.org, mst@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, kbusch@kernel.org, its@irrelevant.dk
Subject: [PATCH 0/2] Two sets of trivials
Date: Tue, 14 Jun 2022 11:40:43 +0100
Message-Id: <20220614104045.85728-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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
X-List-Received-Date: Tue, 14 Jun 2022 10:41:04 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

I've sent the 3 char set last month, but have updated
it a little; I cleaned up a comment style that was already
broken so checkpatch is happy.

The 'namesapce' is a new patch; it's amazing how many places
make the same typo!

Dave

Dr. David Alan Gilbert (2):
  Trivial: 3 char repeat typos
  trivial typos: namesapce

 hw/9pfs/9p-xattr-user.c          | 8 ++++----
 hw/acpi/nvdimm.c                 | 2 +-
 hw/intc/openpic.c                | 2 +-
 hw/net/imx_fec.c                 | 2 +-
 hw/nvme/ctrl.c                   | 2 +-
 hw/pci/pcie_aer.c                | 2 +-
 hw/pci/shpc.c                    | 3 ++-
 hw/ppc/spapr_caps.c              | 2 +-
 hw/scsi/spapr_vscsi.c            | 2 +-
 qapi/net.json                    | 2 +-
 tools/virtiofsd/passthrough_ll.c | 2 +-
 ui/input.c                       | 2 +-
 12 files changed, 16 insertions(+), 15 deletions(-)

-- 
2.36.1


