Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNzmr-0007UX-4R
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 10:42:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNzmo-0007PX-Ro
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 10:42:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNzmi-0002Ek-5t
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 10:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601563334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=yfzTgNqzLiEFc/cAfA6GXjB7CpjC/0vuJpK739XCM10=;
 b=ieo3OqZk1B7w7aFXsJXoR8ORa1PYmzJjy3ZPhneBIC0uF9BvjNznqnjpMBMSlnMzieC1uH
 ujBg87yBra/Mmi7OBavPCTZHgz52LrB2oaUe0GprJx2YQflifgW1Qi03YlmGIZNTlf+l/T
 sWY1yUh+fWyvjSs2sBMBeOpEJMAMf5E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-GMBhaNuqNfe-I7KJYCCyLQ-1; Thu, 01 Oct 2020 10:41:55 -0400
X-MC-Unique: GMBhaNuqNfe-I7KJYCCyLQ-1
Received: by mail-wr1-f70.google.com with SMTP id d13so2120612wrr.23
 for <qemu-trivial@nongnu.org>; Thu, 01 Oct 2020 07:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yfzTgNqzLiEFc/cAfA6GXjB7CpjC/0vuJpK739XCM10=;
 b=j45A1z2JAg1C5p+OM4G9FD7/AoXTCWftqm+1cN4s5B/V3FUC9c2B9h9k+/evNQBK3V
 TWSaKFMZZBWMVj4+O5mes5YqdXjH0HwTD0eK64FDIe0MpNSv8aBs5SuecgNv+hyzZR0I
 i09LaG/p2uzhKptd1PqSuMH3HvUcM6QdEeyjA087X8nrZsVZCiJiGUeNW5kkgwgyWHTB
 biCEo0G5PRcohq7MUijz3uZwgZR2j3Wg/IMTA+a5BzQnAQQTQBBMjp66+4e87RQx8qc1
 ePfr3aA9os1o0sjftE/M+2i+1QxQeo+krgYwIiw6EpTbuXoIOFjgf00/ILMTgorQTagU
 1Vdw==
X-Gm-Message-State: AOAM530n3dEB42a4FFUFF3zBPlzo0iDD6KpFwkP+P7Q+j4LWD7+65N1K
 cscipcc5OvG1+nC7GlaiC8tY7LFQ26TkerdhrRfb0Ieapo+UppdxhqgUFBqB8ds9VwOMtvCuhdJ
 ENbdA4iv2xpDV0ZzPuA==
X-Received: by 2002:a1c:2d86:: with SMTP id t128mr322801wmt.189.1601563314637; 
 Thu, 01 Oct 2020 07:41:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9Fst8GzqzZPtYuakCBP5ul3y1+Tttaamjbc94WW3TTCB8qz1Hkrgi1sExgxlr11WfUGF0kA==
X-Received: by 2002:a1c:2d86:: with SMTP id t128mr322772wmt.189.1601563314421; 
 Thu, 01 Oct 2020 07:41:54 -0700 (PDT)
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id a15sm10185389wrn.3.2020.10.01.07.41.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 07:41:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <rth@twiddle.net>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 0/3] target/i386: Restrict 'feature-words' property to x86
 machines
Date: Thu,  1 Oct 2020 16:41:49 +0200
Message-Id: <20201001144152.1555659-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 02:15:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Thu, 01 Oct 2020 14:42:23 -0000

This series restrict the 'feature-words' property to the x86
architecture (other archs don't have it), and to system-mode
(user-mode doesn't use it).

Extracted from "user-mode: Prune build dependencies (part 3)" v3:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg746423.html

Philippe Mathieu-Daudé (3):
  target/i386/cpu: Trivial code movement
  target/i386/cpu: Restrict some of feature-words uses to system-mode
  target/i386: Restrict X86CPUFeatureWord to X86 targets

 qapi/machine-target.json | 45 ++++++++++++++++++++++++++++++++++++++++
 qapi/machine.json        | 42 -------------------------------------
 target/i386/cpu.c        | 31 ++++++++++++++++-----------
 3 files changed, 64 insertions(+), 54 deletions(-)

-- 
2.26.2


