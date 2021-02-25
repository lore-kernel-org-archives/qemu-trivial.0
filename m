Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lFL9G-00031b-Km
	for mharc-qemu-trivial@gnu.org; Thu, 25 Feb 2021 13:14:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFL9B-000305-H6
 for qemu-trivial@nongnu.org; Thu, 25 Feb 2021 13:13:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFL99-0005lW-0F
 for qemu-trivial@nongnu.org; Thu, 25 Feb 2021 13:13:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614276830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Kp6aFRE7bomZV9AWpo+SEg7jc3npeue+paEFG1rUjA=;
 b=gLWjVzn6d1By5J0Zc/6lZQGp5Yu7/tvaf4/HRwX6QgTWJf71GiZq6dfFGmdsOvrUzSZGWt
 v/UXZX59OIgajA956cDw+q8iE1+zq8QoWT2PNVCAY3byanO0QvKsF62nobYUjo2gRjwsCZ
 cDKA9WkH0S/J2c/AbgNLhQZa29E7KqU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-Tz7hupqrNiCgHaLk0DL6fg-1; Thu, 25 Feb 2021 13:13:48 -0500
X-MC-Unique: Tz7hupqrNiCgHaLk0DL6fg-1
Received: by mail-ed1-f72.google.com with SMTP id i4so3259055edt.11
 for <qemu-trivial@nongnu.org>; Thu, 25 Feb 2021 10:13:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Kp6aFRE7bomZV9AWpo+SEg7jc3npeue+paEFG1rUjA=;
 b=gkisA9mZsn6su+aao9Dfl+gKT3Q9KoVk3CkyKnFxAjg5S/WkpVAfu8gbSuAWhG/TOo
 BWNVTZW4W/ITrNI9U/V/apQOHePG4fqGgMs+VxkCdLYuvIhI2ZBkJZZ/Ix2CmFVTYXN2
 TZ6RLQhAJljDO9Q0SZ7OzkP9ShhIkTSXLfFYCOaQDYoYHWFWq1XNX3TB5GjrY6r/6QLX
 XST2JQT0g0xmslWuiC1jk3VIaguiwPR9MkyE8xZ9yCVBvmtR5LWSXAVIuibnIjaYprix
 JNtczDAfokXzA41Iep3qRJFozs4IFDR1Y/OX2fMfXoTcXrUCMwyuC4CIOEyPAJjiQM2p
 BnJw==
X-Gm-Message-State: AOAM532MT5G54jY/v3jhsbEmsBAlxjjEAf/vP99ZmsBJ6sKTj6taXQ+B
 2dEw1CmGEFTK6dzD4xo1JBNXAjuCf/nW8K0vWnpTNC4QIOtyjXSAF46yFDK9LQNUxflB/UIUxMZ
 lnuk0qLD208j0KXTPtA==
X-Received: by 2002:a17:906:af10:: with SMTP id
 lx16mr3973059ejb.192.1614276827187; 
 Thu, 25 Feb 2021 10:13:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcOWQvxatySPc7KyXOKhPAQLarSUMWB+2bc7xXp/LvrOeg2AQ18lnKdjb0vTsTPysMpbARUQ==
X-Received: by 2002:a17:906:af10:: with SMTP id
 lx16mr3973032ejb.192.1614276826877; 
 Thu, 25 Feb 2021 10:13:46 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id bo12sm3384102ejb.93.2021.02.25.10.13.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 10:13:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/elf_ops: Fix a typo
Date: Thu, 25 Feb 2021 19:13:44 +0100
Message-Id: <20210225181344.3623720-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 25 Feb 2021 18:13:59 -0000

g_mapped_file_new_from_fd()'s parameter is named 'writable'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/elf_ops.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 8e8436831d2..304f266bf3b 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -417,7 +417,7 @@ static int glue(load_elf, SZ)(const char *name, int fd,
 
     /*
      * Since we want to be able to modify the mapped buffer, we set the
-     * 'writeble' parameter to 'true'. Modifications to the buffer are not
+     * 'writable' parameter to 'true'. Modifications to the buffer are not
      * written back to the file.
      */
     mapped_file = g_mapped_file_new_from_fd(fd, true, NULL);
-- 
2.26.2


