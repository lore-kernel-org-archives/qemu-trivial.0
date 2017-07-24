Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi5l-0008JS-Ka
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50092)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5i-0008Fn-7E
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5f-0004k4-3t
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:26 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35716)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5c-0004jF-Iv; Mon, 24 Jul 2017 14:28:20 -0400
Received: by mail-qk0-x243.google.com with SMTP id k2so3223996qkf.2;
	Mon, 24 Jul 2017 11:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Z92FSzG5sTMrFXcT+CgYEM4lFcI+e1+GashOIp7Op2Y=;
	b=eLKOj044v5dtReEgXjWPEuNyCw9I5Rdy1uWoHatlhviYrEsZ8xUAaHSMBlA5W1hMkz
	PwGCeYn4cAx6UO83WUFiUvE+VK8SKIksCLPcbiZehHHhG7GEFJ6EtvcZ58heqo4niJJg
	934MlLI0Rd4XqSPjkTUdJMPYeJIiUrId/1XbP9LoqEBD9dQmskiaQwit1tpDUyBJe2SR
	a8dtV53vI1K51C39b/vVzO5EQ8ahf2nMM77/RucdIEy8p3Z6hz6ft9LeZsNmTEZrZhqj
	K3P8YpFc9U7NeIH3m0KjEYN0mRfhmP+HxYknty2r2+eF3UJ3E1YFJcUdmWH89TjRuBa0
	mvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Z92FSzG5sTMrFXcT+CgYEM4lFcI+e1+GashOIp7Op2Y=;
	b=IOm9pCa8G0Y4YRnoT6MNGJkr75y0npn9O1sLhjUUMTA9wsHKGadbMdGA9dYUNpSZqu
	Ixnd1ut2z9LDXoy5qhMUPCx95FCsWPt9zmPu4DWEP6iI8BtCbun+8pusm0H6iHY5K1tr
	QXDVsRx1u5LCoVf63KGCIshLJKfrIwemAL5xcD18UXNuyDTGl09e7G2jhoX1nwONEclA
	jgOF61IZh2IyYoSGbfsQRzVlKWujDunSR2w6Nq2MTpNlj9sskZ3dxcbiql9ddw5ApBx6
	6RuNvyFFWtrSOHG3rS5K/MXHHtnP+2t7Xi62KRqXDsj1dE1HM9M70pDPg2RyurjLOj/q
	KaTg==
X-Gm-Message-State: AIVw113xkmfC6Qw1g57d80Mvd7rULOqXGKhRRp3UZwmztSXYXNC46quE
	o0CN7VJHvNreN5suqfM=
X-Received: by 10.55.209.86 with SMTP id s83mr20149414qki.171.1500920900010;
	Mon, 24 Jul 2017 11:28:20 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:19 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:19 -0300
Message-Id: <20170724182751.18261-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH for 2.10 03/35] thunk: check nb_fields is
 valid before continuing
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:27 -0000

thunk.c:91:32: warning: Call to 'malloc' has an allocation size of 0 bytes
        se->field_offsets[i] = malloc(nb_fields * sizeof(int));
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 thunk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/thunk.c b/thunk.c
index 2dac36666d..d1c5e221f5 100644
--- a/thunk.c
+++ b/thunk.c
@@ -67,7 +67,6 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
     int nb_fields, offset, max_align, align, size, i, j;
 
     assert(id < max_struct_entries);
-    se = struct_entries + id;
 
     /* first we count the number of fields */
     type_ptr = types;
@@ -76,6 +75,10 @@ void thunk_register_struct(int id, const char *name, const argtype *types)
         type_ptr = thunk_type_next(type_ptr);
         nb_fields++;
     }
+    if (!nb_fields) {
+        return;
+    }
+    se = struct_entries + id;
     se->field_types = types;
     se->nb_fields = nb_fields;
     se->name = name;
-- 
2.13.3


