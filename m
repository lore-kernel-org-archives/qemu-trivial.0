Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lcVPP-0007ux-Jz
	for mharc-qemu-trivial@gnu.org; Fri, 30 Apr 2021 11:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVPL-0007rg-Eh
 for qemu-trivial@nongnu.org; Fri, 30 Apr 2021 11:50:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lcVPD-0000qp-KK
 for qemu-trivial@nongnu.org; Fri, 30 Apr 2021 11:50:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619797814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rePuRUmiJLdH/917Gz9nV9f0upTX5GXwfFmefbXYyi0=;
 b=bGfUaHaqe7EtOr4Hi6UsnWS1yHlX7hfaRMuSooV7M2fksf27Q1uOR1splGG0QC6FoKCwIi
 BEhIGYN8BQ+j3RGeXej+myn7hSB3TaTkiqbuh5GdooxgZ+uhpTpMTS9WsUGD69w9dRwvJU
 It4TkgdQ+I0g+N3Y5ACPs2nWjKHZkho=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-M2LNH3kqNUeCea5y24p8Pg-1; Fri, 30 Apr 2021 11:50:12 -0400
X-MC-Unique: M2LNH3kqNUeCea5y24p8Pg-1
Received: by mail-wr1-f72.google.com with SMTP id
 93-20020adf93e60000b029010d9bb1923eso1728927wrp.4
 for <qemu-trivial@nongnu.org>; Fri, 30 Apr 2021 08:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rePuRUmiJLdH/917Gz9nV9f0upTX5GXwfFmefbXYyi0=;
 b=jKgazJDnyycnLluc9yamQaqCEdZNE83Wv8IlZEza+XgPFRkISaHeefG1XyQlUatsRM
 xAD3FjxvC3o52H5XArjMpQWAAds438WbdByrIj6xtPuE3ret2d7+/+fXcufMcg56fgD7
 Ze2GHxWxF6VWYne3XNKl5kPFZpTPxBaPCGWOecfEpADHmCFDBOO7xzx+dXDnBH2XtSQN
 j5fBeW5qEMHxLY8CnPIOhn6JNH56EFCxZ8ISHJK1lws9w5ZDwkRAk3bVuxYiq04ADzcb
 /8tfnPaxryAb1HjIvzXyPyvd5U5OsW6+aKbIgy7HkTP8kIPOBcPgWYjr/FJm4ynL5zmy
 w4qA==
X-Gm-Message-State: AOAM532vwxo0IjQrYbVcG2w6HHhiiOv2BOO8sd7DSXxHW+65SLKBpnmz
 EAZ5IW0kbh0GAzZxFyo2pO313LY1ypsAVLfoGuhZBUVYTtR72st8w2wY8O5rOcy3B0NVK6wg8KF
 c35qS6kUmP/zrv8Ee5Q==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr4567328wri.27.1619797811545; 
 Fri, 30 Apr 2021 08:50:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyffMx0y3ZAkVjuP/N2GjT+l6HIG1+RM1o58430MeT8aaNw2e6UYVpEyBNS772g5Uo8a3kqpA==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr4567316wri.27.1619797811433; 
 Fri, 30 Apr 2021 08:50:11 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id d13sm2734708wrx.29.2021.04.30.08.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 08:50:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, qemu-trivial@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v2] ui: Fix memory leak in qemu_xkeymap_mapping_table()
Date: Fri, 30 Apr 2021 17:50:09 +0200
Message-Id: <20210430155009.259755-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Fri, 30 Apr 2021 15:50:24 -0000

Refactor qemu_xkeymap_mapping_table() to have a single exit point,
so we can easily free the memory allocated by XGetAtomName().

This fixes when running a binary configured with --enable-sanitizers:

  Direct leak of 22 byte(s) in 1 object(s) allocated from:
      #0 0x561344a7473f in malloc (qemu-system-x86_64+0x1dab73f)
      #1 0x7fa4d9dc08aa in XGetAtomName (/lib64/libX11.so.6+0x2a8aa)

Fixes: 2ec78706d18 ("ui: convert GTK and SDL1 frontends to keycodemapdb")
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 ui/x_keymap.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/ui/x_keymap.c b/ui/x_keymap.c
index 555086fb6bd..2ce7b899615 100644
--- a/ui/x_keymap.c
+++ b/ui/x_keymap.c
@@ -56,6 +56,7 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
 {
     XkbDescPtr desc;
     const gchar *keycodes = NULL;
+    const guint16 *map;
 
     /* There is no easy way to determine what X11 server
      * and platform & keyboard driver is in use. Thus we
@@ -83,21 +84,21 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
     if (check_for_xwin(dpy)) {
         trace_xkeymap_keymap("xwin");
         *maplen = qemu_input_map_xorgxwin_to_qcode_len;
-        return qemu_input_map_xorgxwin_to_qcode;
+        map = qemu_input_map_xorgxwin_to_qcode;
     } else if (check_for_xquartz(dpy)) {
         trace_xkeymap_keymap("xquartz");
         *maplen = qemu_input_map_xorgxquartz_to_qcode_len;
-        return qemu_input_map_xorgxquartz_to_qcode;
+        map = qemu_input_map_xorgxquartz_to_qcode;
     } else if ((keycodes && g_str_has_prefix(keycodes, "evdev")) ||
                (XKeysymToKeycode(dpy, XK_Page_Up) == 0x70)) {
         trace_xkeymap_keymap("evdev");
         *maplen = qemu_input_map_xorgevdev_to_qcode_len;
-        return qemu_input_map_xorgevdev_to_qcode;
+        map = qemu_input_map_xorgevdev_to_qcode;
     } else if ((keycodes && g_str_has_prefix(keycodes, "xfree86")) ||
                (XKeysymToKeycode(dpy, XK_Page_Up) == 0x63)) {
         trace_xkeymap_keymap("kbd");
         *maplen = qemu_input_map_xorgkbd_to_qcode_len;
-        return qemu_input_map_xorgkbd_to_qcode;
+        map = qemu_input_map_xorgkbd_to_qcode;
     } else {
         trace_xkeymap_keymap("NULL");
         g_warning("Unknown X11 keycode mapping '%s'.\n"
@@ -109,6 +110,10 @@ const guint16 *qemu_xkeymap_mapping_table(Display *dpy, size_t *maplen)
                   "  - xprop -root\n"
                   "  - xdpyinfo\n",
                   keycodes ? keycodes : "<null>");
-        return NULL;
+        map = NULL;
     }
+    if (keycodes) {
+        XFree((void *)keycodes);
+    }
+    return map;
 }
-- 
2.26.3


