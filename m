Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dbE1f-0005BV-Bd
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 18:46:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1d-0005A3-Fl
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1a-0002Hm-SN
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 18:46:29 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38884)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dbE1Y-0002E7-4q; Fri, 28 Jul 2017 18:46:24 -0400
Received: by mail-qt0-x241.google.com with SMTP id p3so13992197qtg.5;
	Fri, 28 Jul 2017 15:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iW7nidtz061A3YJPF7KzOT9hzM0nz2nxdM0vSUmobYk=;
	b=BC1rDGMLoaF81yqUwDr8/Wft6SejAQ+Jszo5UwVAzUtPMlvwR11WdWg5mAprCXc4Jj
	OT2GpyV9Q/5FG2Lui/BzrdAAzvzpbWPoPu6A0JBCkHojl0K6vUCccBni97XoxlvbGxjU
	QTmQbOcEoCXJUjZ3cOzasVZ6NTXEe8/WyXCaiHMQQB+L6zd9z9zh1XTut5n5RMfbENFP
	0Er4Gc74cq1SJU2/2PafKboZHS3E0e7g0gtoNZp0GIxVI+wtqXfzh8wUPZB8cOO800+w
	C8S3wBGMVcvCQq9lPDMNbWIVtDNgjlFk2w8JWnnmBouSk0JFwnTakAS4b+nJuT0fi2SC
	d8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=iW7nidtz061A3YJPF7KzOT9hzM0nz2nxdM0vSUmobYk=;
	b=epBZVF9QeW40dD80ARqEp135S72zIOBzNcRmXCZW4b9BJXCHrR3ebfavePqq1cEXaA
	AEvxWGpdEcT3LN/jlG5Har9mOR13ygmbUmt7CkN0S9ExyJXaNpaP5I+6uCxiw7M8Wju7
	tnygzA//YM2ZRt/X3kmxVuwqiqtJikEKLmVBfMRd8C1I+LM7ZBEM2e8ktxrriiz9LpN9
	6RU9IspNaSuYB1Z9XnU8D/+rn7f+mB5GeO7y7YjJA7erYWzSWkVmjhaS+6Ll99QK5ajm
	aKRbHWATOEb2WE835rHwgaMfmvO3X1JhoRFDtRn/1T/HjLJzGmtRSsQdcBj3ol82sroY
	Z1WA==
X-Gm-Message-State: AIVw112ZyoR43ZD3+ojptmYPSwOT35Ljy8Hk15WVbqo0SQTbWlFJllrt
	fJUC04xnl5/Olg==
X-Received: by 10.200.54.139 with SMTP id a11mr13411914qtc.318.1501281983473; 
	Fri, 28 Jul 2017 15:46:23 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m129sm15831970qkc.2.2017.07.28.15.46.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 15:46:22 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 19:46:03 -0300
Message-Id: <20170728224608.3598-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728224608.3598-1-f4bug@amsat.org>
References: <20170728224608.3598-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v2 for 2.10 3/8] docs: fix broken paths to
 docs/devel/qapi-code-gen.txt
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
X-List-Received-Date: Fri, 28 Jul 2017 22:46:30 -0000

With the move of some docs to docs/interop on ac06724a71, a couple of references
were not updated.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 docs/devel/writing-qmp-commands.txt | 2 +-
 include/qapi/visitor.h              | 2 +-
 qapi/introspect.json                | 2 +-
 qapi/qapi-util.c                    | 2 +-
 scripts/qapi2texi.py                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/devel/writing-qmp-commands.txt b/docs/devel/writing-qmp-commands.txt
index 69793e320e..4f5b24c0c4 100644
--- a/docs/devel/writing-qmp-commands.txt
+++ b/docs/devel/writing-qmp-commands.txt
@@ -7,7 +7,7 @@ This document doesn't discuss QMP protocol level details, nor does it dive
 into the QAPI framework implementation.
 
 For an in-depth introduction to the QAPI framework, please refer to
-docs/qapi-code-gen.txt. For documentation about the QMP protocol,
+docs/devel/qapi-code-gen.txt. For documentation about the QMP protocol,
 start with docs/interop/qmp-intro.txt.
 
 == Overview ==
diff --git a/include/qapi/visitor.h b/include/qapi/visitor.h
index fe9faf469f..0f3b8cb459 100644
--- a/include/qapi/visitor.h
+++ b/include/qapi/visitor.h
@@ -36,7 +36,7 @@
  * QemuOpts, and clone visitors have some implementation limitations;
  * see the documentation for each visitor for more details on what it
  * supports.  Also, see visitor-impl.h for the callback contracts
- * implemented by each visitor, and docs/qapi-code-gen.txt for more
+ * implemented by each visitor, and docs/devel/qapi-code-gen.txt for more
  * about the QAPI code generator.
  *
  * All of the visitors are created via:
diff --git a/qapi/introspect.json b/qapi/introspect.json
index 1dbaef56eb..cf77ff0669 100644
--- a/qapi/introspect.json
+++ b/qapi/introspect.json
@@ -226,7 +226,7 @@
 #
 # @members: the alternate type's members, in no particular order.
 #           The members' wire encoding is distinct, see
-#           docs/qapi-code-gen.txt section Alternate types.
+#           docs/devel/qapi-code-gen.txt section Alternate types.
 #
 # On the wire, this can be any of the members.
 #
diff --git a/qapi/qapi-util.c b/qapi/qapi-util.c
index e28dbd0ac3..46eda7d196 100644
--- a/qapi/qapi-util.c
+++ b/qapi/qapi-util.c
@@ -40,7 +40,7 @@ int qapi_enum_parse(const char * const lookup[], const char *buf,
  * It may be prefixed by __RFQDN_ (downstream extension), where RFQDN
  * may contain only letters, digits, hyphen and period.
  * The special exception for enumeration names is not implemented.
- * See docs/qapi-code-gen.txt for more on QAPI naming rules.
+ * See docs/devel/qapi-code-gen.txt for more on QAPI naming rules.
  * Keep this consistent with scripts/qapi.py!
  * If @complete, the parse fails unless it consumes @str completely.
  * Return its length on success, -1 on failure.
diff --git a/scripts/qapi2texi.py b/scripts/qapi2texi.py
index 9e015002ef..a317526e51 100755
--- a/scripts/qapi2texi.py
+++ b/scripts/qapi2texi.py
@@ -91,7 +91,7 @@ def texi_format(doc):
         # doesn't.
         #
         # Make sure to update section "Documentation markup" in
-        # docs/qapi-code-gen.txt when fixing this.
+        # docs/devel/qapi-code-gen.txt when fixing this.
         if line.startswith('| '):
             line = EXAMPLE_FMT(code=line[2:])
         elif line.startswith('= '):
-- 
2.13.3


