Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLtL-0002XL-RU
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:21:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLtI-0002T5-3G
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLtG-0001vu-P0
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:21:52 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:33319)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLtG-0001vb-Kg; Tue, 18 Jul 2017 02:21:50 -0400
Received: by mail-qt0-x242.google.com with SMTP id 50so293752qtz.0;
	Mon, 17 Jul 2017 23:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2ZQM9+RbEoRBD7ER9rON4SUgjt3jWB0suMmQ1C639wc=;
	b=fJMdcnX1j+GuC73oJBUemgmVrFHg/hU+gyqchPY4vTlIlPSZDGF1H13kKzrnD2OgSN
	htua/D6rASYiQStRLsddZKAu931ChxHVIuGMEDqTFROg1P1dXWm6g7HEwVb26pU5x6EI
	B/+ZN5C8zFaXVynjvX2g+BYIHuRBKZDG5HNfDBzjKBAw+93a2O8nGJfPXeTVhsUAT8OT
	zNgh7syqRttUjEezU0WQVgJegfiJ8RdyeQNI6okWs4fJk0Y5rNeftzxDOJ9DS957uTus
	f2B39DUyAxyXpzJxTP+9ZpwZMJEMOr9O68NasldZwkfc+r/+/6yXO4wysyk6aLQeJgvJ
	s2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2ZQM9+RbEoRBD7ER9rON4SUgjt3jWB0suMmQ1C639wc=;
	b=fCBFc4cfZOhFjKW8ZSZVnYmjU6t7QGVNMXSLyk2zjZLwkhXsjhP/qhq5cWpnw2Ayfk
	I2mi8Q5q/xruKjpmhJYi931wvx80HEWQ3nFJ34k58yUCI1MI7dfeAl3c0no7oW7j5OCM
	aOZXlUGpdvLVq73BIkVltww/fH8T/6U3WADDYieH9uf28FdJTJ7ur6YxcXXDEnpgUwCn
	ZnlFKGhAEOF2qRuk7lTkU3C7jKCFTLygdhZvGkgzZ0CFS4DIy4OLJCCLfN4b20XzVVNu
	3FMldNOJ0ikYZfl+TP3TLvdCTvGzeeULf9Yp4LJIlXaf4W5m81M17S/REXpi7W0R5/GC
	7WGg==
X-Gm-Message-State: AIVw1119dA+E/mO9jEyf3WRGLvpHgH5W+JyLpS22pp90IO6RhtZbzd5k
	+1cNU2OgJxn9kCxUEU7A0Q==
X-Received: by 10.237.38.71 with SMTP id z65mr95071qtc.21.1500358910064;
	Mon, 17 Jul 2017 23:21:50 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.21.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:21:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:10:05 -0300
Message-Id: <20170718061005.29518-30-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH 29/29] tests/qapi: use ARRAY_SIZE macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:21:53 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/test-string-output-visitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/test-string-output-visitor.c b/tests/test-string-output-visitor.c
index e736db3af8..f0902dd49e 100644
--- a/tests/test-string-output-visitor.c
+++ b/tests/test-string-output-visitor.c
@@ -97,7 +97,7 @@ static void test_visitor_out_intList(TestOutputVisitorData *data,
     Error *err = NULL;
     char *str;
 
-    for (i = 0; i < sizeof(value) / sizeof(value[0]); i++) {
+    for (i = 0; i < ARRAY_SIZE(value); i++) {
         *tmp = g_malloc0(sizeof(**tmp));
         (*tmp)->value = value[i];
         tmp = &(*tmp)->next;
-- 
2.13.2


