Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ry3YL-00031v-Nr
	for mharc-qemu-trivial@gnu.org; Sat, 20 Apr 2024 01:46:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ry3YJ-000311-6w
 for qemu-trivial@nongnu.org; Sat, 20 Apr 2024 01:46:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ry3YH-0007Gv-QX
 for qemu-trivial@nongnu.org; Sat, 20 Apr 2024 01:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713591977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=FyGRDQwn8/dR/gZHL4hfrkpySTN3DDnWK27uGreCaK4=;
 b=Ek9alFFZn7h947Btex1hrdO/6Jnad1LsQHvy20KIVFE5iYtYQDlkW1SobdAaG4yhO1hEan
 xUCHtzcb7cz2mzgRSq9LtGlVZjvFBJ02jNWQo4wvu3pSbTsaD37RtO8Sgh1CnlaSo8nEa9
 lSCVRFiWJRXcGh7E4piC6/COstUYR24=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-333-zU9M_JjYMgivW5p1Wb3cNA-1; Sat,
 20 Apr 2024 01:46:09 -0400
X-MC-Unique: zU9M_JjYMgivW5p1Wb3cNA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CE5B1C04B59;
 Sat, 20 Apr 2024 05:46:09 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.39.192.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88538492BC7;
 Sat, 20 Apr 2024 05:46:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
Subject: [PATCH 0/3] Remove useless architecture prefix from the CPU list
Date: Sat, 20 Apr 2024 07:46:03 +0200
Message-ID: <20240420054606.13353-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.313,
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
X-List-Received-Date: Sat, 20 Apr 2024 05:46:20 -0000

Printing an architecture prefix in front of each CPU name is not helpful
at all: It is confusing for the users since they don't know whether they
have to specify these letters for the "-cpu" parameter, too, and it also
takes some precious space in the dense output of the CPU entries. Let's
simply remove those now.

Thomas Huth (3):
  target/i386/cpu: Remove "x86" prefix from the CPU list
  target/s390x/cpu_models: Rework the output of "-cpu help"
  target/ppc/cpu_init: Remove "PowerPC" prefix from the CPU list

 target/i386/cpu.c         | 2 +-
 target/ppc/cpu_init.c     | 9 +++++----
 target/s390x/cpu_models.c | 9 +++++----
 3 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.44.0


