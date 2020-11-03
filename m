Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZuSK-0002Gw-Ey
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 06:26:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuSI-0002F3-QA
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kZuSG-0006Z9-GN
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 06:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604402783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ms9/MqSjQ1PZDOJSmQXaPdJqLuT/XwivS769IUm5axs=;
 b=iNp/+rX6MqaQkvb08OBHlZJJq7TEAM/eIRLCyRQjzTt3B9BmbiXvenrzZZ3fJud3xPB8IR
 zX1wYNxxFrVjvpfcIBcaqUbPLA8V7rmeNDONtmzsCqt5Vs0UOhajeDz28Wg+NKh2d9cKzq
 KPWudYUnlwNyuPzR6gkudrYFF2/Gl4Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-lKXUON1yMPyaFx4qw56v5w-1; Tue, 03 Nov 2020 06:26:22 -0500
X-MC-Unique: lKXUON1yMPyaFx4qw56v5w-1
Received: by mail-wr1-f71.google.com with SMTP id u1so5458286wri.6
 for <qemu-trivial@nongnu.org>; Tue, 03 Nov 2020 03:26:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ms9/MqSjQ1PZDOJSmQXaPdJqLuT/XwivS769IUm5axs=;
 b=sVIdq6P8suazugWn759EEzVzHInmwRq7ywHLoQLsWyBf+Oc9w//FYM9qMwSl5DrNib
 gaIXJY1bIz0AMVfaSHNESstI42MwZxz/l/BUzqBRhkY0wLJk2J0qlPd+NStL9RLMDXQT
 gYHK1zO3QmACTLh5iQ45h+LWk62DpSQ5idkAGuQ2KCN1Af3AJSU18zHU0/85q+Vu5WeV
 ieDg7ldanTTQiqth2XQhS/M0DTQffZXB+NKJb1N/yIQ9pF+4foziDcdXDxZML9/AspMs
 0ecKQ85eJptaXeKBJAk3J82dO5RT4ME0/M713SKi/VIyf0YkWD4B7R2RxwJ8MB1sh0oj
 ULow==
X-Gm-Message-State: AOAM532G7vJwT0I8wZv3KrCa9kKmiipBj4wfOiQW8bMdlZa2Z29xx4VM
 Y84XBBZcFmBCCyqajLfKFClhA47OsAr8U17znVwc0ArAopmBEp7NBhOfW9e4+U98Ok3qmhHNwsF
 g374vV+JRET0Q8r4IRA==
X-Received: by 2002:adf:e807:: with SMTP id o7mr14149494wrm.303.1604402781199; 
 Tue, 03 Nov 2020 03:26:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwlWuAW9vhsOwtH2y6J/QpafR8zIjFMv/LxT9xs1kOwxJmpSiiXn3skvqGO5xgOSpeA0rt8mQ==
X-Received: by 2002:adf:e807:: with SMTP id o7mr14149483wrm.303.1604402781080; 
 Tue, 03 Nov 2020 03:26:21 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id y187sm2554418wmg.33.2020.11.03.03.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 03:26:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 4/4] migration/ram: Fix hexadecimal format string
 specifier
Date: Tue,  3 Nov 2020 12:25:58 +0100
Message-Id: <20201103112558.2554390-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103112558.2554390-1-philmd@redhat.com>
References: <20201103112558.2554390-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 11:26:27 -0000

The '%u' conversion specifier is for decimal notation.
When prefixing a format with '0x', we want the hexadecimal
specifier ('%x').

Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 migration/ram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/ram.c b/migration/ram.c
index 2da2b622ab2..23dcfb3ac38 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3729,7 +3729,7 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
     }
 
     if (end_mark != RAMBLOCK_RECV_BITMAP_ENDING) {
-        error_report("%s: ramblock '%s' end mark incorrect: 0x%"PRIu64,
+        error_report("%s: ramblock '%s' end mark incorrect: 0x%"PRIx64,
                      __func__, block->idstr, end_mark);
         ret = -EINVAL;
         goto out;
-- 
2.26.2


