Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ff7yu-000332-Hs
	for mharc-qemu-trivial@gnu.org; Mon, 16 Jul 2018 14:12:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krinkin.m.u@gmail.com>) id 1ff7VR-0001Kw-RN
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 13:41:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krinkin.m.u@gmail.com>) id 1ff7VQ-0004wU-Vx
	for qemu-trivial@nongnu.org; Mon, 16 Jul 2018 13:41:53 -0400
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544]:42811)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <krinkin.m.u@gmail.com>)
	id 1ff7VP-0004vr-3l; Mon, 16 Jul 2018 13:41:51 -0400
Received: by mail-ed1-x544.google.com with SMTP id r4-v6so2178341edp.9;
	Mon, 16 Jul 2018 10:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=JQhlYkA/sm6IVZjzgzznezMU5siaxNM0gHh6imtnElw=;
	b=sWbsn+St+Mf6E9z874T1dZfqosocxhRyZEOpBp5SdS2VMq12HjxsNJi2ltYJ1wKBb5
	nxRGoSpke+U+tpgp6NjjzDw5grG3qYC9TzkjZp4QT2U5Kt770DhGslmR5rEVE62oqmKF
	mUZAHncCtNvv0Nr1PjOyQJnTLQ3yUjCGAHHaVPTAXteBFm3EL3HHsmXQoHShOwa+0PAc
	i05HOt+Hqyo+O8rVBmva2nqFOjAVrpjWfkpfXIY/ESzFM/0tXK90nlezKC0fqPdlP6B/
	28q2HBdaIjLEfe/+j1ZUMzPXZxTXhUyNOCnUHDTMGyairwCqcp3/kE+/lrfT7rGU9fCx
	XTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=JQhlYkA/sm6IVZjzgzznezMU5siaxNM0gHh6imtnElw=;
	b=SNp/hF2aUrl1kiog01VR/tImzdm1rQchzrLkk2PmB4cgnoepiSuxMuz6s9ek/nFYAc
	XNXJibUhRmbf9wzCzTxrBD6H+Z0JAmiaLWM4Lh9m9AVTAO4I7uSdLnOw1b6teJkO3J+m
	yADxIRqbvLXy2f0ONaPBcCFRK4UISazvSuJ8UciWr0WAZqMH62Y0sJPpwge91RtnoQaF
	hkjizmqhnls7uUinX0Te6QFeSvwuJrzbUm4r2JpoIVqxoEsugJl0DYkQ6ua9uzVylw96
	kBuuoxyj2AjIDUcPagnb8vilU+I5BZ2/FaXsmcvMrQ5TtN2cXYdssG8w2LVy9b1oVu9S
	E5rA==
X-Gm-Message-State: AOUpUlGyN/GkPt3Cey2CRC808NYON0UokmHSO9/GzQptkLO0rRfnhP0F
	KdxbXc6UfeTXfGAAq4P+daUQ5Q==
X-Google-Smtp-Source: AAOMgpfVj8NWqSPGRCjwrODE2WTMH9I6C6I0F+OEnO1wlpG5QUzlLHlzSlrXpuT5ngWFg9tFDoNDzg==
X-Received: by 2002:a50:e718:: with SMTP id
	a24-v6mr18413679edn.278.1531762909700; 
	Mon, 16 Jul 2018 10:41:49 -0700 (PDT)
Received: from localhost.localdomain ([2a00:79e1:abc:110e:f944:d77f:2533:7bab])
	by smtp.gmail.com with ESMTPSA id
	v56-v6sm2062482edm.97.2018.07.16.10.41.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 10:41:49 -0700 (PDT)
From: Mike Krinkin <krinkin.m.u@gmail.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
	qemu-trivial@nongnu.org, Mike Krinkin <krinkin.m.u@gmail.com>
Date: Mon, 16 Jul 2018 18:41:46 +0100
Message-Id: <20180716174146.19845-1-krinkin.m.u@gmail.com>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::544
X-Mailman-Approved-At: Mon, 16 Jul 2018 14:12:19 -0400
Subject: [Qemu-trivial] [PATCH] opts: fix NULL pointer derefernce in
 get_opt_value
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Jul 2018 17:41:54 -0000

The value argument can be NULL, for example, in hw/i386/multiboot.c
in the load_multiboot function get_opt_value is explicitly called
with NULL as the second argument.

The problem was introduced in commit 950c4e6c94b1 ("opts: don't
silently truncate long option values"). This change fixes the
problem by adding a check whether the value is NULL or not.

Signed-off-by: Mike Krinkin <krinkin.m.u@gmail.com>
---
 util/qemu-option.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 19761e3eaf..834217fc75 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -75,7 +75,9 @@ const char *get_opt_value(const char *p, char **value)
     size_t capacity = 0, length;
     const char *offset;
 
-    *value = NULL;
+    if (value) {
+        *value = NULL;
+    }
     while (1) {
         offset = qemu_strchrnul(p, ',');
         length = offset - p;
-- 
2.17.1


