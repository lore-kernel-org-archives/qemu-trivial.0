Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1if2u1-0005TP-9Q
	for mharc-qemu-trivial@gnu.org; Wed, 11 Dec 2019 09:23:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2tx-0005QP-1b
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:23:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1if2tw-0003GA-2W
 for qemu-trivial@nongnu.org; Wed, 11 Dec 2019 09:23:40 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:51472)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1if2tr-00039Z-OJ; Wed, 11 Dec 2019 09:23:36 -0500
Received: by mail-wm1-x343.google.com with SMTP id d73so4024558wmd.1;
 Wed, 11 Dec 2019 06:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ItNU5Cjsmx9/ZsYgHNT2cDFny7KJ3p+tyVmczFqGZzE=;
 b=uyR73f76FVa5KGA9y+QE9Uwzx+MzayFIGbUIW+v7rFJXVm/n3CqqUZFs5FANDmCAd3
 0yXWZqYvQyz6Krt0eidLNMJ4Ekbd+8Kgt7WY2fZASVlloalP11+F0Rf5dgRp5kMmdl4D
 qdL63e4KcK5nG0YaGtRz35qLHJsMPzoKG5gbr3lcSu7gai4LTsDVGO1Mx+afX2BD6rXw
 ynEqcW6AxPxLWGg8hI5Y1//+YIZnQ5Mf0TS3qqYmzoHEUyERg9ecbxWWYb7dn7gCau9w
 HOQyPN3827vMVFFwyTCQTOqU4gs/AcbAX3cS29jAqxNk6DQ6K8rKfQ6jipUvsCNlBlfN
 SImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ItNU5Cjsmx9/ZsYgHNT2cDFny7KJ3p+tyVmczFqGZzE=;
 b=Ig5RYeO3EGdNKKYYQvCtd4+fIZJVBqFxAiMW7HG803DriAh6g7P1L79apjDH1QK3Ck
 OUvw65S4Rcn+VoSn7Fb26TrCE08wKQanjmsfvfS3MEBaC/6xMv+B7sKyQWCxMcOn7Tbp
 MYNRYXcM8jNYpVNNODvNSIaYNiupeimdgEEvWu0hp/UwzdwXfLjbn8vSFx7kHTa47tj3
 V4TbPzb+fbeQRWzzvQXFSQ1JizZIzsigVma1iuO4Nr9aC99v68z5zuiA99D2al9thVU8
 6rJHV871fdt923gI3CvZVJlGyubyrlUoli/J4pEKcn7mG9wjWrljlIbu2IJCPTggQHwY
 ZxMA==
X-Gm-Message-State: APjAAAWMS41u91GDsfVyn38rogF1xOMJobqkRf4KLVJkFz60a6uUUY2T
 FICfZCX6z1hbOuC1/SxqWxur0K/J
X-Google-Smtp-Source: APXvYqzPnZmUwzo8FupmKWZH/cLnaT2m6s32BE39/euS7agIVRnZH9ACqBLzWrDWJ1P05SadDtb/kQ==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr33629wmb.41.1576074214465;
 Wed, 11 Dec 2019 06:23:34 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id g23sm2503783wmk.14.2019.12.11.06.23.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Dec 2019 06:23:33 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH] migration: fix stringop-truncation warning
Date: Wed, 11 Dec 2019 15:23:24 +0100
Message-Id: <1576074210-52834-3-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-List-Received-Date: Wed, 11 Dec 2019 14:23:43 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../migration/global_state.c: In function ‘global_state_store_running’:
../migration/global_state.c:47:5: error: ‘strncpy’ specified bound 100 equals destination size [-Werror=stringop-truncation]
   47 |     strncpy((char *)global_state.runstate,
      |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   48 |            state, sizeof(global_state.runstate));
      |            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The assert() above allows to call with strlen(src)+1.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 migration/global_state.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/migration/global_state.c b/migration/global_state.c
index 2531147..a39a876 100644
--- a/migration/global_state.c
+++ b/migration/global_state.c
@@ -44,8 +44,7 @@ void global_state_store_running(void)
 {
     const char *state = RunState_str(RUN_STATE_RUNNING);
     assert(strlen(state) < sizeof(global_state.runstate));
-    strncpy((char *)global_state.runstate,
-           state, sizeof(global_state.runstate));
+    memcpy(global_state.runstate, state, strlen(state) + 1);
 }
 
 bool global_state_received(void)
-- 
1.8.3.1


