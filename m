Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb5AB-0003EM-Al
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 12:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb5A4-0003CS-Rv
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 12:04:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb5A2-00020K-HH
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 12:04:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604682265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Y8CFV0FsZyXFJC+vbP/pWrux/jc89V1kGuvlpHPTJ4=;
 b=dfP691SrVrs4q4MwE9TSt6tFgCGhEsUb+b8WO7yGxUy3WaQFHYXTleiXY3PyyytIeYK1yV
 GX/0gjZqiT8B1tO54m/aoLLA0enN32NU1lP3B1IOOPsQN2OIpIp2aHAt6J2Z1iUpx+Sj2b
 Kxs6FnqFs6PZpm5DaSJI9FUwTidlveI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507-ynjjv6M1MXSEfwQQYOhyXA-1; Fri, 06 Nov 2020 12:04:24 -0500
X-MC-Unique: ynjjv6M1MXSEfwQQYOhyXA-1
Received: by mail-wr1-f70.google.com with SMTP id q1so699430wrn.5
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 09:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Y8CFV0FsZyXFJC+vbP/pWrux/jc89V1kGuvlpHPTJ4=;
 b=lQ0mGSxI5stbPlIjG2RK9+HraytTbvx008bPCxELywFwLCaqDq1BNLGLN/tHYS8/Bp
 r2a/qgjFIc33OvTF9hesOXgW8nAhbmL5mdCrJEum8VmL/HBmXwuYed/uT0zi67Kl/Uqq
 9w+heQDoWE7uzCOEi0Oa4TXk0vp2UIRUDTQJH/sHEcF3/0ADgzcIym6sgg2PiPzIv8Z9
 4837qECUJ9aYyc+CkthkEkt90YC6ATOuBPgiIQwOGJP4x679h7MhtSQAugBzAAn/aJJz
 r76xJbICJkuSQwTZyMCSKaclftxBXQA9nS5P/8EVJs3bKraeN6gqfqbenGOzoNuZK6nJ
 B2vw==
X-Gm-Message-State: AOAM531bfTko4J56/UjrRE1VzWvx/jgfwwht8XMcr1tsCUlwNWY1zGc/
 epMrECfL5atBL1ERfa5RiZOt+F6FLUKzZ8EmERA2yeXGbV7VcKas2ao+1spQLoZLm+xY2FJZhkL
 rKBuya4UqvRDwANY6bQ==
X-Received: by 2002:adf:dd90:: with SMTP id x16mr3527723wrl.47.1604682263036; 
 Fri, 06 Nov 2020 09:04:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyF9dkEmtisMjBG+P10QOqCmJW3OqZAN0NEceG7yctwzhsZWO+NA8vN+kKrXVzUb4fyVfhVRg==
X-Received: by 2002:adf:dd90:: with SMTP id x16mr3527706wrl.47.1604682262895; 
 Fri, 06 Nov 2020 09:04:22 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id w11sm3254763wmg.36.2020.11.06.09.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 09:04:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-6.0 2/2] hw/scsi/scsi-disk: Use SCSI_DISK_GET_CLASS() macro
Date: Fri,  6 Nov 2020 18:04:04 +0100
Message-Id: <20201106170404.4130486-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201106170404.4130486-1-philmd@redhat.com>
References: <20201106170404.4130486-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 07:11:31
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
X-List-Received-Date: Fri, 06 Nov 2020 17:04:30 -0000

Use the SCSI_DISK_GET_CLASS() macro to match the rest of
the codebase.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/scsi-disk.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index d2b9cb28da1..deb51ec8e7d 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -338,7 +338,7 @@ static void scsi_read_complete(void *opaque, int ret)
 static void scsi_do_read(SCSIDiskReq *r, int ret)
 {
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
-    SCSIDiskClass *sdc = (SCSIDiskClass *) object_get_class(OBJECT(s));
+    SCSIDiskClass *sdc = SCSI_DISK_GET_CLASS(s);
 
     assert (r->req.aiocb == NULL);
     if (scsi_disk_req_check_error(r, ret, false)) {
@@ -438,7 +438,7 @@ static bool scsi_handle_rw_error(SCSIDiskReq *r, int error, bool acct_failed)
 {
     bool is_read = (r->req.cmd.mode == SCSI_XFER_FROM_DEV);
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
-    SCSIDiskClass *sdc = (SCSIDiskClass *) object_get_class(OBJECT(s));
+    SCSIDiskClass *sdc = SCSI_DISK_GET_CLASS(s);
     BlockErrorAction action = blk_get_error_action(s->qdev.conf.blk,
                                                    is_read, error);
 
@@ -538,7 +538,7 @@ static void scsi_write_data(SCSIRequest *req)
 {
     SCSIDiskReq *r = DO_UPCAST(SCSIDiskReq, req, req);
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, r->req.dev);
-    SCSIDiskClass *sdc = (SCSIDiskClass *) object_get_class(OBJECT(s));
+    SCSIDiskClass *sdc = SCSI_DISK_GET_CLASS(s);
 
     /* No data transfer may already be in progress */
     assert(r->req.aiocb == NULL);
@@ -2149,7 +2149,7 @@ static int32_t scsi_disk_dma_command(SCSIRequest *req, uint8_t *buf)
 {
     SCSIDiskReq *r = DO_UPCAST(SCSIDiskReq, req, req);
     SCSIDiskState *s = DO_UPCAST(SCSIDiskState, qdev, req->dev);
-    SCSIDiskClass *sdc = (SCSIDiskClass *) object_get_class(OBJECT(s));
+    SCSIDiskClass *sdc = SCSI_DISK_GET_CLASS(s);
     uint32_t len;
     uint8_t command;
 
-- 
2.26.2


