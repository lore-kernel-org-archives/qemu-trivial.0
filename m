Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ox6rR-0000sE-0O
	for mharc-qemu-trivial@gnu.org; Mon, 21 Nov 2022 08:29:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6qX-0000PX-Ka
 for qemu-trivial@nongnu.org; Mon, 21 Nov 2022 08:28:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox6q3-0004nS-VY
 for qemu-trivial@nongnu.org; Mon, 21 Nov 2022 08:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669037248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WsRuCY0N+Xj/tbhpPLoN51AYcDXWDqJFH41/ByuYthc=;
 b=i0ebHv1UD+tEG/Sb6q5adQRmKPmd0QZKbUZIncyJ9+rrj1YvkxEoPvJNa3FLUIEyCX30B7
 fJUvLij0AGx4Z+yTUFwXNXYqgFDuaCVxHfa/fEh3PHEwxo54/7yD92ZccJvpkDA6mNwL0p
 Tp7eukCwS19bfIXdI4r6qs8KrBJ+2j4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-x0iS-wBUPAq5MODTgYM7sQ-1; Mon, 21 Nov 2022 08:27:24 -0500
X-MC-Unique: x0iS-wBUPAq5MODTgYM7sQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 417751C0758F;
 Mon, 21 Nov 2022 13:27:24 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.227])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC7D24B3FCD;
 Mon, 21 Nov 2022 13:27:19 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 00/19] Migration patches for 8.8
Date: Mon, 21 Nov 2022 14:26:58 +0100
Message-Id: <20221121132717.63070-1-quintela@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 21 Nov 2022 13:28:41 -0000
X-List-Received-Date: Mon, 21 Nov 2022 13:28:41 -0000

Hi

Based-on:  <20221121125907.62469-1-quintela@redhat.com>

This are the patches that I had to drop form the last PULL request because they werent fixes:
- AVX2 is dropped, intel posted a fix, I have to redo it
- Fix for out of order channels is out
  Daniel nacked it and I need to redo it

Juan Quintela (4):
  multifd: Create page_size fields into both MultiFD{Recv,Send}Params
  multifd: Create page_count fields into both MultiFD{Recv,Send}Params
  migration: Export ram_transferred_ram()
  migration: Export ram_release_page()

Peter Xu (15):
  migration: Take bitmap mutex when completing ram migration
  migration: Add postcopy_preempt_active()
  migration: Cleanup xbzrle zero page cache update logic
  migration: Trivial cleanup save_page_header() on same block check
  migration: Remove RAMState.f references in compression code
  migration: Yield bitmap_mutex properly when sending/sleeping
  migration: Use atomic ops properly for page accountings
  migration: Teach PSS about host page
  migration: Introduce pss_channel
  migration: Add pss_init()
  migration: Make PageSearchStatus part of RAMState
  migration: Move last_sent_block into PageSearchStatus
  migration: Send requested page directly in rp-return thread
  migration: Remove old preempt code around state maintainance
  migration: Drop rs->f

 migration/migration.h    |   7 -
 migration/multifd.h      |   8 +
 migration/ram.h          |  23 ++
 migration/migration.c    |  47 +--
 migration/multifd-zlib.c |  14 +-
 migration/multifd-zstd.c |  12 +-
 migration/multifd.c      |  27 +-
 migration/ram.c          | 735 ++++++++++++++++++---------------------
 8 files changed, 422 insertions(+), 451 deletions(-)

-- 
2.38.1


