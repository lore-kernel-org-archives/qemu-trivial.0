Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mV7KP-0003tT-OZ
	for mharc-qemu-trivial@gnu.org; Tue, 28 Sep 2021 03:15:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mV7KO-0003rf-0s
 for qemu-trivial@nongnu.org; Tue, 28 Sep 2021 03:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27320)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mV7KK-0006Jn-L5
 for qemu-trivial@nongnu.org; Tue, 28 Sep 2021 03:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632813294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fpqKx5dnVx70RA3IiIu3GNVJDj4MXWV4CdxmP8LpsgQ=;
 b=CDX15Ysqz/z4vDmR2IjWHx8GZ4ynyK/SNuyyFwPLqveJxeA8YqxfAs7mCSPaYVyZXHXNxW
 Xq0hIRz75hzLYteyAbPgNUkYzs94e0BnI1EcqJek7xgWTSw+2kjtlX/wweqqF1XhOepeZc
 JVYwC/+uQfbygJFmNZWJ81E9vYHQra0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-y_mks9tMMlS9f70f4x9Z_Q-1; Tue, 28 Sep 2021 03:14:52 -0400
X-MC-Unique: y_mks9tMMlS9f70f4x9Z_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 983E6100C661;
 Tue, 28 Sep 2021 07:14:51 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6D5A06B54D;
 Tue, 28 Sep 2021 07:14:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BF3C9113865F; Tue, 28 Sep 2021 09:14:49 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] qemu-options: -chardev reconnect=seconds duplicated in help,
 tidy up
Date: Tue, 28 Sep 2021 09:14:49 +0200
Message-Id: <20210928071449.1416022-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
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
X-List-Received-Date: Tue, 28 Sep 2021 07:15:00 -0000

Fixes: 5dd1f02b4bc2f2c2ef3a2adfd8a412c8c8769085
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 8f603cc7e6..27e7b9a77c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -3188,7 +3188,7 @@ DEFHEADING(Character device options:)
 DEF("chardev", HAS_ARG, QEMU_OPTION_chardev,
     "-chardev help\n"
     "-chardev null,id=id[,mux=on|off][,logfile=PATH][,logappend=on|off]\n"
-    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off][,reconnect=seconds]\n"
+    "-chardev socket,id=id[,host=host],port=port[,to=to][,ipv4=on|off][,ipv6=on|off][,nodelay=on|off]\n"
     "         [,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds][,mux=on|off]\n"
     "         [,logfile=PATH][,logappend=on|off][,tls-creds=ID][,tls-authz=ID] (tcp)\n"
     "-chardev socket,id=id,path=path[,server=on|off][,wait=on|off][,telnet=on|off][,websocket=on|off][,reconnect=seconds]\n"
-- 
2.31.1


